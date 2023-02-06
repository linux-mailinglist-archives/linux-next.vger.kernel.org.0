Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA2068B451
	for <lists+linux-next@lfdr.de>; Mon,  6 Feb 2023 04:06:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbjBFDGh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Feb 2023 22:06:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjBFDGh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 5 Feb 2023 22:06:37 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D49ADC15F
        for <linux-next@vger.kernel.org>; Sun,  5 Feb 2023 19:06:32 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id n3so1783119pgr.9
        for <linux-next@vger.kernel.org>; Sun, 05 Feb 2023 19:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bq20GZHDe3WR1U0F6G67Nt0pERyCdPTrikAhlUED2Ew=;
        b=ggri6bCpE5a0uUGJ4G6sk4oEH5a/GyroEpKqD7eplwc/AkZXTkAtK3+qQM7cKRcxxe
         SQGjtW3mXo2ZwBQR/DsDzHv4nDgzhllOvUlQGhOUdZLaKt1njj6RSQcASjK/SS96Gr4M
         8twauaY8Va5Yk2Tt3Xe0XhVNvjm1IIlgL8Vn3+xpVfan/vpkWK9C/umYTR+0nfgCKIpC
         7hU7epwfDRz50HrRYq/qiYlsLW4QKPlzLP2SiWKwusUokScwdPkP3aUpjzEuLQmbubEz
         s0e2tv5KwTKPuaF2qKzEV/kC2TvkJfuTF5moAEVIoVI43aytFlr0CPO9wVUV3vJwAdOh
         0Nkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bq20GZHDe3WR1U0F6G67Nt0pERyCdPTrikAhlUED2Ew=;
        b=kk6YGU0PkmgY8iSDon1vuvD2FPwBbl+oyrCRjWBkUuOxwsZgmfPTjPHvTKfltsKke3
         zjHR2GoW73NT3UvgSF3wSe5/cnKGnLVGFQITHdlaviMak6UW53qDaSH3kF4bT0sgBfjF
         o/kuUgdbhEe5cpq6FuOgn7PP3b+/gBzNz54i7VjCzZJedUvgxHTOvCc9e9LGYUbg5jta
         NEF5ez545G7Aq+jfnw2CDtz6yTiE3wFj9r3r0bZ8e/cfTqYklmGxazw7GkIDNfQ0AoJy
         jIbunc/SyqsN5ipWnOjITx26Oq1GJ8zh+TvjiIWnMxeaaLJeloiIjzUMXJ5gsVnT5197
         DQ0g==
X-Gm-Message-State: AO0yUKXweFVJdHCNAC4RxDTHlTJ06HlQo6oMJTbhbCbvZ5R1xhXSdECu
        vxjbhtRyw1zHx21vZOJM5yttQ0za1FFhTFbVoTnNdQ==
X-Google-Smtp-Source: AK7set8eIcjWZV8yTgcj1snDzYf9QgJg9JCWMT0NEEr+i3N3TeYSkkbm29Q3nGLNMkLHJcRi9sZ7XQ==
X-Received: by 2002:aa7:8b49:0:b0:592:7341:781f with SMTP id i9-20020aa78b49000000b005927341781fmr17939743pfd.31.1675652791248;
        Sun, 05 Feb 2023 19:06:31 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v2-20020a622f02000000b0059261bd5bacsm5737755pfv.202.2023.02.05.19.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 19:06:30 -0800 (PST)
Message-ID: <63e06eb6.620a0220.eb61f.8f2a@mx.google.com>
Date:   Sun, 05 Feb 2023 19:06:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.2-rc7-120-g11b3628314a5
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 716 runs,
 41 regressions (v6.2-rc7-120-g11b3628314a5)
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

next/pending-fixes baseline: 716 runs, 41 regressions (v6.2-rc7-120-g11b362=
8314a5)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

bcm2835-rpi-b-rev2           | arm   | lab-broonie     | gcc-10   | bcm2835=
_defconfig            | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =

beagle-xm                    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm   | lab-baylibre    | gcc-10   | omap2pl=
us_defconfig          | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+debug              | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 2          =

meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxm-q200               | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

mt8173-elm-hana              | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.2-rc7-120-g11b3628314a5/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.2-rc7-120-g11b3628314a5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      11b3628314a5aa3fecf029bcacfaac21fea369e4 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63e03923c51cf34115915ee9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e03923c51cf34115915=
eea
        failing since 119 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e03a1ea0a73d8180915ebd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e03a1ea0a73d8180915=
