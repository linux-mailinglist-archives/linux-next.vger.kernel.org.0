Return-Path: <linux-next+bounces-398-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AC681392B
	for <lists+linux-next@lfdr.de>; Thu, 14 Dec 2023 18:56:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A79AB21369
	for <lists+linux-next@lfdr.de>; Thu, 14 Dec 2023 17:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1C167B5A;
	Thu, 14 Dec 2023 17:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="MgdMQ+M0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 517B5A6
	for <linux-next@vger.kernel.org>; Thu, 14 Dec 2023 09:55:44 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6ceb27ec331so5547281b3a.1
        for <linux-next@vger.kernel.org>; Thu, 14 Dec 2023 09:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702576543; x=1703181343; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O+PooRjrAqnfzoJTy1PN/aQ+w/9/MzGfbV15WI8uM0U=;
        b=MgdMQ+M0eBRw8wU2mIyFKJy+PxtRFI87+sBh6gSkRd2ACKDPC/xn23WvudLTnEfLYC
         z+Y++ITGbRnZi+dNrUTclDCUNaPuoUCuBdHAD0e0sB8MBch77SbNOYk1FkCGHuRpFpw1
         dIde11YIvg3FMKyuryo5JLVbZ475Jg9M38cdqgbJG7Mcy91hggrEeojmFov+mS9wa6qr
         UG6KQrUmL+TsUP3EFen0CVyvJqBWif/lU3IT07XIvVAhyRvWIOyS2v+HvyKXlGeVcaS1
         nWPtQrWBQlApJg+wyZLo2iFcgKPVB0+Dw4aSlz3uvDtevS3Od0eELi7QC+j/ykbukIuj
         /mBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702576543; x=1703181343;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+PooRjrAqnfzoJTy1PN/aQ+w/9/MzGfbV15WI8uM0U=;
        b=wUyhfxVmkhkvshv0bWfLNaZErZz5GjN3Ta+K7AdxZVye3fbsYZURL89lMo/YAh6AjF
         RH1zd1Gu8xM1qSmJ6KdKqDO/5ciLrmYV3nI9yC8PW/zK5NDpnQ1+0/cuqR6GsB4RrO5u
         78/P0vlQO/RGRJM1DPRs+L5llB845ytBoRlY0mUHTeJepG4qhQcr7Q6aNxN7c6GHuQZD
         X858aGD+/299h9PHIxUyvmlYrzhku06FqkqkqPR40Ftbi8tOWl0rPFv8/7Lk7zxqvOrZ
         2WB/3IDCaOpiyWsnUbqQEMRAV18EC4gNkXfQoCEbJTO+QOdjaZNqnezPcf4jWUR9Tvga
         tZLQ==
X-Gm-Message-State: AOJu0Yyq+xK6NDzv7IxO2RmgVxJ0MTMf3nW2M034QJIMWhN08B65PtJ4
	xApk65/J4FpHT9VKkp8y/43XiGnnjQmHBpP/HtI=
X-Google-Smtp-Source: AGHT+IHVg/0LS1GFu45Y+LIK+uaRjlGpGtL3J0z4tPNUgYIbnQuzIT3bK0BJzn72qrIiLiVFy7rvnA==
X-Received: by 2002:a05:6a20:320b:b0:18f:97c:ba20 with SMTP id hl11-20020a056a20320b00b0018f097cba20mr5272754pzc.122.1702576542439;
        Thu, 14 Dec 2023 09:55:42 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id o137-20020a62cd8f000000b006cbb3512266sm12553108pfg.1.2023.12.14.09.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 09:55:41 -0800 (PST)
Message-ID: <657b419d.620a0220.c3dcf.8769@mx.google.com>
Date: Thu, 14 Dec 2023 09:55:41 -0800 (PST)
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
X-Kernelci-Kernel: next-20231214
Subject: next/master baseline: 482 runs, 54 regressions (next-20231214)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 482 runs, 54 regressions (next-20231214)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | sama5_d=
efconfig              | 1          =

at91sam9g20ek                | arm   | lab-broonie     | gcc-10   | at91_dt=
_defconfig            | 1          =

at91sam9g20ek                | arm   | lab-broonie     | gcc-10   | multi_v=
5_defconfig           | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm   | lab-baylibre    | gcc-10   | omap2pl=
us_defconfig          | 1          =

beaglebone-black             | arm   | lab-cip         | clang-17 | multi_v=
7_defconfig           | 1          =

imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig+videodec           | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

