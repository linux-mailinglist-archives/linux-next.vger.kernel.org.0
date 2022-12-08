Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40C7D646774
	for <lists+linux-next@lfdr.de>; Thu,  8 Dec 2022 04:02:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbiLHDC5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Dec 2022 22:02:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbiLHDCh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Dec 2022 22:02:37 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02C6E9AE0F
        for <linux-next@vger.kernel.org>; Wed,  7 Dec 2022 19:01:25 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id p24so271235plw.1
        for <linux-next@vger.kernel.org>; Wed, 07 Dec 2022 19:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YHvqy0xwO4G9vpHPF/s3IB39etzCNQaD7BgMDhnj2xA=;
        b=VZEdhyZeYpdOPCowaE6DYB26u+bWG5gKQ2uFXYk0euPj/TFzW4P/Z83wq32iGtZXYn
         Ifm1ofRDePOGs0SVCqUuMt57JxgbYjzTCVFnYroTav7J3sVWOyPfTZDnE3yOUWl4Y/Pm
         3qkgq5yk88kvurQFv3Ln11BLgytDkCunERHeHyj+ajY/rtY8lHVIZA6Cau7SeM2WV2kJ
         6V8H1/75AhY0JGGpcXLMjQ58nv6OIhW4nnrAprPp4+SwZ9R28+4lp2WjtovdfKE1k5O7
         WjFQVnurhDTm9xpT8MyqG5/v5eC0NVvqS3ruOQqp61uXbSIZMQ+UjFsOOS/lIPEOts9L
         o47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHvqy0xwO4G9vpHPF/s3IB39etzCNQaD7BgMDhnj2xA=;
        b=eDwW/MBkx4xaE+VoHOVlG9Jc14D5VHpr/MfxchG0OpzK2LosIRpg1A0oUI+nKkUpkG
         3cbx1kT6HAziJOKAPK1sssdJ66x0OP7KP+puXH9eubBwMO1Evs26tY20lrrfGRXvnY56
         uFtr5i3SFg1npNnimHbGzIGWpNkn8Ptq56GI0XpoXPDaUZWbNqitofXSVQDguRfIiaTk
         arYv1yC8zyVRuHjKjDeGF9rQUdHThrUdrqz2gm3Hn3E46iZdEGrzSV7YwPQ3HjNW3xER
         hXBygYQK6mQg70w3vPchgFoWwR4fWdO2jXBiNuYV/HT240rh2hJXHiA+NwlFZx/tMeLH
         DBgA==
X-Gm-Message-State: ANoB5pknSnXphRrHxaFQZ4BSQ0jzSmU86Ylg441j95VDOlonCjdBUe/U
        2dIjdJ/xRI5FDOR7cQzwUjGsyDeD5JXqmwIcyNiRZg==
X-Google-Smtp-Source: AA0mqf6IWHbOoOLWKGyoajUav0M6NXiFKtDDKkTnBMUEwaA7QQSfxWbMv8JfzTK+j5xdLgBNBrSYUg==
X-Received: by 2002:a17:903:507:b0:189:57ec:f697 with SMTP id jn7-20020a170903050700b0018957ecf697mr1250647plb.48.1670468484027;
        Wed, 07 Dec 2022 19:01:24 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a11-20020a170902eccb00b00183c6784704sm15322551plh.291.2022.12.07.19.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 19:01:23 -0800 (PST)
Message-ID: <63915383.170a0220.2248e.d885@mx.google.com>
Date:   Wed, 07 Dec 2022 19:01:23 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.1-rc8-154-g2d38c60cb87b
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 489 runs,
 10 regressions (v6.1-rc8-154-g2d38c60cb87b)
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

