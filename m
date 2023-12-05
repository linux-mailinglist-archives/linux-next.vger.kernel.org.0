Return-Path: <linux-next+bounces-238-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAD7805E6A
	for <lists+linux-next@lfdr.de>; Tue,  5 Dec 2023 20:13:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78AB1281C9C
	for <lists+linux-next@lfdr.de>; Tue,  5 Dec 2023 19:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767EF6D1AA;
	Tue,  5 Dec 2023 19:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="FY52Di//"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B25FEB0
	for <linux-next@vger.kernel.org>; Tue,  5 Dec 2023 11:13:05 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5c21e185df5so3600395a12.1
        for <linux-next@vger.kernel.org>; Tue, 05 Dec 2023 11:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701803585; x=1702408385; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RC9ZmNP1quqszgRRyst8KzoIo0fHKRTejEUVX6jozDk=;
        b=FY52Di///kRJPWOlMlSjFjY8s9dNNr5TrI1HwyKIKzYlTBpGjhCUNvh8PY46ARnLsK
         gCSlH6w5yUJ4PHr0pBZrbjKyFLBc5VYcoxmi/gXb6ch4fQzsn5saYObVZPSyPZK4Q/Hk
         PmlqE3d0DC/GJxv5xSWNWZ/Y1J36AnjrSV05AFYmAmewTPlp0oVsRM5niuASNnMvA2x2
         PC+CHmGoSBYnDRnmrI1lP4jN7AjlI94lsxmhtjJi2pIjWXg3ux1D+usIMW4qP91aiGCa
         lTdKzOBszgGQIAxi4pXkqDyoofNq911jBf+ZlMStYROXU5gyFld1JK5mRsPSdk9BiU25
         GBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701803585; x=1702408385;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RC9ZmNP1quqszgRRyst8KzoIo0fHKRTejEUVX6jozDk=;
        b=DMqoRmzsu1KZ9F9XdYRaHJIVE9ZSSr08J/mojiKFbL2lNUG2VbYji7xZkPtoPb0Qao
         yvSGFDtlDHYVAh2YQYDc7GMS/tIf8j4Z+9v10fs2xTaSIWBKdKbv50m//Pr3iFur1UEI
         zCVd03UTjVIORijjDuQQZTPBboPn5XsbrUG+6tU8yG7olFNNYlfweLIDfFWXLJrvmAKi
         TnAkPgrjICeGfbd67lEHmw7Om0NzhVBui2umYYY87ftT17VTHtTK9Qb07KbF9sv+YAj4
         NlE1SBudWU4tTxCfI/JV6LKOQfD9kZ0XxipGYhgIOxbV0L4VPQumqWLOG5TTmfXGk+hx
         NCWA==
X-Gm-Message-State: AOJu0YwE/c/pFxSG003jqUeV83n2ps797Dbt3xnipSvWG01iqDUNK2bR
	NWytaioYMpMtJJMHrsJ/TjW5SVkOt5ntX2u6HECmQQ==
X-Google-Smtp-Source: AGHT+IE1/DNZCTDKIPnCy1Dr7Rtwa8dSmP0pzz/jAsTHW81zAXucBwXsTGqN4RY/VlcKnob2LmfaIg==
X-Received: by 2002:a17:90b:180b:b0:286:d42d:e6a with SMTP id lw11-20020a17090b180b00b00286d42d0e6amr1660270pjb.28.1701803583564;
        Tue, 05 Dec 2023 11:13:03 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id nu8-20020a17090b1b0800b002839d7d8bf3sm9049558pjb.55.2023.12.05.11.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 11:13:02 -0800 (PST)
Message-ID: <656f763e.170a0220.35bbc.9e81@mx.google.com>
Date: Tue, 05 Dec 2023 11:13:02 -0800 (PST)
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
X-Kernelci-Kernel: next-20231205
Subject: next/master baseline: 500 runs, 69 regressions (next-20231205)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 500 runs, 69 regressions (next-20231205)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
at91sam9g20ek            | arm   | lab-broonie     | gcc-10   | at91_dt_def=
config            | 1          =

at91sam9g20ek            | arm   | lab-broonie     | gcc-10   | multi_v5_de=
fconfig           | 1          =

bcm2711-rpi-4-b          | arm64 | lab-collabora   | gcc-10   | defconfig  =
                  | 2          =

bcm2711-rpi-4-b          | arm64 | lab-collabora   | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 2          =

bcm2711-rpi-4-b          | arm64 | lab-collabora   | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 2          =

bcm2711-rpi-4-b          | arm64 | lab-collabora   | gcc-10   | defconfig+v=
ideodec           | 2          =

bcm2836-rpi-2-b          | arm   | lab-collabora   | gcc-10   | bcm2835_def=
config            | 1          =

bcm2836-rpi-2-b          | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

beaglebone-black         | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

imx6dl-riotboard         | arm   | lab-pengutronix | clang-17 | multi_v7_de=
fconfig           | 2          =

imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =

imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig+kselftest | 2          =

imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig           | 2          =

imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 2          =

imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 2          =

imx6dl-udoo              | arm   | lab-broonie     | clang-17 | multi_v7_de=
fconfig           | 2          =

imx6dl-udoo              | arm   | lab-broonie     | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =

imx6dl-udoo              | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fconfig           | 2          =

imx6dl-udoo              | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 2          =

imx6dl-udoo              | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 2          =

imx6q-udoo               | arm   | lab-broonie     | clang-17 | multi_v7_de=
fconfig           | 2          =

imx6q-udoo               | arm   | lab-broonie     | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =

imx6q-udoo               | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fconfig           | 2          =

imx6q-udoo               | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 2          =

imx6q-udoo               | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 2          =

imx6qp-wandboard-revd1   | arm   | lab-pengutronix | clang-17 | multi_v7_de=
fconfig           | 3          =

imx6qp-wandboard-revd1   | arm   | lab-pengutronix | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =

imx6qp-wandboard-revd1   | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig+kselftest | 3          =

imx6qp-wandboard-revd1   | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig           | 3          =

imx6qp-wandboard-revd1   | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 2          =

imx6qp-wandboard-revd1   | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 2          =

kontron-pitx-imx8m       | arm64 | lab-kontron     | gcc-10   | defconfig  =
                  | 2          =

odroid-xu3               | arm   | lab-collabora   | gcc-10   | exynos_defc=
onfig             | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip         | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip         | gcc-10   | defconfig+v=
ideodec           | 1          =

rk3288-rock2-square      | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq        | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

sun50i-h6-pine-h64       | arm64 | lab-clabbe      | gcc-10   | defconfig+k=
selftest          | 1          =

sun50i-h6-pine-h64       | arm64 | lab-collabora   | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64       | arm64 | lab-collabora   | gcc-10   | defconfig+k=
selftest          | 1          =

sun7i-a20-cubieboard2    | arm   | lab-clabbe      | clang-17 | multi_v7_de=
fconfig           | 1          =

sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fconfig           | 1          =

sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231205/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231205
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      0f5f12ac05f36f117e793656c3f560625e927f1b =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
at91sam9g20ek            | arm   | lab-broonie     | gcc-10   | at91_dt_def=
config            | 1          =


  Details:     https://kernelci.org/test/plan/id/656f3c8494f86be288e134a4

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/656f3c8494f86be288e134c0
        failing since 183 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-12-05T15:06:16.458449  /lava-309417/1/../bin/lava-test-case
    2023-12-05T15:06:16.511065  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
