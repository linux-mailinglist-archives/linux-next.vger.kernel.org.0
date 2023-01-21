Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAE586769E8
	for <lists+linux-next@lfdr.de>; Sat, 21 Jan 2023 23:59:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjAUW7H (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 21 Jan 2023 17:59:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjAUW7H (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 21 Jan 2023 17:59:07 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDB216A5F
        for <linux-next@vger.kernel.org>; Sat, 21 Jan 2023 14:59:02 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id 36so6581337pgp.10
        for <linux-next@vger.kernel.org>; Sat, 21 Jan 2023 14:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IW5UPyntUPSc1M741RYOuOFV8RsOkmDdSZ3X98j9Il8=;
        b=qetpAWpEkx+cKvtmIZYJHWuJ7Tkv3rhnq9bnIoyzT39WXoh86Uqdp/Rgr+eizWcA5D
         HJ9K6cA2UQrG/RghSzMRd0WQ64dO85I8QOyO5GVWG9TYuIIBxiR28wK6WMPWGfD9LLOl
         iI+RNyelynfm8wWmmKw+L+SdRqbME17hj9uvUpRpcNvQr8jMCH06UhbbINQOFnuQHB5K
         lhodv+A4XVbM8y3MVePnkZMZCy6ghv01Ng3+VVcN3oGgLlIerypky4r+Bb0AIIbNY12l
         HUyxB43ds+qtorGkQCT/h9YoXWXyfX8/coQ9iaW6KHav60zTj8R5oQ6ryYSMaZNg4wDw
         KEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IW5UPyntUPSc1M741RYOuOFV8RsOkmDdSZ3X98j9Il8=;
        b=OnRd4W/STMXqlj4XkXup70J45Xfx++lvbAeOU7rUgCNQCixcXc8TWnPBrMYvHH7VeN
         2OZpiUMSwLnQU28uo63WrYa8Q7+5Kn4Qs3QRiO6heY5y4FeRYep/HYr8wh4cg0NMKpbm
         OdfwYx25niOmI4XqtERDj8sRUBL3xzwIg/8xzdsXm197AAxc04ad+YJHA7qbn7+CGezL
         TaP3O8oiq7cgunt5jj9Rn/xz9zhlTa8lBzAYSMMSuc+BU/GP6Qa3GpoWkW/9HP8A6MqM
         FYLXjGaP252myonxiGj+peoZtJk8doI+j4yNQLH8wxfGpQmpBRMi6fWazBoLPGkdIlGY
         zu+Q==
X-Gm-Message-State: AFqh2krf3DeHDBbcu7XUVpwr2or51Immi6hgjtSIElraIS+pV9WaPr/o
        9zYGKOFkWxyyu3z0wpD7u3/kJ+BUyB0mtSpDufU=
X-Google-Smtp-Source: AMrXdXu+D/0CrlA5GQM/1Uft8qKaG9amEmM2ZCYddXl63P8uSkw7MH+ai/jT8EmtRAYTLqSwCoFV1A==
X-Received: by 2002:a62:1992:0:b0:58d:be61:8bc8 with SMTP id 140-20020a621992000000b0058dbe618bc8mr17789621pfz.8.1674341941328;
        Sat, 21 Jan 2023 14:59:01 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y194-20020a62cecb000000b005898fcb7c1bsm24166189pfg.177.2023.01.21.14.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 14:59:00 -0800 (PST)
Message-ID: <63cc6e34.620a0220.20fc7.82c7@mx.google.com>
Date:   Sat, 21 Jan 2023 14:59:00 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.2-rc4-480-gb1867226dfbb
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 582 runs,
 28 regressions (v6.2-rc4-480-gb1867226dfbb)
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

next/pending-fixes baseline: 582 runs, 28 regressions (v6.2-rc4-480-gb18672=
26dfbb)

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

beagle-xm                    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =

imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.2-rc4-480-gb1867226dfbb/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.2-rc4-480-gb1867226dfbb
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b1867226dfbb69bf7395369ee0fe3a469500868e =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63cc32556b5b7e89a7915ed6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cc32556b5b7e89a7915=
ed7
        failing since 103 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2835-rpi-b-rev2           | arm   | lab-broonie     | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63cc33b7448536ca33915ece

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cc33b7448536ca33915ed3
        failing since 4 days (last pass: v6.2-rc4-269-g1ab337b63ead, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-21T18:49:02.347893  + set +x
    2023-01-21T18:49:02.350612  <8>[   17.390399] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 147346_1.5.2.4.1>
    2023-01-21T18:49:02.464422  / # #
    2023-01-21T18:49:02.567312  export SHELL=3D/bin/sh
    2023-01-21T18:49:02.567955  #
    2023-01-21T18:49:02.670052  / # export SHELL=3D/bin/sh. /lava-147346/en=
vironment
    2023-01-21T18:49:02.670773  =

    2023-01-21T18:49:02.772946  / # . /lava-147346/environment/lava-147346/=
bin/lava-test-runner /lava-147346/1
    2023-01-21T18:49:02.774077  =

    2023-01-21T18:49:02.780622  / # /lava-147346/bin/lava-test-runner /lava=
-147346/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63cc3ae1352a602ef9915ec1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cc3ae1352a602ef9915ec6
        failing since 10 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-01-21T19:19:46.485488  / # #
    2023-01-21T19:19:46.587886  export SHELL=3D/bin/sh
    2023-01-21T19:19:46.588782  #
    2023-01-21T19:19:46.690870  / # export SHELL=3D/bin/sh. /lava-8815126/e=
nvironment
    2023-01-21T19:19:46.691696  =

    2023-01-21T19:19:46.793823  / # . /lava-8815126/environment/lava-881512=
6/bin/lava-test-runner /lava-8815126/1
    2023-01-21T19:19:46.795036  =

    2023-01-21T19:19:46.811200  / # /lava-8815126/bin/lava-test-runner /lav=
a-8815126/1
    2023-01-21T19:19:46.920192  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-21T19:19:46.920702  + cd /lava-8815126/1/tests/1_bootrr =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cc34264d725c9600915ed2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cc34264d725c9600915=
ed3
        new failure (last pass: v6.2-rc4-412-g665ddd640630) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63cc45179aeeb16a55915f03

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cc45179aeeb16a55915f08
        failing since 4 days (last pass: v6.1-13341-g16cba743aec0, first fa=
il: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-21T20:03:00.700027  <8>[   16.623611] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3175578_1.5.2.4.1>
    2023-01-21T20:03:00.806386  / # #
    2023-01-21T20:03:00.908103  export SHELL=3D/bin/sh
    2023-01-21T20:03:00.908601  #
    2023-01-21T20:03:01.009845  / # export SHELL=3D/bin/sh. /lava-3175578/e=
nvironment
    2023-01-21T20:03:01.010254  =

    2023-01-21T20:03:01.112389  / # . /lava-3175578/environment/lava-317557=
8/bin/lava-test-runner /lava-3175578/1
    2023-01-21T20:03:01.113048  =

    2023-01-21T20:03:01.117790  / # /lava-3175578/bin/lava-test-runner /lav=
a-3175578/1
    2023-01-21T20:03:01.198176  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cc49a9e6e98f6c44915f14

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cc49a9e6e98f6c44915f19
        failing since 4 days (last pass: v6.1-13341-g16cba743aec0, first fa=
il: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-21T20:22:44.585825  <8>[   14.824577] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-01-21T20:22:44.586006  + set +x
    2023-01-21T20:22:44.592267  <8>[   14.835311] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3175604_1.5.2.4.1>
    2023-01-21T20:22:44.699930  / # #
    2023-01-21T20:22:44.801631  export SHELL=3D/bin/sh
    2023-01-21T20:22:44.802021  #
    2023-01-21T20:22:44.906633  / # export SHELL=3D/bin/sh. /lava-3175604/e=
nvironment
    2023-01-21T20:22:44.907002  =

    2023-01-21T20:22:45.012191  / # . /lava-3175604/environment/lava-317560=
4/bin/lava-test-runner /lava-3175604/1
    2023-01-21T20:22:45.013269   =

    ... (14 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cc55b4b8afecdde5915efb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cc55b4b8afecdde5915f00
        failing since 4 days (last pass: v6.1-13341-g16cba743aec0, first fa=
il: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-21T21:14:08.445500  <8>[   14.961624] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3175834_1.5.2.4.1>
    2023-01-21T21:14:08.554001  / # #
    2023-01-21T21:14:08.655642  export SHELL=3D/bin/sh
    2023-01-21T21:14:08.656008  #
    2023-01-21T21:14:08.757247  / # export SHELL=3D/bin/sh. /lava-3175834/e=
nvironment
    2023-01-21T21:14:08.757664  =

    2023-01-21T21:14:08.757867  / # <3>[   15.208235] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-01-21T21:14:08.861245  . /lava-3175834/environment/lava-3175834/bi=
n/lava-test-runner /lava-3175834/1
    2023-01-21T21:14:08.863351  =

    2023-01-21T21:14:08.867933  / # /lava-3175834/bin/lava-test-runner /lav=
a-3175834/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63cc5669eedabe20c7915ed5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cc5669eedabe20c7915eda
        failing since 4 days (last pass: v6.1-13341-g16cba743aec0, first fa=
il: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-21T21:17:17.923824  <8>[   15.114056] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3175909_1.5.2.4.1>
    2023-01-21T21:17:18.035944  / # #
    2023-01-21T21:17:18.139703  export SHELL=3D/bin/sh
    2023-01-21T21:17:18.140806  #
    2023-01-21T21:17:18.243243  / # export SHELL=3D/bin/sh. /lava-3175909/e=
nvironment
    2023-01-21T21:17:18.244147  =

    2023-01-21T21:17:18.345988  / # . /lava-3175909/environment/lava-317590=
9/bin/lava-test-runner /lava-3175909/1
    2023-01-21T21:17:18.347820  <3>[   15.448644] Bluetooth: hci0: command =
0x0c03 tx timeout
    2023-01-21T21:17:18.348278  =

    2023-01-21T21:17:18.355902  / # /lava-3175909/bin/lava-test-runner /lav=
a-3175909/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63cc5b621f61b82bee915eba

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cc5b621f61b82bee915ebf
        failing since 4 days (last pass: v6.1-13341-g16cba743aec0, first fa=
il: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-21T21:38:20.350033  <8>[   24.439881] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3175979_1.5.2.4.1>
    2023-01-21T21:38:20.456827  / # #
    2023-01-21T21:38:20.558226  export SHELL=3D/bin/sh
    2023-01-21T21:38:20.558709  #
    2023-01-21T21:38:20.659905  / # export SHELL=3D/bin/sh. /lava-3175979/e=
nvironment
    2023-01-21T21:38:20.660376  =

    2023-01-21T21:38:20.761628  / # . /lava-3175979/environment/lava-317597=
9/bin/lava-test-runner /lava-3175979/1
    2023-01-21T21:38:20.762208  =

    2023-01-21T21:38:20.768571  / # /lava-3175979/bin/lava-test-runner /lav=
a-3175979/1
    2023-01-21T21:38:20.865179  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/63cc34cc7cb359d27d915ebe

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63cc34cc7cb359d=
27d915ec6
        failing since 362 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2023-01-21T18:53:23.488139  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2023-01-21T18:53:23.489925  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2023-01-21T18:53:23.491496  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2023-01-21T18:53:23.539244  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cc3cc30e5bffcd06915fa5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6=
dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6=
dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cc3cc30e5bffcd06915faa
        new failure (last pass: v6.2-rc4-412-g665ddd640630)

    2023-01-21T19:27:45.649447  + set[   15.032396] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 883700_1.5.2.3.1>
    2023-01-21T19:27:45.649600   +x
    2023-01-21T19:27:45.755565  / # #
    2023-01-21T19:27:45.857097  export SHELL=3D/bin/sh
    2023-01-21T19:27:45.857562  #
    2023-01-21T19:27:45.958845  / # export SHELL=3D/bin/sh. /lava-883700/en=
vironment
    2023-01-21T19:27:45.959349  =

    2023-01-21T19:27:46.060609  / # . /lava-883700/environment/lava-883700/=
bin/lava-test-runner /lava-883700/1
    2023-01-21T19:27:46.061264  =

    2023-01-21T19:27:46.064184  / # /lava-883700/bin/lava-test-runner /lava=
-883700/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63cc35bcb5158d0c62915ebd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cc35bcb5158d0c62915=
ebe
        failing since 136 days (last pass: v5.19-rc5-383-g73ad9bd963c1, fir=
st fail: v6.0-rc4-291-g83a56f559828) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63cc358198ee119312915f18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cc358198ee119312915=
f19
        failing since 137 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63cc3613fff72e93ad915edf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cc3613fff72e93ad915=
ee0
        failing since 137 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63cc3c091188a72f95915f1c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6s=
x-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6s=
x-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cc3c091188a72f95915f1f
        failing since 16 days (last pass: v6.1-rc4-405-g5cc6cef624e2, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-21T19:24:34.805216  <8>[   43.615659] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1141551_1.5.2.4.1>
    2023-01-21T19:24:34.910853  / # #
    2023-01-21T19:24:36.070620  export SHELL=3D/bin/sh
    2023-01-21T19:24:36.076125  #
    2023-01-21T19:24:37.621991  / # export SHELL=3D/bin/sh. /lava-1141551/e=
nvironment
    2023-01-21T19:24:37.627484  =

    2023-01-21T19:24:40.448222  / # . /lava-1141551/environment/lava-114155=
1/bin/lava-test-runner /lava-1141551/1
    2023-01-21T19:24:40.453888  =

    2023-01-21T19:24:40.454020  / # /lava-1141551/bin/lava-test-runner /lav=
a-1141551/1
    2023-01-21T19:24:40.557235  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (20 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63cc3af4352a602ef9915f06

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cc3af4352a602ef9915f09
        failing since 16 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-21T19:19:53.797563  <8>[   40.093772] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1141550_1.5.2.4.1>
    2023-01-21T19:19:53.902972  / # #
    2023-01-21T19:19:55.062714  export SHELL=3D/bin/sh
    2023-01-21T19:19:55.068426  #
    2023-01-21T19:19:56.615551  / # export SHELL=3D/bin/sh. /lava-1141550/e=
nvironment
    2023-01-21T19:19:56.621084  =

    2023-01-21T19:19:59.441337  / # . /lava-1141550/environment/lava-114155=
0/bin/lava-test-runner /lava-1141550/1
    2023-01-21T19:19:59.447257  =

    2023-01-21T19:19:59.456726  / # /lava-1141550/bin/lava-test-runner /lav=
a-1141550/1
    2023-01-21T19:19:59.504557  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (20 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cc554f76ad2744fa915ed5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cc554f76ad2744fa915=
ed6
        failing since 267 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cc435e58d0e4b527915ed8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63cc435f58d0e4b=
527915ee0
        new failure (last pass: v6.2-rc4-412-g665ddd640630)
        4 lines

    2023-01-21T19:56:01.769381  kern  :alert : BUG: Bad page map in process=
 udevadm  pte:4000000000 pmd:80000000bfb7003
    2023-01-21T19:56:01.780217  kern  :alert : addr:0000ffff9a9fe000 vm_<8>=
[   18.949898] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNI=
TS=3Dlines MEASUREMENT=3D4>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cc36495f90d33f2f915ee9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cc36495f90d33f2f915=
eea
        failing since 101 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cc362d75b65b5c18915f7b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cc362d75b65b5c18915=
f7c
        failing since 4 days (last pass: v6.2-rc4-269-g1ab337b63ead, first =
fail: v6.2-rc4-302-g48ed69cf21b2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cc5ce1a676c20047915ed8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cc5ce1a676c20047915=
ed9
        failing since 37 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cc5f8a54958f32ae915f04

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cc5f8a54958f32ae915=
f05
        failing since 37 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63cc338ec09350fe05915ed3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/bas=
eline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/bas=
eline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cc338ec09350fe05915ed6
        failing since 16 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-21T18:48:42.101200  [   21.077093] <LAVA_SIGNAL_ENDRUN 0_dmesg =
382886_1.5.2.4.1>
    2023-01-21T18:48:42.207499  / # #
    2023-01-21T18:48:42.309554  export SHELL=3D/bin/sh
    2023-01-21T18:48:42.310174  #
    2023-01-21T18:48:42.411529  / # export SHELL=3D/bin/sh. /lava-382886/en=
vironment
    2023-01-21T18:48:42.412200  [   21.303171] usb-storage 2-1.1:1.0: USB M=
ass Storage device detected
    2023-01-21T18:48:42.412449  [   21.312874] scsi host0: usb-storage 2-1.=
1:1.0
    2023-01-21T18:48:42.412651  =

    2023-01-21T18:48:42.412846  / # [   21.354787] usbcore: registered new =
interface driver uas
    2023-01-21T18:48:42.514489  . /lava-382886/environment/lava-382886/bin/=
lava-test-runner /lava-382886/1 =

    ... (26 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cc33de0a4224e9ca915ee0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cc33de0a4224e9ca915ee3
        failing since 16 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-21T18:49:57.953741  [   18.643631] <LAVA_SIGNAL_ENDRUN 0_dmesg =
382888_1.5.2.4.1>
    2023-01-21T18:49:58.059093  / # #
    2023-01-21T18:49:58.161095  export SHELL=3D/bin/sh
    2023-01-21T18:49:58.161750  [   18.675235] usb-storage 1-1.1:1.0: USB M=
ass Storage device detected
    2023-01-21T18:49:58.161995  [   18.683953] scsi host0: usb-storage 1-1.=
1:1.0
    2023-01-21T18:49:58.162208  [   18.700224] usbcore: registered new inte=
rface driver uas
    2023-01-21T18:49:58.162406  #
    2023-01-21T18:49:58.263744  / # export SHELL=3D/bin/sh. /lava-382888/en=
vironment
    2023-01-21T18:49:58.264322  =

    2023-01-21T18:49:58.365674  / # . /lava-382888/environment/lava-382888/=
bin/lava-test-runner /lava-382888/1 =

    ... (26 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cc37135f58a266fb915ed0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83=
t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83=
t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cc37135f58a266fb915ed3
        failing since 16 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-21T19:03:23.603112  / # #
    2023-01-21T19:03:23.705101  export SHELL=3D/bin/sh
    2023-01-21T19:03:23.705762  #
    2023-01-21T19:03:23.807090  / # export SHELL=3D/bin/sh. /lava-382941/en=
vironment
    2023-01-21T19:03:23.807743  =

    2023-01-21T19:03:23.909097  / # . /lava-382941/environment/lava-382941/=
bin/lava-test-runner /lava-382941/1
    2023-01-21T19:03:23.910127  =

    2023-01-21T19:03:23.926852  / # /lava-382941/bin/lava-test-runner /lava=
-382941/1
    2023-01-21T19:03:24.050055  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-21T19:03:24.050389  + cd /lava-382941/1/tests/1_bootrr =

    ... (22 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63cc38b7868df76822915ee0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8i=
-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8i=
-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cc38b7868df76822915ee3
        failing since 16 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-21T19:10:39.081893  / # #
    2023-01-21T19:10:39.185206  export SHELL=3D/bin/sh
    2023-01-21T19:10:39.185726  #
    2023-01-21T19:10:39.289293  / # export SHELL=3D/bin/sh. /lava-382953/en=
vironment
    2023-01-21T19:10:39.289811  =

    2023-01-21T19:10:39.399224  / # . /lava-382953/environment/lava-382953/=
bin/lava-test-runner /lava-382953/1
    2023-01-21T19:10:39.400142  =

    2023-01-21T19:10:39.410082  / # /lava-382953/bin/lava-test-runner /lava=
-382953/1
    2023-01-21T19:10:39.534798  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-21T19:10:39.535150  + cd /lava-382953/1/tests/1_bootrr =

    ... (22 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63cc391bf92b2ab5ae915f20

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cc391bf92b2ab5ae915f23
        failing since 16 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-21T19:12:13.217093  / # #
    2023-01-21T19:12:13.320092  export SHELL=3D/bin/sh
    2023-01-21T19:12:13.320731  #
    2023-01-21T19:12:13.426092  / # export SHELL=3D/bin/sh. /lava-382967/en=
vironment
    2023-01-21T19:12:13.426571  =

    2023-01-21T19:12:13.531094  / # . /lava-382967/environment/lava-382967/=
bin/lava-test-runner /lava-382967/1
    2023-01-21T19:12:13.531846  =

    2023-01-21T19:12:13.537825  / # /lava-382967/bin/lava-test-runner /lava=
-382967/1
    2023-01-21T19:12:13.667023  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-21T19:12:13.667374  + cd /lava-382967/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63cc3547a30ec32220915ee7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-b=
ananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-48=
0-gb1867226dfbb/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-b=
ananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cc3547a30ec32220915eea
        failing since 16 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-21T18:55:51.463692  / # #
    2023-01-21T18:55:51.567600  export SHELL=3D/bin/sh
    2023-01-21T18:55:51.568116  #
    2023-01-21T18:55:51.670304  / # export SHELL=3D/bin/sh. /lava-382918/en=
vironment
    2023-01-21T18:55:51.670941  =

    2023-01-21T18:55:51.772465  / # . /lava-382918/environment/lava-382918/=
bin/lava-test-runner /lava-382918/1
    2023-01-21T18:55:51.773531  =

    2023-01-21T18:55:51.782056  / # /lava-382918/bin/lava-test-runner /lava=
-382918/1
    2023-01-21T18:55:51.892324  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-21T18:55:51.892691  + cd /lava-382918/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =20
