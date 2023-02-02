Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE1B6873BF
	for <lists+linux-next@lfdr.de>; Thu,  2 Feb 2023 04:23:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbjBBDX3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Feb 2023 22:23:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbjBBDX2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Feb 2023 22:23:28 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE27A1ABF6
        for <linux-next@vger.kernel.org>; Wed,  1 Feb 2023 19:23:23 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id cl23-20020a17090af69700b0022c745bfdc3so551389pjb.3
        for <linux-next@vger.kernel.org>; Wed, 01 Feb 2023 19:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=agxcbtvVVsF0iIoMfGO+wo79OeGK+g+kTh5TYqFgjbI=;
        b=qEDqTzOQy9U7IopDYHy28iFcGvUQWh2Guuzs8dbxzOfc+wireLH3uD2YVa0GIOyZft
         /uhR27MtICZRpagYYYeURGbY5poLA2yzk8KFq2NNZy5JiqSxZMAB3sKn577I300XhD4H
         R3Jx0Es93CD3uGyMenGCIwJb/phr+LKZcQGKsqd3YPp4D7VI3KNGnx5H2GvuepPZDjmp
         1tYZQSO6+vbn8H7vyqGzvBe/Nqv29wP2ph3v1E+DZEvrNfwtLAmgIgHHzMz/yedSyEIA
         bYm6WBlgh3NQb6HeI9Xw+uv9j7yRY3B0yvLcdJTimUqpo/bBpqF1m7sBiY1kuzpVgYze
         S46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=agxcbtvVVsF0iIoMfGO+wo79OeGK+g+kTh5TYqFgjbI=;
        b=Og8S0Ihhe6XYO/29PgPmSJMuJsYDbEJPDjlBsp2i/KTXkbOZk6jRV4MajlEhP/JHqM
         2MDYEYYeAvnb5wSXJkzfyppyRAmpecMB8JQ83kG+DOMqrGWFZk/7PTxjoI3ucQ+3dyM+
         FclnpyslbVFAX7cmp9JqD7s7gI/1UV1cfMeAncqXi5W2SO59CIXWvJBg+13ffBtUD2BH
         vQSTEqXGbbIrpD0r2T7064gXQ5BjSXfVYN8PoWTgPucCCFC2XsZHl7AjRi5kcIG0hjKD
         y7GPf519rSdNsFxWKLN5SRldAop3xqFxo8KBoFHKhXuG/qAvywDrOeYe3+xK14j3G9lZ
         jQ0w==
X-Gm-Message-State: AO0yUKUpE1cW2v7oPDJxOrXkwgmRUMo3/UafJaJ1oEGmbR8XtAjQ5iUB
        miP5we2uCnbG7Np9E0f0+W3Hc0SpBQUG3jBotxDWzw==
X-Google-Smtp-Source: AK7set/3eAg0emfQo1VkZxddH49DG13vI6eFLjLOslO/QyMuyP5wgLL7oWaiQygJN4uehyBPX8xxkA==
X-Received: by 2002:a17:902:da8c:b0:196:897b:cded with SMTP id j12-20020a170902da8c00b00196897bcdedmr7023536plx.28.1675308202561;
        Wed, 01 Feb 2023 19:23:22 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h11-20020a170902f7cb00b001926392adf9sm12469222plw.271.2023.02.01.19.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 19:23:22 -0800 (PST)
Message-ID: <63db2caa.170a0220.bb2e3.6ab0@mx.google.com>
Date:   Wed, 01 Feb 2023 19:23:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.2-rc6-312-g66bb7649606e3
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 483 runs,
 27 regressions (v6.2-rc6-312-g66bb7649606e3)
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

next/pending-fixes baseline: 483 runs, 27 regressions (v6.2-rc6-312-g66bb76=
49606e3)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

qemu_i386                    | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig+debug         | 1          =

stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defconfig           | 1          =

sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.2-rc6-312-g66bb7649606e3/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.2-rc6-312-g66bb7649606e3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      66bb7649606e3c035a98c5c55754ccdb24fc4044 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63daeffecbdf69d9ea915f44

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm283=
6-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm283=
6-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63daeffecbdf69d9ea915f49
        failing since 21 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-02-01T23:04:16.755283  / # #
    2023-02-01T23:04:16.856949  export SHELL=3D/bin/sh
    2023-02-01T23:04:16.857446  #
    2023-02-01T23:04:16.958755  / # export SHELL=3D/bin/sh. /lava-8978217/e=