k3-am625-sk                  | arm64 | lab-baylibre    | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 5          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =

mt8195-cherry-tomato-r2      | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 1          =

panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | defconf=
ig+videodec           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe      | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora   | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre    | clang-17 | multi_v=
7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | clang-17 | multi_v=
7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =

sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231214/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231214
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      11651f8cb2e88372d4ed523d909514dc9a613ea3 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/657b0b334f11557e71e134a8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657b0b334f11557e71e13=
4a9
        new failure (last pass: next-20231213) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | sama5_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/657b061f9e728293cde13476

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657b061f9e728293cde13=
477
        failing since 316 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91sam9g20ek                | arm   | lab-broonie     | gcc-10   | at91_dt=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/657b029e6bf50d2082e134ad

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/657b029e6bf50d2082e134cc
        failing since 192 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-12-14T13:26:46.339912  /lava-353672/1/../bin/lava-test-case
    2023-12-14T13:26:46.394059  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91sam9g20ek                | arm   | lab-broonie     | gcc-10   | multi_v=
5_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/657b001e3c5c5d3026e134b2

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/657b001e3c5c5d3026e134ca
        failing since 192 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-12-14T13:15:47.122369  /lava-353661/1/../bin/lava-test-case
    2023-12-14T13:15:47.163894  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/657b01939611d20569e13479

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657b01939611d20569e13=
47a
        failing since 192 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657b0c216c6964a585e1347e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657b0c216c6964a585e13=
47f
        failing since 260 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657b0d23ed98c7aa4ce1347c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657b0d23ed98c7aa4ce13=
47d
        failing since 258 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-10   | omap2pl=
us_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/657b0cb2a2611b6ab1e13498

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657b0cb2a2611b6ab1e13=
499
        failing since 1 day (last pass: next-20231212, first fail: next-202=
31213) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | clang-17 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/657b0da14ca67b960ae134b6

  Results:     40 PASS, 9 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig/clang-17/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig/clang-17/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/657b0da24ca67b96=
0ae134ea
        new failure (last pass: next-20231213)
        1 lines

    2023-12-14T14:13:28.350261  / # =

    2023-12-14T14:13:28.360610  =

    2023-12-14T14:13:28.462930  / # #
    2023-12-14T14:13:28.472441  #
    2023-12-14T14:13:28.573332  / # export SHELL=3D/bin/sh
    2023-12-14T14:13:28.584354  export SHELL=3D/bin/sh
    2023-12-14T14:13:28.685283  / # . /lava-1059262/environment
    2023-12-14T14:13:28.696287  . /lava-1059262/environment
    2023-12-14T14:13:28.797075  / # /lava-1059262/bin/lava-test-runner /lav=
a-1059262/0
    2023-12-14T14:13:28.808191  /lava-1059262/bin/lava-test-runner /lava-10=
59262/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/657b04dbc9f5fd9f73e13476

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm6=
4/defconfig+videodec/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm6=
4/defconfig+videodec/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657b04dbc9f5fd9f73e13=
477
        failing since 1 day (last pass: next-20231212, first fail: next-202=
31213) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657b0a91f6dcfe04f9e134ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657b0a91f6dcfe04f9e13=
4cb
        failing since 611 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
k3-am625-sk                  | arm64 | lab-baylibre    | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657b081ddade8869e2e1348d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-k3-am=
625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-k3-am=
625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657b081ddade8869e2e13=
48e
        new failure (last pass: next-20231208) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/657b07114a4f118b41e134e1

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657b07114a4f118b41e134e4
        new failure (last pass: next-20231208)

    2023-12-14T13:45:31.857724  / # #
    2023-12-14T13:45:31.959626  export SHELL=3D/bin/sh
    2023-12-14T13:45:31.960262  #
    2023-12-14T13:45:32.061432  / # export SHELL=3D/bin/sh. /lava-405981/en=
vironment
    2023-12-14T13:45:32.062214  =

    2023-12-14T13:45:32.163423  / # . /lava-405981/environment/lava-405981/=
bin/lava-test-runner /lava-405981/1
    2023-12-14T13:45:32.164419  =

    2023-12-14T13:45:32.172283  / # /lava-405981/bin/lava-test-runner /lava=
