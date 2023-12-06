Return-Path: <linux-next+bounces-254-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1D0807236
	for <lists+linux-next@lfdr.de>; Wed,  6 Dec 2023 15:22:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14F821C20A20
	for <lists+linux-next@lfdr.de>; Wed,  6 Dec 2023 14:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 780FB3D3A0;
	Wed,  6 Dec 2023 14:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="EypiANiv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29FBB1BD
	for <linux-next@vger.kernel.org>; Wed,  6 Dec 2023 06:21:59 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6cc02e77a9cso6606074b3a.0
        for <linux-next@vger.kernel.org>; Wed, 06 Dec 2023 06:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701872518; x=1702477318; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S36+Q6UKta/UqCQ+zvBL1Vi6/Tx6VtQy7z8Qjynx0Lk=;
        b=EypiANivOoSS5bmbtSzLvT1BAM4jaez2kSp6VBhyye9n3QVBWzXywEADbAAZfslAjC
         44wU/8PXL/3YzERu1RXWYdaIy3Lg1NFlK/8d5BegOfu+v+F5jti4EziaKfQfQDv6wvkm
         nqbq0c/AMZkDkdlnmW+NTLPRFfiKkFgbj7VV71hH1j0F1FS7kA1uPwhC3sibNpOmN6TD
         jWlPuIoF3aU6UzwDxpxm38SS0inWGL4R65U+pMz9rAsSQ9/o4MVHLamzB6Z7oD9lXvoj
         7AnUDCVl2+IeRrip9eZ1l3Lyr9Z6tXXrOA/boumkUPDW3ZJoKxHlG2KESs59TOi21OAP
         aNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701872518; x=1702477318;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S36+Q6UKta/UqCQ+zvBL1Vi6/Tx6VtQy7z8Qjynx0Lk=;
        b=vxxigiNUYaf1bwlQn+/d+3z/bn7VNMzVpMivZ0udJ0U+1zQcXvIg2m53REkbrKLoFg
         kmbjXD2r+KUUkYY1c9FJgm0xQ6Cw1LmZ7oGMTzHnVw2Qbt/UCWzOdKtgEenM5cqqP/5K
         QcPxd/QieODeYR3P9akkXt/TCrM9Ul/2DvG5IjRGX6dsG77x11PQsA6RSlszT49VmpEc
         tBkOBELkoQB4xSf79WjjFSIoE/LbYuyGAJlL4QVbT6NuyEpDwg/D8LAvfsNHr09BeHG2
         fMYR6MN2zuah56t7m/8Ao46QYzDbfEm2a70YdmPgYFz3xR7Zj7XBesB3cI4PkwLixYbM
         2rxg==
X-Gm-Message-State: AOJu0YzBptI+m00JPXh0GEJS9wY6JDL5N1UMcHQgL61aLy5Uezrvnl7B
	R+DWR2Xw7ukUKxNRV/e2ZT6WMkWI+/QsI0w/EOaxSQ==
X-Google-Smtp-Source: AGHT+IGF1lhncHWs0EshC39/2PJDENZi26Ql/Lzkt8udIl1v2P9jfJ497xdNdQIowXe2XNepyqua1w==
X-Received: by 2002:a05:6a00:429a:b0:6ce:6901:5611 with SMTP id bx26-20020a056a00429a00b006ce69015611mr1224232pfb.57.1701872516731;
        Wed, 06 Dec 2023 06:21:56 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x26-20020a056a000bda00b006cb95c0fff4sm30843pfu.71.2023.12.06.06.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 06:21:56 -0800 (PST)
Message-ID: <65708384.050a0220.9bf10.02c8@mx.google.com>
Date: Wed, 06 Dec 2023 06:21:56 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20231206
Subject: next/master baseline: 416 runs, 66 regressions (next-20231206)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 416 runs, 66 regressions (next-20231206)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre    | gcc-10   | sama5_defco=
nfig              | 1          =

at91sam9g20ek            | arm   | lab-broonie     | gcc-10   | at91_dt_def=
config            | 1          =

at91sam9g20ek            | arm   | lab-broonie     | gcc-10   | multi_v5_de=
fconfig           | 1          =

bcm2711-rpi-4-b          | arm64 | lab-collabora   | clang-17 | defconfig  =
                  | 2          =

bcm2711-rpi-4-b          | arm64 | lab-collabora   | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 2          =

bcm2711-rpi-4-b          | arm64 | lab-collabora   | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 2          =

bcm2711-rpi-4-b          | arm64 | lab-collabora   | gcc-10   | defconfig+v=
ideodec           | 2          =

bcm2836-rpi-2-b          | arm   | lab-collabora   | gcc-10   | bcm2835_def=
config            | 1          =

bcm2836-rpi-2-b          | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

beagle-xm                | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

beagle-xm                | arm   | lab-baylibre    | gcc-10   | omap2plus_d=
efconfig          | 1          =

imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =

imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig           | 2          =

imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 2          =

imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 2          =

imx6dl-udoo              | arm   | lab-broonie     | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =

imx6dl-udoo              | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fconfig           | 2          =

imx6dl-udoo              | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 2          =

imx6dl-udoo              | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 2          =

imx6q-udoo               | arm   | lab-broonie     | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =

imx6q-udoo               | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fconfig           | 2          =

imx6q-udoo               | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 2          =

imx6q-udoo               | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 2          =

imx6qp-wandboard-revd1   | arm   | lab-pengutronix | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =

imx6qp-wandboard-revd1   | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig           | 2          =

imx6qp-wandboard-revd1   | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 2          =

imx6qp-wandboard-revd1   | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 2          =

jetson-tk1               | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

k3-am625-sk              | arm64 | lab-baylibre    | clang-17 | defconfig  =
                  | 2          =

