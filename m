Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81D1A685EC0
	for <lists+linux-next@lfdr.de>; Wed,  1 Feb 2023 06:11:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbjBAFLu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Feb 2023 00:11:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbjBAFLt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Feb 2023 00:11:49 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F04E4FAC9
        for <linux-next@vger.kernel.org>; Tue, 31 Jan 2023 21:11:45 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id 88so16214670pjo.3
        for <linux-next@vger.kernel.org>; Tue, 31 Jan 2023 21:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HEm4ZQT943NVf6LZiDPJ3TQaFiKB9dRvTLDhK7o4Wr8=;
        b=RhDaos6OK1hwQHtRYmoE918M4BtSJgTCiShNrVIo1/WdhIjH0SgpSU6ldc9Hx3vmGi
         XHhw+BdjaUWp3TNOxsSPB3TT/hgD5XTvk5ZEj3ENhJWH2nIofHtuak99aiYOmEm+KoGF
         ujnxaRmTTH5LwSuaofAyH53qHGXQbvSjTc+cEE32dnZ1BUCiPyC6Y1HYYcjriBEedLrC
         B+jZ+lQ5FF3Q7VWUGJbbhAKHpKp//kTyIjt/T9dGcclCzS3LsCzErWmaiURM07t1NQ1x
         lCo16bD9g2+2C37L8NOLUH7SEl03RykaYqtsYcV8GAAAOEtsuwlVGGlQlmPNRD/fCFH2
         04fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HEm4ZQT943NVf6LZiDPJ3TQaFiKB9dRvTLDhK7o4Wr8=;
        b=Am2VHL2kOVlW8yeEtVZ9n4J/w38JbeUOYovGq00u4V+bYMQeOVrM1PYOeCyNiHqhJc
         1QpimHOgr7H+aturRto2fGspwInhyEHppLSuqZzWH2NtWUgbiJLRrtMEkx+HXOJq6L85
         cAji7SFw7J2mltDt5LYvRqLls+nsfbC9S5SFHFweUdv5DcZ3Nb8c7yGgHU49aXf6V3YX
         LLjoUD4Uxw24gaXuX2uavTyxmMgHe6q9lBHpPxTvSuSZlg0djBDCOmREt1fkTXVeHGYS
         xBCQB9uEpOHoNLicqZJiiVAhBseU7TjeN/6ClxnKqxTNJ25ky7x1ES9MHeyXcWn9XgGZ
         lqSg==
X-Gm-Message-State: AO0yUKVZgCBTkQv4dZZJ3JJFylUwiA4m/OJJoCaZnXbLhKiZ1JQPaFkF
        ZtAn/OYBczBiSFOuYN1q8cTRR9rgcORyJEtWxlnEIw==
X-Google-Smtp-Source: AK7set+06pNXXkdSTXLlZMhNs/VW2JjwE2u5EfXpov+a6E7cv7ioTX/ps2GCnjcAx3eluvybOnJyfQ==
X-Received: by 2002:a17:902:d0d3:b0:194:8c75:29d with SMTP id n19-20020a170902d0d300b001948c75029dmr1313003pln.12.1675228303677;
        Tue, 31 Jan 2023 21:11:43 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t3-20020a170902b20300b001963bc7bdb8sm10597932plr.274.2023.01.31.21.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 21:11:43 -0800 (PST)
Message-ID: <63d9f48f.170a0220.3efa8.3a12@mx.google.com>
Date:   Tue, 31 Jan 2023 21:11:43 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.2-rc6-289-g1b7183933813
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 672 runs,
 37 regressions (v6.2-rc6-289-g1b7183933813)
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

next/pending-fixes baseline: 672 runs, 37 regressions (v6.2-rc6-289-g1b7183=
933813)

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

da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx8mn-ddr4-evk              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxm-q200               | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

mt8173-elm-hana              | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =

rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+videodec           | 1          =

rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =

stm32mp157c-dk2              | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

stm32mp157c-dk2              | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

stm32mp157c-dk2              | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

stm32mp157c-dk2              | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