-405981/1
    2023-12-14T13:45:32.228511  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-14T13:45:32.228959  + <8>[   20.707299] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 405981_1.5.2.4.5> =

    ... (18 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/657b07114a4f118b41e134e8
        new failure (last pass: next-20231208)

    2023-12-14T13:45:34.329950  /lava-405981/1/../bin/lava-test-case
    2023-12-14T13:45:34.330743  <8>[   22.811168] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-12-14T13:45:34.331136  /lava-405981/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
7b07114a4f118b41e134ea
        new failure (last pass: next-20231208)

    2023-12-14T13:45:35.387815  /lava-405981/1/../bin/lava-test-case
    2023-12-14T13:45:35.388296  <8>[   23.848913] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-12-14T13:45:35.388593  /lava-405981/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/657b07114a4f118b41e134ef
        new failure (last pass: next-20231208)

    2023-12-14T13:45:36.462341  /lava-405981/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/657b07114a4f118b41e134f0
        new failure (last pass: next-20231208)

    2023-12-14T13:45:36.465529  <8>[   24.960038] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-14T13:45:37.522863  /lava-405981/1/../bin/lava-test-case
    2023-12-14T13:45:37.523303  <8>[   25.981590] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-12-14T13:45:37.523605  /lava-405981/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/657b04b5adaa25675be13521

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657b04b5adaa25675be13524
        failing since 2 days (last pass: next-20231207, first fail: next-20=
231212)

    2023-12-14T13:35:35.031539  <8>[   20.235790] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 405962_1.5.2.4.1>
    2023-12-14T13:35:35.136776  / # #
    2023-12-14T13:35:35.238914  export SHELL=3D/bin/sh
    2023-12-14T13:35:35.239647  #
    2023-12-14T13:35:35.340994  / # export SHELL=3D/bin/sh. /lava-405962/en=
vironment
    2023-12-14T13:35:35.341722  =

    2023-12-14T13:35:35.443214  / # . /lava-405962/environment/lava-405962/=
bin/lava-test-runner /lava-405962/1
    2023-12-14T13:35:35.444356  =

    2023-12-14T13:35:35.463102  / # /lava-405962/bin/lava-test-runner /lava=
-405962/1
    2023-12-14T13:35:35.507125  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/657b04b5adaa25675be13528
        failing since 2 days (last pass: next-20231207, first fail: next-20=
231212)

    2023-12-14T13:35:37.614924  /lava-405962/1/../bin/lava-test-case
    2023-12-14T13:35:37.615353  <8>[   22.808257] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-12-14T13:35:37.615646  /lava-405962/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
7b04b5adaa25675be1352a
        failing since 2 days (last pass: next-20231207, first fail: next-20=
231212)

    2023-12-14T13:35:38.672677  /lava-405962/1/../bin/lava-test-case
    2023-12-14T13:35:38.673128  <8>[   23.846936] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-12-14T13:35:38.673385  /lava-405962/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/657b04b5adaa25675be1352f
        failing since 2 days (last pass: next-20231207, first fail: next-20=
231212)

    2023-12-14T13:35:39.748988  /lava-405962/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/657b04b5adaa25675be13530
        failing since 2 days (last pass: next-20231207, first fail: next-20=
231212)

    2023-12-14T13:35:39.752204  <8>[   24.959384] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-14T13:35:40.811039  /lava-405962/1/../bin/lava-test-case
    2023-12-14T13:35:40.811201  <8>[   25.979987] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-12-14T13:35:40.811342  /lava-405962/1/../bin/lava-test-case
    2023-12-14T13:35:40.811469  <8>[   25.997913] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-12-14T13:35:40.811592  /lava-405962/1/../bin/lava-test-case
    2023-12-14T13:35:40.811709  <8>[   26.017838] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-probed RESULT=3Dpass>
    2023-12-14T13:35:40.811822  /lava-405962/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/657b0505c9f5fd9f73e134c6

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657b0505c9f5fd9f73e134c9
        failing since 3 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-14T13:36:56.513912  / # #
    2023-12-14T13:36:56.615984  export SHELL=3D/bin/sh
    2023-12-14T13:36:56.616701  #
    2023-12-14T13:36:56.718220  / # export SHELL=3D/bin/sh. /lava-405970/en=
vironment
    2023-12-14T13:36:56.718475  =

    2023-12-14T13:36:56.819362  / # . /lava-405970/environment/lava-405970/=
bin/lava-test-runner /lava-405970/1
    2023-12-14T13:36:56.819970  =

    2023-12-14T13:36:56.861036  / # /lava-405970/bin/lava-test-runner /lava=
-405970/1
    2023-12-14T13:36:56.884833  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-14T13:36:56.885258  + <8>[   20.713076] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 405970_1.5.2.4.5> =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/657b0505c9f5fd9f73e134cd
        failing since 3 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-14T13:36:58.985274  /lava-405970/1/../bin/lava-test-case
    2023-12-14T13:36:58.985698  <8>[   22.815477] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-12-14T13:36:58.986009  /lava-405970/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
7b0505c9f5fd9f73e134cf
        failing since 3 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-14T13:37:00.043663  /lava-405970/1/../bin/lava-test-case
    2023-12-14T13:37:00.044121  <8>[   23.853963] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-12-14T13:37:00.044423  /lava-405970/1/../bin/lava-test-case
    2023-12-14T13:37:00.044643  <8>[   23.871099] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/657b0505c9f5fd9f73e134d4
        failing since 3 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-14T13:37:01.120795  /lava-405970/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/657b0505c9f5fd9f73e134d5
        failing since 3 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-14T13:37:01.123945  <8>[   24.968327] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-14T13:37:02.180898  /lava-405970/1/../bin/lava-test-case
    2023-12-14T13:37:02.181605  <8>[   25.989467] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-12-14T13:37:02.181920  /lava-405970/1/../bin/lava-test-case
    2023-12-14T13:37:02.182201  <8>[   26.006351] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-12-14T13:37:02.182488  /lava-405970/1/../bin/lava-test-case
    2023-12-14T13:37:02.182747  <8>[   26.025410] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-probed RESULT=3Dpass>
    2023-12-14T13:37:02.183011  /lava-405970/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/657b070ec6af38bd8ae13528

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657b070ec6af38bd8ae1352b
        new failure (last pass: next-20231208)

    2023-12-14T13:45:30.138754  / # #
    2023-12-14T13:45:30.241053  export SHELL=3D/bin/sh
    2023-12-14T13:45:30.241818  #
    2023-12-14T13:45:30.343046  / # export SHELL=3D/bin/sh. /lava-405980/en=
vironment
    2023-12-14T13:45:30.343860  =

    2023-12-14T13:45:30.444917  / # . /lava-405980/environment/lava-405980/=
bin/lava-test-runner /lava-405980/1
    2023-12-14T13:45:30.445834  =

    2023-12-14T13:45:30.450000  / # /lava-405980/bin/lava-test-runner /lava=
-405980/1
    2023-12-14T13:45:30.519181  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-14T13:45:30.519608  + <8>[   21.020321] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 405980_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/657b070ec6af38bd8ae1353e
        new failure (last pass: next-20231208)

    2023-12-14T13:45:32.944179  /lava-405980/1/../bin/lava-test-case
    2023-12-14T13:45:32.944650  <8>[   23.433420] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-14T13:45:32.945021  /lava-405980/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/657b04c971e69804a0e13497

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657b04c971e69804a0e1349a
        failing since 2 days (last pass: next-20231207, first fail: next-20=
231212)

    2023-12-14T13:35:46.646492  / # #
    2023-12-14T13:35:46.748439  export SHELL=3D/bin/sh
    2023-12-14T13:35:46.749245  #
    2023-12-14T13:35:46.850618  / # export SHELL=3D/bin/sh. /lava-405965/en=
vironment
    2023-12-14T13:35:46.851349  =

    2023-12-14T13:35:46.952978  / # . /lava-405965/environment/lava-405965/=
bin/lava-test-runner /lava-405965/1
    2023-12-14T13:35:46.954121  =

    2023-12-14T13:35:46.973130  / # /lava-405965/bin/lava-test-runner /lava=
-405965/1
    2023-12-14T13:35:47.027035  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-14T13:35:47.027465  + <8>[   21.030025] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 405965_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/657b04c971e69804a0e134ad
        failing since 2 days (last pass: next-20231207, first fail: next-20=
231212)

    2023-12-14T13:35:49.458533  /lava-405965/1/../bin/lava-test-case
    2023-12-14T13:35:49.459013  <8>[   23.454716] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-14T13:35:49.459372  /lava-405965/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/657b052d59dd276bcae134a4

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657b052d59dd276bcae134a7
        failing since 3 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-14T13:37:27.909825  =

    2023-12-14T13:37:28.011203  / # #export SHELL=3D/bin/sh
    2023-12-14T13:37:28.011825  =

    2023-12-14T13:37:28.112923  / # export SHELL=3D/bin/sh. /lava-405969/en=
vironment
    2023-12-14T13:37:28.113577  =

    2023-12-14T13:37:28.214705  / # . /lava-405969/environment/lava-405969/=
bin/lava-test-runner /lava-405969/1
    2023-12-14T13:37:28.215646  =

    2023-12-14T13:37:28.220152  / # /lava-405969/bin/lava-test-runner /lava=
-405969/1
    2023-12-14T13:37:28.288181  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-14T13:37:28.288570  + <8>[   20.855232] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 405969_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/657b052d59dd276bcae134ba
        failing since 3 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-14T13:37:30.712697  /lava-405969/1/../bin/lava-test-case
    2023-12-14T13:37:30.713172  <8>[   23.266871] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-14T13:37:30.713506  /lava-405969/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8195-cherry-tomato-r2      | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/657b054703d7a931dbe13483

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8195-=
cherry-tomato-r2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8195-=
cherry-tomato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657b054703d7a931dbe13=
484
        new failure (last pass: next-20231212) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/657b09f962cff4eed8e1348a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657b09f962cff4eed8e1348f
        failing since 7 days (last pass: next-20221014, first fail: next-20=
231207)

    2023-12-14T13:58:02.275685  <8>[   14.251037] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3880593_1.5.2.4.1>
    2023-12-14T13:58:02.382417  / # #
    2023-12-14T13:58:02.483505  export SHELL=3D/bin/sh
    2023-12-14T13:58:02.483845  #
    2023-12-14T13:58:02.584604  / # export SHELL=3D/bin/sh. /lava-3880593/e=
nvironment
    2023-12-14T13:58:02.584948  =

    2023-12-14T13:58:02.685713  / # . /lava-3880593/environment/lava-388059=
3/bin/lava-test-runner /lava-3880593/1
    2023-12-14T13:58:02.686264  =

    2023-12-14T13:58:02.690485  / # /lava-3880593/bin/lava-test-runner /lav=
a-3880593/1
    2023-12-14T13:58:02.757701  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657b0b751a5784d119e1376b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-pa=
nda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-pa=
nda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657b0b751a5784d119e13770
        failing since 7 days (last pass: next-20221014, first fail: next-20=
231207)

    2023-12-14T14:04:17.895825  <8>[   14.175506] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3880614_1.5.2.4.1>
    2023-12-14T14:04:18.000726  / # #
    2023-12-14T14:04:18.101840  export SHELL=3D/bin/sh
    2023-12-14T14:04:18.102210  #
    2023-12-14T14:04:18.202992  / # export SHELL=3D/bin/sh. /lava-3880614/e=
nvironment
    2023-12-14T14:04:18.203374  =

    2023-12-14T14:04:18.304190  / # . /lava-3880614/environment/lava-388061=
4/bin/lava-test-runner /lava-3880614/1
    2023-12-14T14:04:18.304811  =

    2023-12-14T14:04:18.309698  / # /lava-3880614/bin/lava-test-runner /lav=
a-3880614/1
    2023-12-14T14:04:18.370989  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/657b0bef51471de0fce134c8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657b0bef51471de0fce134cd
        failing since 7 days (last pass: next-20221017, first fail: next-20=
231207)

    2023-12-14T14:06:13.284277  <8>[   20.234832] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3880632_1.5.2.4.1>
    2023-12-14T14:06:13.389010  / # #
    2023-12-14T14:06:13.490091  export SHELL=3D/bin/sh
    2023-12-14T14:06:13.490428  #
    2023-12-14T14:06:13.591186  / # export SHELL=3D/bin/sh. /lava-3880632/e=
nvironment
    2023-12-14T14:06:13.591532  =

    2023-12-14T14:06:13.692336  / # . /lava-3880632/environment/lava-388063=
2/bin/lava-test-runner /lava-3880632/1
    2023-12-14T14:06:13.692901  =

    2023-12-14T14:06:13.697168  / # /lava-3880632/bin/lava-test-runner /lav=
a-3880632/1
    2023-12-14T14:06:13.742424  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/657b02e34498de83dae13538

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657b02e34498de83dae13=
539
        new failure (last pass: next-20231213) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/657b071de4f71e1283e13506

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657b071de4f71e1283e1350f
        failing since 128 days (last pass: next-20230710, first fail: next-=
20230808)

    2023-12-14T13:45:41.276629  + set +x
    2023-12-14T13:45:41.279817  <8>[   28.569564] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1059211_1.5.2.4.1>
    2023-12-14T13:45:41.386315  / # #
    2023-12-14T13:45:42.844198  export SHELL=3D/bin/sh
    2023-12-14T13:45:42.864955  #
    2023-12-14T13:45:42.865365  / # export SHELL=3D/bin/sh
    2023-12-14T13:45:44.814305  / # . /lava-1059211/environment
    2023-12-14T13:45:48.401151  /lava-1059211/bin/lava-test-runner /lava-10=
59211/1
    2023-12-14T13:45:48.422421  . /lava-1059211/environment
    2023-12-14T13:45:48.422854  / # /lava-1059211/bin/lava-test-runner /lav=
a-1059211/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657b08ada60483b44ee13481

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657b08ada60483b44ee13486
        failing since 135 days (last pass: next-20230712, first fail: next-=
20230801)

    2023-12-14T13:52:32.713004  + set +x
    2023-12-14T13:52:32.716141  <8>[   27.196182] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1059222_1.5.2.4.1>
    2023-12-14T13:52:32.822288  / # #
    2023-12-14T13:52:34.279635  export SHELL=3D/bin/sh
    2023-12-14T13:52:34.300403  #
    2023-12-14T13:52:34.300821  / # export SHELL=3D/bin/sh
    2023-12-14T13:52:36.249319  / # . /lava-1059222/environment
    2023-12-14T13:52:39.833889  /lava-1059222/bin/lava-test-runner /lava-10=
59222/1
    2023-12-14T13:52:39.855098  . /lava-1059222/environment
    2023-12-14T13:52:39.855461  / # /lava-1059222/bin/lava-test-runner /lav=
a-1059222/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657b0b9608b0c66465e13483

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657b0b9608b0c66465e13=
484
        failing since 387 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657b0a90f6dcfe04f9e134c7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657b0a90f6dcfe04f9e13=
4c8
        failing since 387 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe      | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657b06d8ebe1304df1e1351b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-clabbe/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-clabbe/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657b06d8ebe1304df1e13524
        failing since 65 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20231010)

    2023-12-14T13:44:50.863988  <8>[   18.875038] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 448067_1.5.2.4.1>
    2023-12-14T13:44:50.968990  / # #
    2023-12-14T13:44:51.070593  export SHELL=3D/bin/sh
    2023-12-14T13:44:51.071161  #
    2023-12-14T13:44:51.172141  / # export SHELL=3D/bin/sh. /lava-448067/en=
