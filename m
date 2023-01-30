Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 700DE680510
	for <lists+linux-next@lfdr.de>; Mon, 30 Jan 2023 05:35:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235455AbjA3Efm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 29 Jan 2023 23:35:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjA3Efl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 29 Jan 2023 23:35:41 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E119A212AC
        for <linux-next@vger.kernel.org>; Sun, 29 Jan 2023 20:35:30 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id z1-20020a17090a66c100b00226f05b9595so9961243pjl.0
        for <linux-next@vger.kernel.org>; Sun, 29 Jan 2023 20:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NLRjZc0dKa9+/24aclRhdl0oClHE7FyRyvoX03wIYtU=;
        b=HRooRW4XhtIUmOJrFkhkJxDiE7bqjvmdHijvtoyoIRCK1FExfaqCxtxLQzl/69HmpA
         g5io/yBJFi5zuF5dRFpvHxJ1RpeIFtIfI3hKPgum1HAvkMz9ZgvzEhjpXshD9aWFtVLv
         pE7Yf4QavgFJnQZ5Dvok2s04cGC9y4T/Yn1+P/AxqdCp60h/sRNtNRr6Abhf7GVfu7yi
         NB1W7qi/G2to0LB5P/swFXzNsOoQOTYghl9eXjFpgwYoiAvNHJx82I2gJnBZiKJyg/8d
         +Utj69yrx/5qXOBKUaDZPNden/M1QBkHgEI0CqE1kV8yWSDw2zkqt0HSvIufDkWYQVbM
         6NCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLRjZc0dKa9+/24aclRhdl0oClHE7FyRyvoX03wIYtU=;
        b=0crPTaZ1kU+8jrrp5ncCgbQPR623pF9ydjf63jAaX1lWVANzjXah78ukQQLYbZAkBg
         VPZBEAHFWNAxxkWvKr6j8iSPTmHbNI4iX3Q2QhQLDHKNdoxUhHvAMR47X3AfsjbjQME6
         bRWjPPRmPCq5apPedJegU8Fv55JQQwGNyFnNEL8Wpu6rcY7HltfJGlN7PrKdZ31mR33m
         9FB0juKQmiSJgQ+oAN+UB7T06UbaI+3ny/CYuZs3CzM6NNwnDnoMmPg0AJ3MkWI0i2Ii
         Y46ovHgJi+8ZuaQMRcYaZuTS7OecOi5KhbUsmxlYRKS5CbW7JIYf0VMwA7th0XT95yyi
         QG1w==
X-Gm-Message-State: AFqh2ko9UGpA0D+S2pcleyfXaGY2OZwoPO5vIo8HCJiMEQMBjlDJuSdc
        h9c7KoblQsBLrGvfjYvXD1/0wlmF4N1GlXpYw60=
X-Google-Smtp-Source: AMrXdXsAekAny2keIdU5FiKjRyuziaIuWUHp5hgiT14Wvfol1etw3xpLKeoIqSiMDa/2VQdln1CVrw==
X-Received: by 2002:a17:90b:17cb:b0:22b:b9f4:4ad1 with SMTP id me11-20020a17090b17cb00b0022bb9f44ad1mr36132759pjb.34.1675053329022;
        Sun, 29 Jan 2023 20:35:29 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p8-20020a17090a2c4800b002262ab43327sm8497490pjm.26.2023.01.29.20.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 20:35:28 -0800 (PST)
Message-ID: <63d74910.170a0220.aa272.e3b5@mx.google.com>
Date:   Sun, 29 Jan 2023 20:35:28 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.2-rc6-199-g0a49732f057b
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 708 runs,
 50 regressions (v6.2-rc6-199-g0a49732f057b)
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

next/pending-fixes baseline: 708 runs, 50 regressions (v6.2-rc6-199-g0a4973=
2f057b)

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

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
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
7_defconfig+crypto    | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

