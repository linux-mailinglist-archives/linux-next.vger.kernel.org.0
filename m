Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA3E967E671
	for <lists+linux-next@lfdr.de>; Fri, 27 Jan 2023 14:19:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234810AbjA0NT2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Jan 2023 08:19:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234811AbjA0NSy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Jan 2023 08:18:54 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07FD383048
        for <linux-next@vger.kernel.org>; Fri, 27 Jan 2023 05:18:23 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id nm12-20020a17090b19cc00b0022c2155cc0bso4835569pjb.4
        for <linux-next@vger.kernel.org>; Fri, 27 Jan 2023 05:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ow+4CfUKI6QRCaGq8odvopRDpfEMoibQOwao16r6x8w=;
        b=S/0JNAxN+7zCKQd1B1RCUw1eg1bDDVgVg5XpTZaYwnXrSpLEi35x5c+sQJzRzGVKcf
         iCpvqTwCg+rbJ+To9vviWsNjCE8lBBWOU+YIb8DlSVGFMKUYt1YSAmjnVHoW5MEL2XVK
         02N809henZ2wO2h49f1GEroJyNwE1I9u/jRuUsTV07X50AAK8LvyEOQ+CBuARZ6hLj53
         NsUqfiN4TC5QYRj0duveCR7AY8WousIHHtnfqlyJFuFd+qXR2Z0h50ft9m37wjrnhrMp
         U7JCdqSyuXjQeeX9SAiSLgXCI4XGGUPpSUIAnDhQbw7upn8DGfiwYVsXWCl1+QZk70CE
         L/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ow+4CfUKI6QRCaGq8odvopRDpfEMoibQOwao16r6x8w=;
        b=mFiFXb7nIw1OLoS5Zhz56HGelzKvHkdOgkcQaiFfBrjshF7y3eM3xIGL5kyBfpquaY
         NCAeAhBjwWPcHxjm4kctTYZRWmjlqK9z2QdjjG0ecayDXsdzz3gjnaT6F+rEOT+h4NXY
         qU751Gt8rxTlynaheAFvDQW+3Pufc1sdmnKo93hpRmdvsMqB4hGFMPPDJTD1XxlMEo84
         rmjidw74ch5rSjDvPYsiuAS162VQOI9Y4lRGgEUGu0QVXbrIyswjX+GB/Hrka/XnR4eH
         C6bwA7KWJ67gE0i31Xh/489YYkXtUPSEupmw9i/BPIRwaFyWoX1U22StpvV8p6VAi/iz
         IA8g==
X-Gm-Message-State: AFqh2kpv3HG1uNmiG2Y92+ma8+8H+5SLAO0sAGPQTKk6YAVz6A0Bakkv
        tyK+jlP8dVQb5nczLgRrNy5tGa8ZJdTsXS87j/s=
X-Google-Smtp-Source: AMrXdXsTJ/IazLLg8XZI16k6wpyQxtgecRwfUc7QtWI51anxGE0Hit45SfvMvr1TyzEOyY2pmQp5wQ==
X-Received: by 2002:a05:6a21:6d9e:b0:b8:a0e1:2751 with SMTP id wl30-20020a056a216d9e00b000b8a0e12751mr53108909pzb.4.1674825501358;
        Fri, 27 Jan 2023 05:18:21 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p1-20020a63ab01000000b004d2f344430bsm2362544pgf.75.2023.01.27.05.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 05:18:20 -0800 (PST)
Message-ID: <63d3cf1c.630a0220.d64dc.3a09@mx.google.com>
Date:   Fri, 27 Jan 2023 05:18:20 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.2-rc5-286-g436294605dc5
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 609 runs,
 33 regressions (v6.2-rc5-286-g436294605dc5)
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

next/pending-fixes baseline: 609 runs, 33 regressions (v6.2-rc5-286-g436294=
605dc5)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2835-rpi-b-rev2           | arm   | lab-broonie     | gcc-10   | bcm2835=
_defconfig            | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =

beagle-xm                    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+debug              | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+ima                | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig                    | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+crypto             | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.2-rc5-286-g436294605dc5/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.2-rc5-286-g436294605dc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      436294605dc51c3ed577f8ab00fa121dea23e689 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2835-rpi-b-rev2           | arm   | lab-broonie     | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63d39549b1b6dbbf86915f15

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d39549b1b6dbbf86915f1a
        new failure (last pass: v6.2-rc5-219-g3c4f681a3d69)

    2023-01-27T09:11:10.953681  + set +x
    2023-01-27T09:11:10.957456  <8>[   16.418643] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 192016_1.5.2.4.1>
    2023-01-27T09:11:11.068821  / # #
    2023-01-27T09:11:11.171061  export SHELL=3D/bin/sh
    2023-01-27T09:11:11.171637  #
    2023-01-27T09:11:11.273237  / # export SHELL=3D/bin/sh. /lava-192016/en=
vironment
    2023-01-27T09:11:11.273960  =

    2023-01-27T09:11:11.376020  / # . /lava-192016/environment/lava-192016/=
bin/lava-test-runner /lava-192016/1
    2023-01-27T09:11:11.377544  =

    2023-01-27T09:11:11.383542  / # /lava-192016/bin/lava-test-runner /lava=
-192016/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63d395ba13889eb7ac915f03

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d395ba13889eb7ac915f08
        failing since 15 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-01-27T09:13:11.994465  / # #
    2023-01-27T09:13:12.096610  export SHELL=3D/bin/sh
    2023-01-27T09:13:12.097276  #
    2023-01-27T09:13:12.198902  / # export SHELL=3D/bin/sh. /lava-8900359/e=
nvironment
    2023-01-27T09:13:12.199547  =

    2023-01-27T09:13:12.301397  / # . /lava-8900359/environment/lava-890035=
9/bin/lava-test-runner /lava-8900359/1
    2023-01-27T09:13:12.302371  =

    2023-01-27T09:13:12.316509  / # /lava-8900359/bin/lava-test-runner /lav=
a-8900359/1
    2023-01-27T09:13:12.429311  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-27T09:13:12.429757  + cd /lava-8900359/1/tests/1_bootrr =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3987396b853427a915ec8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d3987396b853427a915=