k3-am625-sk              | arm64 | lab-baylibre    | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 2          =

k3-am625-sk              | arm64 | lab-baylibre    | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 2          =

k3-am625-sk              | arm64 | lab-baylibre    | gcc-10   | defconfig+v=
ideodec           | 1          =

k3-j721e-beagleboneai64  | arm64 | lab-baylibre    | gcc-10   | defconfig+v=
ideodec           | 1          =

k3-j721e-sk              | arm64 | lab-baylibre    | gcc-10   | defconfig+v=
ideodec           | 2          =

meson-gxl-s905d-p230     | arm64 | lab-baylibre    | gcc-10   | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =

r8a7743-iwg20d-q7        | arm   | lab-cip         | gcc-10   | shmobile_de=
fconfig           | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip         | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip         | gcc-10   | defconfig+v=
ideodec           | 1          =

rk3288-rock2-square      | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq        | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig           | 1          =

sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fconfig           | 1          =

sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231206/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231206
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      577a4ee0b96fb043c9cf4a533c550ff587e526cf =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre    | gcc-10   | sama5_defco=
nfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6570432b8961ed4e6ee134cc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6570432b8961ed4e6ee13=
4cd
        failing since 308 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
at91sam9g20ek            | arm   | lab-broonie     | gcc-10   | at91_dt_def=
config            | 1          =


  Details:     https://kernelci.org/test/plan/id/657041c532bfe6b300e13560

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/657041c532bfe6b300e13577
        failing since 184 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-12-06T09:41:16.948954  /lava-313889/1/../bin/lava-test-case
    2023-12-06T09:41:16.991281  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
at91sam9g20ek            | arm   | lab-broonie     | gcc-10   | multi_v5_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6570473e11eea42054e13479

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/6570473e11eea42054e13494
        failing since 184 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-12-06T10:04:19.988988  /lava-314010/1/../bin/lava-test-case
    2023-12-06T10:04:20.032012  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2711-rpi-4-b          | arm64 | lab-collabora   | clang-17 | defconfig  =
                  | 2          =


  Details:     https://kernelci.org/test/plan/id/657046af3f6386728ee134a9

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231128093145+6009=
708b4367-1~exp1~20231128093253.72))
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm6=
4/defconfig/clang-17/lab-collabora/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm6=
4/defconfig/clang-17/lab-collabora/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/657046af3f63867=
28ee134b0
        new failure (last pass: next-20231102)
        2 lines

    2023-12-06T10:01:58.987029  kern  :alert : Mem abort info:

    2023-12-06T10:01:58.987471  kern  :alert :   ESR =3D 0x0000000096000006

    2023-12-06T10:01:58.987727  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-12-06T10:01:58.987974  ker<8>[   44.887600] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-12-06T10:01:58.988190  n  :alert :   SE<8>[   44.897639] <LAVA_SIG=
NAL_ENDRUN 0_dmesg 12196326_1.5.2.4.1>

    2023-12-06T10:01:58.988402  T =3D 0, FnV =3D 0

    2023-12-06T10:01:58.988607  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-12-06T10:01:58.988811  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-12-06T10:01:58.989013  kern  :alert : Data abort info:
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/657046af3f63867=
28ee134b1
        new failure (last pass: next-20231102)
        13 lines =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2711-rpi-4-b          | arm64 | lab-collabora   | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65704caa4e7c7dc8dbe13475

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-bcm2711=
-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-bcm2711=
-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65704caa4e7c7dc=
8dbe1347c
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        2 lines

    2023-12-06T10:28:02.023474  kern  :alert : Mem abort info:

    2023-12-06T10:28:02.023930  kern  :alert :   ESR =3D 0x0000000096000006

    2023-12-06T10:28:02.024193  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), I<8>[   44.854663] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=
=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-12-06T10:28:02.024446  L =3D 32 bits

    2023-12-06T10:28:02.024663  ker<8>[   44.864429] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 12196468_1.5.2.4.1>

    2023-12-06T10:28:02.024870  n  :alert :   SET =3D 0, FnV =3D 0

    2023-12-06T10:28:02.025079  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-12-06T10:28:02.025280  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-12-06T10:28:02.025486  kern  :alert : Data abort info:
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/65704caa4e7c7dc=
8dbe1347d
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        13 lines =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2711-rpi-4-b          | arm64 | lab-collabora   | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65704d3eaee6f14843e134cc

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-bcm271=
1-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-bcm271=
1-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65704d3eaee6f14=
843e134d3
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        2 lines

    2023-12-06T10:30:15.087012  at virtual address 0000000000000020

    2023-12-06T10:30:15.087459  kern  :alert : Mem abort info:

    2023-12-06T10:30:15.087711  kern  :alert :   ESR =3D 0x0000000096000007

    2023-12-06T10:30:15.087958  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 b<8>[   44.845810] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Deme=
rg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-12-06T10:30:15.088178  its

    2023-12-06T10:30:15.088386  ker<8>[   44.855517] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 12196501_1.5.2.4.1>

    2023-12-06T10:30:15.088597  n  :alert :   SET =3D 0, FnV =3D 0

    2023-12-06T10:30:15.088806  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-12-06T10:30:15.089010  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault

    2023-12-06T10:30:15.089210  kern  :alert : Data abort info:
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/65704d3eaee6f14=
843e134d4
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        13 lines =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2711-rpi-4-b          | arm64 | lab-collabora   | gcc-10   | defconfig+v=
ideodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/65704f8bc57af3cfe2e1349c

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65704f8bc57af3c=
fe2e134a3
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        2 lines

    2023-12-06T10:44:22.795096  ference at virtual address 0000000000000020

    2023-12-06T10:44:22.795618  kern  :alert : Mem abort info:

    2023-12-06T10:44:22.796004  kern  :alert :   ESR =3D 0x0000000096000006

    2023-12-06T10:44:22.796326  kern  :alert :   EC =3D 0x25: DABT (curren<=
8>[   44.858161] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail U=
NITS=3Dlines MEASUREMENT=3D2>

    2023-12-06T10:44:22.796635  t EL), IL =3D 32 b<8>[   44.867826] <LAVA_S=