meson-gxm-q200               | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxm-q200               | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm   | lab-collabora   | gcc-10   | multi_v=
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

qemu_arm-virt-gicv3-uefi     | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+videodec           | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+crypto             | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+ima                | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.2-rc6-199-g0a49732f057b/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.2-rc6-199-g0a49732f057b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      0a49732f057b28a62652502dafc8e5810ce788ee =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d70b95e074a4d7ce915eba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d70b95e074a4d7ce915=
ebb
        failing since 112 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63d70a885f8efe7ab6915ee9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d70a885f8efe7ab6915eee
        failing since 18 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-01-30T00:08:16.752583  / # #
    2023-01-30T00:08:16.854276  export SHELL=3D/bin/sh
    2023-01-30T00:08:16.854938  #
    2023-01-30T00:08:16.956592  / # export SHELL=3D/bin/sh. /lava-8926940/e=
nvironment
    2023-01-30T00:08:16.957343  =

    2023-01-30T00:08:17.059075  / # . /lava-8926940/environment/lava-892694=
0/bin/lava-test-runner /lava-8926940/1
    2023-01-30T00:08:17.060413  =

    2023-01-30T00:08:17.075609  / # /lava-8926940/bin/lava-test-runner /lav=
a-8926940/1
    2023-01-30T00:08:17.185882  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-30T00:08:17.186278  + cd /lava-8926940/1/tests/1_bootrr =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d70bb81c590fbd65915ec8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d70bb81c590fbd65915ecd
        failing since 12 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-30T00:13:31.807931  <8>[   16.581170] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3241775_1.5.2.4.1>
    2023-01-30T00:13:31.916576  / # #
    2023-01-30T00:13:32.019068  export SHELL=3D/bin/sh
    2023-01-30T00:13:32.020011  #
    2023-01-30T00:13:32.122245  / # export SHELL=3D/bin/sh. /lava-3241775/e=
nvironment
    2023-01-30T00:13:32.123257  =

    2023-01-30T00:13:32.226370  / # . /lava-3241775/environment/lava-324177=
5/bin/lava-test-runner /lava-3241775/1
    2023-01-30T00:13:32.227942  =

    2023-01-30T00:13:32.232719  / # /lava-3241775/bin/lava-test-runner /lav=
a-3241775/1
    2023-01-30T00:13:32.314159  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63d70c935d16526d6c915f33

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d70c935d16526d6c915f38
        failing since 12 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-30T00:17:12.714530  <8>[   15.199842] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3241924_1.5.2.4.1>
    2023-01-30T00:17:12.823813  / # #
    2023-01-30T00:17:12.926903  export SHELL=3D/bin/sh
    2023-01-30T00:17:12.927723  #
    2023-01-30T00:17:12.928098  / # <3>[   15.371970] Bluetooth: hci0: comm=
and 0xfc18 tx timeout
    2023-01-30T00:17:13.029885  export SHELL=3D/bin/sh. /lava-3241924/envir=
onment
    2023-01-30T00:17:13.030619  =

    2023-01-30T00:17:13.132324  / # . /lava-3241924/environment/lava-324192=
4/bin/lava-test-runner /lava-3241924/1
    2023-01-30T00:17:13.133990  =

    2023-01-30T00:17:13.138575  / # /lava-3241924/bin/lava-test-runner /lav=
a-3241924/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d711fc9b0a33bad6915ebe

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d711fc9b0a33bad6915ec3
        failing since 12 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-30T00:40:03.369401  <8>[   24.771154] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3242110_1.5.2.4.1>
    2023-01-30T00:40:03.480174  / # #
    2023-01-30T00:40:03.583182  export SHELL=3D/bin/sh
    2023-01-30T00:40:03.583551  #
    2023-01-30T00:40:03.684749  / # export SHELL=3D/bin/sh. /lava-3242110/e=
nvironment
    2023-01-30T00:40:03.685138  =

    2023-01-30T00:40:03.786295  / # . /lava-3242110/environment/lava-324211=
