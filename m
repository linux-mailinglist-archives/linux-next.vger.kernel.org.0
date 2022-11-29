Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1EF363B917
	for <lists+linux-next@lfdr.de>; Tue, 29 Nov 2022 05:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234875AbiK2EXV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Nov 2022 23:23:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234872AbiK2EXQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Nov 2022 23:23:16 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 715D311A0C
        for <linux-next@vger.kernel.org>; Mon, 28 Nov 2022 20:23:14 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id w79so12553469pfc.2
        for <linux-next@vger.kernel.org>; Mon, 28 Nov 2022 20:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3GiDaaxx70Tusp4wpY3OIGpPYpY3e7cdT+wE6Nz7MkU=;
        b=4HbymQAcjF6LLh/xdpUN65VTL4BkkyHOsDZB95pRHHIQlKS8CctgXL1KqegrtTJ3z+
         LtssdT7SfsEopbcl+vlCu4G4iX9UHVHnNrwv/1gURd3MCLTaVtU3LimBaVRgkmopuJ88
         ugSGJ+u5QqqVVPOUa60/3clWZ3s6BsKMMNB7AyFlO/Kcp5h9ql2+JgFUn8QdjpwQinIm
         yMN6gZHKGDHjVYu2gohOM3tusRaAnKzdDX5tqlngJfKLaRDetbSvtNTfzlK7zkGavxjQ
         q8yBgg6f/jPOlSzx9nGRg3gcarHTSiD9bXHddI9/G4z0dieOHwp3EpzNsofawf3el9nQ
         j2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3GiDaaxx70Tusp4wpY3OIGpPYpY3e7cdT+wE6Nz7MkU=;
        b=aKgd0sUP8d4JXzQI01wcxOhBzBQ0DpHwZYfdT1JmDZf/H3u7+7ycF0bbNtdQznDbWu
         4hHoo2rGdm60rtg1nQJttlhd/2TndOQ8qA/GOaRb3Acq62tAmR/7MBgAXsczQpaw4S3H
         clZ7BVhsMMj94sc5BFU2FT5vK8M2U+4lD3/Y7chtX980a3uoblO/JvBjqVYaVrGYoQPu
         mnaVGAu+mGzecbjGpJBgJsxguFPvBe/V8SPDCAt1FfMqeicI7kyIYtu+GyBMH8zv4UdJ
         UzglqR8VDQQO0nj3eU9XbaBIETUhCG1jAbev5FoqBY7p8LPGwOIGYAN4mm5t9MDWoeQe
         8zKw==
X-Gm-Message-State: ANoB5pmnTZ5ZRg5jrgA9YpxU4JQhghQyOqhZtWjFRGBvhMxoFipyR5fb
        vvbJhP0IKnvO4XIP7N4GY/WgCDAX3+p+IORIrWI=
X-Google-Smtp-Source: AA0mqf4JqhY5gLS2H8dh5hL1HeJRMHKLpOtN2/Kic0CKKG0jwzEh0/Bt8iIz3wCdtCEapjLy+3JrZw==
X-Received: by 2002:a62:6083:0:b0:56d:3180:c7fc with SMTP id u125-20020a626083000000b0056d3180c7fcmr38200683pfb.41.1669695793498;
        Mon, 28 Nov 2022 20:23:13 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k7-20020a170902ce0700b001897d30143asm4795067plg.289.2022.11.28.20.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 20:23:12 -0800 (PST)
Message-ID: <63858930.170a0220.8a7ac.7a28@mx.google.com>
Date:   Mon, 28 Nov 2022 20:23:12 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.1-rc7-154-g6acc901949f1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 440 runs,
 10 regressions (v6.1-rc7-154-g6acc901949f1)
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

next/pending-fixes baseline: 440 runs, 10 regressions (v6.1-rc7-154-g6acc90=
1949f1)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+videodec           | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.1-rc7-154-g6acc901949f1/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.1-rc7-154-g6acc901949f1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6acc901949f108c99944c1f668e344be671f3e31 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63854d3f04427cdc052abd28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-15=
4-g6acc901949f1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-15=
4-g6acc901949f1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63854d3f04427cdc052ab=
d29
        failing since 50 days (last pass: v6.0-6424-g1af0c6a154d32, first f=
ail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63854ceae8f979f06e2abd19

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-15=
4-g6acc901949f1/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson=
-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-15=
4-g6acc901949f1/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson=
-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63854ceae8f979f06e2ab=
d1a
        new failure (last pass: v6.1-rc6-499-gb1bfb363b353) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63854d363b7fc3ffde2abd15

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-15=
4-g6acc901949f1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-15=
4-g6acc901949f1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63854d363b7fc3ffde2ab=
d16
        failing since 115 days (last pass: v5.19-8283-ga8bc7f656e322, first=
 fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6385467fcc3d8fa9802abd2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-15=
4-g6acc901949f1/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-15=
4-g6acc901949f1/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6385467fcc3d8fa9802ab=
d2f
        failing since 47 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63854aaab013b486972abd0a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-15=
4-g6acc901949f1/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-15=
4-g6acc901949f1/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63854aaab013b486972ab=
d0b
        new failure (last pass: v6.1-rc6-391-gf445421fe4c7) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/63854ec7fb9219fd1f2abd83

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-15=
4-g6acc901949f1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-15=
4-g6acc901949f1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/63854ec7fb9219fd1f2abda5
        failing since 273 days (last pass: v5.17-rc5-244-gd77a1b37f796, fir=
st fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-11-29T00:13:44.309410  <8>[   38.175003] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-11-29T00:13:45.343231  /lava-8164955/1/../bin/lava-test-case
    2022-11-29T00:13:45.352807  <8>[   39.219634] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/63854ec7fb9219fd1f2abdc8
        failing since 182 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-11-29T00:13:43.103240  /lava-8164955/1/../bin/lava-test-case
    2022-11-29T00:13:43.112073  <8>[   36.978387] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/63854ec7fb9219fd1f2abdc9
        failing since 182 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-11-29T00:13:42.059933  /lava-8164955/1/../bin/lava-test-case
    2022-11-29T00:13:42.072274  <8>[   35.938146] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/63854ec7fb9219fd1f2abdca
        failing since 182 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-11-29T00:13:39.970926  =

    2022-11-29T00:13:41.017428  /lava-8164955/1/../bin/lava-test-case
    2022-11-29T00:13:41.029077  <8>[   34.894776] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63854c480a870b68402abd5a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-15=
4-g6acc901949f1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-15=
4-g6acc901949f1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63854c480a870b68402ab=
d5b
        failing since 4 days (last pass: v6.1-rc6-321-gf1946233996a, first =
fail: v6.1-rc6-391-gf445421fe4c7) =

 =20