ebe
        new failure (last pass: v6.2-rc6-289-g1b7183933813) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2835-rpi-b-rev2           | arm   | lab-broonie     | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63e03556dcc877afe5915ede

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e03556dcc877afe5915ee3
        failing since 2 days (last pass: v6.2-rc6-312-g66bb7649606e3, first=
 fail: v6.2-rc6-351-gf42837eac380f)

    2023-02-05T23:01:20.106575  + set +x
    2023-02-05T23:01:20.110472  <8>[   16.737020] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 256342_1.5.2.4.1>
    2023-02-05T23:01:20.222905  / # #
    2023-02-05T23:01:20.325454  export SHELL=3D/bin/sh
    2023-02-05T23:01:20.326143  #
    2023-02-05T23:01:20.427746  / # export SHELL=3D/bin/sh. /lava-256342/en=
vironment
    2023-02-05T23:01:20.428648  =

    2023-02-05T23:01:20.530516  / # . /lava-256342/environment/lava-256342/=
bin/lava-test-runner /lava-256342/1
    2023-02-05T23:01:20.531419  =

    2023-02-05T23:01:20.537179  / # /lava-256342/bin/lava-test-runner /lava=
-256342/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63e03642f9193f117e915f05

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e03642f9193f117e915f0a
        failing since 25 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-02-05T23:05:20.920488  / # #
    2023-02-05T23:05:21.022437  export SHELL=3D/bin/sh
    2023-02-05T23:05:21.023113  #
    2023-02-05T23:05:21.124452  / # export SHELL=3D/bin/sh. /lava-9026305/e=
nvironment
    2023-02-05T23:05:21.125141  =

    2023-02-05T23:05:21.226521  / # . /lava-9026305/environment/lava-902630=
5/bin/lava-test-runner /lava-9026305/1
    2023-02-05T23:05:21.227425  =

    2023-02-05T23:05:21.229993  / # /lava-9026305/bin/lava-test-runner /lav=
a-9026305/1
    2023-02-05T23:05:21.354054  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-05T23:05:21.354394  + cd /lava-9026305/1/tests/1_bootrr =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e03824643ba8f92f915ec5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e03824643ba8f92f915=
ec6
        failing since 15 days (last pass: v6.2-rc4-412-g665ddd640630, first=
 fail: v6.2-rc4-480-gb1867226dfbb) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-10   | omap2pl=