next/pending-fixes baseline: 489 runs, 10 regressions (v6.1-rc8-154-g2d38c6=
0cb87b)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
da850-lcdk                   | arm   | lab-baylibre  | gcc-10   | davinci_a=
ll_defconfig      | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
+ima              | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre  | gcc-10   | oxnas_v6_=
defconfig         | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig         | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.1-rc8-154-g2d38c60cb87b/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.1-rc8-154-g2d38c60cb87b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2d38c60cb87bdea68edbd9872de6d15c1e4773bf =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
da850-lcdk                   | arm   | lab-baylibre  | gcc-10   | davinci_a=
ll_defconfig      | 1          =


  Details:     https://kernelci.org/test/plan/id/639119cc3d4e522a122abd67

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc8-15=
4-g2d38c60cb87b/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc8-15=
4-g2d38c60cb87b/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/639119cc3d4e522=
a122abd6f
        failing since 318 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-12-07T22:54:40.028061  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-12-07T22:54:40.028747  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-12-07T22:54:40.031169  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-12-07T22:54:40.077972  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
+ima              | 1          =


  Details:     https://kernelci.org/test/plan/id/639124e334059e31f82abd0d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc8-15=
4-g2d38c60cb87b/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pit=
x-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc8-15=
4-g2d38c60cb87b/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pit=
x-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/639124e334059e31f82ab=
d0e
        new failure (last pass: v6.1-rc8-128-gc530a9add07c) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/639121e1843a041cd12abd0c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc8-15=
4-g2d38c60cb87b/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc8-15=
4-g2d38c60cb87b/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/639121e1843a041cd12ab=
d0d
        failing since 124 days (last pass: v5.19-8283-ga8bc7f656e322, first=
 fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre  | gcc-10   | oxnas_v6_=
defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/63911740e01c7a53a02abcfd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc8-15=
4-g2d38c60cb87b/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc8-15=
4-g2d38c60cb87b/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63911740e01c7a53a02ab=
cfe
        failing since 56 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/639119b08f89c92ec42abd00

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc8-15=
4-g2d38c60cb87b/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc8-15=
4-g2d38c60cb87b/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/639119b18f89c92ec42ab=
d01
        failing since 0 day (last pass: v6.1-rc8-110-g01ca8a2349c6, first f=
ail: v6.1-rc8-128-gc530a9add07c) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =


  Details:     https://kernelci.org/test/plan/id/639122920e89728c2c2abcfb

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc8-15=
4-g2d38c60cb87b/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc8-15=
4-g2d38c60cb87b/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/639122920e89728c2c2abd1d
        failing since 282 days (last pass: v5.17-rc5-244-gd77a1b37f796, fir=
st fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-12-07T23:32:24.559533  =

    2022-12-07T23:32:25.591607  /lava-8278783/1/../bin/lava-test-case
    2022-12-07T23:32:25.591930     =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/639122920e89728c2c2abd40
        failing since 190 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-12-07T23:32:23.269228  /lava-8278783/1/../bin/lava-test-case
    2022-12-07T23:32:23.269654  =

    2022-12-07T23:32:23.281232  <8>[   37.007247] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/639122920e89728c2c2abd41
        failing since 190 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-12-07T23:32:21.202440  =

    2022-12-07T23:32:22.232083  /lava-8278783/1/../bin/lava-test-case
    2022-12-07T23:32:22.232423  =

    2022-12-07T23:32:22.243339  <8>[   35.968774] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/639122920e89728c2c2abd42
        failing since 190 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-12-07T23:32:20.139932  <8>[   33.865060] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dpass>
    2022-12-07T23:32:21.190045  /lava-8278783/1/../bin/lava-test-case
    2022-12-07T23:32:21.190377  =

    2022-12-07T23:32:21.201938  <8>[   34.927538] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/639120dda26075b9762abcfa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc8-15=
4-g2d38c60cb87b/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc8-15=
4-g2d38c60cb87b/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/639120dda26075b9762ab=
cfb
        failing since 1 day (last pass: v6.1-rc8-110-g01ca8a2349c6, first f=
ail: v6.1-rc8-128-gc530a9add07c) =

 =20