vironment
    2023-12-14T13:44:51.172731  =

    2023-12-14T13:44:51.273738  / # . /lava-448067/environment/lava-448067/=
bin/lava-test-runner /lava-448067/1
    2023-12-14T13:44:51.274641  =

    2023-12-14T13:44:51.279273  / # /lava-448067/bin/lava-test-runner /lava=
-448067/1
    2023-12-14T13:44:51.362271  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora   | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657b070c4a4f118b41e134d5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657b070c4a4f118b41e134de
        failing since 65 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20231010)

    2023-12-14T13:53:00.837498  / # #

    2023-12-14T13:53:00.939539  export SHELL=3D/bin/sh

    2023-12-14T13:53:00.940247  #

    2023-12-14T13:53:01.041680  / # export SHELL=3D/bin/sh. /lava-12270843/=
environment

    2023-12-14T13:53:01.042393  =


    2023-12-14T13:53:01.143824  / # . /lava-12270843/environment/lava-12270=
843/bin/lava-test-runner /lava-12270843/1

    2023-12-14T13:53:01.144962  =


    2023-12-14T13:53:01.161384  / # /lava-12270843/bin/lava-test-runner /la=
va-12270843/1

    2023-12-14T13:53:01.233257  + export 'TESTRUN_ID=3D1_bootrr'

    2023-12-14T13:53:01.233749  + cd /lava-1227084<8>[   19.424842] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 12270843_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | clang-17 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/657b06d6ebe1304df1e13504

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657b06d6ebe1304df1e1350d
        failing since 190 days (last pass: next-20230525, first fail: next-=
20230607)

    2023-12-14T13:44:26.422718  / # #
    2023-12-14T13:44:26.524273  export SHELL=3D/bin/sh
    2023-12-14T13:44:26.524785  #
    2023-12-14T13:44:26.625579  / # export SHELL=3D/bin/sh. /lava-3880515/e=