nvironment
    2023-02-01T23:04:16.959207  =

    2023-02-01T23:04:17.060550  / # . /lava-8978217/environment/lava-897821=
7/bin/lava-test-runner /lava-8978217/1
    2023-02-01T23:04:17.061324  =

    2023-02-01T23:04:17.062761  / # /lava-8978217/bin/lava-test-runner /lav=
a-8978217/1
    2023-02-01T23:04:17.190084  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-01T23:04:17.190383  + cd /lava-8978217/1/tests/1_bootrr =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63daf4eaa1d790761d915edf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63daf4eaa1d790761d915=
ee0
        failing since 11 days (last pass: v6.2-rc4-412-g665ddd640630, first=
 fail: v6.2-rc4-480-gb1867226dfbb) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63daf2c4035f39eda3915ed6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubiet=
ruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubiet=
ruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63daf2c4035f39eda3915edb
        failing since 15 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-02-01T23:15:51.457811  <8>[   14.334584] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3269438_1.5.2.4.1>
    2023-02-01T23:15:51.565438  / # #
    2023-02-01T23:15:51.667159  export SHELL=3D/bin/sh
    2023-02-01T23:15:51.667696  #
    2023-02-01T23:15:51.769243  / # export SHELL=3D/bin/sh. /lava-3269438/e=
nvironment
    2023-02-01T23:15:51.770058  =

    2023-02-01T23:15:51.871459  / # . /lava-3269438/environment/lava-326943=
8/bin/lava-test-runner /lava-3269438/1
    2023-02-01T23:15:51.872228  <3>[   14.652107] Bluetooth: hci0: command =
0x0c03 tx timeout
    2023-02-01T23:15:51.872444  =

    2023-02-01T23:15:51.876755  / # /lava-3269438/bin/lava-test-runner /lav=
a-3269438/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63daf35e75f747b98f915ec1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63daf35e75f747b98f915ec6
        failing since 15 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-02-01T23:18:07.789919  <8>[   15.405274] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3269508_1.5.2.4.1>
    2023-02-01T23:18:07.902679  / # #
    2023-02-01T23:18:08.006111  export SHELL=3D/bin/sh
    2023-02-01T23:18:08.007235  #
    2023-02-01T23:18:08.109434  / # export SHELL=3D/bin/sh. /lava-3269508/e=
nvironment
    2023-02-01T23:18:08.110237  =

    2023-02-01T23:18:08.212133  / # . /lava-3269508/environment/lava-326950=
8/bin/lava-test-runner /lava-3269508/1
    2023-02-01T23:18:08.213648  =

    2023-02-01T23:18:08.214173  / # <3>[   15.771917] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-02-01T23:18:08.218538  /lava-3269508/bin/lava-test-runner /lava-32=
69508/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63daf40817bad4653c915f1d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63daf40817bad4653c915f22
        failing since 15 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-02-01T23:21:13.735901  <8>[   23.934175] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3269727_1.5.2.4.1>
    2023-02-01T23:21:13.842877  / # #
    2023-02-01T23:21:13.944694  export SHELL=3D/bin/sh
    2023-02-01T23:21:13.945471  #
    2023-02-01T23:21:14.047331  / # export SHELL=3D/bin/sh. /lava-3269727/e=
nvironment
    2023-02-01T23:21:14.047919  =

    2023-02-01T23:21:14.149639  / # . /lava-3269727/environment/lava-326972=
7/bin/lava-test-runner /lava-3269727/1
    2023-02-01T23:21:14.151034  =

    2023-02-01T23:21:14.155973  / # /lava-3269727/bin/lava-test-runner /lav=
a-3269727/1
    2023-02-01T23:21:14.249741  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63daf4952724eef709915edd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63daf4952724eef709915ee2
        failing since 15 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-02-01T23:23:43.234343  <8>[   15.188019] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3269820_1.5.2.4.1>
    2023-02-01T23:23:43.342748  / # #
    2023-02-01T23:23:43.444120  export SHELL=3D/bin/sh
    2023-02-01T23:23:43.444477  #
    2023-02-01T23:23:43.545639  / # export SHELL=3D/bin/sh. /lava-3269820/e=
