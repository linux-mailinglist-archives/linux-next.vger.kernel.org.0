Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 417E1634E42
	for <lists+linux-next@lfdr.de>; Wed, 23 Nov 2022 04:18:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234134AbiKWDSy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Nov 2022 22:18:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232723AbiKWDSx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Nov 2022 22:18:53 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB4E8D4B2
        for <linux-next@vger.kernel.org>; Tue, 22 Nov 2022 19:18:52 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id f9so11489750pgf.7
        for <linux-next@vger.kernel.org>; Tue, 22 Nov 2022 19:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JaNL4oP2vbupj2Strsaxd2j8zeWM2u0Ib3XsIf9sG58=;
        b=ed3O0XAoK+PS1VGqt72rradvjX9quYE+NjpoGeakuGSRxWtmDFz4du71/xi4bZsyHW
         d33YtaaQtjw3BTPzD45Q0QX4c/c/pO8136jpkJ4cYj67lEVi62yEof4qtGJodiUDmb0C
         JwUqDEOSjGMCGppB7k50a47vKhe3kSL3EB68AG8XBBI2GEZfYBq27PLp14zBX8kcHlWs
         3i4nWof6LPFbh45C2CfW1DaxMgFiqPLElAaz91+CS9LWmXa8TynhQvmy6pRBPZ8b3VfK
         YIhx5cAIPyQCD2fejPDSwLdMnnjlrW6VHNO5apNwg2be3JBlH7PlSkraCY6ldxbwt+3/
         oU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JaNL4oP2vbupj2Strsaxd2j8zeWM2u0Ib3XsIf9sG58=;
        b=MJfYxT0/XgDI7lS5CP0DDDx//b0bAFHlR5WEDldRVCZqY/ZnzPj349V2T5GIwrrKft
         dG0rHayp15YtP08EOzJAxKbsmVvxJo9Rno/OQEcxbXgc+NibG6AKgLMhGoicIw5chRAt
         PT/tYKYyZQ/TD79BW3q/JAc6zLkc1GmwTOK7BgRCG+YTkYiTf4/MT8v6lB/wuFZYz2mA
         ryH4Ld3luZIGFE+8IUtokwDG2f79geoufF+z9K2FJQX1PJaiHZjIIyuaQevrj8UgMZMI
         NhZa4SmNzqIvFHu3jBxMyyacx0xWoJyVgOdLVZ2HDhRilvStGsHD3Y4hSh1J5uryQZqn
         Bdyw==
X-Gm-Message-State: ANoB5pnPBdt6gpn+FTEHRqqAq7XQ4K22NRscgIjqj+aBX0mL+sFnBSn2
        C6BARlyA8FD1CCXhPnqNJVpvM1BR364B0973ax0=
X-Google-Smtp-Source: AA0mqf73jlsYmkvLRQYmB0PUh+IL87dLRc6SQr6w0zAN2ahVrEham7RCO9xsdjCC2HyBGshWqvX4sw==
X-Received: by 2002:aa7:96d2:0:b0:574:2447:947d with SMTP id h18-20020aa796d2000000b005742447947dmr4293611pfq.32.1669173531275;
        Tue, 22 Nov 2022 19:18:51 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 16-20020a17090a0d5000b00218d894fac3sm308693pju.3.2022.11.22.19.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 19:18:50 -0800 (PST)
Message-ID: <637d911a.170a0220.a1274.09b8@mx.google.com>
Date:   Tue, 22 Nov 2022 19:18:50 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.1-rc6-254-g5adecc331ab9
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 419 runs,
 13 regressions (v6.1-rc6-254-g5adecc331ab9)
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