IGNAL_ENDRUN 0_dmesg 12196538_1.5.2.4.1>

    2023-12-06T10:44:22.796935  its

    2023-12-06T10:44:22.797226  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-12-06T10:44:22.797516  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-12-06T10:44:22.797806  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-12-06T10:44:22.798087  kern  :alert : Data abort info:
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/65704f8bc57af3c=
fe2e134a4
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        13 lines =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b          | arm   | lab-collabora   | gcc-10   | bcm2835_def=
config            | 1          =


  Details:     https://kernelci.org/test/plan/id/657044e5c649d4424fe1347a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657044e5c649d4424fe13=
47b
        failing since 184 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b          | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65704dba15e2ad3b48e13476

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65704dba15e2ad3b48e13=
477
        failing since 252 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
beagle-xm                | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65704e95c0eccdad36e1347b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65704e95c0eccdad36e13=
47c
        failing since 250 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
beagle-xm                | arm   | lab-baylibre    | gcc-10   | omap2plus_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/65704c16509eac0569e1347f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65704c16509eac0569e13=
480
        failing since 16 days (last pass: next-20231117, first fail: next-2=
0231120) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/657047b6d37cb304d6e13475

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657047b6d37cb304d6e13=
476
        failing since 0 day (last pass: next-20231204, first fail: next-202=
31205) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/657045fd8016116281e134b4

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/657045fd8016116=
281e134bb
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        55 lines

    2023-12-06T09:59:03.508260  kern  :alert : Register r0 information: sla=
b dentry start c2e2bb28 pointer offset 0 size 136
    2023-12-06T09:59:03.518036  kern  :alert : Register r1 information: non=
-paged memory
    2023-12-06T09:59:03.518400  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-12-06T09:59:03.526524  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-06T09:59:03.535450  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c3077e40 pointer offset 64 size 192
    2023-12-06T09:59:03.544398  kern  :alert : Register r5 information: sla=
b dentry start c2e2baa0 pointer offset 0 size 136
    2023-12-06T09:59:03.553405  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c31392c0 pointer offset 0 size 64
    2023-12-06T09:59:03.562523  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf023000 allocated at load_module+0x6d4/0x=
1adc
    2023-12-06T09:59:03.571663  kern  :alert : Register r8 information: sla=
b kmalloc-64 start c31392c0 pointer offset 0 size 64
    2023-12-06T09:59:03.572000  kern  :alert : Register r9 information: NUL=