0/bin/lava-test-runner /lava-3242110/1
    2023-01-30T00:40:03.787499  =

    2023-01-30T00:40:03.792328  / # /lava-3242110/bin/lava-test-runner /lav=
a-3242110/1
    2023-01-30T00:40:03.879040  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d714d955aa63180a915f75

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d714d955aa63180a915f7a
        failing since 12 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-30T00:52:15.245936  + set +x<8>[   17.606909] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3242379_1.5.2.4.1>
    2023-01-30T00:52:15.246547  =

    2023-01-30T00:52:15.356288  / # #
    2023-01-30T00:52:15.459699  export SHELL=3D/bin/sh
    2023-01-30T00:52:15.460791  #
    2023-01-30T00:52:15.563125  / # export SHELL=3D/bin/sh. /lava-3242379/e=
nvironment
    2023-01-30T00:52:15.564173  =

    2023-01-30T00:52:15.666745  / # . /lava-3242379/environment/lava-324237=
9/bin/lava-test-runner /lava-3242379/1
    2023-01-30T00:52:15.668604  =

    2023-01-30T00:52:15.673512  / # /lava-3242379/bin/lava-test-runner /lav=
a-3242379/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7155525008ade05915f9d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d7155525008ade05915fa2
        failing since 12 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-30T00:54:31.228811  <8>[   14.762109] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3242483_1.5.2.4.1>
    2023-01-30T00:54:31.339886  / # #
    2023-01-30T00:54:31.444138  export SHELL=3D/bin/sh
    2023-01-30T00:54:31.445329  #
    2023-01-30T00:54:31.446025  / # <3>[   14.890111] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-01-30T00:54:31.548494  export SHELL=3D/bin/sh. /lava-3242483/envir=
onment
    2023-01-30T00:54:31.549674  =

    2023-01-30T00:54:31.652387  / # . /lava-3242483/environment/lava-324248=
3/bin/lava-test-runner /lava-3242483/1
    2023-01-30T00:54:31.654295  =

    2023-01-30T00:54:31.659271  / # /lava-3242483/bin/lava-test-runner /lav=
a-3242483/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/63d70dc15a4e49fb0f915f15

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63d70dc15a4e49f=
b0f915f1d
        failing since 371 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2023-01-30T00:22:02.919086  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2023-01-30T00:22:02.919928  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2023-01-30T00:22:02.922282  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2023-01-30T00:22:02.969540  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d70a8edfbd0afa56915ed6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d70a8edfbd0afa56915edb
        new failure (last pass: v6.1-rc8-128-gc530a9add07c)

    2023-01-30T00:08:36.292853  + set +x
    2023-01-30T00:08:36.293017  [   11.924752] <LAVA_SIGNAL_ENDRUN 0_dmesg =
891347_1.5.2.3.1>
    2023-01-30T00:08:36.399577  / # #
    2023-01-30T00:08:36.501570  export SHELL=3D/bin/sh
    2023-01-30T00:08:36.502375  #
    2023-01-30T00:08:36.603786  / # export SHELL=3D/bin/sh. /lava-891347/en=
vironment
    2023-01-30T00:08:36.604354  =

    2023-01-30T00:08:36.705673  / # . /lava-891347/environment/lava-891347/=
bin/lava-test-runner /lava-891347/1
    2023-01-30T00:08:36.706315  =

    2023-01-30T00:08:36.709607  / # /lava-891347/bin/lava-test-runner /lava=
-891347/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63d70c1e790d95f1d1915ee1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d70c1e790d95f1d1915ee6
        new failure (last pass: v6.1-rc8-128-gc530a9add07c)

    2023-01-30T00:15:08.920116  + set +x
    2023-01-30T00:15:08.920411  [   12.959150] <LAVA_SIGNAL_ENDRUN 0_dmesg =