stm32mp157c-dk2              | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.2-rc6-289-g1b7183933813/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.2-rc6-289-g1b7183933813
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1b7183933813912a1055084d11e9173310c0cc33 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9bea4744e88fa4c915f92

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9bea4744e88fa4c915=
f93
        failing since 114 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2835-rpi-b-rev2           | arm   | lab-broonie     | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9b64df4ce60f3ea915ec7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9b64df4ce60f3ea915ecc
        new failure (last pass: v6.2-rc6-241-g70d29276a90d)

    2023-02-01T00:45:37.954631  + set +x
    2023-02-01T00:45:37.958239  <8>[   16.256543] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 226313_1.5.2.4.1>
    2023-02-01T00:45:38.069748  / # #
    2023-02-01T00:45:38.171530  export SHELL=3D/bin/sh
    2023-02-01T00:45:38.171951  #
    2023-02-01T00:45:38.273492  / # export SHELL=3D/bin/sh. /lava-226313/en=
vironment
    2023-02-01T00:45:38.273923  =

    2023-02-01T00:45:38.375326  / # . /lava-226313/environment/lava-226313/=
bin/lava-test-runner /lava-226313/1
    2023-02-01T00:45:38.376343  =

    2023-02-01T00:45:38.383302  / # /lava-226313/bin/lava-test-runner /lava=
-226313/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9b88a98af16f888915f33

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9b88a98af16f888915f38
        failing since 20 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-02-01T00:55:20.168375  / # #
    2023-02-01T00:55:20.270383  export SHELL=3D/bin/sh
    2023-02-01T00:55:20.271128  #
    2023-02-01T00:55:20.372822  / # export SHELL=3D/bin/sh. /lava-8960485/e=
nvironment
    2023-02-01T00:55:20.373387  =

    2023-02-01T00:55:20.474894  / # . /lava-8960485/environment/lava-896048=
5/bin/lava-test-runner /lava-8960485/1
    2023-02-01T00:55:20.475800  =

    2023-02-01T00:55:20.493685  / # /lava-8960485/bin/lava-test-runner /lav=
a-8960485/1
    2023-02-01T00:55:20.604464  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-01T00:55:20.605126  + cd /lava-8960485/1/tests/1_bootrr =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9b89cb122a3ec19915ec8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9b89cb122a3ec19915=
ec9
        failing since 10 days (last pass: v6.2-rc4-412-g665ddd640630, first=
 fail: v6.2-rc4-480-gb1867226dfbb) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9bf155d78ad1b56915fea

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63d9bf155d78ad1=
b56915ff2
        failing since 373 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2023-02-01T01:23:08.327588  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2023-02-01T01:23:08.328385  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2023-02-01T01:23:08.330400  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2023-02-01T01:23:08.379172  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9b4ccebe155eee7915f25

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9b4ccebe155eee7915f2a
        failing since 2 days (last pass: v6.1-rc8-128-gc530a9add07c, first =
fail: v6.2-rc6-199-g0a49732f057b)

    2023-02-01T00:39:19.018659  + set +x
    2023-02-01T00:39:19.018806  [   11.943454] <LAVA_SIGNAL_ENDRUN 0_dmesg =
894089_1.5.2.3.1>
    2023-02-01T00:39:19.126158  / # #
    2023-02-01T00:39:19.227629  export SHELL=3D/bin/sh
    2023-02-01T00:39:19.228114  #
    2023-02-01T00:39:19.329583  / # export SHELL=3D/bin/sh. /lava-894089/en=
vironment
    2023-02-01T00:39:19.330127  =

    2023-02-01T00:39:19.438718  / # . /lava-894089/environment/lava-894089/=
bin/lava-test-runner /lava-894089/1
    2023-02-01T00:39:19.448498  =

    2023-02-01T00:39:19.459961  / # /lava-894089/bin/lava-test-runner /lava=
-894089/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9b5d05a9c3c80f4915ec7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9b5d05a9c3c80f4915ecc
        failing since 2 days (last pass: v6.1-rc8-128-gc530a9add07c, first =
fail: v6.2-rc6-199-g0a49732f057b)

    2023-02-01T00:43:42.166446  + set +x
    2023-02-01T00:43:42.166627  [   12.931319] <LAVA_SIGNAL_ENDRUN 0_dmesg =