at91sam9g20ek            | arm   | lab-broonie     | gcc-10   | multi_v5_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/656f371ece9046b985e1347b

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/656f371ece9046b985e13496
        failing since 183 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-12-05T14:43:16.819106  /lava-309267/1/../bin/lava-test-case
    2023-12-05T14:43:16.860928  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2711-rpi-4-b          | arm64 | lab-collabora   | gcc-10   | defconfig  =
                  | 2          =


  Details:     https://kernelci.org/test/plan/id/656f398ea06ae92d4fe13500

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/656f398ea06ae92=
d4fe13507
        new failure (last pass: next-20231129)
        2 lines

    2023-12-05T14:58:13.733167  kern  :alert : Mem abort info:

    2023-12-05T14:58:13.733599  kern  :alert :   ESR =3D 0x0000000096000006

    2023-12-05T14:58:13.733845  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-12-05T14:58:13.734060  ker<8>[   44.896137] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-12-05T14:58:13.734265  n  :alert :   SE<8>[   44.906070] <LAVA_SIG=
NAL_ENDRUN 0_dmesg 12187341_1.5.2.4.1>

    2023-12-05T14:58:13.734459  T =3D 0, FnV =3D 0

    2023-12-05T14:58:13.734647  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-12-05T14:58:13.734849  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-12-05T14:58:13.735037  kern  :alert : Data abort info:
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/656f398ea06ae92=
d4fe13508
        new failure (last pass: next-20231129)
        13 lines =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2711-rpi-4-b          | arm64 | lab-collabora   | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/656f3e5231b6e47f0ae134cc

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-bcm271=
1-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-bcm271=
1-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/656f3e5231b6e47=
f0ae134d3
        new failure (last pass: next-20231130)
        2 lines

    2023-12-05T15:18:41.775835  ference at virtual address 0000000000000020

    2023-12-05T15:18:41.776330  kern  :alert : Mem abort info:

    2023-12-05T15:18:41.776614  kern  :alert :   ESR =3D 0x0000000096000007

    2023-12-05T15:18:41.776858  kern  :alert :   EC =3D 0x25: DABT (curren<=
8>[   44.844630] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail U=
NITS=3Dlines MEASUREMENT=3D2>

    2023-12-05T15:18:41.777095  t EL), I<8>[   44.854743] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 12187599_1.5.2.4.1>

    2023-12-05T15:18:41.777325  L =3D 32 bits

    2023-12-05T15:18:41.777552  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-12-05T15:18:41.777800  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-12-05T15:18:41.778030  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault

    2023-12-05T15:18:41.778252  kern  :alert : Data abort info:
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/656f3e5231b6e47=
f0ae134d4
        new failure (last pass: next-20231130)
        13 lines =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2711-rpi-4-b          | arm64 | lab-collabora   | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/656f40022ec31b5f2fe134d5

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-bcm2711=
-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-bcm2711=
-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/656f40022ec31b5=
f2fe134dc
        new failure (last pass: next-20231130)
        2 lines =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/656f40022ec31b5=
f2fe134dd
        new failure (last pass: next-20231130)
        13 lines

    2023-12-05T15:21:31.255932  kern  :alert : Unable to handle kernel NULL=
 pointer dere<8>[   44.840097] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert R=
ESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D13>

    2023-12-05T15:21:31.256439  ference at virtual address 0000000000000020

    2023-12-05T15:21:31.256827  kern  :alert : Mem abort info:

    2023-12-05T15:21:31.257154  kern  :alert :   ESR =3D 0x0000000096000006

    2023-12-05T15:21:31.257460  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), I<8>[   44.864203] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=
=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-12-05T15:21:31.257762  L =3D 32 bits
   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2711-rpi-4-b          | arm64 | lab-collabora   | gcc-10   | defconfig+v=
ideodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/656f43672597258cc6e13510

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/656f43672597258=
cc6e13517
        new failure (last pass: next-20231130)
        2 lines

    2023-12-05T15:40:14.256889  kern  :alert : Mem abort info:

    2023-12-05T15:40:14.257353  kern  :alert :   ESR =3D 0x0000000096000006

    2023-12-05T15:40:14.257623  kern  :alert :   EC =3D 0x<8>[   44.896080]=
 <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEA=
SUREMENT=3D2>

    2023-12-05T15:40:14.257848  25: DABT (curren<8>[   44.905834] <LAVA_SIG=
NAL_ENDRUN 0_dmesg 12187858_1.5.2.4.1>

    2023-12-05T15:40:14.258062  t EL), IL =3D 32 bits

    2023-12-05T15:40:14.258263  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-12-05T15:40:14.258466  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-12-05T15:40:14.258697  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-12-05T15:40:14.258925  kern  :alert : Data abort info:
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/656f43672597258=
cc6e13518
        new failure (last pass: next-20231130)
        13 lines =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b          | arm   | lab-collabora   | gcc-10   | bcm2835_def=
config            | 1          =


  Details:     https://kernelci.org/test/plan/id/656f3911b9712f184ae13475

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656f3911b9712f184ae13=
476
        failing since 183 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b          | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/656f42d7db2d454798e134ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656f42d7db2d454798e13=
4ad
        failing since 251 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
beaglebone-black         | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/656f44d76f2e4e11dfe134c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-beaglebone-bl=
ack.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-beaglebone-bl=
ack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656f44d76f2e4e11dfe13=
4c9
        new failure (last pass: next-20231129) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-riotboard         | arm   | lab-pengutronix | clang-17 | multi_v7_de=
fconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/656f3a8d1dbd58399ee13479

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231128093145+6009=
708b4367-1~exp1~20231128093253.72))
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig/clang-17/lab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig/clang-17/lab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/656f3a8d1dbd583=
99ee13480
        new failure (last pass: next-20231130)
        75 lines

    2023-12-05T14:58:00.275049  kern  :alert : Register r0 information: NUL=
L pointer
    2023-12-05T14:58:00.275202  kern  :alert : Register r1 information: non=
-paged memory
    2023-12-05T14:58:00.284144  kern  :alert : Register r2 information: NUL=
L pointer
    2023-12-05T14:58:00.284320  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-05T14:58:00.293057  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c3073e40 pointer offset 64 size 192
    2023-12-05T14:58:00.302115  kern  :alert : Register r5 information: sla=
b dentry start c287b198 pointer offset 0 size 136
    2023-12-05T14:58:00.311082  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c30eea40 pointer offset 0 size 64
    2023-12-05T14:58:00.320187  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf025000 allocated at load_module+0xe78/0x=
1a24
    2023-12-05T14:58:00.329550  kern  :alert : Register r8 information: sla=
b kmalloc-64 start c30eea40 pointer offset 0 size 64
    2023-12-05T14:58:00.338323  kern  :alert : Register r9 information: sla=