nvironment
    2023-12-14T13:44:26.625990  =

    2023-12-14T13:44:26.726747  / # . /lava-3880515/environment/lava-388051=
5/bin/lava-test-runner /lava-3880515/1
    2023-12-14T13:44:26.727257  =

    2023-12-14T13:44:26.772072  / # /lava-3880515/bin/lava-test-runner /lav=
a-3880515/1
    2023-12-14T13:44:26.872884  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-14T13:44:26.873207  + cd /lava-3880515/1/tests/1_bootrr =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | clang-17 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/657b07281b923a0496e134ec

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657b07281b923a0496e134f5
        failing since 190 days (last pass: next-20230525, first fail: next-=
20230607)

    2023-12-14T13:45:57.904087  + set +x
    2023-12-14T13:45:57.905894  [   20.218525] <LAVA_SIGNAL_ENDRUN 0_dmesg =
448066_1.5.2.4.1>
    2023-12-14T13:45:58.015458  / # #
    2023-12-14T13:45:58.117015  export SHELL=3D/bin/sh
    2023-12-14T13:45:58.117554  #
    2023-12-14T13:45:58.218514  / # export SHELL=3D/bin/sh. /lava-448066/en=
vironment
    2023-12-14T13:45:58.219068  =

    2023-12-14T13:45:58.320047  / # . /lava-448066/environment/lava-448066/=