nvironment
    2023-02-01T23:23:43.546021  =

    2023-02-01T23:23:43.647171  / # . /lava-3269820/environment/lava-326982=
0/bin/lava-test-runner /lava-3269820/1
    2023-02-01T23:23:43.647700  =

    2023-02-01T23:23:43.652504  / # /lava-3269820/bin/lava-test-runner /lav=
a-3269820/1
    2023-02-01T23:23:43.741891  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/63daf1af02f9eea7af915ed5

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63daf1af02f9eea=
7af915edd
        failing since 374 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2023-02-01T23:11:02.560146  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2023-02-01T23:11:02.561024  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2023-02-01T23:11:02.563480  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2023-02-01T23:11:02.610672  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63daf0cdd666a78808915f22

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
3daf0cdd666a78808915f31
        new failure (last pass: v6.2-rc6-289-g1b7183933813)

    2023-02-01T23:07:35.053123  =

    2023-02-01T23:07:35.057440  /usr/bin/tpm2_getcap
    2023-02-01T23:07:35.088956  ERROR:tcti:src/tss2-tcti/tcti-device.c:286:=
tcti_device_receive() Failed to read response from fd 3, got errno 14: Bad =
address =

    2023-02-01T23:07:35.095005  ERROR:esys:src/tss2-esys/api/Esys_GetCapabi=
lity.c:307:Esys_GetCapability_Finish() Received a non-TPM Error =

    2023-02-01T23:07:35.104197  ERROR:esys:src/tss2-esys/api/Esys_GetCapabi=
lity.c:107:Esys_GetCapability() Esys Finish ErrorCode (0x000a000a) =

    2023-02-01T23:07:35.106943  ERROR: Esys_GetCapability(0xA000A) - tcti:I=
O failure
    2023-02-01T23:07:35.110077  ERROR: Unable to run tpm2_getcap
    2023-02-01T23:07:36.106508  ERROR:tcti:src/tss2-tcti/tcti-device.c:286:=
tcti_device_receive() Failed to read response from fd 3, got errno 14: Bad =
address =

    2023-02-01T23:07:36.114893  ERROR:esys:src/tss2-esys/api/Esys_GetCapabi=
lity.c:307:Esys_GetCapability_Finish() Received a non-TPM Error =

    2023-02-01T23:07:36.124606  ERROR:esys:src/tss2-esys/api/Esys_GetCapabi=
