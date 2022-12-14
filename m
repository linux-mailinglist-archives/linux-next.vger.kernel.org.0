Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D52064C2DF
	for <lists+linux-next@lfdr.de>; Wed, 14 Dec 2022 04:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236287AbiLNDni (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Dec 2022 22:43:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbiLNDnh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Dec 2022 22:43:37 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A74926AA5
        for <linux-next@vger.kernel.org>; Tue, 13 Dec 2022 19:43:36 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id s7so2048578plk.5
        for <linux-next@vger.kernel.org>; Tue, 13 Dec 2022 19:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0qVKAqcyJg//5C+4yax/hbfGqWGLjJE2LoZgJgskuio=;
        b=y8JQf0CEkpikm5OsnOisp7uT4jSlWVSEsneADVzHN1/oSpEpUxe9pNjaTqbsSbo14C
         EwduKvhdLr7ugJx+pxn9pds+iqp+djb+eeavCJaRMcU3EySBztZ8RWAgtRe1zjCFsUu7
         Uk2DK86ruJLX06+VmaTsRwt8gr32uKYPp7ltGaaePJFQt+czwnnsRh9pDbHAkl3GUw60
         bG3iLrwJamAPfPrdbuUjfMsbn11CJ7mg5HJhd5U8HzU9bABm042JGSQHZYn5/YM4F5vg
         X4XaXUDacwuLddEeA6PsZ7KXGKSit29WdG93Pa6ApZsfabrdxq1NYEM0r45FOdDEqz1W
         NRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0qVKAqcyJg//5C+4yax/hbfGqWGLjJE2LoZgJgskuio=;
        b=VzrrEiIMbTFhzd2iPquKjsWU0xLipzpA0Y607MWugMIMmItAFhjrUTQDWeF24CHBGL
         uZsVQiBcZg3kJjQZodQtIuDdUBiyyA8Mg/XErRZG3dG2HMVV2ypWOVEiVCRhDYEb3vKz
         efso/z6XZCISMhFwt5Gga7fGFV6e5HeyOJLgc5QikiJYQjGPUD8FqXIoJ++d92EFOx1i
         nVEyVYKVVX4QMZ0h7em3M1SgJwx1exHxA2qasC24V2yLwbojbfZw4GXDw9SBnEp7qCSc
         MpT+VCdUVg4B6R/sUCzp/9mAeVzAICfhdYlB2BMmxwKcruWIHlWulFZG0Ie/wUEzXNSf
         zvaQ==
X-Gm-Message-State: ANoB5plE1BXBoWlpmmP4Sv6fofGCzd0j3e9If7Tq6DCvsxpN6EnVHtWH
        JaKhCYjJgAbzRk999fioqvVXSP+7NutZeP5POcY7GQ==
X-Google-Smtp-Source: AA0mqf6KG3+orY+apLhJZrl69kapsZY5Xxm6acaCp/j41nJDSadMM4XCmU+nqO9hOr+M+LKENYjgag==
X-Received: by 2002:a05:6a20:d903:b0:9d:efbf:785e with SMTP id jd3-20020a056a20d90300b0009defbf785emr26474433pzb.19.1670989415685;
        Tue, 13 Dec 2022 19:43:35 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 1-20020a621801000000b005765013d327sm8352709pfy.182.2022.12.13.19.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 19:43:35 -0800 (PST)
Message-ID: <63994667.620a0220.2e07f.ff0d@mx.google.com>
Date:   Tue, 13 Dec 2022 19:43:35 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.1-6378-g44d433ee7540
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 376 runs,
 12 regressions (v6.1-6378-g44d433ee7540)
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

next/pending-fixes baseline: 376 runs, 12 regressions (v6.1-6378-g44d433ee7=
540)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 4          =

sun50i-a64-bananapi-m64      | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.1-6378-g44d433ee7540/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.1-6378-g44d433ee7540
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      44d433ee7540ae754756ea95f9cd7f51e285fb5f =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6399118abaeeaaf9022abd12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-6378-g=
44d433ee7540/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/b=
aseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-6378-g=
44d433ee7540/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/b=
aseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221209.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6399118abaeeaaf9022ab=
d13
        failing since 65 days (last pass: v6.0-6424-g1af0c6a154d32, first f=
ail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/639908f82c8b95b3782abd46

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-6378-g=
44d433ee7540/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-l=
cdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-6378-g=
44d433ee7540/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-l=
cdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221209.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/639908f82c8b95b=
3782abd4e
        failing since 324 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-12-13T23:21:04.334987  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dcri=
t RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-12-13T23:21:04.461737  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-12-13T23:21:04.461992  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-12-13T23:21:04.464727  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-12-13T23:21:04.511572  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6399133184e8305e382abcfe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-6378-g=
44d433ee7540/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-6378-g=
44d433ee7540/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221209.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6399133184e8305e382ab=
cff
        failing since 228 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63990a44d73de0658a2abcfd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-6378-g=
44d433ee7540/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline=
-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-6378-g=
44d433ee7540/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline=
-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221209.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63990a44d73de0658a2ab=
cfe
        failing since 130 days (last pass: v5.19-8283-ga8bc7f656e322, first=
 fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63990b581da6266cf62abcfa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-6378-g=
44d433ee7540/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-clou=
dengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-6378-g=
44d433ee7540/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-clou=
dengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221209.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63990b581da6266cf62ab=
cfb
        failing since 62 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/6399120af6b39f843e2abd15

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-6378-g=
44d433ee7540/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-6378-g=
44d433ee7540/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221209.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6399120af6b39f843e2ab=
d16
        failing since 0 day (last pass: v6.1-rc8-154-g2d38c60cb87b, first f=
ail: v6.1-2435-g5c02e5d167d0) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63990c355cb2ceb1fc2abd63

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-6378-g=
44d433ee7540/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-=
q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-6378-g=
44d433ee7540/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-=
q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221209.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63990c365cb2ceb1fc2ab=
d64
        new failure (last pass: v6.1-2435-g5c02e5d167d0) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/63990d526967ce5e9d2abcfb

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-6378-g=
44d433ee7540/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline=
-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-6378-g=
44d433ee7540/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline=
-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221209.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/63990d526967ce5e9d2abd1d
        failing since 288 days (last pass: v5.17-rc5-244-gd77a1b37f796, fir=
st fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-12-13T23:39:39.118193  /lava-8366117/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/63990d526967ce5e9d2abd40
        failing since 196 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-12-13T23:39:36.799424  /lava-8366117/1/../bin/lava-test-case
    2022-12-13T23:39:36.812024  <8>[   43.587254] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/63990d526967ce5e9d2abd41
        failing since 196 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-12-13T23:39:35.762249  /lava-8366117/1/../bin/lava-test-case
    2022-12-13T23:39:35.772636  <8>[   42.547916] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/63990d526967ce5e9d2abd42
        failing since 196 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-12-13T23:39:33.812683  <4>[   40.587086] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-12-13T23:39:34.724851  /lava-8366117/1/../bin/lava-test-case
    2022-12-13T23:39:34.737311  <8>[   41.513077] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-bananapi-m64      | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63990d650e08341ba22abd07

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-6378-g=
44d433ee7540/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/ba=
seline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-6378-g=
44d433ee7540/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/ba=
seline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221209.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63990d650e08341ba22ab=
d08
        new failure (last pass: v6.1-rc8-154-g2d38c60cb87b) =

 =20