bin/lava-test-runner /lava-448066/1
    2023-12-14T13:45:58.320889  =

    2023-12-14T13:45:58.323907  / # /lava-448066/bin/lava-test-runner /lava=
-448066/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/657b0a5902db332f73e1347a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657b0a5902db332f73e1347f
        failing since 196 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-14T13:59:34.222012  <8>[   12.999578] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3880608_1.5.2.4.1>
    2023-12-14T13:59:34.330404  / # #
    2023-12-14T13:59:34.433890  export SHELL=3D/bin/sh
    2023-12-14T13:59:34.434884  #
    2023-12-14T13:59:34.536655  / # export SHELL=3D/bin/sh. /lava-3880608/e=
nvironment
    2023-12-14T13:59:34.537829  =

    2023-12-14T13:59:34.639500  / # . /lava-3880608/environment/lava-388060=
8/bin/lava-test-runner /lava-3880608/1
    2023-12-14T13:59:34.640927  =

    2023-12-14T13:59:34.652539  / # /lava-3880608/bin/lava-test-runner /lav=
a-3880608/1
    2023-12-14T13:59:34.780657  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657b0b611fa880d097e1349b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657b0b611fa880d097e134a0
        failing since 190 days (last pass: next-20230517, first fail: next-=
20230607)

    2023-12-14T14:03:48.678458  <8>[   13.189344] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3880619_1.5.2.4.1>
    2023-12-14T14:03:48.781949  / # #
    2023-12-14T14:03:48.883215  export SHELL=3D/bin/sh
    2023-12-14T14:03:48.883716  #
    2023-12-14T14:03:48.984592  / # export SHELL=3D/bin/sh. /lava-3880619/e=