lity.c:107:Esys_GetCapability() Esys Finish ErrorCode (0x000a000a)  =

    ... (46 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63daf1dbb1df3d5926915ec9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63daf1dbb1df3d5926915ece
        failing since 2 days (last pass: v6.1-rc8-128-gc530a9add07c, first =
fail: v6.2-rc6-199-g0a49732f057b)

    2023-02-01T23:12:11.435614  + set +x
    2023-02-01T23:12:11.435891  [   12.861496] <LAVA_SIGNAL_ENDRUN 0_dmesg =
895463_1.5.2.3.1>
    2023-02-01T23:12:11.543666  / # #
    2023-02-01T23:12:11.645186  export SHELL=3D/bin/sh
    2023-02-01T23:12:11.645916  #
    2023-02-01T23:12:11.748861  / # export SHELL=3D/bin/sh. /lava-895463/en=
vironment
    2023-02-01T23:12:11.749236  =

    2023-02-01T23:12:11.850552  / # . /lava-895463/environment/lava-895463/=
bin/lava-test-runner /lava-895463/1
    2023-02-01T23:12:11.851333  =

    2023-02-01T23:12:11.854572  / # /lava-895463/bin/lava-test-runner /lava=
-895463/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63daf22d8770692228915f16

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63daf22d8770692228915f1b
        failing since 2 days (last pass: v6.1-rc8-128-gc530a9add07c, first =
fail: v6.2-rc6-199-g0a49732f057b)

    2023-02-01T23:13:30.693529  + set +x
    2023-02-01T23:13:30.693792  [   12.918985] <LAVA_SIGNAL_ENDRUN 0_dmesg =
895473_1.5.2.3.1>
    2023-02-01T23:13:30.801826  / # #
    2023-02-01T23:13:30.903595  export SHELL=3D/bin/sh
    2023-02-01T23:13:30.904190  #
    2023-02-01T23:13:31.005519  / # export SHELL=3D/bin/sh. /lava-895473/en=
vironment
    2023-02-01T23:13:31.006050  =

    2023-02-01T23:13:31.107314  / # . /lava-895473/environment/lava-895473/=
bin/lava-test-runner /lava-895473/1
    2023-02-01T23:13:31.108136  =

    2023-02-01T23:13:31.111331  / # /lava-895473/bin/lava-test-runner /lava=
-895473/1 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63daf2ca048c8fc9ec915eff

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/basel=
ine-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/basel=
ine-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63daf2ca048c8fc9ec915f04
        failing since 2 days (last pass: v6.1-rc8-128-gc530a9add07c, first =
fail: v6.2-rc6-199-g0a49732f057b)

    2023-02-01T23:16:11.773960  + set +x
    2023-02-01T23:16:11.774301  [   16.157425] <LAVA_SIGNAL_ENDRUN 0_dmesg =
895483_1.5.2.3.1>
    2023-02-01T23:16:11.882352  / # #
    2023-02-01T23:16:11.984344  export SHELL=3D/bin/sh
    2023-02-01T23:16:11.984930  #
    2023-02-01T23:16:12.086308  / # export SHELL=3D/bin/sh. /lava-895483/en=
vironment
    2023-02-01T23:16:12.087067  =

    2023-02-01T23:16:12.188525  / # . /lava-895483/environment/lava-895483/=
bin/lava-test-runner /lava-895483/1
    2023-02-01T23:16:12.189446  =

    2023-02-01T23:16:12.192361  / # /lava-895483/bin/lava-test-runner /lava=
-895483/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63daf39285e39f254b915ebb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63daf39285e39f254b915ec0
        failing since 2 days (last pass: v6.1-rc8-128-gc530a9add07c, first =
fail: v6.2-rc6-199-g0a49732f057b)

    2023-02-01T23:19:23.788466  + set +x
    2023-02-01T23:19:23.788655  [   12.669334] <LAVA_SIGNAL_ENDRUN 0_dmesg =
895491_1.5.2.3.1>
    2023-02-01T23:19:23.895484  / # #
    2023-02-01T23:19:23.997325  export SHELL=3D/bin/sh
    2023-02-01T23:19:23.998016  #
    2023-02-01T23:19:24.099432  / # export SHELL=3D/bin/sh. /lava-895491/en=
vironment
    2023-02-01T23:19:24.100010  =

    2023-02-01T23:19:24.201399  / # . /lava-895491/environment/lava-895491/=
bin/lava-test-runner /lava-895491/1
    2023-02-01T23:19:24.202229  =

    2023-02-01T23:19:24.205145  / # /lava-895491/bin/lava-test-runner /lava=
-895491/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63daf4fae5b68eff44915ee0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl=
-udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl=
-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63daf4fae5b68eff44915=
ee1
        failing since 147 days (last pass: v5.19-rc5-383-g73ad9bd963c1, fir=
st fail: v6.0-rc4-291-g83a56f559828) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63daf3bae62b062634915f71

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-=
udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-=
udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63daf3bae62b062634915=
f72
        failing since 148 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/63daf343f4818f05cf915f02

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63daf343f4818f05cf915f05
        new failure (last pass: v6.2-rc6-289-g1b7183933813)

    2023-02-01T23:17:58.851367  / # #
    2023-02-01T23:17:58.953243  export SHELL=3D/bin/sh
    2023-02-01T23:17:58.953707  #
    2023-02-01T23:17:59.055124  / # export SHELL=3D/bin/sh. /lava-263258/en=
vironment
    2023-02-01T23:17:59.055680  =

    2023-02-01T23:17:59.157327  / # . /lava-263258/environment/lava-263258/=
bin/lava-test-runner /lava-263258/1
    2023-02-01T23:17:59.158417  =

    2023-02-01T23:17:59.179264  / # /lava-263258/bin/lava-test-runner /lava=
-263258/1
    2023-02-01T23:17:59.229371  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-01T23:17:59.229700  + cd /l<8>[   15.811282] <LAVA_SIGNAL_START=
RUN 1_bootrr 263258_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/63d=
af343f4818f05cf915f15
        new failure (last pass: v6.2-rc6-289-g1b7183933813)

    2023-02-01T23:18:03.288621  /lava-263258/1/../bin/lava-test-case
    2023-02-01T23:18:03.289231  <8>[   20.035407] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-02-01T23:18:03.289525  /lava-263258/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63daf876655a8112f6915ed6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63daf876655a8112f6915=
ed7
        failing since 8 days (last pass: v6.2-rc5-157-g1f16e03afb18, first =
fail: v6.2-rc5-174-gc5f142de047d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63daf0bb99382a4375915ee1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-=
cloudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-=
cloudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63daf0bb99382a4375915=
ee2
        failing since 112 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/63daf29f8c2e369ee0915ecd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/i386/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_i386.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/i386/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63daf29f8c2e369ee0915=
ece
        new failure (last pass: v6.2-rc6-289-g1b7183933813) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63daf1d4fa2c657bca915ee9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-stm32m=
p157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-stm32m=
p157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63daf1d4fa2c657bca915eee
        failing since 0 day (last pass: v6.0-11312-g1778d6da389c, first fai=
l: v6.2-rc6-289-g1b7183933813)

    2023-02-01T23:11:56.377507  <8>[   13.696665] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3269442_1.5.2.4.1>
    2023-02-01T23:11:56.483666  / # #
    2023-02-01T23:11:56.586306  export SHELL=3D/bin/sh
    2023-02-01T23:11:56.586778  #
    2023-02-01T23:11:56.688187  / # export SHELL=3D/bin/sh. /lava-3269442/e=
nvironment
    2023-02-01T23:11:56.688672  =

    2023-02-01T23:11:56.790069  / # . /lava-3269442/environment/lava-326944=
2/bin/lava-test-runner /lava-3269442/1
    2023-02-01T23:11:56.790723  =

    2023-02-01T23:11:56.793545  / # /lava-3269442/bin/lava-test-runner /lav=
a-3269442/1
    2023-02-01T23:11:56.870403  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63daf212b63c69a0c7915ed1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-st=
m32mp157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-st=
m32mp157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63daf212b63c69a0c7915ed6
        failing since 0 day (last pass: v5.19-3879-ge7dffa5317766, first fa=
il: v6.2-rc6-289-g1b7183933813)

    2023-02-01T23:13:11.908224  <8>[   12.727478] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3269497_1.5.2.4.1>
    2023-02-01T23:13:12.014117  / # #
    2023-02-01T23:13:12.115549  export SHELL=3D/bin/sh
    2023-02-01T23:13:12.115931  #
    2023-02-01T23:13:12.217068  / # export SHELL=3D/bin/sh. /lava-3269497/e=
nvironment
    2023-02-01T23:13:12.217451  =

    2023-02-01T23:13:12.318608  / # . /lava-3269497/environment/lava-326949=
7/bin/lava-test-runner /lava-3269497/1
    2023-02-01T23:13:12.319187  =

    2023-02-01T23:13:12.323274  / # /lava-3269497/bin/lava-test-runner /lav=
a-3269497/1
    2023-02-01T23:13:12.399202  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63daf3df4990f90c02915ee6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-stm32mp157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-stm32mp157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63daf3df4990f90c02915=
ee7
        failing since 0 day (last pass: v6.0-11312-g1778d6da389c, first fai=
l: v6.2-rc6-289-g1b7183933813) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63daf418be55df4550915ef3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-stm32mp157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-stm32mp157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63daf418be55df4550915ef8
        failing since 0 day (last pass: v5.19-rc5-345-gd3298a6516a4, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-02-01T23:21:54.370523  <8>[   13.594074] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3269810_1.5.2.4.1>
    2023-02-01T23:21:54.476805  / # #
    2023-02-01T23:21:54.578525  export SHELL=3D/bin/sh
    2023-02-01T23:21:54.578994  #
    2023-02-01T23:21:54.680422  / # export SHELL=3D/bin/sh. /lava-3269810/e=
nvironment
    2023-02-01T23:21:54.680876  =

    2023-02-01T23:21:54.782378  / # . /lava-3269810/environment/lava-326981=
0/bin/lava-test-runner /lava-3269810/1
    2023-02-01T23:21:54.783162  =

    2023-02-01T23:21:54.786556  / # /lava-3269810/bin/lava-test-runner /lav=
a-3269810/1
    2023-02-01T23:21:54.857516  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63daf205569100b656915ee5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a8=
3t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a8=
3t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63daf205569100b656915eea
        failing since 28 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-02-01T23:12:47.676105  / # #
    2023-02-01T23:12:47.780098  export SHELL=3D/bin/sh
    2023-02-01T23:12:47.780718  [   18.111067] usb-storage 2-1.1:1.0: USB M=
ass Storage device detected
    2023-02-01T23:12:47.780950  [   18.120067] scsi host0: usb-storage 2-1.=
1:1.0
    2023-02-01T23:12:47.781164  [   18.134503] usbcore: registered new inte=
rface driver uas
    2023-02-01T23:12:47.781522  #
    2023-02-01T23:12:47.884798  / # export SHELL=3D/bin/sh. /lava-389577/en=
vironment
    2023-02-01T23:12:47.885520  =

    2023-02-01T23:12:47.990101  / # . /lava-389577/environment/lava-389577/=
bin/lava-test-runner /lava-389577/1
    2023-02-01T23:12:47.991092   =

    ... (25 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63daf26b5c70e050f1915ed4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8=
i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8=
i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63daf26b5c70e050f1915ed9
        failing since 27 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-02-01T23:14:22.712712  / # #
    2023-02-01T23:14:22.815015  export SHELL=3D/bin/sh
    2023-02-01T23:14:22.815769  #
    2023-02-01T23:14:22.917126  / # export SHELL=3D/bin/sh. /lava-389588/en=
vironment
    2023-02-01T23:14:22.917834  =

    2023-02-01T23:14:23.020110  / # . /lava-389588/environment/lava-389588/=
bin/lava-test-runner /lava-389588/1
    2023-02-01T23:14:23.021219  =

    2023-02-01T23:14:23.036320  / # /lava-389588/bin/lava-test-runner /lava=
-389588/1
    2023-02-01T23:14:23.116400  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-01T23:14:23.154361  + cd /lava-389588/1/tests/1_bootrr =

    ... (22 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63daf2f5203731417a915ed2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-s=
un8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-s=
un8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63daf2f5203731417a915ed7
        failing since 28 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-02-01T23:16:53.547102  / # #
    2023-02-01T23:16:53.650117  export SHELL=3D/bin/sh
    2023-02-01T23:16:53.650844  #
    2023-02-01T23:16:53.752427  / # export SHELL=3D/bin/sh. /lava-389610/en=
vironment
    2023-02-01T23:16:53.757156  =

    2023-02-01T23:16:53.859100  / # . /lava-389610/environment/lava-389610/=
bin/lava-test-runner /lava-389610/1
    2023-02-01T23:16:53.860119  =

    2023-02-01T23:16:53.863664  / # /lava-389610/bin/lava-test-runner /lava=
-389610/1
    2023-02-01T23:16:53.992809  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-01T23:16:53.993290  + cd /lava-389610/1/tests/1_bootrr =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63daf38180de418dc8915ec1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-31=
2-g66bb7649606e3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63daf38180de418dc8915ec6
        failing since 28 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-02-01T23:19:05.258428  [   18.355247] <LAVA_SIGNAL_ENDRUN 0_dmesg =
389624_1.5.2.4.1>
    2023-02-01T23:19:05.364998  / # #
    2023-02-01T23:19:05.467302  export SHELL=3D/bin/sh
    2023-02-01T23:19:05.467925  #
    2023-02-01T23:19:05.468314  / # [   18.525370] usb-storage 2-1.1:1.0: U=
SB Mass Storage device detected
    2023-02-01T23:19:05.468613  [   18.533742] scsi host0: usb-storage 2-1.=
1:1.0
    2023-02-01T23:19:05.468902  export SHELL=3D/bin/sh[   18.547265] usbcor=
e: registered new interface driver uas
    2023-02-01T23:19:05.570414  . /lava-389624/environment
    2023-02-01T23:19:05.570991  =

    2023-02-01T23:19:05.672465  / # . /lava-389624/environment/lava-389624/=
bin/lava-test-runner /lava-389624/1 =

    ... (26 line(s) more)  =

 =20