us_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e038e1194c044426915eba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e038e1194c044426915=
ebb
        new failure (last pass: v6.2-rc6-312-g66bb7649606e3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63e0391cc51cf34115915ec4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e0391cc51cf34115915ec9
        failing since 19 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-02-05T23:17:38.475017  + set +x<8>[   15.600446] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3292513_1.5.2.4.1>
    2023-02-05T23:17:38.475329  =

    2023-02-05T23:17:38.581848  / # #
    2023-02-05T23:17:38.684273  export SHELL=3D/bin/sh
    2023-02-05T23:17:38.685167  #
    2023-02-05T23:17:38.787076  / # export SHELL=3D/bin/sh. /lava-3292513/e=
nvironment
    2023-02-05T23:17:38.787823  =

    2023-02-05T23:17:38.889828  / # . /lava-3292513/environment/lava-329251=
3/bin/lava-test-runner /lava-3292513/1
    2023-02-05T23:17:38.891518  =

    2023-02-05T23:17:38.896353  / # /lava-3292513/bin/lava-test-runner /lav=
a-3292513/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e039aaa94b8169d6915eb9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e039aaa94b8169d6915ebe
        failing since 19 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-02-05T23:19:59.562267  <8>[   14.353582] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3292532_1.5.2.4.1>
    2023-02-05T23:19:59.672199  / # #
    2023-02-05T23:19:59.775598  export SHELL=3D/bin/sh
    2023-02-05T23:19:59.776811  #
    2023-02-05T23:19:59.878910  / # export SHELL=3D/bin/sh. /lava-3292532/e=
nvironment
    2023-02-05T23:19:59.879935  =

    2023-02-05T23:19:59.982073  / # . /lava-3292532/environment/lava-329253=
2/bin/lava-test-runner /lava-3292532/1
    2023-02-05T23:19:59.983661  =

    2023-02-05T23:19:59.984109  / # <3>[   14.730332] Bluetooth: hci0: comm=
and 0xfc18 tx timeout
    2023-02-05T23:19:59.988290  /lava-3292532/bin/lava-test-runner /lava-32=
92532/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e03a40e28fcaf530915eff

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e03a40e28fcaf530915f04
        failing since 19 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-02-05T23:22:29.094528  + set +x<8>[   23.410818] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3292643_1.5.2.4.1>
    2023-02-05T23:22:29.095156  =

    2023-02-05T23:22:29.204057  / # #
    2023-02-05T23:22:29.306971  export SHELL=3D/bin/sh
    2023-02-05T23:22:29.308081  #
    2023-02-05T23:22:29.410375  / # export SHELL=3D/bin/sh. /lava-3292643/e=
nvironment
    2023-02-05T23:22:29.411506  =

    2023-02-05T23:22:29.513734  / # . /lava-3292643/environment/lava-329264=
3/bin/lava-test-runner /lava-3292643/1
    2023-02-05T23:22:29.515321  =

    2023-02-05T23:22:29.520253  / # /lava-3292643/bin/lava-test-runner /lav=
a-3292643/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63e03c4d4d6c9315a0915f91

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e03c4d4d6c9315a0915f96
        failing since 19 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-02-05T23:31:15.932080  <8>[   16.636473] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3292767_1.5.2.4.1>
    2023-02-05T23:31:16.040738  / # #
    2023-02-05T23:31:16.142337  export SHELL=3D/bin/sh
    2023-02-05T23:31:16.143159  #
    2023-02-05T23:31:16.244928  / # export SHELL=3D/bin/sh. /lava-3292767/e=
nvironment
    2023-02-05T23:31:16.245801  =

    2023-02-05T23:31:16.347740  / # . /lava-3292767/environment/lava-329276=
7/bin/lava-test-runner /lava-3292767/1
    2023-02-05T23:31:16.349019  =

    2023-02-05T23:31:16.353927  / # /lava-3292767/bin/lava-test-runner /lav=
a-3292767/1
    2023-02-05T23:31:16.447185  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e03eba7ff23fe642915eee

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e03eba7ff23fe642915ef3
        failing since 19 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-02-05T23:41:36.725562  <8>[   15.521871] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3292799_1.5.2.4.1>
    2023-02-05T23:41:36.834013  / # #
    2023-02-05T23:41:36.935676  export SHELL=3D/bin/sh
    2023-02-05T23:41:36.936120  #
    2023-02-05T23:41:37.037364  / # export SHELL=3D/bin/sh. /lava-3292799/e=
nvironment
    2023-02-05T23:41:37.037812  =

    2023-02-05T23:41:37.139137  / # . /lava-3292799/environment/lava-329279=
9/bin/lava-test-runner /lava-3292799/1
    2023-02-05T23:41:37.139808  =

    2023-02-05T23:41:37.144655  / # /lava-3292799/bin/lava-test-runner /lav=
a-3292799/1
    2023-02-05T23:41:37.232471  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e03c5f4d6c9315a091642b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e03c5f4d6c9315a0916=
42c
        failing since 41 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc1-87-g81c29d2c4600) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63e0377d8a3c2e9d21915ec6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e0377d8a3c2e9d21915ecb
        failing since 6 days (last pass: v6.1-rc8-128-gc530a9add07c, first =
fail: v6.2-rc6-199-g0a49732f057b)

    2023-02-05T23:10:32.135525  + set +x
    2023-02-05T23:10:32.135703  [   12.873299] <LAVA_SIGNAL_ENDRUN 0_dmesg =
898858_1.5.2.3.1>
    2023-02-05T23:10:32.243840  / # #
    2023-02-05T23:10:32.345667  export SHELL=3D/bin/sh
    2023-02-05T23:10:32.346177  #
    2023-02-05T23:10:32.447447  / # export SHELL=3D/bin/sh. /lava-898858/en=
vironment
    2023-02-05T23:10:32.447914  =

    2023-02-05T23:10:32.549190  / # . /lava-898858/environment/lava-898858/=
bin/lava-test-runner /lava-898858/1
    2023-02-05T23:10:32.549877  =

    2023-02-05T23:10:32.552820  / # /lava-898858/bin/lava-test-runner /lava=
-898858/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e037cd23a13726d8915ee3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e037cd23a13726d8915ee8
        failing since 6 days (last pass: v6.1-rc8-128-gc530a9add07c, first =
fail: v6.2-rc6-199-g0a49732f057b)

    2023-02-05T23:11:50.022551  + set +x
    2023-02-05T23:11:50.022788  [   12.643562] <LAVA_SIGNAL_ENDRUN 0_dmesg =
898863_1.5.2.3.1>
    2023-02-05T23:11:50.130440  / # #
    2023-02-05T23:11:50.231874  export SHELL=3D/bin/sh
    2023-02-05T23:11:50.232244  #
    2023-02-05T23:11:50.333547  / # export SHELL=3D/bin/sh. /lava-898863/en=
vironment
    2023-02-05T23:11:50.334003  =

    2023-02-05T23:11:50.435308  / # . /lava-898863/environment/lava-898863/=