894104_1.5.2.3.1>
    2023-02-01T00:43:42.274059  / # #
    2023-02-01T00:43:42.375730  export SHELL=3D/bin/sh
    2023-02-01T00:43:42.376090  #
    2023-02-01T00:43:42.477213  / # export SHELL=3D/bin/sh. /lava-894104/en=
vironment
    2023-02-01T00:43:42.477655  =

    2023-02-01T00:43:42.578848  / # . /lava-894104/environment/lava-894104/=
bin/lava-test-runner /lava-894104/1
    2023-02-01T00:43:42.579518  =

    2023-02-01T00:43:42.582698  / # /lava-894104/bin/lava-test-runner /lava=
-894104/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9b6206c99a51097915eb9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9b6206c99a51097915ebe
        failing since 2 days (last pass: v6.1-rc8-128-gc530a9add07c, first =
fail: v6.2-rc6-199-g0a49732f057b)

    2023-02-01T00:45:02.446905  + set +x
    2023-02-01T00:45:02.447087  [   16.167163] <LAVA_SIGNAL_ENDRUN 0_dmesg =
894111_1.5.2.3.1>
    2023-02-01T00:45:02.554959  / # #
    2023-02-01T00:45:02.657155  export SHELL=3D/bin/sh
    2023-02-01T00:45:02.657884  #
    2023-02-01T00:45:02.759281  / # export SHELL=3D/bin/sh. /lava-894111/en=
vironment
    2023-02-01T00:45:02.759892  =

    2023-02-01T00:45:02.861266  / # . /lava-894111/environment/lava-894111/=
bin/lava-test-runner /lava-894111/1
    2023-02-01T00:45:02.862083  =

    2023-02-01T00:45:02.865350  / # /lava-894111/bin/lava-test-runner /lava=
-894111/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9b6c1404615ad5c915f04

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9b6c1404615ad5c915f09
        failing since 1 day (last pass: v6.1-rc8-128-gc530a9add07c, first f=
ail: v6.2-rc6-199-g0a49732f057b)

    2023-02-01T00:47:43.786601  + set +x
    2023-02-01T00:47:43.786771  [   12.901864] <LAVA_SIGNAL_ENDRUN 0_dmesg =
894127_1.5.2.3.1>
    2023-02-01T00:47:43.894106  / # #
    2023-02-01T00:47:43.995529  export SHELL=3D/bin/sh
    2023-02-01T00:47:43.996024  #
    2023-02-01T00:47:44.097306  / # export SHELL=3D/bin/sh. /lava-894127/en=
vironment
    2023-02-01T00:47:44.097898  =

    2023-02-01T00:47:44.199147  / # . /lava-894127/environment/lava-894127/=
bin/lava-test-runner /lava-894127/1
    2023-02-01T00:47:44.199917  =

    2023-02-01T00:47:44.203033  / # /lava-894127/bin/lava-test-runner /lava=
-894127/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9b78800cc8569d0915ebb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9b78800cc8569d0915ec0
        failing since 1 day (last pass: v6.1-rc8-128-gc530a9add07c, first f=
ail: v6.2-rc6-199-g0a49732f057b)

    2023-02-01T00:50:57.563130  + set +x
    2023-02-01T00:50:57.563312  [   12.599818] <LAVA_SIGNAL_ENDRUN 0_dmesg =
894132_1.5.2.3.1>
    2023-02-01T00:50:57.670258  / # #
    2023-02-01T00:50:57.771938  export SHELL=3D/bin/sh
    2023-02-01T00:50:57.772328  #
    2023-02-01T00:50:57.873565  / # export SHELL=3D/bin/sh. /lava-894132/en=
vironment
    2023-02-01T00:50:57.874087  =

    2023-02-01T00:50:57.975466  / # . /lava-894132/environment/lava-894132/=
bin/lava-test-runner /lava-894132/1
    2023-02-01T00:50:57.976193  =

    2023-02-01T00:50:57.979283  / # /lava-894132/bin/lava-test-runner /lava=