L pointer =

    ... (43 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/657045fd8016116=
281e134bc
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        16 lines

    2023-12-06T09:59:03.481419  kern  :alert : 8<--- cut here ---
    2023-12-06T09:59:03.490294  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read
    2023-12-06T09:59:03.499261  kern  :alert : [000[   16.105966] <LAVA_SIG=
NAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D16>
    2023-12-06T09:59:03.499442  00010] *pgd=3D4b206831   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/657046edb6ca118eb6e13485

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6dl-ri=
otboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6dl-ri=
otboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/657046edb6ca118=
eb6e1348c
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        55 lines

    2023-12-06T10:03:02.615937  kern  :alert : Register r0 information: sla=
b dentry start c287b110 pointer offset 0 size 136
    2023-12-06T10:03:02.625136  kern  :alert : Register r1 information: NUL=
L pointer
    2023-12-06T10:03:02.625349  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-06T10:03:02.634051  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-06T10:03:02.642963  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c305bd80 pointer offset 64 size 192
    2023-12-06T10:03:02.652035  kern  :alert : Register r5 information: sla=
b dentry start c287b198 pointer offset 0 size 136
    2023-12-06T10:03:02.652195  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c3089c40 pointer offset 0 size 64
    2023-12-06T10:03:02.670158  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf023000 allocated at load_module+0x6c8/0x=
19bc
    2023-12-06T10:03:02.679102  kern  :alert : Register r8 information: sla=
b kmalloc-64 start c3089c40 pointer offset 0 size 64
    2023-12-06T10:03:02.679254  kern  :alert : Register r9 information: NUL=
L pointer =

    ... (39 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/657046edb6ca118=
eb6e1348d
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        16 lines

    2023-12-06T10:03:02.589089  kern  :alert : 8<--- cut here ---
    2023-12-06T10:03:02.606912  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010[   15.639178] <LAVA_SIGNAL=
_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>
    2023-12-06T10:03:02.607139   when read
    2023-12-06T10:03:02.607251  kern  :alert : [00000010] *pgd=3D4b265831   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65704d7da4623e215be13483

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65704d7da4623e2=
15be1348a
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        56 lines

    2023-12-06T10:31:14.951093  kern  :alert : Register r0 information: sla=
b dentry start c2e44e58 pointer offset 0 size 136
    2023-12-06T10:31:14.960287  kern  :alert : Register r1 information: NUL=
L pointer
    2023-12-06T10:31:14.960461  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-06T10:31:14.969297  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-06T10:31:14.978362  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c3076c00 pointer offset 64 size 192
    2023-12-06T10:31:14.987099  kern  :alert : Register r5 information: sla=
b dentry start c2e31dd0 pointer offset 0 size 136
    2023-12-06T10:31:14.987258  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c3097480 pointer offset 0 size 64
    2023-12-06T10:31:15.005364  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf81f000 allocated at load_module+0x4e1/0x=
1434
    2023-12-06T10:31:15.005546  kern  :alert : Register r8 information: NUL=
L pointer
    2023-12-06T10:31:15.014364  kern  :alert : Register r9 information: sla=
b kmalloc-128 start c3121d00 pointer offset 64 size 128 =

    ... (41 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/65704d7da4623e2=
15be1348b
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        16 lines

    2023-12-06T10:31:14.923977  kern  :alert : 8<--- cut here ---
    2023-12-06T10:31:14.933132  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read
    2023-12-06T10:31:14.942161  kern  :alert : [000[   16.038800] <LAVA_SIG=
NAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D16>
    2023-12-06T10:31:14.942342  00010] *pgd=3D4b23e831   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-udoo              | arm   | lab-broonie     | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/657048359e958d0e14e134fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657048359e958d0e14e13=
4fc
        failing since 0 day (last pass: next-20231204, first fail: next-202=
31205) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-udoo              | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6570475911eea42054e13548

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6570475911eea42=
054e1356a
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        55 lines

    2023-12-06T10:05:03.993399  kern  :alert : [000<8>[   21.791783] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D16>
    2023-12-06T10:05:03.993702  00010] *pgd=3D48fcc831
    2023-12-06T10:05:03.993873  kern  :alert : Register r0 information: sla=
b dentry start c2eadcc0 pointer offset 0 size 136
    2023-12-06T10:05:03.994008  kern  :alert : Register r1 information: non=
-paged memory
    2023-12-06T10:05:03.994369  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-06T10:05:04.015198  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-06T10:05:04.015725  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c4aa6c00 pointer offset 64 size 192
    2023-12-06T10:05:04.015889  kern  :alert : Register r5 information: sla=
b dentry start c2eadc38 pointer offset 0 size 136
    2023-12-06T10:05:04.038282  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c4c90800 pointer offset 0 size 64
    2023-12-06T10:05:04.038826  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf033000 allocated at load_module+0x6d4/0x=
1adc =

    ... (45 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6570475911eea42=
054e1356b
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        16 lines

    2023-12-06T10:05:03.971224  kern  :alert : 8<--- cut here ---
    2023-12-06T10:05:03.971765  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-udoo              | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/657047ded37cb304d6e134f2

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-imx6dl-udoo.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-imx6dl-udoo.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/657047ded37cb30=
4d6e13514
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        55 lines

    2023-12-06T10:06:38.800458  kern  :alert : [00000010] *pgd=3D48d9b831
    2023-12-06T10:06:38.800761  kern  :alert : Register r0 information: sla=
b dentry start c28706e8 pointer offset 0 size 136
    2023-12-06T10:06:38.801200  kern  :alert : Register r1 information: NUL=
L pointer
    2023-12-06T10:06:38.801386  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-06T10:06:38.822959  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-06T10:06:38.823420  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c4d60cc0 pointer offset 64 size 192
    2023-12-06T10:06:38.823606  kern  :alert : Register r5 information: sla=
b dentry start c2870550 pointer offset 0 size 136
    2023-12-06T10:06:38.844423  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c4eefcc0 pointer offset 0 size 64
    2023-12-06T10:06:38.844919  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf023000 allocated at load_module+0x6c8/0x=
19bc
    2023-12-06T10:06:38.866862  kern  :alert : Register r8 information: sla=
b kmalloc-64 start c4eefcc0 pointer offset 0 size 64 =

    ... (44 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/657047ded37cb30=
4d6e13515
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        16 lines

    2023-12-06T10:06:38.777894  kern  :alert : 8<--- cut here ---
    2023-12-06T10:06:38.778248  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010<8>[   24.434535] <LAVA_SIG=
NAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D16>
    2023-12-06T10:06:38.778444   when read   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-udoo              | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65704f31560c503117e13476

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-imx=
6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-imx=
6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65704f31560c503=
117e13498
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        56 lines

    2023-12-06T10:38:20.401507  kern  :alert : [000<8>[   50.686383] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D16>
    2023-12-06T10:38:20.401881  00010] *pgd=3D4973e831
    2023-12-06T10:38:20.402070  kern  :alert : Register r0 information: sla=
b dentry start c28dab28 pointer offset 0 size 136
    2023-12-06T10:38:20.402234  kern  :alert : Register r1 information: NUL=
L pointer
    2023-12-06T10:38:20.402637  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-06T10:38:20.424788  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-06T10:38:20.425192  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c21aa480 pointer offset 64 size 192
    2023-12-06T10:38:20.425377  kern  :alert : Register r5 information: sla=
b dentry start c2c93088 pointer offset 0 size 136
    2023-12-06T10:38:20.446409  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c3068ec0 pointer offset 0 size 64
    2023-12-06T10:38:20.447037  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf82f000 allocated at load_module+0x4e1/0x=
1434 =

    ... (44 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/65704f31560c503=
117e13499
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        16 lines

    2023-12-06T10:38:20.379421  kern  :alert : 8<--- cut here ---
    2023-12-06T10:38:20.380038  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6q-udoo               | arm   | lab-broonie     | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6570477f9f2959dc16e13484

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6570477f9f2959dc16e13=
485
        failing since 0 day (last pass: next-20231204, first fail: next-202=
31205) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6q-udoo               | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/657046e173adef8face134e3

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/657046e173adef8=
face13505
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        55 lines

    2023-12-06T10:02:54.605201  kern  :alert : [000<8>[   21.248711] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D16>
    2023-12-06T10:02:54.605589  00010] *pgd=3D48020831
    2023-12-06T10:02:54.605881  kern  :alert : Register r0 information: sla=
b dentry start c28142a8 pointer offset 0 size 136
    2023-12-06T10:02:54.606398  kern  :alert : Register r1 information: non=
-paged memory
    2023-12-06T10:02:54.606609  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-06T10:02:54.627225  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-06T10:02:54.627889  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c2330cc0 pointer offset 64 size 192
    2023-12-06T10:02:54.628108  kern  :alert : Register r5 information: sla=
b dentry start c2814220 pointer offset 0 size 136
    2023-12-06T10:02:54.649235  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c4f75140 pointer offset 0 size 64
    2023-12-06T10:02:54.649515  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf037000 allocated at load_module+0x6d4/0x=
1adc =

    ... (44 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/657046e173adef8=
face13506
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        16 lines

    2023-12-06T10:02:54.583248  kern  :alert : 8<--- cut here ---
    2023-12-06T10:02:54.583896  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6q-udoo               | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/6570474511eea42054e134be

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-imx6q-udoo.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6570474511eea42=
054e134e0
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        55 lines

    2023-12-06T10:04:26.924344  kern  :alert : [00000010] *pgd=3D48d9e831
    2023-12-06T10:04:26.924699  kern  :alert : Register r0 information: sla=
b dentry start c2e564c8 pointer offset 0 size 136
    2023-12-06T10:04:26.925127  kern  :alert : Register r1 information: NUL=
L pointer
    2023-12-06T10:04:26.925301  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-06T10:04:26.946234  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-06T10:04:26.946498  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c4e21600 pointer offset 64 size 192
    2023-12-06T10:04:26.946917  kern  :alert : Register r5 information: sla=
b dentry start c2e58f68 pointer offset 0 size 136
    2023-12-06T10:04:26.968223  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c2477180 pointer offset 0 size 64
    2023-12-06T10:04:26.968504  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf023000 allocated at load_module+0x6c8/0x=
19bc
    2023-12-06T10:04:26.991261  kern  :alert : Register r8 information: sla=
b kmalloc-64 start c2477180 pointer offset 0 size 64 =

    ... (40 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6570474511eea42=
054e134e1
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        16 lines

    2023-12-06T10:04:26.902381  kern  :alert : 8<--- cut here ---
    2023-12-06T10:04:26.902939  kern  :alert : Unable to handle kernel NULL=
 pointer derefere<8>[   25.640257] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>
    2023-12-06T10:04:26.903150  nce at virtual address 00000010 when read   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6q-udoo               | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65704df1c6c7487d94e134a6

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-imx=
6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-imx=
6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65704df1c6c7487=
d94e134c8
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        56 lines

    2023-12-06T10:33:09.106561  rt : [00000010] *pgd=3D48a18831
    2023-12-06T10:33:09.106980  kern  :alert : Register r0 information: sla=
b dentry start c2d47770 pointer offset 0 size 136
    2023-12-06T10:33:09.107125  kern  :alert : Register r1 information: NUL=
L pointer
    2023-12-06T10:33:09.107258  kern  :alert : Register r2 information: vma=
lloc memory
    2023-12-06T10:33:09.128329  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-06T10:33:09.128836  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c4b66180 pointer offset 64 size 192
    2023-12-06T10:33:09.129353  kern  :alert : Register r5 information: sla=
b dentry start c2d474c8 pointer offset 0 size 136
    2023-12-06T10:33:09.151399  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c3408440 pointer offset 0 size 64
    2023-12-06T10:33:09.151706  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf833000 allocated at load_module+0x4e1/0x=
1434
    2023-12-06T10:33:09.152099  kern  :alert : Register r8 information: NUL=
L pointer =

    ... (43 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/65704df1c6c7487=
d94e134c9
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        16 lines

    2023-12-06T10:33:09.084586  kern  :alert : 8<--- cut here ---
    2023-12-06T10:33:09.084946  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read
    2023-12-06T10:33:09.085130  <k8e>r[n     :2a1l.805208] <LAVA_SIGNAL_TES=
TCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6qp-wandboard-revd1   | arm   | lab-pengutronix | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6570477958c1bee479e13476

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-revd1.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-revd1.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6570477958c1bee479e13=
477
        failing since 0 day (last pass: next-20231204, first fail: next-202=
31205) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6qp-wandboard-revd1   | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/657046110e2efb3275e134b3

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-revd1.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-revd1.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/657046110e2efb3=
275e134ba
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        55 lines

    2023-12-06T09:59:39.610389  ert : Register r0 information: slab dentry =
start c2910e58 pointer offset 0 size 136
    2023-12-06T09:59:39.619476  kern  :alert : Register r1 information: non=
-paged memory
    2023-12-06T09:59:39.619729  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-06T09:59:39.628457  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-06T09:59:39.637435  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c82136c0 pointer offset 64 size 192
    2023-12-06T09:59:39.646326  kern  :alert : Register r5 information: sla=
b dentry start c2910ee0 pointer offset 0 size 136
    2023-12-06T09:59:39.646527  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c81fd900 pointer offset 0 size 64
    2023-12-06T09:59:39.664346  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf06d000 allocated at load_module+0x6d4/0x=
1adc
    2023-12-06T09:59:39.673774  kern  :alert : Register r8 information: sla=
b kmalloc-64 start c81fd900 pointer offset 0 size 64
    2023-12-06T09:59:39.674070  kern  :alert : Register r9 information: NUL=
L pointer =

    ... (43 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/657046110e2efb3=
275e134bb
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        16 lines

    2023-12-06T09:59:39.583226  kern  :alert : 8<--- cut here ---
    2023-12-06T09:59:39.592152  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read
    2023-12-06T09:59:39.592402  kern  :alert : [00000010] *pgd=3D886d2831
    2023-12-06T09:59:39.601375  kern  :al[   38.927904] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6qp-wandboard-revd1   | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/657046d9786c0f0e17e13485

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6qp-wa=
ndboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6qp-wa=
ndboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/657046d9786c0f0=
e17e1348c
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        55 lines

    2023-12-06T10:02:53.426251  kern  :alert : Register r0 information: sla=
b dentry start c2e0c660 pointer offset 0 size 136
    2023-12-06T10:02:53.435240  kern  :alert : Register r1 information: NUL=
L pointer
    2023-12-06T10:02:53.435453  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-06T10:02:53.444231  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-06T10:02:53.453271  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c309a900 pointer offset 64 size 192
    2023-12-06T10:02:53.462290  kern  :alert : Register r5 information: sla=
b dentry start c2e0c5d8 pointer offset 0 size 136
    2023-12-06T10:02:53.462657  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c240dd40 pointer offset 0 size 64
    2023-12-06T10:02:53.480549  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf023000 allocated at load_module+0x6c8/0x=
19bc
    2023-12-06T10:02:53.489413  kern  :alert : Register r8 information: sla=
b kmalloc-64 start c240dd40 pointer offset 0 size 64
    2023-12-06T10:02:53.489597  kern  :alert : Register r9 information: NUL=
L pointer =

    ... (39 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/657046d9786c0f0=
e17e1348d
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        16 lines

    2023-12-06T10:02:53.399279  kern  :alert : 8<--- cut here ---
    2023-12-06T10:02:53.417296  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010[   41.528840] <LAVA_SIGNAL=
_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>
    2023-12-06T10:02:53.417582   when read
    2023-12-06T10:02:53.417691  kern  :alert : [00000010] *pgd=3D8b259831   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6qp-wandboard-revd1   | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65704d693d3c6eff94e13597

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65704d693d3c6ef=
f94e1359e
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        56 lines

    2023-12-06T10:30:58.520086  kern  :alert : Register r0 information: sla=
b dentry start c2903dd0 pointer offset 0 size 136
    2023-12-06T10:30:58.529020  kern  :alert : Register r1 information: NUL=
L pointer
    2023-12-06T10:30:58.529175  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-06T10:30:58.538161  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-06T10:30:58.547104  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c31c5180 pointer offset 64 size 192
    2023-12-06T10:30:58.547293  kern  :alert : Register r5 information: sla=
b dentry
    2023-12-06T10:30:58.556072  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c31c9a80 pointer offset 0 size 64
    2023-12-06T10:30:58.565198  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf8a2000 allocated at load_module+0x4e1/0x=
1434
    2023-12-06T10:30:58.574131  kern  :alert : Register r8 information: NUL=
L pointer
    2023-12-06T10:30:58.583066  kern  :alert : Register r9 information: sla=
b kmalloc-128 start c805f100 pointer offset 64 size 128 =

    ... (42 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/65704d693d3c6ef=
f94e1359f
        failing since 0 day (last pass: next-20231130, first fail: next-202=
31205)
        16 lines

    2023-12-06T10:30:58.493187  kern  :alert : 8<--- cut here ---
    2023-12-06T10:30:58.501943  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read
    2023-12-06T10:30:58.510843  kern  :alert : [000[    7.605011] <LAVA_SIG=
NAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D16>
    2023-12-06T10:30:58.510984  00010] *pgd=3D8b0da831   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
jetson-tk1               | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65704a83d42a5e8772e13476

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65704a83d42a5e8772e13=
477
        failing since 603 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
k3-am625-sk              | arm64 | lab-baylibre    | clang-17 | defconfig  =
                  | 2          =


  Details:     https://kernelci.org/test/plan/id/6570469e24b6f16bace1347f

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231128093145+6009=
708b4367-1~exp1~20231128093253.72))
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6570469e24b6f16=
bace13486
        new failure (last pass: next-20231102)
        2 lines

    2023-12-06T10:01:41.171691  kern  :alert : Mem abort in<8>[    9.139150=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D13>
    2023-12-06T10:01:41.171892  fo:
    2023-12-06T10:01:41.172111  kern  :alert :   ESR =3D 0x0000000096000006
    2023-12-06T10:01:41.174046  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-12-06T10:01:41.186481  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-12-06T10:01:41.186770  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-12-06T10:01:41.187200  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-12-06T10:01:41.189822  kern  :alert : Data abort info:
    2023-12-06T10:01:41.202819  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006, ISS2 =3D <8>[    9.174694] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg =
RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6570469e24b6f16=
bace13487
        new failure (last pass: next-20231102)
        13 lines

    2023-12-06T10:01:41.154942  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000020   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
k3-am625-sk              | arm64 | lab-baylibre    | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65704c6455d0123947e1351b

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-k3-am625=
-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-k3-am625=
-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65704c6455d0123=
947e13522
        new failure (last pass: next-20231120)
        2 lines

    2023-12-06T10:26:26.355793  kern  :alert :   ESR =3D 0x0000000096000006
    2023-12-06T10:26:26.356641  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-12-06T10:26:26.368584  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-12-06T10:26:26.369206  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-12-06T10:26:26.369854  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-12-06T10:26:26.371802  kern  :alert : Data abort info:
    2023-12-06T10:26:26.384851  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006, ISS2 =3D 0x00000000
    2023-12-06T10:26:26.388006  kern  :alert :   CM =3D 0, WnR =3D 0, TnD =
=3D 0, TagAccess<8>[    9.378619] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demer=
g RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-12-06T10:26:26.388469   =3D 0   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/65704c6455d0123=
947e13523
        new failure (last pass: next-20231120)
        13 lines

    2023-12-06T10:26:26.336422  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000020
    2023-12-06T10:26:26.352607  kern  :alert : Mem abort in<8>[    9.337515=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D13>
    2023-12-06T10:26:26.353287  fo:   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
k3-am625-sk              | arm64 | lab-baylibre    | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65704d1aaee6f14843e134a6

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-k3-am62=
5-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-k3-am62=
5-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65704d1aaee6f14=
843e134ad
        new failure (last pass: next-20231120)
        2 lines

    2023-12-06T10:29:18.371619  kern  :alert :   ESR =3D 0x0000000096000007
    2023-12-06T10:29:18.372897  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-12-06T10:29:18.375012  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-12-06T10:29:18.375570  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-12-06T10:29:18.387773  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault
    2023-12-06T10:29:18.388825  kern  :alert : Data abort info:
    2023-12-06T10:29:18.391091  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007, ISS2 =3D 0x00000000
    2023-12-06T10:29:18.403638  kern  :alert :   CM =3D 0, WnR =3D 0, TnD =
=3D 0, TagAccess =3D 0
    2023-12-06T10:29:18.404621  kern  :alert :   GCS =3D 0, Overlay =3D 0, =
DirtyBit =3D 0, Xs =3D 0
    2023-12-06T10:29:18.407167  kern  :alert : user pgtable: 64k pages, 48-=
bit VAs, pgdp=3D00000000aed90400 =

    ... (1 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/65704d1aaee6f14=
843e134ae
        new failure (last pass: next-20231120)
        13 lines

    2023-12-06T10:29:18.355894  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000020
    2023-12-06T10:29:18.359155  kern  :alert : Mem abort in<8>[    9.121639=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D13>
    2023-12-06T10:29:18.359850  fo:   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
k3-am625-sk              | arm64 | lab-baylibre    | gcc-10   | defconfig+v=
ideodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6570504b25cb2ecb10e1347c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6570504b25cb2ecb10e13=
47d
        new failure (last pass: next-20231120) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
k3-j721e-beagleboneai64  | arm64 | lab-baylibre    | gcc-10   | defconfig+v=
ideodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65704f836c0b6cc78fe134db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-j721e-beagleboneai64.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-j721e-beagleboneai64.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65704f836c0b6cc78fe13=
4dc
        new failure (last pass: next-20231120) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
k3-j721e-sk              | arm64 | lab-baylibre    | gcc-10   | defconfig+v=
ideodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/6570502402e995c4b5e13484

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-j721e-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-j721e-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6570502402e995c=
4b5e13487
        new failure (last pass: next-20231120)
        2 lines

    2023-12-06T10:41:22.673292  <8>[  160.100034] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6570502402e995c=
4b5e13488
        new failure (last pass: next-20231120)
        13 lines

    2023-12-06T10:41:22.654421  <8>[  160.081038] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D13>   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
meson-gxl-s905d-p230     | arm64 | lab-baylibre    | gcc-10   | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65704b0f6729be5496e13498

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65704b0f6729be5496e13=
499
        new failure (last pass: next-20231120) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
r8a7743-iwg20d-q7        | arm   | lab-cip         | gcc-10   | shmobile_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/657048449e958d0e14e13549

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657048449e958d0e14e13=
54a
        new failure (last pass: next-20231205) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip         | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65704de774f6daa617e13536

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65704de774f6daa617e1353b
        failing since 127 days (last pass: next-20230712, first fail: next-=
20230801)

    2023-12-06T10:32:45.886915  + set +x
    2023-12-06T10:32:45.890120  <8>[   28.280579] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1052794_1.5.2.4.1>
    2023-12-06T10:32:45.996752  / # #
    2023-12-06T10:32:47.455150  export SHELL=3D/bin/sh
    2023-12-06T10:32:47.475919  #
    2023-12-06T10:32:47.476358  / # export SHELL=3D/bin/sh
    2023-12-06T10:32:49.426377  / # . /lava-1052794/environment
    2023-12-06T10:32:53.013733  /lava-1052794/bin/lava-test-runner /lava-10=
52794/1
    2023-12-06T10:32:53.035027  . /lava-1052794/environment
    2023-12-06T10:32:53.035393  / # /lava-1052794/bin/lava-test-runner /lav=
a-1052794/1 =

    ... (27 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip         | gcc-10   | defconfig+v=
ideodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6570504f25cb2ecb10e1347f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6570504f25cb2ecb10e13484
        failing since 120 days (last pass: next-20230710, first fail: next-=
20230808)

    2023-12-06T10:43:09.194904  + set +x
    2023-12-06T10:43:09.197982  <8>[   28.470336] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1052825_1.5.2.4.1>
    2023-12-06T10:43:09.304680  / # #
    2023-12-06T10:43:10.760046  export SHELL=3D/bin/sh
    2023-12-06T10:43:10.780565  #
    2023-12-06T10:43:10.780843  / # export SHELL=3D/bin/sh
    2023-12-06T10:43:12.727178  / # . /lava-1052825/environment
    2023-12-06T10:43:16.308772  /lava-1052825/bin/lava-test-runner /lava-10=
52825/1
    2023-12-06T10:43:16.329459  . /lava-1052825/environment
    2023-12-06T10:43:16.329563  / # /lava-1052825/bin/lava-test-runner /lav=
a-1052825/1 =

    ... (27 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
rk3288-rock2-square      | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65704b8aa35775f14be1349a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65704b8aa35775f14be13=
49b
        failing since 379 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
rk3288-veyron-jaq        | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65704a86bf590c0583e1349e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65704a86bf590c0583e13=
49f
        failing since 379 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/657045fe0e2efb3275e13492

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657045fe0e2efb3275e13497
        failing since 182 days (last pass: next-20230525, first fail: next-=
20230607)

    2023-12-06T09:59:16.817848  + set +x<8>[   14.105181] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3863083_1.5.2.4.1>
    2023-12-06T09:59:16.818394  =

    2023-12-06T09:59:16.926970  / # #
    2023-12-06T09:59:17.030554  export SHELL=3D/bin/sh
    2023-12-06T09:59:17.031643  #
    2023-12-06T09:59:17.133339  / # export SHELL=3D/bin/sh. /lava-3863083/e=
nvironment
    2023-12-06T09:59:17.134600  =

    2023-12-06T09:59:17.236636  / # . /lava-3863083/environment/lava-386308=
3/bin/lava-test-runner /lava-3863083/1
    2023-12-06T09:59:17.238485  =

    2023-12-06T09:59:17.249406  / # /lava-3863083/bin/lava-test-runner /lav=
a-3863083/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/657046c5ec8395e4aee1350b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657046c5ec8395e4aee13510
        failing since 182 days (last pass: next-20230525, first fail: next-=
20230607)

    2023-12-06T10:02:35.301339  / # #
    2023-12-06T10:02:35.404284  export SHELL=3D/bin/sh
    2023-12-06T10:02:35.405431  #
    2023-12-06T10:02:35.507353  / # export SHELL=3D/bin/sh. /lava-3863106/e=
nvironment
    2023-12-06T10:02:35.508444  =

    2023-12-06T10:02:35.610192  / # . /lava-3863106/environment/lava-386310=
6/bin/lava-test-runner /lava-3863106/1
    2023-12-06T10:02:35.611824  =

    2023-12-06T10:02:35.624510  / # /lava-3863106/bin/lava-test-runner /lav=
a-3863106/1
    2023-12-06T10:02:35.744770  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-06T10:02:35.745504  + cd /lava-3863106/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65704d9209689c3079e134a2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65704d9209689c3079e134a7
        failing since 182 days (last pass: next-20230517, first fail: next-=
20230607)

    2023-12-06T10:31:35.754953  / # #
    2023-12-06T10:31:35.858105  export SHELL=3D/bin/sh
    2023-12-06T10:31:35.859119  #
    2023-12-06T10:31:35.961051  / # export SHELL=3D/bin/sh. /lava-3863217/e=
nvironment
    2023-12-06T10:31:35.962276  =

    2023-12-06T10:31:36.064344  / # . /lava-3863217/environment/lava-386321=
7/bin/lava-test-runner /lava-3863217/1
    2023-12-06T10:31:36.066119  =

    2023-12-06T10:31:36.077227  / # /lava-3863217/bin/lava-test-runner /lav=
a-3863217/1
    2023-12-06T10:31:36.199427  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-06T10:31:36.200563  + cd /lava-3863217/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65704610c8f20eb820e13488

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65704610c8f20eb820e1348d
        failing since 182 days (last pass: next-20230525, first fail: next-=
20230607)

    2023-12-06T09:59:26.324720  + set +x
    2023-12-06T09:59:26.326529  [   19.327940] <LAVA_SIGNAL_ENDRUN 0_dmesg =
446779_1.5.2.4.1>
    2023-12-06T09:59:26.435041  / # #
    2023-12-06T09:59:26.536657  export SHELL=3D/bin/sh
    2023-12-06T09:59:26.537264  #
    2023-12-06T09:59:26.638245  / # export SHELL=3D/bin/sh. /lava-446779/en=
vironment
    2023-12-06T09:59:26.638867  =

    2023-12-06T09:59:26.739878  / # . /lava-446779/environment/lava-446779/=
bin/lava-test-runner /lava-446779/1
    2023-12-06T09:59:26.740734  =

    2023-12-06T09:59:26.743758  / # /lava-446779/bin/lava-test-runner /lava=
-446779/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/657046d8786c0f0e17e1347a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657046d8786c0f0e17e1347f
        failing since 182 days (last pass: next-20230525, first fail: next-=
20230607)

    2023-12-06T10:02:50.440864  + set +x
    2023-12-06T10:02:50.445380  [   23.495722] <LAVA_SIGNAL_ENDRUN 0_dmesg =
446783_1.5.2.4.1>
    2023-12-06T10:02:50.553664  / # #
    2023-12-06T10:02:50.655236  export SHELL=3D/bin/sh
    2023-12-06T10:02:50.655787  #
    2023-12-06T10:02:50.756800  / # export SHELL=3D/bin/sh. /lava-446783/en=
vironment
    2023-12-06T10:02:50.757344  =

    2023-12-06T10:02:50.858356  / # . /lava-446783/environment/lava-446783/=
bin/lava-test-runner /lava-446783/1
    2023-12-06T10:02:50.859200  =

    2023-12-06T10:02:50.861776  / # /lava-446783/bin/lava-test-runner /lava=
-446783/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65704d9109689c3079e13497

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231206/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65704d9109689c3079e1349c
        failing since 182 days (last pass: next-20230517, first fail: next-=
20230607)

    2023-12-06T10:31:28.842303  + set +x[   21.034938] <LAVA_SIGNAL_ENDRUN =
0_dmesg 446790_1.5.2.4.1>
    2023-12-06T10:31:28.842658  =

    2023-12-06T10:31:28.950249  / # #
    2023-12-06T10:31:29.051955  export SHELL=3D/bin/sh
    2023-12-06T10:31:29.052605  #
    2023-12-06T10:31:29.153616  / # export SHELL=3D/bin/sh. /lava-446790/en=
vironment
    2023-12-06T10:31:29.154252  =

    2023-12-06T10:31:29.255272  / # . /lava-446790/environment/lava-446790/=
bin/lava-test-runner /lava-446790/1
    2023-12-06T10:31:29.256202  =

    2023-12-06T10:31:29.258917  / # /lava-446790/bin/lava-test-runner /lava=
-446790/1 =

    ... (12 line(s) more)  =

 =20