bin/lava-test-runner /lava-898863/1
    2023-02-05T23:11:50.435813  =

    2023-02-05T23:11:50.438949  / # /lava-898863/bin/lava-test-runner /lava=
-898863/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e0381d9b0a1dce3a915ee2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e0381d9b0a1dce3a915ee7
        failing since 6 days (last pass: v6.1-rc8-128-gc530a9add07c, first =
fail: v6.2-rc6-199-g0a49732f057b)

    2023-02-05T23:13:14.217495  + set +x
    2023-02-05T23:13:14.217655  [   16.073983] <LAVA_SIGNAL_ENDRUN 0_dmesg =
898867_1.5.2.3.1>
    2023-02-05T23:13:14.325375  / # #
    2023-02-05T23:13:14.426817  export SHELL=3D/bin/sh
    2023-02-05T23:13:14.427293  #
    2023-02-05T23:13:14.528435  / # export SHELL=3D/bin/sh. /lava-898867/en=
vironment
    2023-02-05T23:13:14.529072  =

    2023-02-05T23:13:14.630340  / # . /lava-898867/environment/lava-898867/=
bin/lava-test-runner /lava-898867/1
    2023-02-05T23:13:14.630964  =

    2023-02-05T23:13:14.634612  / # /lava-898867/bin/lava-test-runner /lava=
-898867/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63e039c01a11b73be6915f7d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e039c01a11b73be6915f82
        failing since 6 days (last pass: v6.1-rc8-128-gc530a9add07c, first =
fail: v6.2-rc6-199-g0a49732f057b)

    2023-02-05T23:20:11.198464  + set +x
    2023-02-05T23:20:11.198723  [   11.983240] <LAVA_SIGNAL_ENDRUN 0_dmesg =
898874_1.5.2.3.1>
    2023-02-05T23:20:11.305930  / # #
    2023-02-05T23:20:11.407403  export SHELL=3D/bin/sh
    2023-02-05T23:20:11.407812  #
    2023-02-05T23:20:11.509114  / # export SHELL=3D/bin/sh. /lava-898874/en=
vironment
    2023-02-05T23:20:11.509580  =

    2023-02-05T23:20:11.610828  / # . /lava-898874/environment/lava-898874/=
bin/lava-test-runner /lava-898874/1
    2023-02-05T23:20:11.613139  =

    2023-02-05T23:20:11.615946  / # /lava-898874/bin/lava-test-runner /lava=
-898874/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e03b79db4df678c0915fc2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e03b79db4df678c0915fc7
        failing since 6 days (last pass: v6.1-rc8-128-gc530a9add07c, first =
fail: v6.2-rc6-199-g0a49732f057b)

    2023-02-05T23:27:33.945150  + set +x
    2023-02-05T23:27:33.945417  [   12.877345] <LAVA_SIGNAL_ENDRUN 0_dmesg =
898885_1.5.2.3.1>
    2023-02-05T23:27:34.053185  / # #
    2023-02-05T23:27:34.154772  export SHELL=3D/bin/sh
    2023-02-05T23:27:34.155216  #
    2023-02-05T23:27:34.256471  / # export SHELL=3D/bin/sh. /lava-898885/en=
vironment
    2023-02-05T23:27:34.256865  =

    2023-02-05T23:27:34.358047  / # . /lava-898885/environment/lava-898885/=
bin/lava-test-runner /lava-898885/1
    2023-02-05T23:27:34.358827  =

    2023-02-05T23:27:34.361917  / # /lava-898885/bin/lava-test-runner /lava=
-898885/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63e03b14d25f60ed60915ed4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e03b14d25f60ed60915=
ed5
        failing since 90 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.1-rc3-573-g82d05e3975f5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e037ab3c66412e40915f5a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e037ab3c66412e40915=
f5b
        failing since 151 days (last pass: v5.19-rc5-383-g73ad9bd963c1, fir=
st fail: v6.0-rc4-291-g83a56f559828) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e03887b257156b0d915f11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e03887b257156b0d915=
f12
        failing since 152 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63e03b29d25f60ed60915f29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e03b29d25f60ed60915=
f2a
        failing since 143 days (last pass: v6.0-rc4-291-g83a56f559828, firs=
t fail: v6.0-rc5-197-ga6a750a2f4166) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e0395106a3e98a0a915ed2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e0395106a3e98a0a915=
ed3
        failing since 282 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/63e0396656a3d032cf915edf

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-im=
x8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-im=
x8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e0396656a3d032cf915ee2
        new failure (last pass: v6.2-rc6-312-g66bb7649606e3)

    2023-02-05T23:18:37.398951  / # #
    2023-02-05T23:18:37.500986  export SHELL=3D/bin/sh
    2023-02-05T23:18:37.501511  #
    2023-02-05T23:18:37.602849  / # export SHELL=3D/bin/sh. /lava-266180/en=