next/pending-fixes baseline: 419 runs, 13 regressions (v6.1-rc6-254-g5adecc=
331ab9)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 1          =

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

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.1-rc6-254-g5adecc331ab9/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.1-rc6-254-g5adecc331ab9
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5adecc331ab9aa85056cf674c41d8ce7ddce5cc6 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/637d59dc423c10a03a2abd65

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-25=
4-g5adecc331ab9/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-25=
4-g5adecc331ab9/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/637d59dc423c10a03a2ab=
d66
        failing since 44 days (last pass: v6.0-6424-g1af0c6a154d32, first f=
ail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/637d587d68237a3ab52abd21

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-25=
4-g5adecc331ab9/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-25=
4-g5adecc331ab9/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/637d587d68237a3=
ab52abd29
        failing since 303 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-11-22T23:17:08.063100  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-11-22T23:17:08.064025  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-11-22T23:17:08.066738  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-11-22T23:17:08.113572  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/637d593bac40ac7eaa2abd28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-25=
4-g5adecc331ab9/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-25=
4-g5adecc331ab9/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/637d593bac40ac7eaa2ab=
d29
        failing since 110 days (last pass: v5.19-1483-gffa33bbcf63ea, first=
 fail: v5.19-3879-ge7dffa5317766) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/637d5a2c8d68ab636d2abd50

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-25=
4-g5adecc331ab9/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pit=
x-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-25=
4-g5adecc331ab9/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pit=
x-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/637=
d5a2c8d68ab636d2abd63
        new failure (last pass: v6.1-rc6-197-ge7525a67d6a7)

    2022-11-22T23:24:09.768049  /lava-213073/1/../bin/lava-test-case
    2022-11-22T23:24:09.768345  <8>[   16.917432] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-11-22T23:24:09.768501  /lava-213073/1/../bin/lava-test-case
    2022-11-22T23:24:09.768645  <8>[   16.938452] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>
    2022-11-22T23:24:09.768788  /lava-213073/1/../bin/lava-test-case
    2022-11-22T23:24:09.768925  <8>[   16.960657] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy0-probed RESULT=3Dpass>
    2022-11-22T23:24:09.769063  /lava-213073/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/637d57c66744afd08a2abd03

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-25=
4-g5adecc331ab9/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-25=
4-g5adecc331ab9/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/637d57c66744afd08a2ab=
d04
        failing since 109 days (last pass: v5.19-8283-ga8bc7f656e322, first=
 fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/637d5926ac40ac7eaa2abd0c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-25=
4-g5adecc331ab9/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-25=
4-g5adecc331ab9/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/637d5926ac40ac7eaa2ab=
d0d
        failing since 41 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/637d59a8c1fa833de62abd02

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-25=
4-g5adecc331ab9/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-25=
4-g5adecc331ab9/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/637d59a8c1fa833de62ab=
d03
        new failure (last pass: v6.1-rc6-197-ge7525a67d6a7) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/637d591774b54d1afe2abd2e

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-25=
4-g5adecc331ab9/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-25=
4-g5adecc331ab9/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/637d591874b54d1afe2abd50
        failing since 267 days (last pass: v5.17-rc5-244-gd77a1b37f796, fir=
st fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-11-22T23:19:26.891392  =

    2022-11-22T23:19:27.949416  /lava-8087551/1/../bin/lava-test-case
    2022-11-22T23:19:27.968123  <8>[   49.382679] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/637d591874b54d1afe2abd73
        failing since 175 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-11-22T23:19:24.897485  /lava-8087551/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/637d591874b54d1afe2abd74
        failing since 175 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-11-22T23:19:22.801594  <8>[   44.215200] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>
    2022-11-22T23:19:23.847594  /lava-8087551/1/../bin/lava-test-case
    2022-11-22T23:19:23.861065  <8>[   45.274913] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/637d591874b54d1afe2abd75
        failing since 175 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-11-22T23:19:22.785389  /lava-8087551/1/../bin/lava-test-case
    2022-11-22T23:19:22.786403     =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/637d56bae00088dc092abcfb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-25=
4-g5adecc331ab9/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-25=
4-g5adecc331ab9/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/637d56bae00088dc092ab=
cfc
        failing since 7 days (last pass: v6.1-rc5-247-g22dce2b89d604, first=
 fail: v6.1-rc5-291-gb36f34e79a29) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/637d59877b4eb1557f2abcfa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-25=
4-g5adecc331ab9/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc6-25=
4-g5adecc331ab9/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/637d59877b4eb1557f2ab=
cfb
        new failure (last pass: v6.1-rc6-197-ge7525a67d6a7) =

 =20