891360_1.5.2.3.1>
    2023-01-30T00:15:09.028159  / # #
    2023-01-30T00:15:09.130696  export SHELL=3D/bin/sh
    2023-01-30T00:15:09.131485  #
    2023-01-30T00:15:09.232735  / # export SHELL=3D/bin/sh. /lava-891360/en=
vironment
    2023-01-30T00:15:09.233242  =

    2023-01-30T00:15:09.334469  / # . /lava-891360/environment/lava-891360/=
bin/lava-test-runner /lava-891360/1
    2023-01-30T00:15:09.335484  =

    2023-01-30T00:15:09.339047  / # /lava-891360/bin/lava-test-runner /lava=
-891360/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7116e343ac517c8915f73

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d7116e343ac517c8915f78
        new failure (last pass: v6.1-rc8-128-gc530a9add07c)

    2023-01-30T00:37:51.551401  + set +x
    2023-01-30T00:37:51.551560  [   16.126542] <LAVA_SIGNAL_ENDRUN 0_dmesg =
891403_1.5.2.3.1>
    2023-01-30T00:37:51.659337  / # #
    2023-01-30T00:37:51.761075  export SHELL=3D/bin/sh
    2023-01-30T00:37:51.761652  #
    2023-01-30T00:37:51.862979  / # export SHELL=3D/bin/sh. /lava-891403/en=
vironment
    2023-01-30T00:37:51.863509  =

    2023-01-30T00:37:51.965198  / # . /lava-891403/environment/lava-891403/=
bin/lava-test-runner /lava-891403/1
    2023-01-30T00:37:51.965738  =

    2023-01-30T00:37:51.969015  / # /lava-891403/bin/lava-test-runner /lava=
-891403/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d713c659d7570e0f915ecb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d713c659d7570e0f915ed0
        new failure (last pass: v6.1-rc8-128-gc530a9add07c)

    2023-01-30T00:47:45.902019  + set +x
    2023-01-30T00:47:45.902180  [   12.909480] <LAVA_SIGNAL_ENDRUN 0_dmesg =
891433_1.5.2.3.1>
    2023-01-30T00:47:46.009703  / # #
    2023-01-30T00:47:46.111154  export SHELL=3D/bin/sh
    2023-01-30T00:47:46.111483  #
    2023-01-30T00:47:46.212604  / # export SHELL=3D/bin/sh. /lava-891433/en=
vironment
    2023-01-30T00:47:46.212982  =

    2023-01-30T00:47:46.314210  / # . /lava-891433/environment/lava-891433/=
bin/lava-test-runner /lava-891433/1
    2023-01-30T00:47:46.314812  =

    2023-01-30T00:47:46.317740  / # /lava-891433/bin/lava-test-runner /lava=
-891433/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7156be02525a3ba915f71

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d7156be02525a3ba915f76
        new failure (last pass: v6.1-rc8-128-gc530a9add07c)

    2023-01-30T00:54:45.716305  [   12.613391] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-01-30T00:54:45.722941  + set +x
    2023-01-30T00:54:45.723220  [   12.624476] <LAVA_SIGNAL_ENDRUN 0_dmesg =
891451_1.5.2.3.1>
    2023-01-30T00:54:45.830299  / # #
    2023-01-30T00:54:45.931900  export SHELL=3D/bin/sh
    2023-01-30T00:54:45.932409  #
    2023-01-30T00:54:46.033656  / # export SHELL=3D/bin/sh. /lava-891451/en=
vironment
    2023-01-30T00:54:46.034148  =

    2023-01-30T00:54:46.135452  / # . /lava-891451/environment/lava-891451/=