vironment
    2023-02-05T23:18:37.603326  =

    2023-02-05T23:18:37.704697  / # . /lava-266180/environment/lava-266180/=
bin/lava-test-runner /lava-266180/1
    2023-02-05T23:18:37.705403  =

    2023-02-05T23:18:37.709338  / # /lava-266180/bin/lava-test-runner /lava=
-266180/1
    2023-02-05T23:18:37.775325  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-05T23:18:37.775601  + cd /lava-266180/1/tests/1_bootrr =

    ... (9 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/63e=
0396656a3d032cf915ef2
        new failure (last pass: v6.2-rc6-312-g66bb7649606e3)

    2023-02-05T23:18:41.839274  /lava-266180/1/../bin/lava-test-case
    2023-02-05T23:18:41.839685  <8>[   19.936375] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-02-05T23:18:41.839924  /lava-266180/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e03c2b504fb55d06915f97

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e03c2b504fb55d06915=
f98
        new failure (last pass: v6.2-rc6-351-gf42837eac380f) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxm-q200               | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e05f4dd16157a01e915eb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e05f4dd16157a01e915=
eba
        failing since 7 days (last pass: v6.2-rc5-286-g436294605dc5, first =
fail: v6.2-rc6-199-g0a49732f057b) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e038822a2c14caa4915ed0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e038822a2c14caa4915=
ed1
        failing since 12 days (last pass: v6.2-rc5-157-g1f16e03afb18, first=
 fail: v6.2-rc5-174-gc5f142de047d) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e0367f70fdd80e7a915edf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e0367f70fdd80e7a915=
ee0
        failing since 116 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63e03b9db10f92319b915eba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e03b9db10f92319b915=
ebb
        failing since 116 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63e03b5042c56ad799915ed5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e03b5042c56ad799915=
ed6
        failing since 116 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63e03ba1b10f92319b915ecc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e03ba1b10f92319b915=
ecd
        failing since 116 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63e03b5242c56ad799915edb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e03b5242c56ad799915=
edc
        failing since 116 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63e03b88ffade37868915f0e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e03b88ffade37868915=
f0f
        failing since 116 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63e03b4e42c56ad799915ed2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e03b4e42c56ad799915=
ed3
        failing since 116 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63e03b0962a2be4f7f915f2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e03b0962a2be4f7f915=
f30
        failing since 116 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63e03b9fb30d5582bd915ee5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e03b9fb30d5582bd915=
ee6
        failing since 116 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63e03b51ee567c49dd915eba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e03b51ee567c49dd915=
ebb
        failing since 116 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e03af20c008e302b915ebe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e03af20c008e302b915=
ebf
        failing since 52 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e0398aea6cfd83c8915ec4

  Results:     65 PASS, 6 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baseline=
-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baseline=
-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
63e0398aea6cfd83c8915f01
        new failure (last pass: v6.2-rc6-312-g66bb7649606e3)

    2023-02-05T23:19:22.893766  =

    2023-02-05T23:19:23.242122  <6>[   49.253713] sbs-battery 20-000b: Disa=
bling PEC because of broken Cros-EC implementation
    2023-02-05T23:19:23.289959  <4>[   49.304662] sbs-battery 20-000b: Unkn=
own chemistry: POLY
    2023-02-05T23:19:23.290457  =

    2023-02-05T23:19:23.296164  <4>[   49.309211] sbs-battery 20-000b: Unkn=
own chemistry: POLY
    2023-02-05T23:19:23.795371  <4>[   49.810078] sbs-battery 20-000b: Unkn=
own chemistry: POLY
    2023-02-05T23:19:23.812542  <6>[   49.824118] sbs-battery 20-000b: Disa=
bling PEC because of broken Cros-EC implementation
    2023-02-05T23:19:23.910788  /lava-9026531/1/../bin/lava-test-case
    2023-02-05T23:19:23.924112  <8>[   49.936608] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-keyb-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e039ef4be8df9c8e915f0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e039ef4be8df9c8e915=
f0c
        failing since 52 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e03bc874766e3adf915ebd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-12=
0-g11b3628314a5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e03bc874766e3adf915=
ebe
        failing since 108 days (last pass: v6.0-10339-g565da9e84d8f, first =
fail: v6.1-rc1-192-gdfe701541ba9) =

 =20