-894132/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9b7750752746e8a915ec7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9b7750752746e8a915ecc
        new failure (last pass: v6.2-rc6-241-g70d29276a90d)

    2023-02-01T00:50:41.579240  [   14.981875] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-02-01T00:50:41.585413  + set[   14.991707] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 894134_1.5.2.3.1>
    2023-02-01T00:50:41.585643   +x
    2023-02-01T00:50:41.694823  / # #
    2023-02-01T00:50:41.796417  export SHELL=3D/bin/sh
    2023-02-01T00:50:41.796897  #
    2023-02-01T00:50:41.898219  / # export SHELL=3D/bin/sh. /lava-894134/en=
vironment
    2023-02-01T00:50:41.898835  =

    2023-02-01T00:50:42.000123  / # . /lava-894134/environment/lava-894134/=
bin/lava-test-runner /lava-894134/1
    2023-02-01T00:50:42.000875   =

    ... (13 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9b78ba85cf15f62915ebc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9b78ba85cf15f62915=
ebd
        failing since 146 days (last pass: v5.19-rc5-383-g73ad9bd963c1, fir=
st fail: v6.0-rc4-291-g83a56f559828) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9b7ee8bb9e7df67915f11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9b7ee8bb9e7df67915=
f12
        failing since 147 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9c6c96c5e21c124915f0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9c6c96c5e21c124915=
f0c
        new failure (last pass: v6.2-rc6-241-g70d29276a90d) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9dbd768d76fdca7915eba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9dbd768d76fdca7915=
ebb
        failing since 277 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9b6c2404615ad5c915f0f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9b6c2404615ad5c915=
f10
        new failure (last pass: v6.2-rc6-241-g70d29276a90d) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9e059ff1f8fcfba915eba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9e059ff1f8fcfba915=
ebb
        new failure (last pass: v6.2-rc6-241-g70d29276a90d) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxm-q200               | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9dc5c51cf7c86df915eed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9dc5c51cf7c86df915=
eee
        failing since 2 days (last pass: v6.2-rc5-286-g436294605dc5, first =
fail: v6.2-rc6-199-g0a49732f057b) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9ebb793353072a6915ecc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9ebb793353072a6915=
ecd
        new failure (last pass: v6.2-rc6-241-g70d29276a90d) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9b63b6c99a51097915f1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9b63b6c99a51097915=
f1d
        new failure (last pass: v6.2-rc6-241-g70d29276a90d) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9b9bd02453a3546916032

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9b9bd02453a3546916=
033
        failing since 7 days (last pass: v6.2-rc5-157-g1f16e03afb18, first =
fail: v6.2-rc5-174-gc5f142de047d) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9b5d15a9c3c80f4915ee0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9b5d15a9c3c80f4915=
ee1
        failing since 111 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9b12519b0df68c7915edc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9b12519b0df68c7915=
edd
        new failure (last pass: v6.2-rc6-241-g70d29276a90d) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9b79aa85cf15f62915ec1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9b79aa85cf15f62915=
ec2
        failing since 47 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9b505decc971cea915ecc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9b505decc971cea915=
ecd
        failing since 47 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9b64b280c26fc4e915f37

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9b64b280c26fc4e915f3c
        new failure (last pass: v6.0-11312-g1778d6da389c)

    2023-02-01T00:45:40.562851  [   28.547565] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3260089_1.5.2.4.1>
    2023-02-01T00:45:40.667420  =

    2023-02-01T00:45:40.769005  / # #export SHELL=3D/bin/sh
    2023-02-01T00:45:40.769442  =

    2023-02-01T00:45:40.870840  / # export SHELL=3D/bin/sh. /lava-3260089/e=
nvironment
    2023-02-01T00:45:40.871332  =

    2023-02-01T00:45:40.972693  / # . /lava-3260089/environment/lava-326008=
9/bin/lava-test-runner /lava-3260089/1
    2023-02-01T00:45:40.973493  =

    2023-02-01T00:45:40.975972  / # /lava-3260089/bin/lava-test-runner /lav=
a-3260089/1
    2023-02-01T00:45:41.012381  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9b97e1c180ce236915ecc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-roc=
k64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-roc=
k64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9b97e1c180ce236915ed1
        new failure (last pass: v6.0-9666-g02c05e0b8d5c)

    2023-02-01T00:59:22.624132  [   29.437953] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3260284_1.5.2.4.1>
    2023-02-01T00:59:22.734137  =

    2023-02-01T00:59:22.836036  / # #export SHELL=3D/bin/sh
    2023-02-01T00:59:22.836539  =

    2023-02-01T00:59:22.938741  / # export SHELL=3D/bin/sh. /lava-3260284/e=
nvironment
    2023-02-01T00:59:22.939167  =

    2023-02-01T00:59:23.040513  / # . /lava-3260284/environment/lava-326028=
4/bin/lava-test-runner /lava-3260284/1
    2023-02-01T00:59:23.041356  =

    2023-02-01T00:59:23.044592  / # /lava-3260284/bin/lava-test-runner /lav=
a-3260284/1
    2023-02-01T00:59:23.080091  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9b9e2f188115fd1915eb9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9b9e2f188115fd1915ebe
        new failure (last pass: v6.0-11312-g1778d6da389c)

    2023-02-01T01:01:00.178245  + set +x
    2023-02-01T01:01:00.178988  [   28.613391] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3260375_1.5.2.4.1>
    2023-02-01T01:01:00.283198  =

    2023-02-01T01:01:00.384668  / # #export SHELL=3D/bin/sh
    2023-02-01T01:01:00.385182  =

    2023-02-01T01:01:00.486563  / # export SHELL=3D/bin/sh. /lava-3260375/e=
nvironment
    2023-02-01T01:01:00.487147  =

    2023-02-01T01:01:00.588557  / # . /lava-3260375/environment/lava-326037=
5/bin/lava-test-runner /lava-3260375/1
    2023-02-01T01:01:00.589385  =

    2023-02-01T01:01:00.592019  / # /lava-3260375/bin/lava-test-runner /lav=
a-3260375/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9ba47a79e5f652f915ec7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-rk332=
8-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-rk332=
8-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9ba47a79e5f652f915ecc
        new failure (last pass: v6.0-11312-g1778d6da389c)

    2023-02-01T01:02:45.241622  [   29.786155] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3260380_1.5.2.4.1>
    2023-02-01T01:02:45.346477  =

    2023-02-01T01:02:45.447991  / # #export SHELL=3D/bin/sh
    2023-02-01T01:02:45.448416  =

    2023-02-01T01:02:45.549748  / # export SHELL=3D/bin/sh. /lava-3260380/e=
nvironment
    2023-02-01T01:02:45.550171  =

    2023-02-01T01:02:45.651529  / # . /lava-3260380/environment/lava-326038=
0/bin/lava-test-runner /lava-3260380/1
    2023-02-01T01:02:45.652216  =

    2023-02-01T01:02:45.655823  / # /lava-3260380/bin/lava-test-runner /lav=
a-3260380/1
    2023-02-01T01:02:45.690886  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9bae6245e76edbb915f0e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328-=
rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328-=
rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9bae6245e76edbb915f13
        new failure (last pass: v6.0-11312-g1778d6da389c)

    2023-02-01T01:05:28.463349  [   95.585512] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3260455_1.5.2.4.1>
    2023-02-01T01:05:28.566716  =

    2023-02-01T01:05:28.667914  / # #export SHELL=3D/bin/sh
    2023-02-01T01:05:28.668194  =

    2023-02-01T01:05:28.769364  / # export SHELL=3D/bin/sh. /lava-3260455/e=
nvironment
    2023-02-01T01:05:28.769805  =

    2023-02-01T01:05:28.871247  / # . /lava-3260455/environment/lava-326045=
5/bin/lava-test-runner /lava-3260455/1
    2023-02-01T01:05:28.872129  =

    2023-02-01T01:05:28.875567  / # /lava-3260455/bin/lava-test-runner /lav=
a-3260455/1
    2023-02-01T01:05:28.911359  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
stm32mp157c-dk2              | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9b455d4e93efc48915f0d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-stm32mp157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-stm32mp157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9b456d4e93efc48915f12
        new failure (last pass: v6.0-11312-g1778d6da389c)

    2023-02-01T00:37:35.933090  <8>[   15.205882] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3259862_1.5.2.4.1>
    2023-02-01T00:37:36.037728  / # #
    2023-02-01T00:37:36.139618  export SHELL=3D/bin/sh
    2023-02-01T00:37:36.140083  #
    2023-02-01T00:37:36.241402  / # export SHELL=3D/bin/sh. /lava-3259862/e=
nvironment
    2023-02-01T00:37:36.241860  =

    2023-02-01T00:37:36.343042  / # . /lava-3259862/environment/lava-325986=
2/bin/lava-test-runner /lava-3259862/1
    2023-02-01T00:37:36.343779  =

    2023-02-01T00:37:36.347756  / # /lava-3259862/bin/lava-test-runner /lav=
a-3259862/1
    2023-02-01T00:37:36.417964  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
stm32mp157c-dk2              | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9b574b5658659ea915ec8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-stm=
32mp157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-stm=
32mp157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9b574b5658659ea915ecd
        new failure (last pass: v5.19-3879-ge7dffa5317766)

    2023-02-01T00:42:14.685489  <8>[   12.660310] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3260035_1.5.2.4.1>
    2023-02-01T00:42:14.790212  / # #
    2023-02-01T00:42:14.892178  export SHELL=3D/bin/sh
    2023-02-01T00:42:14.892502  #
    2023-02-01T00:42:14.993619  / # export SHELL=3D/bin/sh. /lava-3260035/e=
nvironment
    2023-02-01T00:42:14.993915  =

    2023-02-01T00:42:15.095045  / # . /lava-3260035/environment/lava-326003=
5/bin/lava-test-runner /lava-3260035/1
    2023-02-01T00:42:15.095514  =

    2023-02-01T00:42:15.099455  / # /lava-3260035/bin/lava-test-runner /lav=
a-3260035/1
    2023-02-01T00:42:15.175426  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
stm32mp157c-dk2              | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9b6d6bd5ad60f3c915ed5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
stm32mp157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
stm32mp157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9b6d6bd5ad60f3c915=
ed6
        new failure (last pass: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
stm32mp157c-dk2              | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9b72727bd3f03a89161eb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-stm32mp=
157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-stm32mp=
157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9b72727bd3f03a89161f0
        new failure (last pass: v6.0-11312-g1778d6da389c)

    2023-02-01T00:49:25.793369  <8>[   18.348095] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3260159_1.5.2.4.1>
    2023-02-01T00:49:25.899997  / # #
    2023-02-01T00:49:26.002305  export SHELL=3D/bin/sh
    2023-02-01T00:49:26.003018  #
    2023-02-01T00:49:26.107014  / # export SHELL=3D/bin/sh. /lava-3260159/e=
nvironment
    2023-02-01T00:49:26.107556  =

    2023-02-01T00:49:26.208973  / # . /lava-3260159/environment/lava-326015=
9/bin/lava-test-runner /lava-3260159/1
    2023-02-01T00:49:26.209603  =

    2023-02-01T00:49:26.213392  / # /lava-3260159/bin/lava-test-runner /lav=
a-3260159/1
    2023-02-01T00:49:26.288331  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
stm32mp157c-dk2              | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9b762e31cb6fc76915ed9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-stm32mp157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-stm32mp157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9b762e31cb6fc76915ede
        new failure (last pass: v5.19-rc5-345-gd3298a6516a4)

    2023-02-01T00:50:37.508233  <8>[   13.510342] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3260191_1.5.2.4.1>
    2023-02-01T00:50:37.613416  / # #
    2023-02-01T00:50:37.715566  export SHELL=3D/bin/sh
    2023-02-01T00:50:37.715956  #
    2023-02-01T00:50:37.817356  / # export SHELL=3D/bin/sh. /lava-3260191/e=
nvironment
    2023-02-01T00:50:37.818084  =

    2023-02-01T00:50:37.920036  / # . /lava-3260191/environment/lava-326019=
1/bin/lava-test-runner /lava-3260191/1
    2023-02-01T00:50:37.920979  =

    2023-02-01T00:50:37.925494  / # /lava-3260191/bin/lava-test-runner /lav=
a-3260191/1
    2023-02-01T00:50:37.994261  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9bc32dee66988c4915ec7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9bc32dee66988c4915=
ec8
        failing since 103 days (last pass: v6.0-10339-g565da9e84d8f, first =
fail: v6.1-rc1-192-gdfe701541ba9) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9b5f47fbcb7b3ee915ebf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-28=
9-g1b7183933813/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9b5f47fbcb7b3ee915=
ec0
        failing since 47 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =20