ec9
        failing since 5 days (last pass: v6.2-rc4-412-g665ddd640630, first =
fail: v6.2-rc4-480-gb1867226dfbb) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3984bf9b14adc48915ed7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d3984bf9b14adc48915edc
        failing since 9 days (last pass: v6.1-13341-g16cba743aec0, first fa=
il: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-27T09:24:00.218748  <8>[   18.226648] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3225990_1.5.2.4.1>
    2023-01-27T09:24:00.325188  / # #
    2023-01-27T09:24:00.427905  export SHELL=3D/bin/sh
    2023-01-27T09:24:00.428655  #<3>[   18.324665] Bluetooth: hci0: command=
 0x0c03 tx timeout
    2023-01-27T09:24:00.429070  =

    2023-01-27T09:24:00.530691  / # export SHELL=3D/bin/sh. /lava-3225990/e=
nvironment
    2023-01-27T09:24:00.531448  =

    2023-01-27T09:24:00.633245  / # . /lava-3225990/environment/lava-322599=
0/bin/lava-test-runner /lava-3225990/1
    2023-01-27T09:24:00.634954  =

    2023-01-27T09:24:00.638369  / # /lava-3225990/bin/lava-test-runner /lav=
a-3225990/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d398c66c559d9452915ed9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d398c66c559d9452915ede
        failing since 9 days (last pass: v6.1-13341-g16cba743aec0, first fa=
il: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-27T09:26:16.628410  <8>[   16.567833] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3225998_1.5.2.4.1>
    2023-01-27T09:26:16.735557  / # #
    2023-01-27T09:26:16.837149  export SHELL=3D/bin/sh
    2023-01-27T09:26:16.837538  #
    2023-01-27T09:26:16.938778  / # export SHELL=3D/bin/sh. /lava-3225998/e=
nvironment
    2023-01-27T09:26:16.939369  =

    2023-01-27T09:26:17.041125  / # . /lava-3225998/environment/lava-322599=
8/bin/lava-test-runner /lava-3225998/1
    2023-01-27T09:26:17.042226  =

    2023-01-27T09:26:17.046663  / # /lava-3225998/bin/lava-test-runner /lav=
a-3225998/1
    2023-01-27T09:26:17.131362  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63d39954df27b07b31915ebd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d39954df27b07b31915ec2
        failing since 9 days (last pass: v6.1-13341-g16cba743aec0, first fa=
il: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-27T09:28:21.036539  + set +x<8>[   13.574643] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3226019_1.5.2.4.1>
    2023-01-27T09:28:21.036770  =

    2023-01-27T09:28:21.143522  / # #
    2023-01-27T09:28:21.245125  export SHELL=3D/bin/sh
    2023-01-27T09:28:21.245486  #
    2023-01-27T09:28:21.245645  / # export SHELL=3D/bin/sh<3>[   13.772531]=
 Bluetooth: hci0: command 0x0c03 tx timeout
    2023-01-27T09:28:21.346762  . /lava-3226019/environment
    2023-01-27T09:28:21.347132  =

    2023-01-27T09:28:21.448102  / # . /lava-3226019/environment/lava-322601=
9/bin/lava-test-runner /lava-3226019/1
    2023-01-27T09:28:21.448643   =

    ... (13 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d399dc4543447298915eb9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d399dc4543447298915ebe
        failing since 9 days (last pass: v6.1-13341-g16cba743aec0, first fa=
il: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-27T09:30:53.379957  <8>[   24.687148] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3226169_1.5.2.4.1>
    2023-01-27T09:30:53.486698  / # #
    2023-01-27T09:30:53.588451  export SHELL=3D/bin/sh
    2023-01-27T09:30:53.589224  #
    2023-01-27T09:30:53.690912  / # export SHELL=3D/bin/sh. /lava-3226169/e=
nvironment
    2023-01-27T09:30:53.691475  =

    2023-01-27T09:30:53.792821  / # . /lava-3226169/environment/lava-322616=
9/bin/lava-test-runner /lava-3226169/1
    2023-01-27T09:30:53.793358  =

    2023-01-27T09:30:53.797996  / # /lava-3226169/bin/lava-test-runner /lav=
a-3226169/1
    2023-01-27T09:30:53.884126  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/63d394edb04a4d2d49915ecc

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63d394edb04a4d2=
d49915ed4
        failing since 368 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2023-01-27T09:09:43.076973  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2023-01-27T09:09:43.077236  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2023-01-27T09:09:43.077409  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2023-01-27T09:09:43.124314  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63d39b49c2cec7662a915f5d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d39b49c2cec7662a915=
f5e
        failing since 32 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc1-87-g81c29d2c4600) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d397c4d462378cab915edb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d397c4d462378cab915ee0
        new failure (last pass: v6.2-rc5-219-g3c4f681a3d69)

    2023-01-27T09:21:54.221378  + set[   14.959985] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 889267_1.5.2.3.1>
    2023-01-27T09:21:54.221538   +x
    2023-01-27T09:21:54.327276  / # #
    2023-01-27T09:21:54.429079  export SHELL=3D/bin/sh
    2023-01-27T09:21:54.429534  #
    2023-01-27T09:21:54.530920  / # export SHELL=3D/bin/sh. /lava-889267/en=
vironment
    2023-01-27T09:21:54.531300  =

    2023-01-27T09:21:54.632391  / # . /lava-889267/environment/lava-889267/=
bin/lava-test-runner /lava-889267/1
    2023-01-27T09:21:54.632968  =

    2023-01-27T09:21:54.636171  / # /lava-889267/bin/lava-test-runner /lava=
-889267/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3985341ce40652f915ebc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d3985341ce40652f915=
ebd
        failing since 141 days (last pass: v5.19-rc5-383-g73ad9bd963c1, fir=
st fail: v6.0-rc4-291-g83a56f559828) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3972525955df71e915ecf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d3972525955df71e915=
ed0
        failing since 143 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3996917af836142915ecb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d3996917af836142915ece
        failing since 22 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-27T09:28:47.966972  / # #
    2023-01-27T09:28:49.126960  export SHELL=3D/bin/sh
    2023-01-27T09:28:49.132595  #
    2023-01-27T09:28:50.679491  / # export SHELL=3D/bin/sh. /lava-1147407/e=
nvironment
    2023-01-27T09:28:50.685200  =

    2023-01-27T09:28:53.507017  / # . /lava-1147407/environment/lava-114740=
7/bin/lava-test-runner /lava-1147407/1
    2023-01-27T09:28:53.513013  =

    2023-01-27T09:28:53.516820  / # /lava-1147407/bin/lava-test-runner /lav=
a-1147407/1
    2023-01-27T09:28:53.606809  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-27T09:28:53.607571  + cd /lava-1147407/1/tests/1_bootrr =

    ... (19 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3970cddf02ad05c915ecd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d3970cddf02ad05c915=
ece
        failing since 272 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3b4715662d5b8c8915ec7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d3b4715662d5b8c8915=
ec8
        failing since 2 days (last pass: v6.2-rc5-174-gc5f142de047d, first =
fail: v6.2-rc5-219-g3c4f681a3d69) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d397af7586b44731915f33

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d397af7586b44731915=
f34
        new failure (last pass: v6.2-rc5-219-g3c4f681a3d69) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d394f3673eee39d9915f00

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d394f3673eee39d9915=
f01
        failing since 107 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63d39c081e53cb6640915edc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d39c081e53cb6640915=
edd
        new failure (last pass: v6.2-rc5-219-g3c4f681a3d69) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63d39b7dc7e369b6b8915ebe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d39b7dc7e369b6b8915=
ebf
        new failure (last pass: v6.2-rc5-219-g3c4f681a3d69) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d395e89a0475c769915ebe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d395e89a0475c769915=
ebf
        new failure (last pass: v6.2-rc5-219-g3c4f681a3d69) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3aa105375d8c337915ebb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d3aa105375d8c337915=
ebc
        failing since 43 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63d39ac27d348da82f915ec5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d39ac27d348da82f915=
ec6
        failing since 99 days (last pass: v6.0-10339-g565da9e84d8f, first f=
ail: v6.1-rc1-192-gdfe701541ba9) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d396d42323145f23915ec6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-clabbe=
/baseline-sun50i-h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-clabbe=
/baseline-sun50i-h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d396d42323145f23915ec9
        failing since 9 days (last pass: v6.1-13341-g16cba743aec0, first fa=
il: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-27T09:17:55.584099  <8>[   19.063550] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 387021_1.5.2.4.1>
    2023-01-27T09:17:55.690754  / # #
    2023-01-27T09:17:55.793142  export SHELL=3D/bin/sh
    2023-01-27T09:17:55.793740  #
    2023-01-27T09:17:55.895159  / # export SHELL=3D/bin/sh. /lava-387021/en=
vironment
    2023-01-27T09:17:55.895839  =

    2023-01-27T09:17:55.997519  / # . /lava-387021/environment/lava-387021/=
bin/lava-test-runner /lava-387021/1
    2023-01-27T09:17:55.998622  =

    2023-01-27T09:17:56.014859  / # /lava-387021/bin/lava-test-runner /lava=
-387021/1
    2023-01-27T09:17:56.080927  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3973825955df71e915ef6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-or=
angepi-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-or=
angepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d3973825955df71e915ef9
        failing since 9 days (last pass: v6.1-2435-g5c02e5d167d0, first fai=
l: v6.2-rc4-350-g5ce527a369f5)

    2023-01-27T09:19:34.901309  / # #
    2023-01-27T09:19:35.003570  export SHELL=3D/bin/sh
    2023-01-27T09:19:35.004300  #
    2023-01-27T09:19:35.105928  / # export SHELL=3D/bin/sh. /lava-387026/en=
vironment
    2023-01-27T09:19:35.106615  =

    2023-01-27T09:19:35.208107  / # . /lava-387026/environment/lava-387026/=
bin/lava-test-runner /lava-387026/1
    2023-01-27T09:19:35.209163  =

    2023-01-27T09:19:35.225472  / # /lava-387026/bin/lava-test-runner /lava=
-387026/1
    2023-01-27T09:19:35.291471  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-27T09:19:35.291926  + cd /lava-387026/<8>[   19.595207] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 387026_1.5.2.4.5> =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d397d8c65030c9a5915ef2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orange=
pi-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orange=
pi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d397d8c65030c9a5915ef5
        failing since 22 days (last pass: v6.1-2435-g5c02e5d167d0, first fa=
il: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-27T09:22:11.760121  / # #
    2023-01-27T09:22:11.862488  export SHELL=3D/bin/sh
    2023-01-27T09:22:11.863230  #
    2023-01-27T09:22:11.965054  / # export SHELL=3D/bin/sh. /lava-387048/en=
vironment
    2023-01-27T09:22:11.965775  =

    2023-01-27T09:22:12.067562  / # . /lava-387048/environment/lava-387048/=
bin/lava-test-runner /lava-387048/1
    2023-01-27T09:22:12.068682  =

    2023-01-27T09:22:12.082392  / # /lava-387048/bin/lava-test-runner /lava=
-387048/1
    2023-01-27T09:22:12.150886  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-27T09:22:12.151395  + cd /lava-387048/<8>[   19.891245] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 387048_1.5.2.4.5> =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d39851091bfc8798915ebb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe=
/baseline-sun50i-h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe=
/baseline-sun50i-h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d39851091bfc8798915ebe
        failing since 22 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-27T09:24:20.164283  / # #
    2023-01-27T09:24:20.266635  export SHELL=3D/bin/sh
    2023-01-27T09:24:20.267305  #
    2023-01-27T09:24:20.368943  / # export SHELL=3D/bin/sh. /lava-387057/en=
vironment
    2023-01-27T09:24:20.369625  =

    2023-01-27T09:24:20.471257  / # . /lava-387057/environment/lava-387057/=
bin/lava-test-runner /lava-387057/1
    2023-01-27T09:24:20.472323  =

    2023-01-27T09:24:20.488574  / # /lava-387057/bin/lava-test-runner /lava=
-387057/1
    2023-01-27T09:24:20.554593  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-27T09:24:20.555244  + cd /lava-387057/<8>[   20.095294] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 387057_1.5.2.4.5> =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63d39c744e03ed03eb915ec1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h6=
-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h6=
-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d39c744e03ed03eb915ec4
        failing since 9 days (last pass: v6.1-13341-g16cba743aec0, first fa=
il: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-27T09:41:58.671405  <8>[  115.256830] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 387071_1.5.2.4.1>
    2023-01-27T09:41:58.779797  / # #
    2023-01-27T09:41:58.882298  export SHELL=3D/bin/sh
    2023-01-27T09:41:58.882979  #
    2023-01-27T09:41:58.984635  / # export SHELL=3D/bin/sh. /lava-387071/en=
vironment
    2023-01-27T09:41:58.985276  =

    2023-01-27T09:41:59.086470  / # . /lava-387071/environment/lava-387071/=
bin/lava-test-runner /lava-387071/1
    2023-01-27T09:41:59.087334  =

    2023-01-27T09:41:59.101821  / # /lava-387071/bin/lava-test-runner /lava=
-387071/1
    2023-01-27T09:41:59.168853  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d397e0bcd6013236915ebb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d397e0bcd6013236915ebe
        failing since 22 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-27T09:22:25.878140  / ##
    2023-01-27T09:22:25.980534  export SHELL=3D/bin/sh
    2023-01-27T09:22:25.981234   #[   19.608479] usb-storage 2-1.1:1.0: USB=
 Mass Storage device detected
    2023-01-27T09:22:25.981587  [   19.617254] scsi host0: usb-storage 2-1.=
1:1.0
    2023-01-27T09:22:25.981890  [   19.630791] usbcore: registered new inte=
rface driver uas
    2023-01-27T09:22:25.982197  =

    2023-01-27T09:22:26.083728  / # export SHELL=3D/bin/sh. /lava-387036/en=
vironment
    2023-01-27T09:22:26.084365  =

    2023-01-27T09:22:26.186059  / # . /lava-387036/environment/lava-387036/=
bin/lava-test-runner /lava-387036/1
    2023-01-27T09:22:26.187047   =

    ... (21 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d39844f9b14adc48915ec9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/bas=
eline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/bas=
eline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d39844f9b14adc48915ecc
        failing since 22 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-27T09:23:56.294085  / # #
    2023-01-27T09:23:56.396734  export SHELL=3D/bin/sh
    2023-01-27T09:23:56.397428  #
    2023-01-27T09:23:56.498899  / # export SHELL=3D/bin/sh[   22.487514] us=
b-storage 2-1.1:1.0: USB Mass Storage de. /lava-387041/environment
    2023-01-27T09:23:56.499674  vice detected
    2023-01-27T09:23:56.499928  [   22.497102] scsi host0: usb-storage 2-1.=
1:1.0
    2023-01-27T09:23:56.500306  =

    2023-01-27T09:23:56.500650  / # [   22.517706] usbcore: registered new =
interface driver uas
    2023-01-27T09:23:56.602091  . /lava-387041/environment/lava-387041/bin/=
lava-test-runner /lava-387041/1
    2023-01-27T09:23:56.603217   =

    ... (21 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63d398a8bcc07b1d1e915ebd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8i=
-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8i=
-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d398a8bcc07b1d1e915ec0
        failing since 22 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-27T09:25:38.739624  / # #
    2023-01-27T09:25:38.842181  export SHELL=3D/bin/sh
    2023-01-27T09:25:38.842774  #
    2023-01-27T09:25:38.949089  / # export SHELL=3D/bin/sh. /lava-387042/en=
vironment
    2023-01-27T09:25:38.949669  =

    2023-01-27T09:25:39.051086  / # . /lava-387042/environment/lava-387042/=
bin/lava-test-runner /lava-387042/1
    2023-01-27T09:25:39.051834  =

    2023-01-27T09:25:39.067488  / # /lava-387042/bin/lava-test-runner /lava=
-387042/1
    2023-01-27T09:25:39.147668  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-27T09:25:39.185708  + cd /lava-387042/1/tests/1_bootrr =

    ... (22 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3990cd0b0d425ea915ebb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d3990cd0b0d425ea915ebe
        failing since 22 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-27T09:27:19.215099  / # #
    2023-01-27T09:27:19.320111  export SHELL=3D/bin/sh
    2023-01-27T09:27:19.320679  #
    2023-01-27T09:27:19.432094  / # export SHELL=3D/bin/sh. /lava-387060/en=
vironment
    2023-01-27T09:27:19.432651  =

    2023-01-27T09:27:19.543091  / # . /lava-387060/environment/lava-387060/=
bin/lava-test-runner /lava-387060/1
    2023-01-27T09:27:19.543875  =

    2023-01-27T09:27:19.555130  / # /lava-387060/bin/lava-test-runner /lava=
-387060/1
    2023-01-27T09:27:19.678126  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-27T09:27:19.678478  + cd /lava-387060/1/tests/1_bootrr =

    ... (14 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3975a455f87902f915eb9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-b=
ananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-b=
ananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d3975a455f87902f915ebc
        failing since 22 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-27T09:20:11.789454  / # #
    2023-01-27T09:20:11.895093  export SHELL=3D/bin/sh
    2023-01-27T09:20:11.895587  #
    2023-01-27T09:20:11.997162  / # export SHELL=3D/bin/sh. /lava-387031/en=
vironment
    2023-01-27T09:20:11.997927  =

    2023-01-27T09:20:12.099509  / # . /lava-387031/environment/lava-387031/=
bin/lava-test-runner /lava-387031/1
    2023-01-27T09:20:12.100738  =

    2023-01-27T09:20:12.114789  / # /lava-387031/bin/lava-test-runner /lava=
-387031/1
    2023-01-27T09:20:12.222579  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-27T09:20:12.223077  + cd /lava-387031/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3a1f1dba4f9b976915ebb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-28=
6-g436294605dc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d3a1f1dba4f9b976915=
ebc
        failing since 42 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =20