b kmalloc-128 start c2794f80 pointer offset 80 size 128 =

    ... (41 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/656f3a8d1dbd583=
99ee13481
        new failure (last pass: next-20231130)
        16 lines

    2023-12-05T14:58:00.248175  kern  :alert : 8<--- cut here ---
    2023-12-05T14:58:00.256959  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read
    2023-12-05T14:58:00.265978  kern  :alert : [000[   16.504827] <LAVA_SIG=
NAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D16>
    2023-12-05T14:58:00.266166  00010] *pgd=3D4b241831   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/656f3e6158ce4d3d18e1347d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656f3e6158ce4d3d18e13=
47e
        new failure (last pass: next-20231204) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/656f3af1fceeba39aae1348f

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+kselftest/gcc-10/lab-pengutronix/baseline-imx6dl-riotboa=
rd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+kselftest/gcc-10/lab-pengutronix/baseline-imx6dl-riotboa=
rd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/656f3af1fceeba3=
9aae13496
        new failure (last pass: next-20231130)
        56 lines

    2023-12-05T14:59:41.054893  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-05T14:59:41.055270  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-05T14:59:41.073016  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c5d6f280 data offset 64 pointer offset 64 size 192 allo=
cated at __drmm_encoder_alloc+0x34/0x90
    2023-12-05T14:59:41.082015  kern  :alert : Register r5 information: sla=
b dentry start c9055578 data offset 8 pointer offset 0 size 136 allocated a=
t __d_alloc+0x2c/0x1ac
    2023-12-05T14:59:41.091071  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c5d86cc0 data offset 64 pointer offset 0 size 64 allocat=
ed at kasprintf+0x28/0x4c
    2023-12-05T14:59:41.109414  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf05b000 allocated at load_module+0x784/0x=
2254
    2023-12-05T14:59:41.118335  kern  :alert : Register r8 information: sla=
b kmalloc-64 start c5d86cc0 data offset 64 pointer offset 0 size 64 allocat=
ed at kasprintf+0x28/0x4c
    2023-12-05T14:59:41.127259  kern  :alert : Register r9 information: NUL=
L pointer
    2023-12-05T14:59:41.136548  kern  :alert : Register r10 information: sl=
ab kmalloc-128 start c4826900 data offset 128 pointer offset 64 size 128 al=
located at __component_match_add+0xec/0x110
    2023-12-05T14:59:41.145422  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory =

    ... (50 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/656f3af1fceeba3=
9aae13497
        new failure (last pass: next-20231130)
        16 lines

    2023-12-05T14:59:41.009745  kern  :alert : 8<--- cut here ---
    2023-12-05T14:59:41.018564  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read
    2023-12-05T14:59:41.018798  kern  :alert : [00000010] *pgd=3D4b27b831
    2023-12-05T14:59:41.036808  kern  :alert : Register r0 information: sla=
b dentry start c9055640 data offset 8 pointer offset 0 size 136 allocated a=
t __d_alloc+0x2c/0x1ac
    2023-12-05T14:59:41.045797  kern  :alert : Registe[   28.913971] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D16>
    2023-12-05T14:59:41.046001  r r1 information: non-paged memory   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/656f3e257bea22f672e1347b

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/656f3e257bea22f=
672e13482
        new failure (last pass: next-20231130)
        55 lines

    2023-12-05T15:13:28.847335  kern  :alert : Register r0 information: sla=
b dentry start c2e46c38 pointer offset 0 size 136
    2023-12-05T15:13:28.856140  kern  :alert : Register r1 information: non=
-paged memory
    2023-12-05T15:13:28.856280  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-05T15:13:28.865159  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-05T15:13:28.874234  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c3074c00 pointer offset 64 size 192
    2023-12-05T15:13:28.883359  kern  :alert : Register r5 information: sla=
b dentry start c2e46bb0 pointer offset 0 size 136
    2023-12-05T15:13:28.883515  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c30f36c0 pointer offset 0 size 64
    2023-12-05T15:13:28.901284  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf023000 allocated at load_module+0x6d4/0x=
1adc
    2023-12-05T15:13:28.910292  kern  :alert : Register r8 information: sla=
b kmalloc-64 start c30f36c0 pointer offset 0 size 64
    2023-12-05T15:13:28.910487  kern  :alert : Register r9 information: NUL=
L pointer =

    ... (41 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/656f3e257bea22f=
672e13483
        new failure (last pass: next-20231130)
        16 lines

    2023-12-05T15:13:28.820117  kern  :alert : 8<--- cut here ---
    2023-12-05T15:13:28.829147  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read
    2023-12-05T15:13:28.838070  kern  :alert : [000[   15.965038] <LAVA_SIG=
NAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D16>
    2023-12-05T15:13:28.838249  00010] *pgd=3D4b228831   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/656f4272949066c7cde13481

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/656f4272949066c=
7cde13488
        new failure (last pass: next-20231130)
        56 lines

    2023-12-05T15:31:39.346195  kern  :alert : Register r0 information: sla=
b dentry start c2e3ff68 pointer offset 0 size 136
    2023-12-05T15:31:39.355319  kern  :alert : Register r1 information: NUL=
L pointer
    2023-12-05T15:31:39.355571  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-05T15:31:39.364241  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-05T15:31:39.373444  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c3074c00 pointer offset 64 size 192
    2023-12-05T15:31:39.382429  kern  :alert : Register r5 information: sla=
b dentry start c2e45000 pointer offset 0 size 136
    2023-12-05T15:31:39.382591  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c30ec100 pointer offset 0 size 64
    2023-12-05T15:31:39.400499  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf81f000 allocated at load_module+0x4e1/0x=
1434
    2023-12-05T15:31:39.400662  kern  :alert : Register r8 information: NUL=
L pointer
    2023-12-05T15:31:39.409563  kern  :alert : Register r9 information: sla=
b kmalloc-128 start c240e900 pointer offset 64 size 128 =

    ... (41 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/656f4272949066c=
7cde13489
        new failure (last pass: next-20231130)
        16 lines

    2023-12-05T15:31:39.319188  kern  :alert : 8<--- cut here ---
    2023-12-05T15:31:39.328164  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read
    2023-12-05T15:31:39.337216  kern  :alert : [000[   15.983879] <LAVA_SIG=
NAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D16>
    2023-12-05T15:31:39.337415  00010] *pgd=3D4b20e831   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/656f43b162dc7cfda8e13475

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6dl-ri=
otboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6dl-ri=
otboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/656f43b162dc7cf=
da8e1347c
        new failure (last pass: next-20231130)
        55 lines

    2023-12-05T15:37:00.936804  kern  :alert : Register r0 information: sla=
b dentry start c2de6088 pointer offset 0 size 136
    2023-12-05T15:37:00.945609  kern  :alert : Register r1 information: NUL=
L pointer
    2023-12-05T15:37:00.945833  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-05T15:37:00.954630  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-05T15:37:00.963879  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c35ec0c0 pointer offset 64 size 192
    2023-12-05T15:37:00.972966  kern  :alert : Register r5 information: sla=
b dentry start c287af68 pointer offset 0 size 136
    2023-12-05T15:37:00.973150  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c35ef0c0 pointer offset 0 size 64
    2023-12-05T15:37:00.990894  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf023000 allocated at load_module+0x6c8/0x=
19bc
    2023-12-05T15:37:00.999912  kern  :alert : Register r8 information: sla=
b kmalloc-64 start c35ef0c0 pointer offset 0 size 64
    2023-12-05T15:37:01.000091  kern  :alert : Register r9 information: NUL=
L pointer =

    ... (39 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/656f43b162dc7cf=
da8e1347d
        new failure (last pass: next-20231130)
        16 lines

    2023-12-05T15:37:00.909764  kern  :alert : 8<--- cut here ---
    2023-12-05T15:37:00.927618  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010[   15.606301] <LAVA_SIGNAL=
_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>
    2023-12-05T15:37:00.927891   when read
    2023-12-05T15:37:00.928001  kern  :alert : [00000010] *pgd=3D4b243831   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-udoo              | arm   | lab-broonie     | clang-17 | multi_v7_de=
fconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/656f3b778690609145e134a2

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231128093145+6009=
708b4367-1~exp1~20231128093253.72))
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig/clang-17/lab-broonie/baseline-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig/clang-17/lab-broonie/baseline-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/656f3b778690609=
145e134c4
        new failure (last pass: next-20231130)
        75 lines

    2023-12-05T15:02:04.850605  kern  :alert : [000<8>[   24.036975] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D16>
    2023-12-05T15:02:04.850923  00010] *pgd=3D4800d831
    2023-12-05T15:02:04.851425  kern  :alert : Register r0 information: NUL=
L pointer
    2023-12-05T15:02:04.851625  kern  :alert : Register r1 information: non=
-paged memory
    2023-12-05T15:02:04.851843  kern  :alert : Register r2 information: NUL=
L pointer
    2023-12-05T15:02:04.852056  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-05T15:02:04.872589  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c27a9b40 pointer offset 64 size 192
    2023-12-05T15:02:04.873172  kern  :alert : Register r5 information: sla=
b dentry start c2a84e58 pointer offset 0 size 136
    2023-12-05T15:02:04.895633  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c48e4640 pointer offset 0 size 64
    2023-12-05T15:02:04.896013  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf04d000 allocated at load_module+0xe78/0x=
1a24 =

    ... (43 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/656f3b778690609=
145e134c5
        new failure (last pass: next-20231130)
        16 lines

    2023-12-05T15:02:04.828504  kern  :alert : 8<--- cut here ---
    2023-12-05T15:02:04.828842  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-udoo              | arm   | lab-broonie     | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/656f3f72d74b96ebe3e1349c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656f3f72d74b96ebe3e13=
49d
        new failure (last pass: next-20231204) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-udoo              | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/656f3f361d234b9a2ee13478

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/656f3f361d234b9=
a2ee1349a
        new failure (last pass: next-20231130)
        55 lines

    2023-12-05T15:18:03.517703  kern  :alert : [000<8>[   21.379034] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D16>
    2023-12-05T15:18:03.518018  00010] *pgd=3D48dd9831
    2023-12-05T15:18:03.518464  kern  :alert : Register r0 information: sla=
b dentry start c2c633b8 pointer offset 0 size 136
    2023-12-05T15:18:03.518622  kern  :alert : Register r1 information: non=
-paged memory
    2023-12-05T15:18:03.518797  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-12-05T15:18:03.539685  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-05T15:18:03.540111  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c4c75480 pointer offset 64 size 192
    2023-12-05T15:18:03.540234  kern  :alert : Register r5 information: sla=
b dentry start c2c632a8 pointer offset 0 size 136
    2023-12-05T15:18:03.561968  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c4fc35c0 pointer offset 0 size 64
    2023-12-05T15:18:03.562183  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf061000 allocated at load_module+0x6d4/0x=
1adc =

    ... (45 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/656f3f361d234b9=
a2ee1349b
        new failure (last pass: next-20231130)
        16 lines

    2023-12-05T15:18:03.495081  kern  :alert : 8<--- cut here ---
    2023-12-05T15:18:03.495782  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-udoo              | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/656f42f6db2d454798e1351b

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-imx=
6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-imx=
6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/656f42f6db2d454=
798e1353d
        new failure (last pass: next-20231130)
        56 lines

    2023-12-05T15:34:02.836573  kern  :alert : [000<8>[   21.265896] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D16>
    2023-12-05T15:34:02.836966  00010] *pgd=3D48d13831
    2023-12-05T15:34:02.837151  kern  :alert : Register r0 information: sla=
b dentry start c2ea9a18 pointer offset 0 size 136
    2023-12-05T15:34:02.837314  kern  :alert : Register r1 information: NUL=
L pointer
    2023-12-05T15:34:02.837469  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-05T15:34:02.859575  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-05T15:34:02.860037  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c4cff840 pointer offset 64 size 192
    2023-12-05T15:34:02.860224  kern  :alert : Register r5 information: sla=
b dentry start c2ea9110 pointer offset 0 size 136
    2023-12-05T15:34:02.881598  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c4c31080 pointer offset 0 size 64
    2023-12-05T15:34:02.882088  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf833000 allocated at load_module+0x4e1/0x=
1434 =

    ... (44 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/656f42f6db2d454=
798e1353e
        new failure (last pass: next-20231130)
        16 lines

    2023-12-05T15:34:02.814495  kern  :alert : 8<--- cut here ---
    2023-12-05T15:34:02.814894  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-udoo              | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/656f4524c1a19e65c7e13482

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-imx6dl-udoo.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-imx6dl-udoo.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/656f4525c1a19e6=
5c7e134a4
        new failure (last pass: next-20231130)
        55 lines

    2023-12-05T15:43:06.576218  kern  :alert : [00000010] *pgd=3D48da4831
    2023-12-05T15:43:06.576524  kern  :alert : Register r0 information: sla=
b dentry start c2879550 pointer offset 0 size 136
    2023-12-05T15:43:06.576724  kern  :alert : Register r1 information: NUL=
L pointer
    2023-12-05T15:43:06.576898  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-05T15:43:06.598989  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-05T15:43:06.599371  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c4b3b9c0 pointer offset 64 size 192
    2023-12-05T15:43:06.599816  kern  :alert : Register r5 information: sla=
b dentry start c2879330 pointer offset 0 size 136
    2023-12-05T15:43:06.621120  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c4b670c0 pointer offset 0 size 64
    2023-12-05T15:43:06.621488  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf023000 allocated at load_module+0x6c8/0x=
19bc
    2023-12-05T15:43:06.643035  kern  :alert : Register r8 information: sla=
b kmalloc-64 start c4b670c0 pointer offset 0 size 64 =

    ... (44 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/656f4525c1a19e6=
5c7e134a5
        new failure (last pass: next-20231130)
        16 lines

    2023-12-05T15:43:06.554086  kern  :alert : 8<--- cut here ---
    2023-12-05T15:43:06.554377  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010<8>[   21.384593] <LAVA_SIG=
NAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D16>
    2023-12-05T15:43:06.554538   when read   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6q-udoo               | arm   | lab-broonie     | clang-17 | multi_v7_de=
fconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/656f3aab62fda00c77e13475

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231128093145+6009=
708b4367-1~exp1~20231128093253.72))
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig/clang-17/lab-broonie/baseline-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig/clang-17/lab-broonie/baseline-imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/656f3aab62fda00=
c77e13497
        new failure (last pass: next-20231130)
        75 lines

    2023-12-05T14:58:25.181946  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c4984f00 pointer offset 64 size 192
    2023-12-05T14:58:25.182416  kern  :alert : Register r5 information: sla=
b dentry start c2cc0990 pointer offset 0 size 136
    2023-12-05T14:58:25.203950  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c57f8940 pointer offset 0 size 64
    2023-12-05T14:58:25.204422  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf175000 allocated at load_module+0xe78/0x=
1a24
    2023-12-05T14:58:25.204604  kern  :alert : Register r8 information: sla=
b kmalloc-64 start c57f8940 pointer offset 0 size 64
    2023-12-05T14:58:25.226546  kern  :alert : Register r9 information: sla=
b kmalloc-192 start c49849c0 pointer offset 176 size 192
    2023-12-05T14:58:25.227171  kern  :alert : Register r10 information: sl=
ab kmalloc-192 start c49849c0 pointer offset 172 size 192
    2023-12-05T14:58:25.227373  kern  :alert : Register r11 information: no=
n-paged memory
    2023-12-05T14:58:25.248869  kern  :alert : Register r12 information: sl=
ab inode_cache start c2a52e10 pointer offset 72 size 392
    2023-12-05T14:58:25.249259  kern  :emerg : Internal error: Oops: 17 [#1=
] SMP ARM =

    ... (37 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/656f3aab62fda00=
c77e13498
        new failure (last pass: next-20231130)
        16 lines

    2023-12-05T14:58:25.137832  kern  :alert : 8<--- cut here ---
    2023-12-05T14:58:25.138253  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read
    2023-12-05T14:58:25.138437  kern  :alert : [00000010] *pgd=3D48e9c831
    2023-12-05T14:58:25.159919  kern  :al<8>[   20.910903] <LAVA_SIGNAL_TES=
TCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>
    2023-12-05T14:58:25.160390  ert : Register r0 information: NULL pointer
    2023-12-05T14:58:25.160570  kern  :alert : Register r1 information: non=
-paged memory
    2023-12-05T14:58:25.160737  kern  :alert : Register r2 information: NUL=
L pointer
    2023-12-05T14:58:25.160888  kern  :alert : Register r3 information: NUL=
L pointer   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6q-udoo               | arm   | lab-broonie     | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/656f3f71fb25d461fde13476

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656f3f71fb25d461fde13=
477
        new failure (last pass: next-20231204) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6q-udoo               | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/656f3f20e8f989d635e134aa

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/656f3f20e8f989d=
635e134cc
        new failure (last pass: next-20231130)
        55 lines

    2023-12-05T15:17:31.331860  kern  :alert : [000<8>[   20.224372] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D16>
    2023-12-05T15:17:31.332243  00010] *pgd=3D481b9831
    2023-12-05T15:17:31.332428  kern  :alert : Register r0 information: sla=
b dentry start c2d725d8 pointer offset 0 size 136
    2023-12-05T15:17:31.332597  kern  :alert : Register r1 information: non=
-paged memory
    2023-12-05T15:17:31.332755  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-05T15:17:31.353906  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-05T15:17:31.354283  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c304b480 pointer offset 64 size 192
    2023-12-05T15:17:31.354467  kern  :alert : Register r5 information: sla=
b dentry start c2d72550 pointer offset 0 size 136
    2023-12-05T15:17:31.376891  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c4ea6340 pointer offset 0 size 64
    2023-12-05T15:17:31.377353  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf037000 allocated at load_module+0x6d4/0x=
1adc =

    ... (44 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/656f3f20e8f989d=
635e134cd
        new failure (last pass: next-20231130)
        16 lines

    2023-12-05T15:17:31.309918  kern  :alert : 8<--- cut here ---
    2023-12-05T15:17:31.310268  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6q-udoo               | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/656f43d162dc7cfda8e134f3

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-imx=
6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-imx=
6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/656f43d162dc7cf=
da8e13515
        new failure (last pass: next-20231130)
        56 lines

    2023-12-05T15:37:35.691576  kern  :alert : [000<8>[   21.567431] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D16>
    2023-12-05T15:37:35.691971  00010] *pgd=3D48e2b831
    2023-12-05T15:37:35.692235  kern  :alert : Register r0 information: sla=
b dentry start c5089a18 pointer offset 0 size 136
    2023-12-05T15:37:35.692491  kern  :alert : Register r1 information: NUL=
L pointer
    2023-12-05T15:37:35.692991  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-05T15:37:35.713365  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-05T15:37:35.713708  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c4c9cf00 pointer offset 64 size 192
    2023-12-05T15:37:35.714266  kern  :alert : Register r5 information: sla=
b dentry start c2fcb880 pointer offset 0 size 136
    2023-12-05T15:37:35.735843  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c4be7b40 pointer offset 0 size 64
    2023-12-05T15:37:35.736234  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf833000 allocated at load_module+0x4e1/0x=
1434 =

    ... (44 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/656f43d162dc7cf=
da8e13516
        new failure (last pass: next-20231130)
        16 lines

    2023-12-05T15:37:35.669910  kern  :alert : 8<--- cut here ---
    2023-12-05T15:37:35.670285  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6q-udoo               | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/656f448439e584b0c6e13486

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-imx6q-udoo.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/656f448439e584b=
0c6e134a8
        new failure (last pass: next-20231130)
        55 lines

    2023-12-05T15:40:40.761180  kern  :alert : [00000010] *pgd=3D48d96831
    2023-12-05T15:40:40.761530  kern  :alert : Register r0 information: sla=
b dentry start c2e5ccc0 pointer offset 0 size 136
    2023-12-05T15:40:40.761712  kern  :alert : Register r1 information: NUL=
L pointer
    2023-12-05T15:40:40.761908  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-05T15:40:40.782891  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-05T15:40:40.783202  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c4f41600 pointer offset 64 size 192
    2023-12-05T15:40:40.783638  kern  :alert : Register r5 information: sla=
b dentry start c2e5cc38 pointer offset 0 size 136
    2023-12-05T15:40:40.804888  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c4eb3c00 pointer offset 0 size 64
    2023-12-05T15:40:40.805443  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf031000 allocated at load_module+0x6c8/0x=
19bc
    2023-12-05T15:40:40.828227  kern  :alert : Register r8 information: sla=
b kmalloc-64 start c4eb3c00 pointer offset 0 size 64 =

    ... (44 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/656f448439e584b=
0c6e134a9
        new failure (last pass: next-20231130)
        16 lines

    2023-12-05T15:40:40.739443  kern  :alert : 8<--- cut here ---
    2023-12-05T15:40:40.739824  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010<8>[   25.669603] <LAVA_SIG=
NAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D16>
    2023-12-05T15:40:40.740018   when read   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6qp-wandboard-revd1   | arm   | lab-pengutronix | clang-17 | multi_v7_de=
fconfig           | 3          =


  Details:     https://kernelci.org/test/plan/id/656f3aa1cfc63ee7cfe1349f

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231128093145+6009=
708b4367-1~exp1~20231128093253.72))
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig/clang-17/lab-pengutronix/baseline-imx6qp-wandboard-revd1=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig/clang-17/lab-pengutronix/baseline-imx6qp-wandboard-revd1=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/656f3aa1cfc63ee7cfe134a4
        new failure (last pass: next-20231130)

    2023-12-05T14:58:27.410721  kern  :emerg :[   36.541090] <LAVA_SIGNAL_E=
NDRUN 0_dmesg 1014432_1.5.2.3.1>
    2023-12-05T14:58:27.410861   de60: f0b34000 00000002 fffff000 ffff8000 =
00000000 00000001 00000002 fffff000
    2023-12-05T14:58:27.419793  kern  :emerg : de80: 000006a0 c03dd424 ffff=
8000 00007fff bf095100 c03de5fc f0b36094 b6f3dbc1
    2023-12-05T14:58:27.428716  kern  :emerg : dea0: f0e9df30 f0b34000 0000=
0000 0000001d 00000024 00000021 00000001 391ad088
    2023-12-05T14:58:27.437776  kern  :emerg : dec0: bf095100 c25856c0 0000=
0000 b6f3dbc1 c3246480 61c88647 c1e90250 c03de754
    2023-12-05T14:58:27.446697  kern  :emerg : dee0: b6f3dbc1 c3246480 0000=
2094 c3246480 00000000 c03db138 f0e9df2c 7fffffff
    2023-12-05T14:58:27.455752  kern  :emerg : df00: 00000000 00000002 391a=
d088 c310c050 00000000 c1e90400 00000000 00000000
    2023-12-05T14:58:27.464985  kern  :emerg : df20: f0e9df20 f0e9df20 0000=
0000 f0b34000 f0b3478b f0b34a80 f0b34000 00002094
    2023-12-05T14:58:27.473800  kern  :emerg : df40: f0b35af4 f0b359a4 f0b3=
5284 000003c0 00000470 000009dc 00000521 00000000
    2023-12-05T14:58:27.482841  kern  :emerg : df60: 000009cc 00000021 0000=
0022 0000001d 00000000 00000015 00000000 c04b91bc =

    ... (49 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/656f3aa1cfc63ee=
7cfe134a6
        new failure (last pass: next-20231130)
        75 lines

    2023-12-05T14:58:27.004348  ert : Register r0 information: NULL pointer
    2023-12-05T14:58:27.004508  kern  :alert : Register r1 information: non=
-paged memory
    2023-12-05T14:58:27.013336  kern  :alert : Register r2 information: NUL=
L pointer
    2023-12-05T14:58:27.013480  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-05T14:58:27.022472  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c2531900 pointer offset 64 size 192
    2023-12-05T14:58:27.031568  kern  :alert : Register r5 information: sla=
b dentry start c2ea97f8 pointer offset 0 size 136
    2023-12-05T14:58:27.040630  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c25e7700 pointer offset 0 size 64
    2023-12-05T14:58:27.049375  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf070000 allocated at load_module+0xe78/0x=
1a24
    2023-12-05T14:58:27.058473  kern  :alert : Register r8 information: sla=
b kmalloc-64 start c25e7700 pointer offset 0 size 64
    2023-12-05T14:58:27.067445  kern  :alert : Register r9 information: sla=
b kmalloc-192 start c352a840 pointer offset 176 size 192 =

    ... (42 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/656f3aa1cfc63ee=
7cfe134a7
        new failure (last pass: next-20231130)
        16 lines

    2023-12-05T14:58:26.977391  kern  :alert : 8<--- cut here ---
    2023-12-05T14:58:26.986416  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read
    2023-12-05T14:58:26.986695  kern  :alert : [00000010] *pgd=3D88698831
    2023-12-05T14:58:26.995244  kern  :al[   36.128251] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6qp-wandboard-revd1   | arm   | lab-pengutronix | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/656f3e6258ce4d3d18e13480

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-revd1.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-revd1.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656f3e6258ce4d3d18e13=
481
        new failure (last pass: next-20231204) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6qp-wandboard-revd1   | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig+kselftest | 3          =


  Details:     https://kernelci.org/test/plan/id/656f3b19425d9e8fb2e13481

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+kselftest/gcc-10/lab-pengutronix/baseline-imx6qp-wandboa=
rd-revd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+kselftest/gcc-10/lab-pengutronix/baseline-imx6qp-wandboa=
rd-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/656f3b19425d9e8fb2e13486
        new failure (last pass: next-20231130)

    2023-12-05T15:00:34.825068  kern  :emerg :  do[   46.818787] <LAVA_SIGN=
AL_ENDRUN 0_dmesg 1014437_1.5.2.3.1>
    2023-12-05T15:00:34.825226  _init_module from init_module_from_file+0x9=
8/0xc4
    2023-12-05T15:00:34.833902  kern  :emerg :  init_module_from_file from =
sys_finit_module+0x160/0x298
    2023-12-05T15:00:34.842908  kern  :emerg :  sys_finit_module from ret_f=
ast_syscall+0x0/0x1c
    2023-12-05T15:00:34.843081  kern  :emerg : Exception stack(0xf0b31fa8 t=
o 0xf0b31ff0)
    2023-12-05T15:00:34.851950  kern  :emerg : 1fa0:                   0002=
0000 00000000 0000000d b6f0bbc1 00000000 00058330
    2023-12-05T15:00:34.860833  kern  :emerg : 1fc0: 00020000 00000000 0000=
0000 0000017b 00068e88 00058330 00000000 00020000
    2023-12-05T15:00:34.869890  kern  :emerg : 1fe0: bee22948 bee22938 b6f0=
559c b6c6b830
    2023-12-05T15:00:34.870154  kern  :emerg : Code: e34c01f3 e3a01f49 ebed=
7e37 e5943040 (e5933010) =

    2023-12-05T15:00:34.870265  + set +x =

    ... (20 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/656f3b19425d9e8=
fb2e13488
        new failure (last pass: next-20231130)
        56 lines

    2023-12-05T15:00:34.364217   information: vmalloc memory
    2023-12-05T15:00:34.364391  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-05T15:00:34.382359  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c52abe00 data offset 64 pointer offset 64 size 192 allo=
cated at __drmm_encoder_alloc+0x34/0x90
    2023-12-05T15:00:34.391323  kern  :alert : Register r5 information: sla=
b dentry start c3c83898 data offset 8 pointer offset 0 size 136 allocated a=
t __d_alloc+0x2c/0x1ac
    2023-12-05T15:00:34.400420  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c9aa5780 data offset 64 pointer offset 0 size 64 allocat=
ed at kernfs_fop_open+0x2f8/0x3b0
    2023-12-05T15:00:34.418499  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf0dc000 allocated at load_module+0x784/0x=
2254
    2023-12-05T15:00:34.427532  kern  :alert : Register r8 information: sla=
b kmalloc-64 start c9abb180 data offset 64 pointer offset 0 size 64 allocat=
ed at kernfs_fop_open+0x2f8/0x3b0
    2023-12-05T15:00:34.436670  kern  :alert : Register r9 information: NUL=
L pointer
    2023-12-05T15:00:34.445609  kern  :alert : Register r10 information: sl=
ab kmalloc-128 start c52ad680 data offset 128 pointer offset 64 size 128 al=
located at __component_match_add+0xec/0x110
    2023-12-05T15:00:34.454833  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory =

    ... (50 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/656f3b19425d9e8=
fb2e13489
        new failure (last pass: next-20231130)
        16 lines

    2023-12-05T15:00:34.319725  kern  :alert : 8<--- cut here ---
    2023-12-05T15:00:34.328319  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read
    2023-12-05T15:00:34.328520  kern  :alert : [00000010] *pgd=3D8b760831
    2023-12-05T15:00:34.346342  kern  :alert : Register r0 information: sla=
b dentry start c3c83960 data offset 8 pointer offset 0 size 136 allocated a=
t __d_alloc+0x2c/0x1ac
    2023-12-05T15:00:34.346533  kern  :alert : Register r1 information: non=
-paged memory
    2023-12-05T15:00:34.355361  kern  :alert : Register r2[   46.350919] <L=
AVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUR=
EMENT=3D16>   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6qp-wandboard-revd1   | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig           | 3          =


  Details:     https://kernelci.org/test/plan/id/656f3e26f94a82b93ae1348d

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-revd1.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-revd1.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/656f3e26f94a82b93ae13492
        new failure (last pass: next-20231130)

    2023-12-05T15:13:18.118398  kern  :emerg :[   10.525595] <LAVA_SIGNAL_E=
NDRUN 0_dmesg 1014445_1.5.2.3.1>
    2023-12-05T15:13:18.118561    really_probe from __driver_probe_device+0=
x88/0x1a0
    2023-12-05T15:13:18.127442  kern  :emerg :  __driver_probe_device from =
driver_probe_device+0x30/0x104
    2023-12-05T15:13:18.136660  kern  :emerg :  driver_probe_device from __=
driver_attach+0x90/0x174
    2023-12-05T15:13:18.136809  kern  :emerg :  __driver_attach from bus_fo=
r_each_dev+0x6c/0xb4
    2023-12-05T15:13:18.145641  kern  :emerg :  bus_for_each_dev from bus_a=
dd_driver+0xcc/0x1cc
    2023-12-05T15:13:18.154510  kern  :emerg :  bus_add_driver from driver_=
register+0x7c/0x114
    2023-12-05T15:13:18.154654  kern  :emerg :  driver_register from do_one=
_initcall+0x40/0x1e0
    2023-12-05T15:13:18.163701  kern  :emerg :  do_one_initcall from do_ini=
t_module+0x54/0x1e8
    2023-12-05T15:13:18.163856  kern  :emerg :  do_init_module from init_mo=
dule_from_file+0x90/0xbc =

    ... (28 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/656f3e26f94a82b=
93ae13494
        new failure (last pass: next-20231130)
        55 lines

    2023-12-05T15:13:17.721291  ert : Register r0 information: slab dentry =
start c29034c8 pointer offset 0 size 136
    2023-12-05T15:13:17.730156  kern  :alert : Register r1 information: non=
-paged memory
    2023-12-05T15:13:17.730342  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-05T15:13:17.739321  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-05T15:13:17.748558  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c24ebe40 pointer offset 64 size 192
    2023-12-05T15:13:17.757549  kern  :alert : Register r5 information: sla=
b dentry start c2903440 pointer offset 0 size 136
    2023-12-05T15:13:17.757704  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c83796c0 pointer offset 0 size 64
    2023-12-05T15:13:17.775296  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf03e000 allocated at load_module+0x6d4/0x=
1adc
    2023-12-05T15:13:17.784294  kern  :alert : Register r8 information: sla=
b kmalloc-64 start c83796c0 pointer offset 0 size 64
    2023-12-05T15:13:17.784438  kern  :alert : Register r9 information: NUL=
L pointer =

    ... (43 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/656f3e26f94a82b=
93ae13495
        new failure (last pass: next-20231130)
        16 lines

    2023-12-05T15:13:17.694099  kern  :alert : 8<--- cut here ---
    2023-12-05T15:13:17.703041  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read
    2023-12-05T15:13:17.703195  kern  :alert : [00000010] *pgd=3D88090831
    2023-12-05T15:13:17.712159  kern  :al[   10.120044] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6qp-wandboard-revd1   | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/656f42718af8e34e9ee1348c

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/656f42718af8e34=
e9ee13493
        new failure (last pass: next-20231130)
        56 lines

    2023-12-05T15:31:39.179607  kern  :alert : Register r0 information: sla=
b dentry start c2aeb198 pointer offset 0 size 136
    2023-12-05T15:31:39.188622  kern  :alert : Register r1 information: NUL=
L pointer
    2023-12-05T15:31:39.188764  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-05T15:31:39.197831  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-05T15:31:39.206631  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c3431f00 pointer offset 64 size 192
    2023-12-05T15:31:39.215702  kern  :alert : Register r5 information: sla=
b dentry start c2aeb220 pointer offset 0 size 136
    2023-12-05T15:31:39.215850  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c362b1c0 pointer offset 0 size 64
    2023-12-05T15:31:39.233813  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf83a000 allocated at load_module+0x4e1/0x=
1434
    2023-12-05T15:31:39.234008  kern  :alert : Register r8 information: NUL=
L pointer
    2023-12-05T15:31:39.242771  kern  :alert : Register r9 information: sla=
b kmalloc-128 start c3623b00 pointer offset 64 size 128 =

    ... (42 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/656f42718af8e34=
e9ee13494
        new failure (last pass: next-20231130)
        16 lines

    2023-12-05T15:31:39.152838  kern  :alert : 8<--- cut here ---
    2023-12-05T15:31:39.161657  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010 when read
    2023-12-05T15:31:39.170563  kern  :alert : [000[   10.251239] <LAVA_SIG=
NAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D16>
    2023-12-05T15:31:39.170718  00010] *pgd=3D87c5f831   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6qp-wandboard-revd1   | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/656f43c594f907bd3be13569

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6qp-wa=
ndboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6qp-wa=
ndboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/656f43c594f907b=
d3be13570
        new failure (last pass: next-20231130)
        55 lines

    2023-12-05T15:37:29.336042  kern  :alert : Register r0 information: sla=
b dentry start c2871c38 pointer offset 0 size 136
    2023-12-05T15:37:29.345123  kern  :alert : Register r1 information: NUL=
L pointer
    2023-12-05T15:37:29.345269  kern  :alert : Register r2 information: non=
-paged memory
    2023-12-05T15:37:29.354351  kern  :alert : Register r3 information: NUL=
L pointer
    2023-12-05T15:37:29.363214  kern  :alert : Register r4 information: sla=
b kmalloc-192 start c3628780 pointer offset 64 size 192
    2023-12-05T15:37:29.372301  kern  :alert : Register r5 information: sla=
b dentry start c2871bb0 pointer offset 0 size 136
    2023-12-05T15:37:29.372453  kern  :alert : Register r6 information: sla=
b kmalloc-64 start c36b1440 pointer offset 0 size 64
    2023-12-05T15:37:29.390319  kern  :alert : Register r7 information: 1-p=
age vmalloc region starting at 0xbf023000 allocated at load_module+0x6c8/0x=
19bc
    2023-12-05T15:37:29.399254  kern  :alert : Register r8 information: sla=
b kmalloc-64 start c36b1440 pointer offset 0 size 64
    2023-12-05T15:37:29.399405  kern  :alert : Register r9 information: NUL=
L pointer =

    ... (39 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/656f43c594f907b=
d3be13571
        new failure (last pass: next-20231130)
        16 lines

    2023-12-05T15:37:29.308847  kern  :alert : 8<--- cut here ---
    2023-12-05T15:37:29.327323  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000010[   41.341568] <LAVA_SIGNAL=
_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>
    2023-12-05T15:37:29.327517   when read
    2023-12-05T15:37:29.327684  kern  :alert : [00000010] *pgd=3D8b237831   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
kontron-pitx-imx8m       | arm64 | lab-kontron     | gcc-10   | defconfig  =
                  | 2          =


  Details:     https://kernelci.org/test/plan/id/656f395dce7afce1bee134d4

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/656f395dce7afce1bee134d7
        new failure (last pass: next-20231129)

    2023-12-05T14:52:49.312603  / # #
    2023-12-05T14:52:49.414617  export SHELL=3D/bin/sh
    2023-12-05T14:52:49.415217  #
    2023-12-05T14:52:49.516274  / # export SHELL=3D/bin/sh. /lava-401858/en=
vironment
    2023-12-05T14:52:49.516967  =

    2023-12-05T14:52:49.618107  / # . /lava-401858/environment/lava-401858/=
bin/lava-test-runner /lava-401858/1
    2023-12-05T14:52:49.619254  =

    2023-12-05T14:52:49.624486  / # /lava-401858/bin/lava-test-runner /lava=
-401858/1
    2023-12-05T14:52:49.688592  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-05T14:52:49.689054  + cd /l<8>[   15.786930] <LAVA_SIGNAL_START=
RUN 1_bootrr 401858_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/656=
f395dce7afce1bee134e7
        new failure (last pass: next-20231129)

    2023-12-05T14:52:52.071984  /lava-401858/1/../bin/lava-test-case
    2023-12-05T14:52:52.072147  <8>[   18.265392] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-12-05T14:52:52.072261  /lava-401858/1/../bin/lava-test-case   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
odroid-xu3               | arm   | lab-collabora   | gcc-10   | exynos_defc=
onfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/656f3759c7cffa0870e13491

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656f3759c7cffa0870e13=
492
        failing since 5 days (last pass: next-20231129, first fail: next-20=
231130) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip         | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/656f406b3464aaeeb3e134af

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/656f406b3464aaeeb3e134b4
        failing since 126 days (last pass: next-20230712, first fail: next-=
20230801)

    2023-12-05T15:23:08.193553  + set +x
    2023-12-05T15:23:08.196670  <8>[   28.188695] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1052064_1.5.2.4.1>
    2023-12-05T15:23:08.301986  / # #
    2023-12-05T15:23:09.757300  export SHELL=3D/bin/sh
    2023-12-05T15:23:09.777767  #
    2023-12-05T15:23:09.778049  / # export SHELL=3D/bin/sh
    2023-12-05T15:23:11.724316  / # . /lava-1052064/environment
    2023-12-05T15:23:15.305370  /lava-1052064/bin/lava-test-runner /lava-10=
52064/1
    2023-12-05T15:23:15.326058  . /lava-1052064/environment
    2023-12-05T15:23:15.326157  / # /lava-1052064/bin/lava-test-runner /lav=
a-1052064/1 =

    ... (27 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip         | gcc-10   | defconfig+v=
ideodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/656f4519c1faa2b5bfe13475

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/656f4519c1faa2b5bfe1347a
        failing since 119 days (last pass: next-20230710, first fail: next-=
20230808)

    2023-12-05T15:42:49.736466  + set +x
    2023-12-05T15:42:49.739665  <8>[   28.313448] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1052126_1.5.2.4.1>
    2023-12-05T15:42:49.846406  / # #
    2023-12-05T15:42:51.302484  export SHELL=3D/bin/sh
    2023-12-05T15:42:51.322950  #
    2023-12-05T15:42:51.323162  / # export SHELL=3D/bin/sh
    2023-12-05T15:42:53.270138  / # . /lava-1052126/environment
    2023-12-05T15:42:56.851886  /lava-1052126/bin/lava-test-runner /lava-10=
52126/1
    2023-12-05T15:42:56.872932  . /lava-1052126/environment
    2023-12-05T15:42:56.873091  / # /lava-1052126/bin/lava-test-runner /lav=
a-1052126/1 =

    ... (27 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
rk3288-rock2-square      | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/656f4007666f4ae77be13481

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656f4007666f4ae77be13=
482
        failing since 378 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
rk3288-veyron-jaq        | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/656f3f047462129f8de1347a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656f3f047462129f8de13=
47b
        failing since 378 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun50i-h6-pine-h64       | arm64 | lab-clabbe      | gcc-10   | defconfig+k=
selftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/656f42330d713cb671e13476

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656f42330d713cb671e13=
477
        failing since 298 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun50i-h6-pine-h64       | arm64 | lab-collabora   | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/656f3f0272b5fe81c2e134ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-sun50i=
-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-sun50i=
-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656f3f0272b5fe81c2e13=
4ac
        new failure (last pass: next-20231130) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun50i-h6-pine-h64       | arm64 | lab-collabora   | gcc-10   | defconfig+k=
selftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/656f424c163db4cd01e13480

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656f424c163db4cd01e13=
481
        failing since 298 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-clabbe      | clang-17 | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/656f3a8cd246dc81c8e1349a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231128093145+6009=
708b4367-1~exp1~20231128093253.72))
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/656f3a8cd246dc81c8e1349f
        failing since 187 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-05T14:58:03.000476  + set +x
    2023-12-05T14:58:03.002496  [   21.263770] <LAVA_SIGNAL_ENDRUN 0_dmesg =
446603_1.5.2.4.1>
    2023-12-05T14:58:03.111431  / # #
    2023-12-05T14:58:03.213228  export SHELL=3D/bin/sh
    2023-12-05T14:58:03.214001  #
    2023-12-05T14:58:03.315311  / # export SHELL=3D/bin/sh. /lava-446603/en=
vironment
    2023-12-05T14:58:03.315962  =

    2023-12-05T14:58:03.417031  / # . /lava-446603/environment/lava-446603/=
bin/lava-test-runner /lava-446603/1
    2023-12-05T14:58:03.417960  =

    2023-12-05T14:58:03.421029  / # /lava-446603/bin/lava-test-runner /lava=
-446603/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/656f3ed9620643e2f9e13483

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/656f3ed9620643e2f9e13488
        failing since 187 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-05T15:16:21.837999  + set +x
    2023-12-05T15:16:21.839797  [   19.355939] <LAVA_SIGNAL_ENDRUN 0_dmesg =
446616_1.5.2.4.1>
    2023-12-05T15:16:21.948359  / # #
    2023-12-05T15:16:22.049947  export SHELL=3D/bin/sh
    2023-12-05T15:16:22.050547  #
    2023-12-05T15:16:22.151503  / # export SHELL=3D/bin/sh. /lava-446616/en=
vironment
    2023-12-05T15:16:22.152036  =

    2023-12-05T15:16:22.253013  / # . /lava-446616/environment/lava-446616/=
bin/lava-test-runner /lava-446616/1
    2023-12-05T15:16:22.253850  =

    2023-12-05T15:16:22.256641  / # /lava-446616/bin/lava-test-runner /lava=
-446616/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/656f43da056fdf089ce1349b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231205/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/656f43da056fdf089ce134a0
        failing since 187 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-05T15:37:39.799187  + set +x
    2023-12-05T15:37:39.800927  [   22.476379] <LAVA_SIGNAL_ENDRUN 0_dmesg =
446633_1.5.2.4.1>
    2023-12-05T15:37:39.909156  / # #
    2023-12-05T15:37:40.010761  export SHELL=3D/bin/sh
    2023-12-05T15:37:40.011300  #
    2023-12-05T15:37:40.112291  / # export SHELL=3D/bin/sh. /lava-446633/en=
vironment
    2023-12-05T15:37:40.112900  =

    2023-12-05T15:37:40.213962  / # . /lava-446633/environment/lava-446633/=
bin/lava-test-runner /lava-446633/1
    2023-12-05T15:37:40.214882  =

    2023-12-05T15:37:40.217660  / # /lava-446633/bin/lava-test-runner /lava=
-446633/1 =

    ... (12 line(s) more)  =

 =20