bin/lava-test-runner /lava-891451/1
    2023-01-30T00:54:46.136109   =

    ... (13 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d711833582ca6b9b915ebb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d711833582ca6b9b915ec0
        new failure (last pass: v6.2-rc5-286-g436294605dc5)

    2023-01-30T00:38:11.406448  + set[   27.230760] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 891402_1.5.2.3.1>
    2023-01-30T00:38:11.406629   +x
    2023-01-30T00:38:11.512470  / # #
    2023-01-30T00:38:11.614272  export SHELL=3D/bin/sh
    2023-01-30T00:38:11.614661  #
    2023-01-30T00:38:11.715834  / # export SHELL=3D/bin/sh. /lava-891402/en=
vironment
    2023-01-30T00:38:11.716261  =

    2023-01-30T00:38:11.817432  / # . /lava-891402/environment/lava-891402/=
bin/lava-test-runner /lava-891402/1
    2023-01-30T00:38:11.817973  =

    2023-01-30T00:38:11.820952  / # /lava-891402/bin/lava-test-runner /lava=
-891402/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63d71737bae8e07d6e915eef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d71737bae8e07d6e915=
ef0
        failing since 84 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.1-rc3-573-g82d05e3975f5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d71863fb4791311b916001

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d71863fb4791311b916=
002
        failing since 144 days (last pass: v5.19-rc5-383-g73ad9bd963c1, fir=
st fail: v6.0-rc4-291-g83a56f559828) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d71951e577403932915ed9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d71951e577403932915=
eda
        failing since 146 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63d716fb6075d049e5915eba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d716fb6075d049e5915=
ebb
        failing since 136 days (last pass: v6.0-rc4-291-g83a56f559828, firs=
t fail: v6.0-rc5-197-ga6a750a2f4166) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7125684e468fe48915ef6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d7125684e468fe48915ef9
        failing since 25 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-30T00:41:37.962130  + set<8>[   38.850585] <LAVA_SIGNAL_ENDRUN =
0_dmesg 1148948_1.5.2.4.1>
    2023-01-30T00:41:37.962252   +x
    2023-01-30T00:41:38.065214  / # #
    2023-01-30T00:41:39.223847  export SHELL=3D/bin/sh
    2023-01-30T00:41:39.229510  #
    2023-01-30T00:41:40.776978  / # export SHELL=3D/bin/sh. /lava-1148948/e=
nvironment
    2023-01-30T00:41:40.782657  =

    2023-01-30T00:41:43.604716  / # . /lava-1148948/environment/lava-114894=
8/bin/lava-test-runner /lava-1148948/1
    2023-01-30T00:41:43.610737  =

    2023-01-30T00:41:43.619825  / # /lava-1148948/bin/lava-test-runner /lav=
a-1148948/1 =

    ... (21 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7086dd1d43e7c57915ed1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7086dd1d43e7c57915=
ed2
        failing since 275 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxm-q200               | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d71f72188b0d2f75915ef9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d71f72188b0d2f75915=
efa
        new failure (last pass: v6.2-rc5-286-g436294605dc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxm-q200               | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7283380a6d31c04915ecf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g=
xm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g=
xm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7283380a6d31c04915=
ed0
        new failure (last pass: v6.2-rc5-286-g436294605dc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63d710c1354db2a530915ec4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d710c1354db2a530915=
ec5
        new failure (last pass: v6.2-rc5-286-g436294605dc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7118417db13ae79915ecb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7118417db13ae79915=
ecc
        failing since 109 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7170881c22d67ab915ed7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7170881c22d67ab915=
ed8
        failing since 109 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7174abae8e07d6e915f57

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7174abae8e07d6e915=
f58
        failing since 109 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63d716e982ebc9d9d2915ed0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d716e982ebc9d9d2915=
ed1
        failing since 109 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7170a81c22d67ab915ee1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7170a81c22d67ab915=
ee2
        failing since 109 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63d71770684c6b200c915ed2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d71770684c6b200c915=
ed3
        failing since 109 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7170981c22d67ab915edc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7170981c22d67ab915=
edd
        failing since 109 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7176e684c6b200c915ecb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7176e684c6b200c915=
ecc
        failing since 109 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7170781c22d67ab915ed2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7170781c22d67ab915=
ed3
        failing since 109 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7173281fb205ec8915ec0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7173281fb205ec8915=
ec1
        failing since 109 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63d716e83672469c18915ec9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d716e83672469c18915=
eca
        failing since 109 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d709066f9498d223915ed8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d709066f9498d223915=
ed9
        failing since 2 days (last pass: v6.2-rc5-219-g3c4f681a3d69, first =
fail: v6.2-rc5-286-g436294605dc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7162da09c6af0ae915eb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7162da09c6af0ae915=
eba
        failing since 45 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7193b4401d80804915ec5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d7193b4401d80804915=
ec6
        failing since 45 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63d70f14c80fb3c8e2915ecf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d70f14c80fb3c8e2915=
ed0
        failing since 101 days (last pass: v6.0-10339-g565da9e84d8f, first =
fail: v6.1-rc1-192-gdfe701541ba9) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d70f747d77ce891a915ee2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-=
h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-=
h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d70f747d77ce891a915ee5
        failing since 25 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-30T00:29:25.898139  / # #
    2023-01-30T00:29:26.000502  export SHELL=3D/bin/sh
    2023-01-30T00:29:26.001164  #
    2023-01-30T00:29:26.102940  / # export SHELL=3D/bin/sh. /lava-388381/en=
vironment
    2023-01-30T00:29:26.103690  =

    2023-01-30T00:29:26.205350  / # . /lava-388381/environment/lava-388381/=
bin/lava-test-runner /lava-388381/1
    2023-01-30T00:29:26.206426  =

    2023-01-30T00:29:26.221764  / # /lava-388381/bin/lava-test-runner /lava=
-388381/1
    2023-01-30T00:29:26.287954  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-30T00:29:26.288457  + cd /lava-388381/<8>[   19.939078] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 388381_1.5.2.4.5> =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d713a710053c2ed2915ee4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe=
/baseline-sun50i-h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe=
/baseline-sun50i-h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d713a710053c2ed2915ee7
        failing since 25 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-30T00:47:23.121675  / # #
    2023-01-30T00:47:23.223443  export SHELL=3D/bin/sh
    2023-01-30T00:47:23.223909  #
    2023-01-30T00:47:23.325067  / # export SHELL=3D/bin/sh. /lava-388421/en=
vironment
    2023-01-30T00:47:23.325515  =

    2023-01-30T00:47:23.426875  / # . /lava-388421/environment/lava-388421/=
bin/lava-test-runner /lava-388421/1
    2023-01-30T00:47:23.427609  =

    2023-01-30T00:47:23.432204  / # /lava-388421/bin/lava-test-runner /lava=
-388421/1
    2023-01-30T00:47:23.511360  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-30T00:47:23.511947  + cd /lava-388421/<8>[   19.927651] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 388421_1.5.2.4.5> =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d714725e087520f3915f0b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-clabbe=
/baseline-sun50i-h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-clabbe=
/baseline-sun50i-h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d714725e087520f3915f0e
        failing since 12 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-30T00:50:41.439123  <8>[   19.394479] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 388435_1.5.2.4.1>
    2023-01-30T00:50:41.547130  / # #
    2023-01-30T00:50:41.650094  export SHELL=3D/bin/sh
    2023-01-30T00:50:41.650691  #
    2023-01-30T00:50:41.752503  / # export SHELL=3D/bin/sh. /lava-388435/en=
vironment
    2023-01-30T00:50:41.753171  =

    2023-01-30T00:50:41.854863  / # . /lava-388435/environment/lava-388435/=
bin/lava-test-runner /lava-388435/1
    2023-01-30T00:50:41.855699  =

    2023-01-30T00:50:41.871182  / # /lava-388435/bin/lava-test-runner /lava=
-388435/1
    2023-01-30T00:50:41.939078  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63d71628538485568b915f2a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h6=
-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h6=
-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d71628538485568b915f2d
        failing since 12 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-30T00:58:09.429441  / # #
    2023-01-30T00:58:09.531781  export SHELL=3D/bin/sh
    2023-01-30T00:58:09.532452  #
    2023-01-30T00:58:09.634139  / # export SHELL=3D/bin/sh. /lava-388453/en=
vironment
    2023-01-30T00:58:09.634958  =

    2023-01-30T00:58:09.736725  / # . /lava-388453/environment/lava-388453/=
bin/lava-test-runner /lava-388453/1
    2023-01-30T00:58:09.737783  =

    2023-01-30T00:58:09.753527  / # /lava-388453/bin/lava-test-runner /lava=
-388453/1
    2023-01-30T00:58:09.820512  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-30T00:58:09.821280  + cd /lava-388453/1/tests/1_bootrr<8>[  112=
.913265] <LAVA_SIGNAL_STARTRUN 1_bootrr 388453_1.5.2.4.5> =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7168b109c81588b915ed4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-or=
angepi-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-or=
angepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d7168b109c81588b915ed7
        failing since 12 days (last pass: v6.1-2435-g5c02e5d167d0, first fa=
il: v6.2-rc4-350-g5ce527a369f5)

    2023-01-30T00:59:42.086891  <8>[   19.147675] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 388457_1.5.2.4.1>
    2023-01-30T00:59:42.193570  / # #
    2023-01-30T00:59:42.296019  export SHELL=3D/bin/sh
    2023-01-30T00:59:42.296672  #
    2023-01-30T00:59:42.398152  / # export SHELL=3D/bin/sh. /lava-388457/en=
vironment
    2023-01-30T00:59:42.398880  =

    2023-01-30T00:59:42.500528  / # . /lava-388457/environment/lava-388457/=
bin/lava-test-runner /lava-388457/1
    2023-01-30T00:59:42.501576  =

    2023-01-30T00:59:42.517780  / # /lava-388457/bin/lava-test-runner /lava=
-388457/1
    2023-01-30T00:59:42.583766  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d70a9d264146e466915ee5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/bas=
eline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/bas=
eline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d70a9d264146e466915ee8
        failing since 25 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-30T00:08:41.669700  / # #
    2023-01-30T00:08:41.772440  export SHELL=3D/bin/sh
    2023-01-30T00:08:41.773150  #
    2023-01-30T00:08:41.875111  / # export SHELL=3D/bin/sh. /lava-388353/en=
vironment
    2023-01-30T00:08:41.875801  =

    2023-01-30T00:08:41.876256  / # [   21.427845] usb-storage 2-1.1:1.0: U=
SB Mass Storage device detected
    2023-01-30T00:08:41.876635  [   21.437811] scsi host0: usb-storage 2-1.=
1:1.0
    2023-01-30T00:08:41.877013  . /lava-388353/environment[   21.486535] us=
bcore: registered new interface driver uas
    2023-01-30T00:08:41.978852  /lava-388353/bin/lava-test-runner /lava-388=
353/1
    2023-01-30T00:08:41.980427   =

    ... (25 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63d70c19392077fe4b915f66

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8i=
-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8i=
-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d70c19392077fe4b915f69
        failing since 25 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-30T00:15:16.273912  / # #
    2023-01-30T00:15:16.376101  export SHELL=3D/bin/sh
    2023-01-30T00:15:16.376681  #
    2023-01-30T00:15:16.478358  / # export SHELL=3D/bin/sh. /lava-388359/en=
vironment
    2023-01-30T00:15:16.478934  =

    2023-01-30T00:15:16.580632  / # . /lava-388359/environment/lava-388359/=
bin/lava-test-runner /lava-388359/1
    2023-01-30T00:15:16.581675  =

    2023-01-30T00:15:16.597631  / # /lava-388359/bin/lava-test-runner /lava=
-388359/1
    2023-01-30T00:15:16.677765  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-30T00:15:16.716771  + cd /lava-388359/1/tests/1_bootrr =

    ... (18 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d70f9f94db8253da915ee6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d70f9f94db8253da915ee9
        failing since 25 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-30T00:30:13.903148  / # #
    2023-01-30T00:30:14.005122  export SHELL=3D/bin/sh
    2023-01-30T00:30:14.005817  #
    2023-01-30T00:30:14.110484  / # export SHELL=3D/bin/sh. /lava-388377/en=
vironment
    2023-01-30T00:30:14.111170  =

    2023-01-30T00:30:14.212483  / # . /lava-388377/environment/lava-388377/=
bin/lava-test-runner /lava-388377/1
    2023-01-30T00:30:14.213448  =

    2023-01-30T00:30:14.224502  / # /lava-388377/bin/lava-test-runner /lava=
-388377/1
    2023-01-30T00:30:14.348205  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-30T00:30:14.348567  + cd /lava-388377/1/tests/1_bootrr =

    ... (14 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7119417db13ae79915edd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83=
t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83=
t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d7119417db13ae79915ee0
        failing since 25 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-30T00:38:35.509123  / # #
    2023-01-30T00:38:35.611512  export SHELL=3D/bin/sh
    2023-01-30T00:38:35.612190  #
    2023-01-30T00:38:35.713950  / # export SHELL=3D/bin/sh. /lava-388409/en=
vironment
    2023-01-30T00:38:35.714652  =

    2023-01-30T00:38:35.816486  / # . /lava-388409/environment/lava-388409/=
bin/lava-test-runner /lava-388409/1
    2023-01-30T00:38:35.817613  =

    2023-01-30T00:38:35.831829  / # /lava-388409/bin/lava-test-runner /lava=
-388409/1
    2023-01-30T00:38:35.912005  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-30T00:38:35.950067  + cd /lava-388409/1/tests/1_bootrr =

    ... (22 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7151867b58aeafd915ed4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d7151867b58aeafd915ed7
        failing since 25 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-30T00:53:34.377008  + set +x[   19.389622] <LAVA_SIGNAL_ENDRUN =
0_dmesg 388445_1.5.2.4.1>
    2023-01-30T00:53:34.377352  =

    2023-01-30T00:53:34.377951  / # [   19.400807] brcmfmac: brcmf_sdio_htc=
lk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-30T00:53:34.484383  #
    2023-01-30T00:53:34.586792  export SHELL=3D/bin/sh
    2023-01-30T00:53:34.587417  #
    2023-01-30T00:53:34.587860  / # [   19.535956] usb-storage 2-1.1:1.0: U=
SB Mass Storage device detected
    2023-01-30T00:53:34.588184  [   19.544659] scsi host0: usb-storage 2-1.=
1:1.0
    2023-01-30T00:53:34.588480  [   19.557070] usbcore: registered new inte=
rface driver uas
    2023-01-30T00:53:34.690109  export SHELL=3D/bin/sh. /lava-388445/enviro=
nment =

    ... (24 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63d70fee00fda0405d915ed8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-b=
ananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-b=
ananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d70fee00fda0405d915edb
        failing since 25 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-30T00:31:26.478469  / # #
    2023-01-30T00:31:26.581105  export SHELL=3D/bin/sh
    2023-01-30T00:31:26.581777  #
    2023-01-30T00:31:26.683839  / # export SHELL=3D/bin/sh. /lava-388391/en=
vironment
    2023-01-30T00:31:26.684840  =

    2023-01-30T00:31:26.786726  / # . /lava-388391/environment/lava-388391/=
bin/lava-test-runner /lava-388391/1
    2023-01-30T00:31:26.788114  =

    2023-01-30T00:31:26.800348  / # /lava-388391/bin/lava-test-runner /lava=
-388391/1
    2023-01-30T00:31:26.880400  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-30T00:31:26.920754  + cd /lava-388391/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d71dafde993fc031917813

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc6-19=
9-g0a49732f057b/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d71dafde993fc031917=
814
        failing since 45 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =20