nvironment
    2023-12-14T14:03:48.985066  =

    2023-12-14T14:03:49.086717  / # . /lava-3880619/environment/lava-388061=
9/bin/lava-test-runner /lava-3880619/1
    2023-12-14T14:03:49.087316  =

    2023-12-14T14:03:49.127963  / # /lava-3880619/bin/lava-test-runner /lav=
a-3880619/1
    2023-12-14T14:03:49.219804  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/657b0bee51471de0fce13493

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657b0bee51471de0fce13498
        failing since 196 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-14T14:06:05.403406  <8>[   16.010345] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-12-14T14:06:05.403769  + set +x
    2023-12-14T14:06:05.403975  <8>[   16.020728] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3880638_1.5.2.4.1>
    2023-12-14T14:06:05.508285  / # #
    2023-12-14T14:06:05.609998  export SHELL=3D/bin/sh
    2023-12-14T14:06:05.610487  #
    2023-12-14T14:06:05.711420  / # export SHELL=3D/bin/sh. /lava-3880638/e=
nvironment
    2023-12-14T14:06:05.711775  =

    2023-12-14T14:06:05.812772  / # . /lava-3880638/environment/lava-388063=
8/bin/lava-test-runner /lava-3880638/1
    2023-12-14T14:06:05.814533   =

    ... (13 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/657b0a0ebe1eff583ee134a3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657b0a0ebe1eff583ee134a8
        failing since 196 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-14T13:58:08.928375  + set +x
    2023-12-14T13:58:08.930196  [   20.784978] <LAVA_SIGNAL_ENDRUN 0_dmesg =
448073_1.5.2.4.1>
    2023-12-14T13:58:09.039163  / # #
    2023-12-14T13:58:09.140721  export SHELL=3D/bin/sh
    2023-12-14T13:58:09.141262  #
    2023-12-14T13:58:09.242248  / # export SHELL=3D/bin/sh. /lava-448073/en=
vironment
    2023-12-14T13:58:09.242847  =

    2023-12-14T13:58:09.343840  / # . /lava-448073/environment/lava-448073/=
bin/lava-test-runner /lava-448073/1
    2023-12-14T13:58:09.344707  =

    2023-12-14T13:58:09.347471  / # /lava-448073/bin/lava-test-runner /lava=
-448073/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657b0b74f70e49554de134d4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657b0b74f70e49554de134d9
        failing since 190 days (last pass: next-20230517, first fail: next-=
20230607)

    2023-12-14T14:04:06.814434  + set +x
    2023-12-14T14:04:06.816199  [   18.634984] <LAVA_SIGNAL_ENDRUN 0_dmesg =
448081_1.5.2.4.1>
    2023-12-14T14:04:06.924854  / # #
    2023-12-14T14:04:07.026407  export SHELL=3D/bin/sh
    2023-12-14T14:04:07.026942  #
    2023-12-14T14:04:07.127918  / # export SHELL=3D/bin/sh. /lava-448081/en=
vironment
    2023-12-14T14:04:07.128474  =

    2023-12-14T14:04:07.229469  / # . /lava-448081/environment/lava-448081/=
bin/lava-test-runner /lava-448081/1
    2023-12-14T14:04:07.230280  =

    2023-12-14T14:04:07.236772  / # /lava-448081/bin/lava-test-runner /lava=
-448081/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/657b0bec51471de0fce13484

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657b0bec51471de0fce13489
        failing since 196 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-14T14:06:20.636529  + set +x
    2023-12-14T14:06:20.638397  [   22.294978] <LAVA_SIGNAL_ENDRUN 0_dmesg =
448085_1.5.2.4.1>
    2023-12-14T14:06:20.747171  / # #
    2023-12-14T14:06:20.848902  export SHELL=3D/bin/sh
    2023-12-14T14:06:20.849465  #
    2023-12-14T14:06:20.950439  / # export SHELL=3D/bin/sh. /lava-448085/en=
vironment
    2023-12-14T14:06:20.951006  =

    2023-12-14T14:06:21.052014  / # . /lava-448085/environment/lava-448085/=
bin/lava-test-runner /lava-448085/1
    2023-12-14T14:06:21.052858  =

    2023-12-14T14:06:21.055509  / # /lava-448085/bin/lava-test-runner /lava=
-448085/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/657b033ff5bce37aece13485

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657b033ff5bce37aece1348e
        failing since 3 days (last pass: next-20231208, first fail: next-20=
231211)

    2023-12-14T13:29:19.334628  / # #
    2023-12-14T13:29:19.435784  export SHELL=3D/bin/sh
    2023-12-14T13:29:19.436136  #
    2023-12-14T13:29:19.536902  / # export SHELL=3D/bin/sh. /lava-3880388/e=
nvironment
    2023-12-14T13:29:19.537273  =

    2023-12-14T13:29:19.638065  / # . /lava-3880388/environment/lava-388038=
8/bin/lava-test-runner /lava-3880388/1
    2023-12-14T13:29:19.638639  =

    2023-12-14T13:29:19.646637  / # /lava-3880388/bin/lava-test-runner /lav=
a-3880388/1
    2023-12-14T13:29:19.786505  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-14T13:29:19.786945  + cd /lava-3880388/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/657b0341ef73531d13e13475

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231214/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231214/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657b0341ef73531d13e1347e
        new failure (last pass: next-20231213)

    2023-12-14T13:29:13.438862  <8>[    9.547333] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3880391_1.5.2.4.1>
    2023-12-14T13:29:13.543692  / # #
    2023-12-14T13:29:13.644953  export SHELL=3D/bin/sh
    2023-12-14T13:29:13.645333  #
    2023-12-14T13:29:13.746135  / # export SHELL=3D/bin/sh. /lava-3880391/e=
nvironment
    2023-12-14T13:29:13.746509  =

    2023-12-14T13:29:13.847338  / # . /lava-3880391/environment/lava-388039=
1/bin/lava-test-runner /lava-3880391/1
    2023-12-14T13:29:13.848004  =

    2023-12-14T13:29:13.892963  / # /lava-3880391/bin/lava-test-runner /lav=
a-3880391/1
    2023-12-14T13:29:14.011524  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =20

