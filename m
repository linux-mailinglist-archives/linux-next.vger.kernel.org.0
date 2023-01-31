Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA5CA682C9C
	for <lists+linux-next@lfdr.de>; Tue, 31 Jan 2023 13:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231713AbjAaMeI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 31 Jan 2023 07:34:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjAaMeH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 31 Jan 2023 07:34:07 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FFCC3801E
        for <linux-next@vger.kernel.org>; Tue, 31 Jan 2023 04:34:01 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id g68so9922090pgc.11
        for <linux-next@vger.kernel.org>; Tue, 31 Jan 2023 04:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Wz7cElwTQnP0VbrUnp5yTztw9tccqeu5mFP2Gi1vuik=;
        b=p3GiBTM1TOXzTNJXPO7aGYyd0Q1DCce8RCMEZ2LGvsWc6VeCrQExUFZ5AWn9YA2LPE
         2z0owSJppZv9nTWb/X2/5eSdEJe/rQAD7a44jcZU9F7D6RcItff7XZZrouRqnubMqqz0
         t0V3aJCYaIWOekb4VqmGKaQnZEOlKQ8hEPHibmGeI2kfKRPmgtS3JdKTR3mahpGG+KbH
         EhqpDePyLUzC9ZNjdE8gLGcQJkXegUi9O5Ld+ZX3qo71AQtG8q8i3Ild1Oo0t/6WQH7x
         vq0hdEQK2YDtzrpHU0EKvxBm38JPFE3Oeyu2Zvtsb9UnwOhg3hmbQD+phCHq/zzBgIro
         /pEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wz7cElwTQnP0VbrUnp5yTztw9tccqeu5mFP2Gi1vuik=;
        b=fTuRjWm3Ha+UuIuha52Rh9s8J+jTK0KbwQ7M38eJ0p3SmDDntLRtev52PS7e5wVcVx
         XdUu7bfGb0d1mqxSffm85AARoCdqR4g0zYv8rQ1OxEqZ7N1Z3h2g6n8QfEbObwUIM+bL
         egEfOr5srkFnCmnDleKUUVoOrVGD7PnWD4YubMA9L8iK7vsipPfPLoDjcEYyVegFlgyN
         fUVGABA7EYZiwZOTTTLgDq+VpLjx5rHHl7DvXiTmV/VhBv3V/zFQJIqZwSxL37AIOpbk
         ADFn0jhwvVLwB2pvbPwVU5Pa39lqw4M5m6x1jEMahWE7Lbd1ELv7+WQhlei974mLuOL6
         DB7Q==
X-Gm-Message-State: AO0yUKXBn+8sqJHcSzoo1jI4vuDb5ydW81o1kiBW5MOgcDbjrDKDWnFw
        3TO+8baCRVIoBehZAagZ7oNMcXunwUuJU8WyiUPUbg==
X-Google-Smtp-Source: AK7set/XhcStWgrll6iMqMjjiQ4TT16s+7NuXL7QyEOyIe2xPcnjRM2zKV9Az+FyCGP7R3zR/uY2CA==
X-Received: by 2002:a62:4ec1:0:b0:593:d2ab:fdfb with SMTP id c184-20020a624ec1000000b00593d2abfdfbmr5595639pfb.13.1675168440029;
        Tue, 31 Jan 2023 04:34:00 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w6-20020aa78586000000b005907716bf8bsm7824892pfn.60.2023.01.31.04.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 04:33:59 -0800 (PST)
Message-ID: <63d90ab7.a70a0220.9aaf9.dab4@mx.google.com>
Date:   Tue, 31 Jan 2023 04:33:59 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.2-rc6-241-g70d29276a90d
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 661 runs,
 28 regressions (v6.2-rc6-241-g70d29276a90d)
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

next/pending-fixes baseline: 661 runs, 28 regressions (v6.2-rc6-241-g70d292=
76a90d)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

sun5i-a13-olinuxino-micro    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =

tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.2-rc6-241-g70d29276a90d/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.2-rc6-241-g70d29276a90d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      70d29276a90d181584b2ed5c83079fad7e2cd6b6 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d8d93ffa5a9f8581915edd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d8d93ffa5a9f8581915=
ede
        new failure (last pass: v6.2-rc5-174-gc5f142de047d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63d8cf9e4215eabb6a915ed2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d8cf9e4215eabb6a915ed7
        failing since 19 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-01-31T08:21:35.411833  / # #
    2023-01-31T08:21:35.514585  export SHELL=3D/bin/sh
    2023-01-31T08:21:35.515400  #
    2023-01-31T08:21:35.617562  / # export SHELL=3D/bin/sh. /lava-8944060/e=
nvironment
    2023-01-31T08:21:35.618381  =

    2023-01-31T08:21:35.720208  / # . /lava-8944060/environment/lava-894406=
0/bin/lava-test-runner /lava-8944060/1
    2023-01-31T08:21:35.722066  =

    2023-01-31T08:21:35.731397  / # /lava-8944060/bin/lava-test-runner /lav=
a-8944060/1
    2023-01-31T08:21:35.847393  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-31T08:21:35.847910  + cd /lava-8944060/1/tests/1_bootrr =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d8d0fa4e6ad73636915f11

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d8d0fa4e6ad73636915f16
        failing since 13 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-31T08:27:10.510321  + set +x<8>[   15.223681] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3249514_1.5.2.4.1>
    2023-01-31T08:27:10.510639  =

    2023-01-31T08:27:10.617321  / # #
    2023-01-31T08:27:10.718850  export SHELL=3D/bin/sh
    2023-01-31T08:27:10.719206  #
    2023-01-31T08:27:10.820314  / # export SHELL=3D/bin/sh. /lava-3249514/e=
nvironment
    2023-01-31T08:27:10.820665  =

    2023-01-31T08:27:10.820825  / # <3>[   15.451852] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-01-31T08:27:10.921791  . /lava-3249514/environment/lava-3249514/bi=
n/lava-test-runner /lava-3249514/1
    2023-01-31T08:27:10.923026   =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d8d5d4403aa13ccb915ec4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d8d5d4403aa13ccb915ec9
        failing since 13 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-31T08:48:10.732806  <8>[   15.206636] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3249658_1.5.2.4.1>
    2023-01-31T08:48:10.842509  / # #
    2023-01-31T08:48:10.946643  export SHELL=3D/bin/sh
    2023-01-31T08:48:10.947711  #
    2023-01-31T08:48:11.049886  / # export SHELL=3D/bin/sh. /lava-3249658/e=
nvironment
    2023-01-31T08:48:11.050701  =

    2023-01-31T08:48:11.152574  / # . /lava-3249658/environment/lava-324965=
8/bin/lava-test-runner /lava-3249658/1
    2023-01-31T08:48:11.154056  =

    2023-01-31T08:48:11.158870  / # /lava-3249658/bin/lava-test-runner /lav=
a-3249658/1
    2023-01-31T08:48:11.214123  <3>[   15.689998] Bluetooth: hci0: command =
0x0c03 tx timeout =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d8d69e2a77876111915ec8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d8d69e2a77876111915ecd
        failing since 13 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-31T08:51:27.739918  <8>[   23.157573] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3249783_1.5.2.4.1>
    2023-01-31T08:51:27.850122  / # #
    2023-01-31T08:51:27.953067  export SHELL=3D/bin/sh
    2023-01-31T08:51:27.953978  #
    2023-01-31T08:51:28.055700  / # export SHELL=3D/bin/sh. /lava-3249783/e=
nvironment
    2023-01-31T08:51:28.056707  =

    2023-01-31T08:51:28.158764  / # . /lava-3249783/environment/lava-324978=
3/bin/lava-test-runner /lava-3249783/1
    2023-01-31T08:51:28.160104  =

    2023-01-31T08:51:28.164908  / # /lava-3249783/bin/lava-test-runner /lav=
a-3249783/1
    2023-01-31T08:51:28.262263  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d8d72cfc3e78d14e915ec6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d8d72cfc3e78d14e915ecb
        failing since 13 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-31T08:53:48.978954  <8>[   16.629561] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3249789_1.5.2.4.1>
    2023-01-31T08:53:49.090267  / # #
    2023-01-31T08:53:49.192961  export SHELL=3D/bin/sh
    2023-01-31T08:53:49.193671  #
    2023-01-31T08:53:49.295717  / # export SHELL=3D/bin/sh. /lava-3249789/e=
nvironment
    2023-01-31T08:53:49.296575  =

    2023-01-31T08:53:49.398459  / # . /lava-3249789/environment/lava-324978=
9/bin/lava-test-runner /lava-3249789/1
    2023-01-31T08:53:49.399812  =

    2023-01-31T08:53:49.404515  / # /lava-3249789/bin/lava-test-runner /lav=
a-3249789/1
    2023-01-31T08:53:49.496246  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63d8d7ad8f1d41958a915f50

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d8d7ad8f1d41958a915f55
        failing since 13 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-31T08:55:54.847372  <8>[   14.378663] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3249823_1.5.2.4.1>
    2023-01-31T08:55:54.959340  / # #
    2023-01-31T08:55:55.062930  export SHELL=3D/bin/sh
    2023-01-31T08:55:55.064045  #
    2023-01-31T08:55:55.064567  / # export SHELL=3D/bin/sh<3>[   14.571912]=
 Bluetooth: hci0: command 0xfc18 tx timeout
    2023-01-31T08:55:55.166573  . /lava-3249823/environment
    2023-01-31T08:55:55.167435  =

    2023-01-31T08:55:55.269485  / # . /lava-3249823/environment/lava-324982=
3/bin/lava-test-runner /lava-3249823/1
    2023-01-31T08:55:55.271210  =

    2023-01-31T08:55:55.276058  / # /lava-3249823/bin/lava-test-runner /lav=
a-3249823/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/63d8d28c420ed2fff7915ef7

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63d8d28c420ed2f=
ff7915eff
        failing since 372 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2023-01-31T08:33:54.419266  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2023-01-31T08:33:54.419983  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2023-01-31T08:33:54.422697  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2023-01-31T08:33:54.469381  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63d8d4780544ab447f915ebb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d8d4780544ab447f915=
ebc
        new failure (last pass: v6.2-rc6-199-g0a49732f057b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d8d0a96df0cd66e8915ee5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d8d0a96df0cd66e8915eea
        failing since 1 day (last pass: v6.1-rc8-128-gc530a9add07c, first f=
ail: v6.2-rc6-199-g0a49732f057b)

    2023-01-31T08:26:07.257344  + set +x
    2023-01-31T08:26:07.257527  [   12.920746] <LAVA_SIGNAL_ENDRUN 0_dmesg =
892440_1.5.2.3.1>
    2023-01-31T08:26:07.365216  / # #
    2023-01-31T08:26:07.466877  export SHELL=3D/bin/sh
    2023-01-31T08:26:07.467368  #
    2023-01-31T08:26:07.568628  / # export SHELL=3D/bin/sh. /lava-892440/en=
vironment
    2023-01-31T08:26:07.569115  =

    2023-01-31T08:26:07.670499  / # . /lava-892440/environment/lava-892440/=
bin/lava-test-runner /lava-892440/1
    2023-01-31T08:26:07.671231  =

    2023-01-31T08:26:07.674159  / # /lava-892440/bin/lava-test-runner /lava=
-892440/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d8d4a45c1970a520915f43

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d8d4a45c1970a520915f48
        failing since 1 day (last pass: v6.1-rc8-128-gc530a9add07c, first f=
ail: v6.2-rc6-199-g0a49732f057b)

    2023-01-31T08:42:59.064778  + set +x
    2023-01-31T08:42:59.064946  [   12.651796] <LAVA_SIGNAL_ENDRUN 0_dmesg =
892454_1.5.2.3.1>
    2023-01-31T08:42:59.171725  / # #
    2023-01-31T08:42:59.273606  export SHELL=3D/bin/sh
    2023-01-31T08:42:59.273956  #
    2023-01-31T08:42:59.375106  / # export SHELL=3D/bin/sh. /lava-892454/en=
vironment
    2023-01-31T08:42:59.375442  =

    2023-01-31T08:42:59.476866  / # . /lava-892454/environment/lava-892454/=
bin/lava-test-runner /lava-892454/1
    2023-01-31T08:42:59.477659  =

    2023-01-31T08:42:59.481056  / # /lava-892454/bin/lava-test-runner /lava=
-892454/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d8d4f42ffe10f767915f23

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d8d4f42ffe10f767915f28
        failing since 1 day (last pass: v6.1-rc8-128-gc530a9add07c, first f=
ail: v6.2-rc6-199-g0a49732f057b)

    2023-01-31T08:44:17.825276  + set +x
    2023-01-31T08:44:17.825432  [   16.123746] <LAVA_SIGNAL_ENDRUN 0_dmesg =
892461_1.5.2.3.1>
    2023-01-31T08:44:17.933158  / # #
    2023-01-31T08:44:18.034800  export SHELL=3D/bin/sh
    2023-01-31T08:44:18.035152  #
    2023-01-31T08:44:18.136301  / # export SHELL=3D/bin/sh. /lava-892461/en=
vironment
    2023-01-31T08:44:18.136667  =

    2023-01-31T08:44:18.237880  / # . /lava-892461/environment/lava-892461/=
bin/lava-test-runner /lava-892461/1
    2023-01-31T08:44:18.238400  =

    2023-01-31T08:44:18.241748  / # /lava-892461/bin/lava-test-runner /lava=
-892461/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d8d5457e1338a968915ee1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d8d5457e1338a968915ee6
        failing since 1 day (last pass: v6.1-rc8-128-gc530a9add07c, first f=
ail: v6.2-rc6-199-g0a49732f057b)

    2023-01-31T08:45:37.999155  + set +x
    2023-01-31T08:45:37.999295  [   11.918434] <LAVA_SIGNAL_ENDRUN 0_dmesg =
892469_1.5.2.3.1>
    2023-01-31T08:45:38.106603  / # #
    2023-01-31T08:45:38.208010  export SHELL=3D/bin/sh
    2023-01-31T08:45:38.208355  #
    2023-01-31T08:45:38.309501  / # export SHELL=3D/bin/sh. /lava-892469/en=
vironment
    2023-01-31T08:45:38.309864  =

    2023-01-31T08:45:38.411037  / # . /lava-892469/environment/lava-892469/=
bin/lava-test-runner /lava-892469/1
    2023-01-31T08:45:38.411533  =

    2023-01-31T08:45:38.414740  / # /lava-892469/bin/lava-test-runner /lava=
-892469/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63d8d595e53afceb3d915ebb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d8d595e53afceb3d915ec0
        failing since 1 day (last pass: v6.1-rc8-128-gc530a9add07c, first f=
ail: v6.2-rc6-199-g0a49732f057b)

    2023-01-31T08:46:58.179960  + set +x
    2023-01-31T08:46:58.180119  [   12.964537] <LAVA_SIGNAL_ENDRUN 0_dmesg =
892476_1.5.2.3.1>
    2023-01-31T08:46:58.287970  / # #
    2023-01-31T08:46:58.389324  export SHELL=3D/bin/sh
    2023-01-31T08:46:58.389720  #
    2023-01-31T08:46:58.490936  / # export SHELL=3D/bin/sh. /lava-892476/en=
vironment
    2023-01-31T08:46:58.491410  =

    2023-01-31T08:46:58.592758  / # . /lava-892476/environment/lava-892476/=
bin/lava-test-runner /lava-892476/1
    2023-01-31T08:46:58.593660  =

    2023-01-31T08:46:58.596718  / # /lava-892476/bin/lava-test-runner /lava=
-892476/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d8d5948c29eecee1915ebd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d8d5948c29eecee1915ec2
        new failure (last pass: v6.2-rc6-199-g0a49732f057b)

    2023-01-31T08:46:56.791177  + set[   14.394039] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 892468_1.5.2.3.1>
    2023-01-31T08:46:56.791332   +x
    2023-01-31T08:46:56.896914  / # #
    2023-01-31T08:46:56.998253  export SHELL=3D/bin/sh
    2023-01-31T08:46:56.998660  #
    2023-01-31T08:46:57.099950  / # export SHELL=3D/bin/sh. /lava-892468/en=
vironment
    2023-01-31T08:46:57.100361  =

    2023-01-31T08:46:57.201444  / # . /lava-892468/environment/lava-892468/=
bin/lava-test-runner /lava-892468/1
    2023-01-31T08:46:57.201882  =

    2023-01-31T08:46:57.204878  / # /lava-892468/bin/lava-test-runner /lava=
-892468/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d8cff8417c3b9d58915ecf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d8cff8417c3b9d58915=
ed0
        failing since 145 days (last pass: v5.19-rc5-383-g73ad9bd963c1, fir=
st fail: v6.0-rc4-291-g83a56f559828) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d8cf954215eabb6a915eca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d8cf954215eabb6a915=
ecb
        failing since 147 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d8d5d0fa5c972ba1915ee7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d8d5d0fa5c972ba1915eea
        failing since 26 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-31T08:47:37.522742  + set<8>[   40.669026] <LAVA_SIGNAL_ENDRUN =
0_dmesg 1149578_1.5.2.4.1>
    2023-01-31T08:47:37.523011   +x
    2023-01-31T08:47:37.628491  / # #
    2023-01-31T08:47:38.788068  export SHELL=3D/bin/sh
    2023-01-31T08:47:38.793602  #
    2023-01-31T08:47:40.339649  / # export SHELL=3D/bin/sh. /lava-1149578/e=
nvironment
    2023-01-31T08:47:40.345219  =

    2023-01-31T08:47:43.167007  / # . /lava-1149578/environment/lava-114957=
8/bin/lava-test-runner /lava-1149578/1
    2023-01-31T08:47:43.173037  =

    2023-01-31T08:47:43.182952  / # /lava-1149578/bin/lava-test-runner /lav=
a-1149578/1 =

    ... (21 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d8d33eaa02e5ff4a915fa8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d8d33eaa02e5ff4a915=
fa9
        failing since 276 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d8db78597bbd54f3915eba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d8db78597bbd54f3915=
ebb
        new failure (last pass: v6.2-rc6-199-g0a49732f057b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63d8d4f9a2842ab631915eea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g=
xm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g=
xm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d8d4f9a2842ab631915=
eeb
        new failure (last pass: v6.2-rc6-199-g0a49732f057b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d8d9ea1cb5c9de84915ef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d8d9ea1cb5c9de84915=
ef4
        failing since 1 day (last pass: v6.2-rc5-286-g436294605dc5, first f=
ail: v6.2-rc6-199-g0a49732f057b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d8cf4922407f9421915eb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d8cf4922407f9421915=
eba
        failing since 111 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d8d47777bf4bb25e915eda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d8d47777bf4bb25e915=
edb
        failing since 47 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d8d388e20b09e6ba915ec8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d8d388e20b09e6ba915=
ec9
        failing since 46 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun5i-a13-olinuxino-micro    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d8d307e5232a4c30915ecf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun5i-a=
13-olinuxino-micro.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun5i-a=
13-olinuxino-micro.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d8d307e5232a4c30915=
ed0
        new failure (last pass: v6.2-rc6-199-g0a49732f057b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63d8ceed8a4dfaf6fe915ebe

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-b=
ananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-b=
ananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d8ceed8a4dfaf6fe915ec1
        failing since 26 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-31T08:18:37.629113  / # #
    2023-01-31T08:18:37.731436  export SHELL=3D/bin/sh
    2023-01-31T08:18:37.732155  #
    2023-01-31T08:18:37.834038  / # export SHELL=3D/bin/sh. /lava-389120/en=
vironment
    2023-01-31T08:18:37.834686  =

    2023-01-31T08:18:37.936364  / # . /lava-389120/environment/lava-389120/=
bin/lava-test-runner /lava-389120/1
    2023-01-31T08:18:37.937531  =

    2023-01-31T08:18:37.952966  / # /lava-389120/bin/lava-test-runner /lava=
-389120/1
    2023-01-31T08:18:38.059938  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-31T08:18:38.060516  + cd /lava-389120/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d8d3b2e6441af7c5915ecd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-24=
1-g70d29276a90d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d8d3b2e6441af7c5915=
ece
        failing since 46 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =20
