Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4418A67A8E9
	for <lists+linux-next@lfdr.de>; Wed, 25 Jan 2023 03:42:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234035AbjAYCml (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Jan 2023 21:42:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234037AbjAYCmk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Jan 2023 21:42:40 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F7B530D1
        for <linux-next@vger.kernel.org>; Tue, 24 Jan 2023 18:42:35 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id be8so3744698plb.7
        for <linux-next@vger.kernel.org>; Tue, 24 Jan 2023 18:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f6YWRPvfrTLgB5Rbimp0qxCYux462ioChlzhg9WLjNI=;
        b=y52Ojo+m0J/Wjaui7Vln+Y3/MtcVriMuDrqBjF3cNE8Lv4ckEXH98o1IkigT4OhoFy
         k431HgCPfsCXn7PcHyC98PGLMBMswXNk3PT4lPlgH29GvKBFmShF6lOMr2rCEwo4Q6n8
         rTxJdofW1DvkVwHNjWoNvL5npCaMuKbYfaQ48UHe9Xw744VTu9GrJjGpbPNH4Y+tkj4s
         HXrHLsjBrHwTsc8+hQBUJ8VUOpyB7km3YpqsHU1UkJPiiSJvf20Zp4hMd2O5vHKnNMrU
         RePsHA2CaKhsNPYhAhlhMfKfg7MqaTrgcGEKzX1m2cIr87o+2exmfZj8IOeYsfpRLvsR
         RhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6YWRPvfrTLgB5Rbimp0qxCYux462ioChlzhg9WLjNI=;
        b=bhV2T2nu0KJB4svuFhwxdYtCOFDj368iEwyOyGykP9p7XSq5n3uaygkxbE2jDnn1Ty
         UH+FUKNcny5AhGd1KRqZbC7Wy+beB0JKUia2yznzlgY8/Ohor7JU+KIYfPHnZ5fldn41
         YpbQi+Ht3XJGoTHlknv62zC+rXfaKTCSPo6CJFgoQhQ7TwCaZhflnSWBNFEhkSt0lEwC
         TxP954asq3+OEnxOIVTfRhEOl60omFAsewmtadrz74pnw5ViLW/iE4KRWSZzLyUG27Tr
         FT66/L07w3cZRbTzVU2FmXD+87rO0zSgbzJGaJ+QA4dzkXR4WdFdNeSgNXIhc/Kgsmac
         yDkw==
X-Gm-Message-State: AFqh2kp6kTb3/6YHyAZssoGrAIpxv/i8EkzUiyGSUZHHp01HFYh4DaUd
        /aXAPcEVmOWRhKGRaISA+DUxpFmu/BLT0uRIuFM=
X-Google-Smtp-Source: AMrXdXvi5CnLGg5AARG5zkDP2uke7UKw1NEbdiVLyTXGjEJAK1s8KA01X9VNAixp+HwWIxaXf+jWZQ==
X-Received: by 2002:a17:90b:1d08:b0:226:f63b:e26 with SMTP id on8-20020a17090b1d0800b00226f63b0e26mr31932190pjb.7.1674614554305;
        Tue, 24 Jan 2023 18:42:34 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id cc21-20020a17090af11500b0020dc318a43esm274087pjb.25.2023.01.24.18.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 18:42:33 -0800 (PST)
Message-ID: <63d09719.170a0220.f9aab.08b0@mx.google.com>
Date:   Tue, 24 Jan 2023 18:42:33 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.2-rc5-219-g3c4f681a3d69
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 600 runs,
 35 regressions (v6.2-rc5-219-g3c4f681a3d69)
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

next/pending-fixes baseline: 600 runs, 35 regressions (v6.2-rc5-219-g3c4f68=
1a3d69)

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

beagle-xm                    | arm   | lab-baylibre    | gcc-10   | omap2pl=
us_defconfig          | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+debug              | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =

imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx8mn-ddr4-evk              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+crypto             | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

mt8173-elm-hana              | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =

r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+ima                | 2          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+crypto             | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+ima                | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+videodec           | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig                    | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.2-rc5-219-g3c4f681a3d69/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.2-rc5-219-g3c4f681a3d69
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3c4f681a3d69fa221ca9591d448fa518e93cc1ee =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d05ea1b13cda3ac4915eb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d05ea1b13cda3ac4915=
eba
        failing since 106 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63d06db478b34d8aa0915f15

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d06db478b34d8aa0915f1a
        failing since 13 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-01-24T23:45:38.267106  / # #
    2023-01-24T23:45:38.369834  export SHELL=3D/bin/sh
    2023-01-24T23:45:38.370653  #
    2023-01-24T23:45:38.472740  / # export SHELL=3D/bin/sh. /lava-8863747/e=
nvironment
    2023-01-24T23:45:38.473544  =

    2023-01-24T23:45:38.575684  / # . /lava-8863747/environment/lava-886374=
7/bin/lava-test-runner /lava-8863747/1
    2023-01-24T23:45:38.577129  =

    2023-01-24T23:45:38.586989  / # /lava-8863747/bin/lava-test-runner /lav=
a-8863747/1
    2023-01-24T23:45:38.703291  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-24T23:45:38.703889  + cd /lava-8863747/1/tests/1_bootrr =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d060fcf410f47288915ed5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d060fcf410f47288915=
ed6
        failing since 3 days (last pass: v6.2-rc4-412-g665ddd640630, first =
fail: v6.2-rc4-480-gb1867226dfbb) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-10   | omap2pl=
us_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d065c1f69ccf6ba9915eff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d065c1f69ccf6ba9915=
f00
        new failure (last pass: v6.2-rc5-174-gc5f142de047d) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d060c09d078edf72915f95

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d060c09d078edf72915f9a
        failing since 7 days (last pass: v6.1-13341-g16cba743aec0, first fa=
il: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-24T22:49:51.690865  <8>[   23.736647] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3204320_1.5.2.4.1>
    2023-01-24T22:49:51.801582  / # #
    2023-01-24T22:49:51.905314  export SHELL=3D/bin/sh
    2023-01-24T22:49:51.906476  #
    2023-01-24T22:49:52.008882  / # export SHELL=3D/bin/sh. /lava-3204320/e=
nvironment
    2023-01-24T22:49:52.009992  =

    2023-01-24T22:49:52.112343  / # . /lava-3204320/environment/lava-320432=
0/bin/lava-test-runner /lava-3204320/1
    2023-01-24T22:49:52.113994  =

    2023-01-24T22:49:52.118855  / # /lava-3204320/bin/lava-test-runner /lav=
a-3204320/1
    2023-01-24T22:49:52.213103  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d06200bed4701b8c915ec6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d06200bed4701b8c915ecb
        failing since 7 days (last pass: v6.1-13341-g16cba743aec0, first fa=
il: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-24T22:55:47.192499  <8>[   15.271790] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3204368_1.5.2.4.1>
    2023-01-24T22:55:47.300507  / # #
    2023-01-24T22:55:47.402178  export SHELL=3D/bin/sh
    2023-01-24T22:55:47.403085  #
    2023-01-24T22:55:47.403510  / # export SHELL=3D/bin/sh<3>[   15.450456]=
 Bluetooth: hci0: command 0xfc18 tx timeout
    2023-01-24T22:55:47.505445  . /lava-3204368/environment
    2023-01-24T22:55:47.506288  =

    2023-01-24T22:55:47.609328  / # . /lava-3204368/environment/lava-320436=
8/bin/lava-test-runner /lava-3204368/1
    2023-01-24T22:55:47.610799  =

    2023-01-24T22:55:47.614976  / # /lava-3204368/bin/lava-test-runner /lav=
a-3204368/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63d0633da30542ad41915eda

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d0633da30542ad41915edf
        failing since 7 days (last pass: v6.1-13341-g16cba743aec0, first fa=
il: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-24T23:00:53.395893  <8>[   15.709770] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3204588_1.5.2.4.1>
    2023-01-24T23:00:53.506516  / # #
    2023-01-24T23:00:53.609566  export SHELL=3D/bin/sh
    2023-01-24T23:00:53.610674  #
    2023-01-24T23:00:53.611110  / # <3>[   15.852338] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-01-24T23:00:53.713026  export SHELL=3D/bin/sh. /lava-3204588/envir=
onment
    2023-01-24T23:00:53.713954  =

    2023-01-24T23:00:53.816242  / # . /lava-3204588/environment/lava-320458=
8/bin/lava-test-runner /lava-3204588/1
    2023-01-24T23:00:53.817627  =

    2023-01-24T23:00:53.822320  / # /lava-3204588/bin/lava-test-runner /lav=
a-3204588/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d063e51c611a66af915ecb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d063e51c611a66af915ed0
        failing since 7 days (last pass: v6.1-13341-g16cba743aec0, first fa=
il: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-24T23:03:34.717892  <8>[   16.568333] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3204605_1.5.2.4.1>
    2023-01-24T23:03:34.824826  / # #
    2023-01-24T23:03:34.926653  export SHELL=3D/bin/sh
    2023-01-24T23:03:34.927191  #
    2023-01-24T23:03:35.028459  / # export SHELL=3D/bin/sh. /lava-3204605/e=
nvironment
    2023-01-24T23:03:35.029011  =

    2023-01-24T23:03:35.130680  / # . /lava-3204605/environment/lava-320460=
5/bin/lava-test-runner /lava-3204605/1
    2023-01-24T23:03:35.131462  =

    2023-01-24T23:03:35.142709  / # /lava-3204605/bin/lava-test-runner /lav=
a-3204605/1
    2023-01-24T23:03:35.234123  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d0649bd81072ac66915eee

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d0649bd81072ac66915ef3
        failing since 7 days (last pass: v6.1-13341-g16cba743aec0, first fa=
il: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-24T23:06:40.541742  + set +x<8>[   14.615665] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3204629_1.5.2.4.1>
    2023-01-24T23:06:40.542246  =

    2023-01-24T23:06:40.649643  / # #
    2023-01-24T23:06:40.751565  export SHELL=3D/bin/sh
    2023-01-24T23:06:40.752021  #
    2023-01-24T23:06:40.853205  / # export SHELL=3D/bin/sh. /lava-3204629/e=
nvironment
    2023-01-24T23:06:40.853592  =

    2023-01-24T23:06:40.954923  / # . /lava-3204629/environment/lava-320462=
9/bin/lava-test-runner /lava-3204629/1
    2023-01-24T23:06:40.955593  =

    2023-01-24T23:06:40.955787  / # <3>[   14.982120] Bluetooth: hci0: comm=
and 0x0c03 tx timeout =

    ... (13 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/63d05da62e11ca3394915f84

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63d05da62e11ca3=
394915f8c
        failing since 366 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2023-01-24T22:36:07.315773  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2023-01-24T22:36:07.316652  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2023-01-24T22:36:07.319049  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2023-01-24T22:36:07.367722  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63d068136fbb89a11e915ef7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d068136fbb89a11e915=
ef8
        failing since 29 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc1-87-g81c29d2c4600) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d05f407afd34b747915ebe

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6=
dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6=
dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d05f407afd34b747915ec3
        new failure (last pass: v6.2-rc5-174-gc5f142de047d)

    2023-01-24T22:43:58.228267  [   15.056528] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-01-24T22:43:58.234206  + set[   15.066317] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 886735_1.5.2.3.1>
    2023-01-24T22:43:58.234492   +x
    2023-01-24T22:43:58.340183  / # #
    2023-01-24T22:43:58.441824  export SHELL=3D/bin/sh
    2023-01-24T22:43:58.442411  #
    2023-01-24T22:43:58.543940  / # export SHELL=3D/bin/sh. /lava-886735/en=
vironment
    2023-01-24T22:43:58.544455  =

    2023-01-24T22:43:58.645817  / # . /lava-886735/environment/lava-886735/=
bin/lava-test-runner /lava-886735/1
    2023-01-24T22:43:58.646611   =

    ... (13 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d05c0cdeb2157272915ed6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d05c0cdeb2157272915=
ed7
        failing since 139 days (last pass: v5.19-rc5-383-g73ad9bd963c1, fir=
st fail: v6.0-rc4-291-g83a56f559828) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d05b431dc2b516d6915ec5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d05b441dc2b516d6915=
ec6
        failing since 140 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d05f6723415ba159915ed3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d05f6723415ba159915ed6
        failing since 19 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-24T22:44:30.430847  + set +x<8>[   40.366447] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 1144978_1.5.2.4.1>
    2023-01-24T22:44:30.431108  =

    2023-01-24T22:44:30.534929  / # #
    2023-01-24T22:44:31.694120  export SHELL=3D/bin/sh
    2023-01-24T22:44:31.699672  #
    2023-01-24T22:44:33.246074  / # export SHELL=3D/bin/sh. /lava-1144978/e=
nvironment
    2023-01-24T22:44:33.251691  =

    2023-01-24T22:44:36.073246  / # . /lava-1144978/environment/lava-114497=
8/bin/lava-test-runner /lava-1144978/1
    2023-01-24T22:44:36.079266  =

    2023-01-24T22:44:36.090593  / # /lava-1144978/bin/lava-test-runner /lav=
a-1144978/1 =

    ... (21 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63d064da8126f12657915eef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4-=
evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d064da8126f12657915=
ef0
        new failure (last pass: v6.2-rc5-174-gc5f142de047d) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d05c4b7f2041281e915ed7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d05c4b7f2041281e915=
ed8
        failing since 270 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d061d58242e385ac915eb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d061d58242e385ac915=
eba
        new failure (last pass: v6.2-rc5-174-gc5f142de047d) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63d065b8e01c3e2514915eb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d065b8e01c3e2514915=
eba
        failing since 0 day (last pass: v6.2-rc5-157-g1f16e03afb18, first f=
ail: v6.2-rc5-174-gc5f142de047d) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d05cf47630b3c725915ec0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d05cf47630b3c725915=
ec1
        failing since 104 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/63d061f88b73e246b6915ef1

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm64/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm64/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63d061f88b73e24=
6b6915ef9
        new failure (last pass: v6.2-rc5-174-gc5f142de047d)
        12 lines

    2023-01-24T22:55:22.154020  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000080
    2023-01-24T22:55:22.154142  kern  :alert : Mem abort info:
    2023-01-24T22:55:22.154253  kern  :alert :   ESR =3D 0x00<8>[   29.8446=
75] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines =
MEASUREMENT=3D12>
    2023-01-24T22:55:22.154359  00000096000006
    2023-01-24T22:55:22.154463  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-01-24T22:55:22.154565  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-01-24T22:55:22.154664  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-01-24T22:55:22.154744  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-01-24T22:55:22.154822  kern  :alert : Data abort info:
    2023-01-24T22:55:22.154900  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63d061f88b73e24=
6b6915efa
        new failure (last pass: v6.2-rc5-174-gc5f142de047d)
        2 lines

    2023-01-24T22:55:22.197200  kern  :alert :   CM =3D 0, WnR =3D 0
    2023-01-24T22:55:22.197334  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D000000007f1e2000
    2023-01-24T22:55:22.197446  kern  :alert : [0000000000000080] pgd=3D080=
000007f205<8>[   29.891956] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESU=
LT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-01-24T22:55:22.197553  003, p4d=3D080000007f205003, pud=3D08000000=
7<8>[   29.904358] <LAVA_SIGNAL_ENDRUN 0_dmesg 832611_1.5.2.4.1>
    2023-01-24T22:55:22.197658  f1de003, pmd=3D0000000000000000
    2023-01-24T22:55:22.197759  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63d067587cea7b0805915ed3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d067587cea7b0805915=
ed4
        failing since 96 days (last pass: v6.0-10339-g565da9e84d8f, first f=
ail: v6.1-rc1-192-gdfe701541ba9) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63d05f68208c6683a2915ef0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h6=
-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h6=
-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d05f68208c6683a2915ef3
        failing since 7 days (last pass: v6.1-13341-g16cba743aec0, first fa=
il: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-24T22:44:35.566099  / # #
    2023-01-24T22:44:35.668093  export SHELL=3D/bin/sh
    2023-01-24T22:44:35.668884  #
    2023-01-24T22:44:35.770450  / # export SHELL=3D/bin/sh. /lava-385206/en=
vironment
    2023-01-24T22:44:35.770951  =

    2023-01-24T22:44:35.872867  / # . /lava-385206/environment/lava-385206/=
bin/lava-test-runner /lava-385206/1
    2023-01-24T22:44:35.873888  =

    2023-01-24T22:44:35.887759  / # /lava-385206/bin/lava-test-runner /lava=
-385206/1
    2023-01-24T22:44:35.956952  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-24T22:44:35.957371  + cd /lava-385206/<8>[  114.214769] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 385206_1.5.2.4.5> =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63d05fcf5322326dda915efb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-or=
angepi-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-or=
angepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d05fcf5322326dda915efe
        failing since 6 days (last pass: v6.1-2435-g5c02e5d167d0, first fai=
l: v6.2-rc4-350-g5ce527a369f5)

    2023-01-24T22:46:29.034098  / # #
    2023-01-24T22:46:29.136924  export SHELL=3D/bin/sh
    2023-01-24T22:46:29.137436  #
    2023-01-24T22:46:29.242102  / # export SHELL=3D/bin/sh. /lava-385212/en=
vironment
    2023-01-24T22:46:29.242803  =

    2023-01-24T22:46:29.348100  / # . /lava-385212/environment/lava-385212/=
bin/lava-test-runner /lava-385212/1
    2023-01-24T22:46:29.349077  =

    2023-01-24T22:46:29.354099  / # /lava-385212/bin/lava-test-runner /lava=
-385212/1
    2023-01-24T22:46:29.433184  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-24T22:46:29.433537  + cd /lava-385212/<8>[   20.024486] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 385212_1.5.2.4.5> =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d0604592bdf96d53915ec7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe=
/baseline-sun50i-h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe=
/baseline-sun50i-h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d0604592bdf96d53915eca
        failing since 19 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-24T22:48:27.150232  <8>[   19.272248] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 385221_1.5.2.4.1>
    2023-01-24T22:48:27.256959  / # #
    2023-01-24T22:48:27.359336  export SHELL=3D/bin/sh
    2023-01-24T22:48:27.359975  #
    2023-01-24T22:48:27.461562  / # export SHELL=3D/bin/sh. /lava-385221/en=
vironment
    2023-01-24T22:48:27.462173  =

    2023-01-24T22:48:27.563763  / # . /lava-385221/environment/lava-385221/=
bin/lava-test-runner /lava-385221/1
    2023-01-24T22:48:27.564786  =

    2023-01-24T22:48:27.580983  / # /lava-385221/bin/lava-test-runner /lava=
-385221/1
    2023-01-24T22:48:27.646965  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d060a83590d50589915f8d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-=
h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-=
h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d060a83590d50589915f90
        failing since 19 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-24T22:49:59.227097  / # #
    2023-01-24T22:49:59.329473  export SHELL=3D/bin/sh
    2023-01-24T22:49:59.330066  #
    2023-01-24T22:49:59.431738  / # export SHELL=3D/bin/sh. /lava-385253/en=
vironment
    2023-01-24T22:49:59.432336  =

    2023-01-24T22:49:59.533993  / # . /lava-385253/environment/lava-385253/=
bin/lava-test-runner /lava-385253/1
    2023-01-24T22:49:59.535091  =

    2023-01-24T22:49:59.547107  / # /lava-385253/bin/lava-test-runner /lava=
-385253/1
    2023-01-24T22:49:59.617192  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-24T22:49:59.617615  + cd /lava-385253/<8>[   19.634300] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 385253_1.5.2.4.5> =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d0610edd79c81dd8915f26

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-clabbe=
/baseline-sun50i-h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-clabbe=
/baseline-sun50i-h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d0610edd79c81dd8915f29
        failing since 7 days (last pass: v6.1-13341-g16cba743aec0, first fa=
il: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-24T22:51:40.394904  <8>[   19.634897] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 385257_1.5.2.4.1>
    2023-01-24T22:51:40.501490  / # #
    2023-01-24T22:51:40.603920  export SHELL=3D/bin/sh
    2023-01-24T22:51:40.604627  #
    2023-01-24T22:51:40.706188  / # export SHELL=3D/bin/sh. /lava-385257/en=
vironment
    2023-01-24T22:51:40.706889  =

    2023-01-24T22:51:40.808493  / # . /lava-385257/environment/lava-385257/=
bin/lava-test-runner /lava-385257/1
    2023-01-24T22:51:40.809488  =

    2023-01-24T22:51:40.825297  / # /lava-385257/bin/lava-test-runner /lava=
-385257/1
    2023-01-24T22:51:40.894129  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d063a0f02b20d49d915ec3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orange=
pi-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orange=
pi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d063a0f02b20d49d915ec6
        failing since 20 days (last pass: v6.1-2435-g5c02e5d167d0, first fa=
il: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-24T23:02:35.069624  <8>[   19.195938] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 385265_1.5.2.4.1>
    2023-01-24T23:02:35.177698  / # #
    2023-01-24T23:02:35.280428  export SHELL=3D/bin/sh
    2023-01-24T23:02:35.280971  #
    2023-01-24T23:02:35.382110  / # export SHELL=3D/bin/sh. /lava-385265/en=
vironment
    2023-01-24T23:02:35.382661  =

    2023-01-24T23:02:35.484038  / # . /lava-385265/environment/lava-385265/=
bin/lava-test-runner /lava-385265/1
    2023-01-24T23:02:35.484829  =

    2023-01-24T23:02:35.499309  / # /lava-385265/bin/lava-test-runner /lava=
-385265/1
    2023-01-24T23:02:35.566407  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d05cf3014e88f26c915ec2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d05cf3014e88f26c915ec5
        failing since 19 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-24T22:34:11.127152  [   26.440148] <LAVA_SIGNAL_ENDRUN 0_dmesg =
385173_1.5.2.4.1>
    2023-01-24T22:34:11.233870  / # #
    2023-01-24T22:34:11.336108  export SHELL=3D/bin/sh
    2023-01-24T22:34:11.336697  #
    2023-01-24T22:34:11.438379  / # export SHELL=3D/bin/sh. /lava-385173/en=
vironment
    2023-01-24T22:34:11.439055  =

    2023-01-24T22:34:11.540468  / # . /lava-385173/environment/lava-385173/=
bin/lava-test-runner /lava-385173/1
    2023-01-24T22:34:11.541527  =

    2023-01-24T22:34:11.557727  / # /lava-385173/bin/lava-test-runner /lava=
-385173/1
    2023-01-24T22:34:11.637854  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d05d93eecab2bebb915f54

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d05d93eecab2bebb915f57
        failing since 19 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-24T22:36:57.761477  / # #
    2023-01-24T22:36:57.863835  export SHELL=3D/bin/sh
    2023-01-24T22:36:57.864582  #
    2023-01-24T22:36:57.967022  / # export SHELL=3D/bin/sh. /lava-385182/en=
vironment
    2023-01-24T22:36:57.967753  =

    2023-01-24T22:36:58.070106  / # . /lava-385182/environment/lava-385182/=
bin/lava-test-runner /lava-385182/1
    2023-01-24T22:36:58.071600  =

    2023-01-24T22:36:58.081695  / # /lava-385182/bin/lava-test-runner /lava=
-385182/1
    2023-01-24T22:36:58.195962  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-24T22:36:58.196312  + cd /lava-385182/1/tests/1_bootrr =

    ... (22 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63d05e83b6a57e0591915ec6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8i=
-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8i=
-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d05e83b6a57e0591915ec9
        failing since 19 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-24T22:40:44.068112  / # #
    2023-01-24T22:40:44.170430  export SHELL=3D/bin/sh
    2023-01-24T22:40:44.171216  [   20.603905] usb-storage 2-1.1:1.0: USB M=
ass Storage device detected
    2023-01-24T22:40:44.171483  [   20.612716] scsi host0: usb-storage 2-1.=
1:1.0
    2023-01-24T22:40:44.171684  #[   20.626261] usbcore: registered new int=
erface driver uas
    2023-01-24T22:40:44.171879  =

    2023-01-24T22:40:44.273301  / # export SHELL=3D/bin/sh. /lava-385225/en=
vironment
    2023-01-24T22:40:44.273921  =

    2023-01-24T22:40:44.375478  / # . /lava-385225/environment/lava-385225/=
bin/lava-test-runner /lava-385225/1
    2023-01-24T22:40:44.376516   =

    ... (21 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d05ee72ea6b8753a915ebe

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/bas=
eline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/bas=
eline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d05ee72ea6b8753a915ec1
        failing since 19 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-24T22:42:27.341328  =

    2023-01-24T22:42:27.443119  / # #export SHELL=3D/bin/sh
    2023-01-24T22:42:27.443871  =

    2023-01-24T22:42:27.545433  / # export SHELL=3D/bin/sh. /lava-385233/en=
vironment
    2023-01-24T22:42:27.546146  [   23.427539] usb-storage 2-1.1:1.0: USB M=
ass Storage device detected
    2023-01-24T22:42:27.546623  [   23.437439] scsi host0: usb-storage 2-1.=
1:1.0
    2023-01-24T22:42:27.546951  =

    2023-01-24T22:42:27.547304  / # [   23.461792] usbcore: registered new =
interface driver uas
    2023-01-24T22:42:27.648933  . /lava-385233/environment/lava-385233/bin/=
lava-test-runner /lava-385233/1
    2023-01-24T22:42:27.650085   =

    ... (21 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d05f39fa25dc4fd6915ece

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83=
t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83=
t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d05f39fa25dc4fd6915ed1
        failing since 19 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-24T22:44:00.734772  / # #
    2023-01-24T22:44:00.837802  export SHELL=3D/bin/sh
    2023-01-24T22:44:00.838615  #[   19.753412] usb-storage 2-1.1:1.0: USB =
Mass Storage device detected
    2023-01-24T22:44:00.838882  [   19.762311] scsi host0: usb-storage 2-1.=
1:1.0
    2023-01-24T22:44:00.839240  [   19.777645] usbcore: registered new inte=
rface driver uas
    2023-01-24T22:44:00.839442  =

    2023-01-24T22:44:00.941328  / # export SHELL=3D/bin/sh. /lava-385238/en=
vironment
    2023-01-24T22:44:00.942107  =

    2023-01-24T22:44:01.043578  / # . /lava-385238/environment/lava-385238/=
bin/lava-test-runner /lava-385238/1
    2023-01-24T22:44:01.044631   =

    ... (21 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63d059e65c2db46343915ebf

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-b=
ananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-21=
9-g3c4f681a3d69/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-b=
ananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d059e65c2db46343915ec2
        failing since 19 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-24T22:21:20.411561  / # #
    2023-01-24T22:21:20.513983  export SHELL=3D/bin/sh
    2023-01-24T22:21:20.514648  #
    2023-01-24T22:21:20.616101  / # export SHELL=3D/bin/sh. /lava-385103/en=
vironment
    2023-01-24T22:21:20.616758  =

    2023-01-24T22:21:20.718480  / # . /lava-385103/environment/lava-385103/=
bin/lava-test-runner /lava-385103/1
    2023-01-24T22:21:20.719761  =

    2023-01-24T22:21:20.735049  / # /lava-385103/bin/lava-test-runner /lava=
-385103/1
    2023-01-24T22:21:20.842150  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-24T22:21:20.842901  + cd /lava-385103/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =20
