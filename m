Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DFB266E09D
	for <lists+linux-next@lfdr.de>; Tue, 17 Jan 2023 15:29:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjAQO3B (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Jan 2023 09:29:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbjAQO22 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Jan 2023 09:28:28 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEE80402C8
        for <linux-next@vger.kernel.org>; Tue, 17 Jan 2023 06:27:23 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id r21so1607485plg.13
        for <linux-next@vger.kernel.org>; Tue, 17 Jan 2023 06:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Flpp29INPgf4VEG6XXqzipckXeYExeOGc5oTS8t70uc=;
        b=AoG+i7cNvTYgaXS+x1pvD1ZjWPyq7KX14IijZDldHI8lFxcsVizsk3TCsybnRZdc3/
         U49SOJhOwYHsMfl3V8Q+UH683YVKXmYlFF8AIVpbBnx6qyJgxzS+DUJl1NGCpW7Rk2dN
         KxBgZwSzU4pDzhSPMuS5nJpHV/McRXRk6Z0hT9N+ONQdMqco4CFStU8W/uW2GJdjwKts
         /zz4EPBeudCcWy9/lCs3PufhtgEAVmFfWA+xpHyVo/Wv0TG/eN+Al0zUxYKsK1Qarp5q
         YW+zRoTGSSdtimozy/6rNDrJ6HEcA9O6XG7ghq2LwDmlKdVH3gFqb9uhBXU3yCh79l/L
         xK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Flpp29INPgf4VEG6XXqzipckXeYExeOGc5oTS8t70uc=;
        b=vQU7HxtcsanYOPSGoMk+Xf0iUJJTHVSYO+dsVqhJYkuJeN8/IFq0/Fhfx8QqhfHPeD
         1pt+SGhubWkmleOE7oCcMKePe+brgZX1bNAlzsZQJ2jUi7V4idnsbiwSggB3ykhBqWWp
         8/NIFjB3xL8oXBRSuml1sapN++15e9WOF3vbbRtLwYfECSqj4Gtqc3jOMou/5k+gbwZK
         A0gneLphJWyCTG7FpVXY+R0j3wHfPEd8KwPLmNwWOqhCNCHaBzbSP36gc40TQ6Kvz7l6
         +AzkgrKM+zx81MhplyZUE8EKXLWFX1YhvlM1ZQU5IfN9edi94Nfsa7dwnhdenswMRWkf
         Crsw==
X-Gm-Message-State: AFqh2kpACE9ZzqW5UPB/0ebTWOKQdtpCPvBUM5vPcUN94IoLQ2P/y0oN
        peN1Wq4XUR3rfsDpswvogZ9wstCts4SYpCNfbXuG1Q==
X-Google-Smtp-Source: AMrXdXsYB25rvtIumI0mLTTJ7mUAeq64L/AOt6xeRogO5fiQ8BWwgI0auUDbkmUafhmQFkZPrpZQfQ==
X-Received: by 2002:a17:902:f708:b0:189:c4a9:c5e8 with SMTP id h8-20020a170902f70800b00189c4a9c5e8mr4363762plo.45.1673965642383;
        Tue, 17 Jan 2023 06:27:22 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a17-20020a170902ecd100b0018912c37c8fsm4479223plh.129.2023.01.17.06.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 06:27:22 -0800 (PST)
Message-ID: <63c6b04a.170a0220.5f77.64de@mx.google.com>
Date:   Tue, 17 Jan 2023 06:27:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.2-rc4-302-g48ed69cf21b2
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 423 runs,
 27 regressions (v6.2-rc4-302-g48ed69cf21b2)
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

next/pending-fixes baseline: 423 runs, 27 regressions (v6.2-rc4-302-g48ed69=
cf21b2)

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

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =

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

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+arm...ook+videodec | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+arm...ook+videodec | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+crypto             | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.2-rc4-302-g48ed69cf21b2/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.2-rc4-302-g48ed69cf21b2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      48ed69cf21b26566785dfd48f93dac3463901caf =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63c67ad54c649f425c915ebb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c67ad54c649f425c915=
ebc
        failing since 99 days (last pass: v6.0-6424-g1af0c6a154d32, first f=
ail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2835-rpi-b-rev2           | arm   | lab-broonie     | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63c6773587b00b097b915ede

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c6773587b00b097b915ee3
        new failure (last pass: v6.2-rc4-269-g1ab337b63ead)

    2023-01-17T10:23:27.588039  + set +x
    2023-01-17T10:23:27.591587  <8>[   15.848771] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 125568_1.5.2.4.1>
    2023-01-17T10:23:27.708680  / # #
    2023-01-17T10:23:27.813182  export SHELL=3D/bin/sh
    2023-01-17T10:23:27.814557  #
    2023-01-17T10:23:27.916489  / # export SHELL=3D/bin/sh. /lava-125568/en=
vironment
    2023-01-17T10:23:27.917200  =

    2023-01-17T10:23:28.019001  / # . /lava-125568/environment/lava-125568/=
bin/lava-test-runner /lava-125568/1
    2023-01-17T10:23:28.020242  =

    2023-01-17T10:23:28.026472  / # /lava-125568/bin/lava-test-runner /lava=
-125568/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63c697d522bc31035b915f4b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c697d522bc31035b915f50
        failing since 5 days (last pass: v6.2-rc3-243-g3145d9dfed32, first =
fail: v6.2-rc3-296-g79fa898551af)

    2023-01-17T12:42:41.665216  / # #
    2023-01-17T12:42:41.767073  export SHELL=3D/bin/sh
    2023-01-17T12:42:41.767838  #
    2023-01-17T12:42:41.869983  / # export SHELL=3D/bin/sh. /lava-8750988/e=
nvironment
    2023-01-17T12:42:41.870780  =

    2023-01-17T12:42:41.972702  / # . /lava-8750988/environment/lava-875098=
8/bin/lava-test-runner /lava-8750988/1
    2023-01-17T12:42:41.973325  =

    2023-01-17T12:42:41.987463  / # /lava-8750988/bin/lava-test-runner /lav=
a-8750988/1
    2023-01-17T12:42:42.098486  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-17T12:42:42.098773  + cd /lava-8750988/1/tests/1_bootrr =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c698160402c115ac915eb9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c698160402c115ac915ebe
        new failure (last pass: v6.1-13341-g16cba743aec0)

    2023-01-17T12:43:45.927530  + set +x
    2023-01-17T12:43:45.936410  <8>[   15.171615] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3145275_1.5.2.4.1>
    2023-01-17T12:43:46.039906  / # #
    2023-01-17T12:43:46.141352  export SHELL=3D/bin/sh
    2023-01-17T12:43:46.141722  #
    2023-01-17T12:43:46.242931  / # export SHELL=3D/bin/sh. /lava-3145275/e=
nvironment
    2023-01-17T12:43:46.243298  =

    2023-01-17T12:43:46.344431  / # . /lava-3145275/environment/lava-314527=
5/bin/lava-test-runner /lava-3145275/1
    2023-01-17T12:43:46.344974  =

    2023-01-17T12:43:46.349693  / # /lava-3145275/bin/lava-test-runner /lav=
a-3145275/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c69950e95755997d915eb9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c69950e95755997d915ebe
        new failure (last pass: v6.1-13341-g16cba743aec0)

    2023-01-17T12:49:06.638629  <8>[   13.924942] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3145317_1.5.2.4.1>
    2023-01-17T12:49:06.748488  / # #
    2023-01-17T12:49:06.852150  export SHELL=3D/bin/sh
    2023-01-17T12:49:06.853380  #
    2023-01-17T12:49:06.955956  / # export SHELL=3D/bin/sh. /lava-3145317/e=
nvironment
    2023-01-17T12:49:06.957193  =

    2023-01-17T12:49:06.957810  / # <3>[   14.157916] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-01-17T12:49:07.060208  . /lava-3145317/environment/lava-3145317/bi=
n/lava-test-runner /lava-3145317/1
    2023-01-17T12:49:07.061908  =

    2023-01-17T12:49:07.067213  / # /lava-3145317/bin/lava-test-runner /lav=
a-3145317/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c69a8fa9ba7021aa915f52

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c69a8fa9ba7021aa915f57
        new failure (last pass: v6.1-13341-g16cba743aec0)

    2023-01-17T12:54:19.667202  <8>[   24.617851] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3145422_1.5.2.4.1>
    2023-01-17T12:54:19.773544  / # #
    2023-01-17T12:54:19.876885  export SHELL=3D/bin/sh
    2023-01-17T12:54:19.877941  #
    2023-01-17T12:54:19.980072  / # export SHELL=3D/bin/sh. /lava-3145422/e=
nvironment
    2023-01-17T12:54:19.981111  =

    2023-01-17T12:54:20.083230  / # . /lava-3145422/environment/lava-314542=
2/bin/lava-test-runner /lava-3145422/1
    2023-01-17T12:54:20.084880  =

    2023-01-17T12:54:20.090151  / # /lava-3145422/bin/lava-test-runner /lav=
a-3145422/1
    2023-01-17T12:54:20.176932  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63c69c70fa5149c96a915ee5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c69c70fa5149c96a915eea
        new failure (last pass: v6.1-13341-g16cba743aec0)

    2023-01-17T13:02:13.841685  <8>[   14.658474] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3145469_1.5.2.4.1>
    2023-01-17T13:02:13.950777  / # #
    2023-01-17T13:02:14.054125  export SHELL=3D/bin/sh
    2023-01-17T13:02:14.055139  #
    2023-01-17T13:02:14.157258  / # export SHELL=3D/bin/sh. /lava-3145469/e=
nvironment
    2023-01-17T13:02:14.158287  =

    2023-01-17T13:02:14.158845  / # . /lava-3145469/environment<3>[   14.96=
8275] Bluetooth: hci0: command 0x0c03 tx timeout
    2023-01-17T13:02:14.260905  /lava-3145469/bin/lava-test-runner /lava-31=
45469/1
    2023-01-17T13:02:14.262574  =

    2023-01-17T13:02:14.267759  / # /lava-3145469/bin/lava-test-runner /lav=
a-3145469/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63c6a29c11512a45d9915ecb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c6a29c11512a45d9915ed0
        new failure (last pass: v6.1-13341-g16cba743aec0)

    2023-01-17T13:28:37.520782  <8>[   16.656026] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3145549_1.5.2.4.1>
    2023-01-17T13:28:37.633444  / # #
    2023-01-17T13:28:37.737554  export SHELL=3D/bin/sh
    2023-01-17T13:28:37.739038  #
    2023-01-17T13:28:37.842547  / # export SHELL=3D/bin/sh. /lava-3145549/e=
nvironment
    2023-01-17T13:28:37.843954  =

    2023-01-17T13:28:37.946992  / # . /lava-3145549/environment/lava-314554=
9/bin/lava-test-runner /lava-3145549/1
    2023-01-17T13:28:37.950485  =

    2023-01-17T13:28:37.956324  / # /lava-3145549/bin/lava-test-runner /lav=
a-3145549/1
    2023-01-17T13:28:38.040459  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/63c6783f6f331f27e3915ed9

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63c6783f6f331f2=
7e3915ee1
        failing since 358 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2023-01-17T10:28:05.822928  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2023-01-17T10:28:05.824049  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2023-01-17T10:28:05.826336  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2023-01-17T10:28:05.873403  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63c6784c800c890a83915ee5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c6784c800c890a83915=
ee6
        failing since 131 days (last pass: v5.19-rc5-383-g73ad9bd963c1, fir=
st fail: v6.0-rc4-291-g83a56f559828) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63c6785f34f27fa0f2915f06

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c6785f34f27fa0f2915=
f07
        failing since 133 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63c67a74607782f21f915eba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c67a74607782f21f915=
ebb
        failing since 133 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c67b1405e6e8302b915ec3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6s=
x-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6s=
x-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c67b1405e6e8302b915ec6
        failing since 12 days (last pass: v6.1-rc4-405-g5cc6cef624e2, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-17T10:39:56.961154  <8>[   43.778227] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1138360_1.5.2.4.1>
    2023-01-17T10:39:57.066670  / # #
    2023-01-17T10:39:58.226085  export SHELL=3D/bin/sh
    2023-01-17T10:39:58.231806  #
    2023-01-17T10:39:59.778712  / # export SHELL=3D/bin/sh. /lava-1138360/e=
nvironment
    2023-01-17T10:39:59.784417  =

    2023-01-17T10:40:02.606592  / # . /lava-1138360/environment/lava-113836=
0/bin/lava-test-runner /lava-1138360/1
    2023-01-17T10:40:02.612317  =

    2023-01-17T10:40:02.612480  / # /lava-1138360/bin/lava-test-runner /lav=
a-1138360/1
    2023-01-17T10:40:02.715364  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (20 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c678aef59ac3380e915ed0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c678aef59ac3380e915ed3
        failing since 12 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-17T10:29:41.750673  <8>[   40.159393] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1138359_1.5.2.4.1>
    2023-01-17T10:29:41.856227  / # #
    2023-01-17T10:29:43.015853  export SHELL=3D/bin/sh
    2023-01-17T10:29:43.021223  #
    2023-01-17T10:29:44.566512  / # export SHELL=3D/bin/sh. /lava-1138359/e=
nvironment
    2023-01-17T10:29:44.571903  =

    2023-01-17T10:29:47.390230  / # . /lava-1138359/environment/lava-113835=
9/bin/lava-test-runner /lava-1138359/1
    2023-01-17T10:29:47.395817  =

    2023-01-17T10:29:47.408655  / # /lava-1138359/bin/lava-test-runner /lav=
a-1138359/1
    2023-01-17T10:29:47.490570  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (20 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c691552942bf9995915ec1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c691552942bf9995915=
ec2
        failing since 262 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c6787f8842072635915ebd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c6787f8842072635915=
ebe
        failing since 97 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/63c67fedd2e0fe43df915ed0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-baylib=
re/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-baylib=
re/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c67fedd2e0fe43df915=
ed1
        new failure (last pass: v6.2-rc4-269-g1ab337b63ead) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/63c67fd6f4865b8b2f915f23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-baylib=
re/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-baylib=
re/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c67fd6f4865b8b2f915=
f24
        new failure (last pass: v6.2-rc4-269-g1ab337b63ead) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c67799e65fcbe989915f72

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c67799e65fcbe989915=
f73
        new failure (last pass: v6.2-rc4-269-g1ab337b63ead) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c676d085e7fa065f915ed3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-clabbe=
/baseline-sun50i-h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-clabbe=
/baseline-sun50i-h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c676d085e7fa065f915ed6
        new failure (last pass: v6.1-13341-g16cba743aec0)

    2023-01-17T10:21:52.276052  / # #
    2023-01-17T10:21:52.378578  export SHELL=3D/bin/sh
    2023-01-17T10:21:52.379308  #
    2023-01-17T10:21:52.481114  / # export SHELL=3D/bin/sh. /lava-380618/en=
vironment
    2023-01-17T10:21:52.481767  =

    2023-01-17T10:21:52.583448  / # . /lava-380618/environment/lava-380618/=
bin/lava-test-runner /lava-380618/1
    2023-01-17T10:21:52.584588  =

    2023-01-17T10:21:52.598846  / # /lava-380618/bin/lava-test-runner /lava=
-380618/1
    2023-01-17T10:21:52.666984  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-17T10:21:52.667417  + cd /lava-380618/<8>[   20.026154] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 380618_1.5.2.4.5> =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c67c0e6a7a685518915f3a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h6=
-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h6=
-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c67c0e6a7a685518915f3d
        new failure (last pass: v6.1-13341-g16cba743aec0)

    2023-01-17T10:44:19.560480  / # #
    2023-01-17T10:44:19.662378  export SHELL=3D/bin/sh
    2023-01-17T10:44:19.663003  #
    2023-01-17T10:44:19.764572  / # export SHELL=3D/bin/sh. /lava-380657/en=
vironment
    2023-01-17T10:44:19.765174  =

    2023-01-17T10:44:19.866784  / # . /lava-380657/environment/lava-380657/=
bin/lava-test-runner /lava-380657/1
    2023-01-17T10:44:19.867817  =

    2023-01-17T10:44:19.878230  / # /lava-380657/bin/lava-test-runner /lava=
-380657/1
    2023-01-17T10:44:19.950236  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-17T10:44:19.950669  + cd /lava-380657/<8>[  113.384901] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 380657_1.5.2.4.5> =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c676648e14045bbd915ef1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c676648e14045bbd915ef4
        failing since 12 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-17T10:20:11.652249  [   18.501139] <LAVA_SIGNAL_ENDRUN 0_dmesg =
380614_1.5.2.4.1>
    2023-01-17T10:20:11.759003  / # #
    2023-01-17T10:20:11.861425  export SHELL=3D/bin/sh
    2023-01-17T10:20:11.862076  #
    2023-01-17T10:20:11.963825  / # export SHELL=3D/bin/sh. /lava-380614/en=
vironment
    2023-01-17T10:20:11.964499  =

    2023-01-17T10:20:12.066123  / # . /lava-380614/environment/lava-380614/=
bin/lava-test-runner /lava-380614/1
    2023-01-17T10:20:12.067196  =

    2023-01-17T10:20:12.082892  / # /lava-380614/bin/lava-test-runner /lava=
-380614/1
    2023-01-17T10:20:12.194084  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (23 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c676b9baeec174ac915ec4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83=
t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83=
t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c676b9baeec174ac915ec7
        failing since 12 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-17T10:21:33.605865  / # #
    2023-01-17T10:21:33.708114  export SHELL=3D/bin/sh
    2023-01-17T10:21:33.709053  #
    2023-01-17T10:21:33.811837  / # export SHELL=3D/bin/sh. /lava-380622/en=
vironment
    2023-01-17T10:21:33.814296  =

    2023-01-17T10:21:33.916877  / # . /lava-380622/environment/lava-380622/=
bin/lava-test-runner /lava-380622/1
    2023-01-17T10:21:33.918891  =

    2023-01-17T10:21:33.928716  / # /lava-380622/bin/lava-test-runner /lava=
-380622/1
    2023-01-17T10:21:34.009071  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-17T10:21:34.047015  + cd /lava-380622/1/tests/1_bootrr =

    ... (22 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c6786c084b829adf915f7a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c6786c084b829adf915f7d
        failing since 12 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-17T10:28:47.248855  [   25.046912] <LAVA_SIGNAL_ENDRUN 0_dmesg =
380635_1.5.2.4.1>
    2023-01-17T10:28:47.357124  / # #
    2023-01-17T10:28:47.459513  export SHELL=3D/bin/sh
    2023-01-17T10:28:47.460084  #
    2023-01-17T10:28:47.561579  / # export SHELL=3D/bin/sh. /lava-380635/en=
vironment
    2023-01-17T10:28:47.562224  =

    2023-01-17T10:28:47.663964  / # . /lava-380635/environment/lava-380635/=
bin/lava-test-runner /lava-380635/1
    2023-01-17T10:28:47.665068  =

    2023-01-17T10:28:47.679249  / # /lava-380635/bin/lava-test-runner /lava=
-380635/1
    2023-01-17T10:28:47.803309  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63c67970f0ae03b567915ebb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8i=
-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8i=
-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c67970f0ae03b567915ebe
        failing since 12 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-17T10:33:14.264674  #
    2023-01-17T10:33:14.367115  / # #export SHELL=3D/bin/sh
    2023-01-17T10:33:14.367858  =

    2023-01-17T10:33:14.469372  / # export SHELL=3D/bin/sh. /lava-380639/en=
vironment
    2023-01-17T10:33:14.470129  =

    2023-01-17T10:33:14.571649  / # . /lava-380639/environment/lava-380639/=
bin/lava-test-runner /lava-380639/1
    2023-01-17T10:33:14.572699  =

    2023-01-17T10:33:14.590384  / # /lava-380639/bin/lava-test-runner /lava=
-380639/1
    2023-01-17T10:33:14.706816  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-17T10:33:14.707196  + cd /lava-380639/1/tests/1_bootrr =

    ... (22 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63c67b2805e6e8302b915ed0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/bas=
eline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/bas=
eline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c67b2805e6e8302b915ed3
        failing since 12 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-17T10:40:18.728499  [   23.331702] <LAVA_SIGNAL_ENDRUN 0_dmesg =
380651_1.5.2.4.1>
    2023-01-17T10:40:18.836121  / # #
    2023-01-17T10:40:18.938531  export SHELL=3D/bin/sh
    2023-01-17T10:40:18.939250  #
    2023-01-17T10:40:18.939593  / # [   23.503474] usb-storage 2-1.1:1.0: U=
SB Mass Storage device detected
    2023-01-17T10:40:18.939893  [   23.513064] scsi host0: usb-storage 2-1.=
1:1.0
    2023-01-17T10:40:18.940207  export SHELL=3D/bin/sh[   23.533294] usbcor=
e: registered new interface driver uas
    2023-01-17T10:40:19.041729  . /lava-380651/environment
    2023-01-17T10:40:19.042396  =

    2023-01-17T10:40:19.144009  / # . /lava-380651/environment/lava-380651/=
bin/lava-test-runner /lava-380651/1 =

    ... (22 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63c674987fa59b9255915fd2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-b=
ananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc4-30=
2-g48ed69cf21b2/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-b=
ananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c674987fa59b9255915fd5
        failing since 12 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-17T10:12:22.159311  [   15.941184] <LAVA_SIGNAL_ENDRUN 0_dmesg =
380606_1.5.2.4.1>
    2023-01-17T10:12:22.265981  / # #
    2023-01-17T10:12:22.368524  export SHELL=3D/bin/sh
    2023-01-17T10:12:22.369371  #
    2023-01-17T10:12:22.471021  / # export SHELL=3D/bin/sh. /lava-380606/en=
vironment
    2023-01-17T10:12:22.471907  =

    2023-01-17T10:12:22.573566  / # . /lava-380606/environment/lava-380606/=
bin/lava-test-runner /lava-380606/1
    2023-01-17T10:12:22.574721  =

    2023-01-17T10:12:22.590055  / # /lava-380606/bin/lava-test-runner /lava=
-380606/1
    2023-01-17T10:12:22.697102  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =20
