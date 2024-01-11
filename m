Return-Path: <linux-next+bounces-727-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A3082AE16
	for <lists+linux-next@lfdr.de>; Thu, 11 Jan 2024 12:59:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8146FB213B5
	for <lists+linux-next@lfdr.de>; Thu, 11 Jan 2024 11:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13EE116428;
	Thu, 11 Jan 2024 11:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="upDCAcgY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257CD16431
	for <linux-next@vger.kernel.org>; Thu, 11 Jan 2024 11:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6ddeb015ec6so1833273a34.0
        for <linux-next@vger.kernel.org>; Thu, 11 Jan 2024 03:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1704974284; x=1705579084; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F6EsmfDhjmYxSBxQ/0jX/CatZmBkrQt2e2t56Mi3YGw=;
        b=upDCAcgYJ5ZYf/QfGK0+DEbw40IdY/eSYNI3n0/CswT8KU2J9dJakKX3Y7LlTRdSei
         rYkqS8XE5E9srxrVGUCftPDviU7HmAfwuFHsy5uvEjx+QHNpP7RS65zWDEIFgvgTh+Mv
         A5jj/Wfykmuge8TZhehriXS3hioGuB6AG3PTu92Ht2++Ctzrt8FN4OBE6n+c4WYPCvFU
         H+UW7br6MdjL2wfMKatYEg3Qha6uUIImtjOVjyfSrVmrCtjLOxGUDu2RvSbJi+aubZ+f
         3JuJoDedMLMdyKEw8Uv/ZR9buXgMZZKzI6lbLtacLp88IYApOAs3J2CsGE2ekrtmKFrF
         qO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704974284; x=1705579084;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6EsmfDhjmYxSBxQ/0jX/CatZmBkrQt2e2t56Mi3YGw=;
        b=X2Chr27VPGfn9tnAcPNIDH/+RNubyJxA9j7ZE+kvfkO7H2YOTW/V0//mA2KmiEbirG
         H/QNjfc6GrKr1i1m9vpaJU0NHX959aL7QBibCo7oN78OYil++3V+wHAGcvGvkFz0BVyA
         Dq7ca48w8zc3T7VRVtsdUPdsrD5CCfi2TgD3Hq5rliZflN+D4nuRWgXisVc+TMBTgwGU
         Xq7SKM/oo7f5oXa5xLyEg+yPCrBogMoSR7UpUp5ibEcGEA3zbRCi+EPAME7rW5IDqvdu
         ASNKeVF5lNyeSkqYcLz8qEzh+YUAwiQ/uJzY6TbM/IuJw3SOh+uqcShZHRta/ig1C2YY
         A5jA==
X-Gm-Message-State: AOJu0Yyp27EEPATBwy/RImf+kDnnS++Fgmx9abYK8sO0DEiojVXbVjT4
	fx87DUKvFGiYkqwWGortSZAvks1d+Otg1lTCYndM8xlWkUyu8w==
X-Google-Smtp-Source: AGHT+IHONKdDSZxU/+ifRaPGemzHWaw6xWDpz1xysk/+oLFAbDibviVrJB/x2v/gvc5GB2+ZP9XtfA==
X-Received: by 2002:a05:6808:1812:b0:3bd:3b99:76f3 with SMTP id bh18-20020a056808181200b003bd3b9976f3mr1380466oib.21.1704974283586;
        Thu, 11 Jan 2024 03:58:03 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ko20-20020a056a00461400b006da13bc46c0sm1010690pfb.171.2024.01.11.03.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 03:58:03 -0800 (PST)
Message-ID: <659fd7cb.050a0220.aa8d9.1adb@mx.google.com>
Date: Thu, 11 Jan 2024 03:58:03 -0800 (PST)
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
X-Kernelci-Kernel: next-20240111
X-Kernelci-Report-Type: test
Subject: next/master baseline: 405 runs, 61 regressions (next-20240111)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 405 runs, 61 regressions (next-20240111)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | sama5_def=
config              | 1          =

at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig            | 1          =

at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | multi_v5_=
defconfig           | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm   | lab-baylibre  | gcc-10   | omap2plus=
_defconfig          | 1          =

beaglebone-black             | arm   | lab-cip       | gcc-10   | omap2plus=
_defconfig          | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

k3-am625-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =

k3-j721e-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 5          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | clang-17 | defconfig=
                    | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+kselftest          | 1          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 2          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 2          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 3          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | clang-17 | defconfig=
                    | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
+kselftest          | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | clang-17 | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | clang-17 | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240111/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240111
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9e21984d62c56a0f6d1fc6f76b646212cfd7fe88 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/659f9dd3e4d06bce0d52a454

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-at91-sama5d4=
_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-at91-sama5d4=
_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659f9dd3e4d06bce0d52a=
455
        new failure (last pass: next-20240110) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | sama5_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/659f9c7360dbb27a9f52a419

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659f9c7360dbb27a9f52a=
41a
        failing since 344 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/659f995c89c3fd97ce52a3fc

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/659f995c89c3fd97ce52a41c
        failing since 220 days (last pass: next-20230601, first fail: next-=
20230605)

    2024-01-11T07:31:14.363350  /lava-446362/1/../bin/lava-test-case
    2024-01-11T07:31:14.405560  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | multi_v5_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/659f9808816d27e9d052a3f1

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/659f9808816d27e9d052a410
        failing since 220 days (last pass: next-20230601, first fail: next-=
20230605)

    2024-01-11T07:25:35.138142  /lava-446332/1/../bin/lava-test-case
    2024-01-11T07:25:35.178476  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/659f9facaf3117682d52a3fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659f9facaf3117682d52a=
3ff
        failing since 220 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659f9e445948e51afd52a42b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659f9e445948e51afd52a=
42c
        failing since 288 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659f9fc2af3117682d52a40e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659f9fc2af3117682d52a=
40f
        failing since 286 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-10   | omap2plus=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/659f9bc4ba054b162152a464

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659f9bc4ba054b162152a=
465
        new failure (last pass: next-20240109) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | omap2plus=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/659fa291ce91b608e952a414

  Results:     51 PASS, 4 FAIL, 1 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/659fa291ce91b608=
e952a419
        new failure (last pass: next-20240109)
        1 lines

    2024-01-11T08:10:47.832994  / # =

    2024-01-11T08:10:47.844795  =

    2024-01-11T08:10:47.947332  / # #
    2024-01-11T08:10:47.956652  #
    2024-01-11T08:10:48.057946  / # export SHELL=3D/bin/sh
    2024-01-11T08:10:48.068530  export SHELL=3D/bin/sh
    2024-01-11T08:10:48.169288  / # . /lava-1073657/environment
    2024-01-11T08:10:48.180377  . /lava-1073657/environment
    2024-01-11T08:10:48.281097  / # /lava-1073657/bin/lava-test-runner /lav=
a-1073657/0
    2024-01-11T08:10:48.292227  /lava-1073657/bin/lava-test-runner /lava-10=
73657/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659f9b7ed26d489f0e52a3f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659f9b7ed26d489f0e52a=
3f2
        failing since 639 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
k3-am625-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/659fa01afc246b4a4952a414

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659fa01afc246b4a4952a=
415
        failing since 62 days (last pass: next-20231103, first fail: next-2=
0231110) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
k3-j721e-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/659fa017fc246b4a4952a40e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-j721e-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-j721e-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659fa017fc246b4a4952a=
40f
        failing since 69 days (last pass: next-20231025, first fail: next-2=
0231103) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/659f98bc78cb6a10e052a425

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659f98bc78cb6a10e052a42c
        failing since 29 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-11T07:28:40.886512  =

    2024-01-11T07:28:40.988024  / # #export SHELL=3D/bin/sh
    2024-01-11T07:28:40.988728  =

    2024-01-11T07:28:41.090100  / # export SHELL=3D/bin/sh. /lava-416179/en=
vironment
    2024-01-11T07:28:41.090806  =

    2024-01-11T07:28:41.192376  / # . /lava-416179/environment/lava-416179/=
bin/lava-test-runner /lava-416179/1
    2024-01-11T07:28:41.193567  =

    2024-01-11T07:28:41.197756  / # /lava-416179/bin/lava-test-runner /lava=
-416179/1
    2024-01-11T07:28:41.262053  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-11T07:28:41.301673  + cd /lava-416179/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/659f98bc78cb6a10e052a430
        failing since 29 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-11T07:28:43.512502  /lava-416179/1/../bin/lava-test-case
    2024-01-11T07:28:43.540658  <8>[   26.242788] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
9f98bc78cb6a10e052a432
        failing since 29 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-11T07:28:44.600962  /lava-416179/1/../bin/lava-test-case
    2024-01-11T07:28:44.628508  <8>[   27.330728] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/659f98bc78cb6a10e052a437
        failing since 29 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-11T07:28:45.860085  /lava-416179/1/../bin/lava-test-case
    2024-01-11T07:28:45.887282  <8>[   28.589124] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/659f98bc78cb6a10e052a438
        failing since 29 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-11T07:28:46.910004  /lava-416179/1/../bin/lava-test-case
    2024-01-11T07:28:46.937058  <8>[   29.639352] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 5          =


  Details:     https://kernelci.org/test/plan/id/659f9b8f01a6387ae552a48a

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659f9b8f01a6387ae552a491
        failing since 30 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-11T07:40:43.949026  / # #
    2024-01-11T07:40:44.050966  export SHELL=3D/bin/sh
    2024-01-11T07:40:44.051598  #
    2024-01-11T07:40:44.152691  / # export SHELL=3D/bin/sh. /lava-416186/en=
vironment
    2024-01-11T07:40:44.153304  =

    2024-01-11T07:40:44.254360  / # . /lava-416186/environment/lava-416186/=
bin/lava-test-runner /lava-416186/1
    2024-01-11T07:40:44.255330  =

    2024-01-11T07:40:44.259603  / # /lava-416186/bin/lava-test-runner /lava=
-416186/1
    2024-01-11T07:40:44.324308  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-11T07:40:44.358367  + cd /lava-416186/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/659f9b8f01a6387ae552a495
        failing since 30 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-11T07:40:46.574248  /lava-416186/1/../bin/lava-test-case
    2024-01-11T07:40:46.601079  <8>[   26.235254] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
9f9b8f01a6387ae552a497
        failing since 30 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-11T07:40:47.662936  /lava-416186/1/../bin/lava-test-case
    2024-01-11T07:40:47.688412  <8>[   27.322880] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/659f9b8f01a6387ae552a49c
        failing since 30 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-11T07:40:48.922319  /lava-416186/1/../bin/lava-test-case
    2024-01-11T07:40:48.947907  <8>[   28.582256] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/659f9b8f01a6387ae552a49d
        failing since 30 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-11T07:40:49.971788  /lava-416186/1/../bin/lava-test-case
    2024-01-11T07:40:49.998687  <8>[   29.632549] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/659f9f24de882579df52a3f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659f9f24de882579df52a=
3f7
        failing since 27 days (last pass: next-20231205, first fail: next-2=
0231215) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/659fa439b5303fa7b852a3f7

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659fa439b5303fa7b852a3fe
        failing since 31 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-11T08:17:47.469987  / # #
    2024-01-11T08:17:47.572194  export SHELL=3D/bin/sh
    2024-01-11T08:17:47.572884  #
    2024-01-11T08:17:47.674243  / # export SHELL=3D/bin/sh. /lava-416229/en=
vironment
    2024-01-11T08:17:47.674930  =

    2024-01-11T08:17:47.776391  / # . /lava-416229/environment/lava-416229/=
bin/lava-test-runner /lava-416229/1
    2024-01-11T08:17:47.777516  =

    2024-01-11T08:17:47.797426  / # /lava-416229/bin/lava-test-runner /lava=
-416229/1
    2024-01-11T08:17:47.877151  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-11T08:17:47.877560  + cd /lava-416229/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/659fa439b5303fa7b852a402
        failing since 31 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-11T08:17:50.040959  /lava-416229/1/../bin/lava-test-case
    2024-01-11T08:17:50.062041  <8>[   25.708866] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
9fa439b5303fa7b852a404
        failing since 31 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-11T08:17:51.111620  /lava-416229/1/../bin/lava-test-case
    2024-01-11T08:17:51.132797  <8>[   26.780718] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/659fa439b5303fa7b852a409
        failing since 31 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-11T08:17:52.342072  /lava-416229/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/659fa439b5303fa7b852a40a
        failing since 31 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-11T08:17:52.345338  <8>[   27.991126] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-01-11T08:17:53.381926  /lava-416229/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | clang-17 | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/659fa298e621406f9652a42b

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig/clang-17/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig/clang-17/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659fa298e621406f9652a432
        failing since 31 days (last pass: next-20231208, first fail: next-2=
0231211)

    2024-01-11T08:10:39.682702  / # #
    2024-01-11T08:10:39.784698  export SHELL=3D/bin/sh
    2024-01-11T08:10:39.785431  #
    2024-01-11T08:10:39.886786  / # export SHELL=3D/bin/sh. /lava-416225/en=
vironment
    2024-01-11T08:10:39.887522  =

    2024-01-11T08:10:39.988730  / # . /lava-416225/environment/lava-416225/=
bin/lava-test-runner /lava-416225/1
    2024-01-11T08:10:39.989356  =

    2024-01-11T08:10:39.993697  / # /lava-416225/bin/lava-test-runner /lava=
-416225/1
    2024-01-11T08:10:40.057957  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-11T08:10:40.091847  + cd /lava-416225/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/659fa298e621406f9652a445
        failing since 31 days (last pass: next-20231208, first fail: next-2=
0231211)

    2024-01-11T08:10:43.023681  /lava-416225/1/../bin/lava-test-case
    2024-01-11T08:10:43.049915  <8>[   27.147907] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/659f98bf3b244e6f4152a3f1

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659f98bf3b244e6f4152a3f8
        failing since 29 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-11T07:28:43.428982  / # #
    2024-01-11T07:28:43.531315  export SHELL=3D/bin/sh
    2024-01-11T07:28:43.532042  #
    2024-01-11T07:28:43.633548  / # export SHELL=3D/bin/sh. /lava-416180/en=
vironment
    2024-01-11T07:28:43.634308  =

    2024-01-11T07:28:43.735655  / # . /lava-416180/environment/lava-416180/=
bin/lava-test-runner /lava-416180/1
    2024-01-11T07:28:43.736896  =

    2024-01-11T07:28:43.756452  / # /lava-416180/bin/lava-test-runner /lava=
-416180/1
    2024-01-11T07:28:43.844423  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-11T07:28:43.844844  + cd /lava-416180/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/659f98bf3b244e6f4152a40b
        failing since 29 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-11T07:28:46.771046  /lava-416180/1/../bin/lava-test-case
    2024-01-11T07:28:46.799073  <8>[   27.248317] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/659f9b8c01a6387ae552a420

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659f9b8c01a6387ae552a427
        failing since 30 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-11T07:40:44.301397  / # #
    2024-01-11T07:40:44.403218  export SHELL=3D/bin/sh
    2024-01-11T07:40:44.403907  #
    2024-01-11T07:40:44.505236  / # export SHELL=3D/bin/sh. /lava-416184/en=
vironment
    2024-01-11T07:40:44.506197  =

    2024-01-11T07:40:44.607884  / # . /lava-416184/environment/lava-416184/=
bin/lava-test-runner /lava-416184/1
    2024-01-11T07:40:44.609003  =

    2024-01-11T07:40:44.628542  / # /lava-416184/bin/lava-test-runner /lava=
-416184/1
    2024-01-11T07:40:44.716351  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-11T07:40:44.716736  + cd /lava-416184/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/659f9b8c01a6387ae552a43a
        failing since 30 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-11T07:40:47.640684  /lava-416184/1/../bin/lava-test-case
    2024-01-11T07:40:47.667327  <8>[   27.260236] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/659f9f10f61a792ca952a415

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659f9f10f61a792ca952a=
416
        failing since 27 days (last pass: next-20231205, first fail: next-2=
0231215) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/659fa321153ab1354352a3f3

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659fa321153ab1354352a3fa
        failing since 31 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-11T08:12:58.288165  / # #
    2024-01-11T08:12:58.390000  export SHELL=3D/bin/sh
    2024-01-11T08:12:58.390665  #
    2024-01-11T08:12:58.491727  / # export SHELL=3D/bin/sh. /lava-416233/en=
vironment
    2024-01-11T08:12:58.492398  =

    2024-01-11T08:12:58.593475  / # . /lava-416233/environment/lava-416233/=
bin/lava-test-runner /lava-416233/1
    2024-01-11T08:12:58.594547  =

    2024-01-11T08:12:58.598659  / # /lava-416233/bin/lava-test-runner /lava=
-416233/1
    2024-01-11T08:12:58.699805  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-11T08:12:58.700161  + cd /lava-416233/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/659fa321153ab1354352a40d
        failing since 31 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-11T08:13:01.458731  /lava-416233/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 2          =


  Details:     https://kernelci.org/test/plan/id/659fa04e49fe40817752a41f

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/659fa04e49fe408=
17752a422
        failing since 36 days (last pass: next-20231120, first fail: next-2=
0231205)
        2 lines

    2024-01-11T08:01:07.923344  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2024-01-11T08:01:07.923733  kern  :alert : Data abort info:
    2024-01-11T08:01:07.961370  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004, ISS2 =3D 0x00000000
    2024-01-11T08:01:07.962215  kern  :alert :   CM =3D 0, WnR =3D 0, TnD =
=3D 0, TagAccess =3D 0
    2024-01-11T08:01:07.963464  kern  :alert :   GCS =3D 0, Overlay =3D 0, =
DirtyBit =3D 0, Xs =3D 0
    2024-01-11T08:01:07.964445  kern  :alert : [cccccccccccccccc] address b=
etween user and kernel address ranges
    2024-01-11T08:01:07.966797  kern  :emerg : In<8>[   20.010092] <LAVA_SI=
GNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D2>
    2024-01-11T08:01:07.967376  ternal error: Oops: <8>[   20.019910] <LAVA=
_SIGNAL_ENDRUN 0_dmesg 3906383_1.5.2.4.1>
    2024-01-11T08:01:07.967913  0000000096000004 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/659fa04e49fe408=
17752a423
        failing since 36 days (last pass: next-20231120, first fail: next-2=
0231205)
        12 lines

    2024-01-11T08:01:07.918998  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address cccccccccccccccc
    2024-01-11T08:01:07.919599  kern  :alert : Mem abort info:
    2024-01-11T08:01:07.920006  kern  :alert :   ESR =3D 0x0000000096000004
    2024-01-11T08:01:07.920365  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2024-01-11T08:01:07.920664  kern  :alert :   SET =3D 0, FnV =3D<8>[   1=
9.966650] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3D=
lines MEASUREMENT=3D12>
    2024-01-11T08:01:07.920951   0
    2024-01-11T08:01:07.921248  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/659f9bc0ba054b162152a404

  Results:     48 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/659f9bc0ba054b1=
62152a407
        new failure (last pass: next-20240109)
        2 lines

    2024-01-11T07:41:08.671335  <3>[   28.378830] mmc0: error -84 whilst in=
itialising SD card
    2024-01-11T07:41:08.671624  kern  :emerg : Internal error: Oops - BUG: =
00000000f2000800 [#1] PREEMPT SMP
    2024-01-11T07:41:08.674440  kern  :emerg : Code: d2800027 d2e02809 f2e0=
0807 17ffffda (d4210000) =

    2024-01-11T07:41:08.752272  <8>[   28.458252] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2024-01-11T07:41:08.752565  + set +x
    2024-01-11T07:41:08.752731  <8>[   28.471454] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3906326_1.5.2.4.1>   =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/659f9bc0ba054b16=
2152a409
        new failure (last pass: next-20240109)
        1 lines

    2024-01-11T07:41:07.285675  / # =

    2024-01-11T07:41:07.291079  =

    2024-01-11T07:41:07.412616  / # #
    2024-01-11T07:41:07.419068  #
    2024-01-11T07:41:07.537159  / # export SHELL=3D/bin/sh
    2024-01-11T07:41:07.546850  export SHELL=3D/bin/sh
    2024-01-11T07:41:07.648420  / # . /lava-3906326/environment
    2024-01-11T07:41:07.658638  . /lava-3906326/environment
    2024-01-11T07:41:07.760257  / # /lava-3906326/bin/lava-test-runner /lav=
a-3906326/0
    2024-01-11T07:41:07.770728  /lava-3906326/bin/lava-test-runner /lava-39=
06326/0 =

    ... (8 line(s) more)  =


  * baseline.bootrr.meson8b-dwmac-driver-present: https://kernelci.org/test=
/case/id/659f9bc0ba054b162152a430
        new failure (last pass: next-20240109)

    2024-01-11T07:41:12.576552  /lava-3906326/1/../bin/lava-test-case
    2024-01-11T07:41:12.651581  <8>[   32.374724] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmeson8b-dwmac-driver-present RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/659fa127300faae31752a415

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659fa127300faae31752a=
416
        failing since 337 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/659f9f2a81a2e31fe552a3f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659f9f2a81a2e31fe552a=
3f5
        failing since 337 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/659f9f08f61a792ca952a40c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-=
cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-=
cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659f9f08f61a792ca952a=
40d
        failing since 337 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/659f988e46fe2debbe52a402

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659f988e46fe2debbe52a=
403
        failing since 20 days (last pass: next-20231220, first fail: next-2=
0231221) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | clang-17 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/659fa45db5303fa7b852a49c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659fa45db5303fa7b852a4a5
        failing since 136 days (last pass: next-20230710, first fail: next-=
20230828)

    2024-01-11T08:18:17.937376  + set +x
    2024-01-11T08:18:17.940467  <8>[   28.377528] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1073745_1.5.2.4.1>
    2024-01-11T08:18:18.047183  / # #
    2024-01-11T08:18:19.502384  export SHELL=3D/bin/sh
    2024-01-11T08:18:19.522800  #
    2024-01-11T08:18:19.523024  / # export SHELL=3D/bin/sh
    2024-01-11T08:18:21.469084  / # . /lava-1073745/environment
    2024-01-11T08:18:25.051507  /lava-1073745/bin/lava-test-runner /lava-10=
73745/1
    2024-01-11T08:18:25.072311  . /lava-1073745/environment
    2024-01-11T08:18:25.072511  / # /lava-1073745/bin/lava-test-runner /lav=
a-1073745/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659fa719cc0ff59ad252a3fa

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659fa719cc0ff59ad252a403
        failing since 163 days (last pass: next-20230712, first fail: next-=
20230801)

    2024-01-11T08:30:01.857551  + set +x
    2024-01-11T08:30:01.860638  <8>[   28.498382] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1073758_1.5.2.4.1>
    2024-01-11T08:30:01.966935  / # #
    2024-01-11T08:30:03.422612  export SHELL=3D/bin/sh
    2024-01-11T08:30:03.443048  #
    2024-01-11T08:30:03.443258  / # export SHELL=3D/bin/sh
    2024-01-11T08:30:05.389429  / # . /lava-1073758/environment
    2024-01-11T08:30:08.971169  /lava-1073758/bin/lava-test-runner /lava-10=
73758/1
    2024-01-11T08:30:08.991809  . /lava-1073758/environment
    2024-01-11T08:30:08.991955  / # /lava-1073758/bin/lava-test-runner /lav=
a-1073758/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659f9c8b4636e8d16d52a3fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659f9c8b4636e8d16d52a=
3fd
        failing since 414 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659f9b8701a6387ae552a41a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659f9b8701a6387ae552a=
41b
        failing since 414 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/659f9f3045287db21a52a3ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plu=
s.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plu=
s.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659f9f3045287db21a52a=
400
        failing since 89 days (last pass: next-20230125, first fail: next-2=
0231013) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/659f9f09ec7bdc65e652a405

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659f9f09ec7bdc65e652a=
406
        failing since 335 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/659f9f0bf428d8259652a410

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659f9f0bf428d8259652a=
411
        failing since 335 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | clang-17 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/659fa4be4a4d22a00452a3f1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659fa4bf4a4d22a00452a3fa
        failing since 218 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-01-11T08:19:56.802719  / # #
    2024-01-11T08:19:56.904088  export SHELL=3D/bin/sh
    2024-01-11T08:19:56.904484  #
    2024-01-11T08:19:57.005263  / # export SHELL=3D/bin/sh. /lava-3906497/e=
nvironment
    2024-01-11T08:19:57.005711  =

    2024-01-11T08:19:57.106533  / # . /lava-3906497/environment/lava-390649=
7/bin/lava-test-runner /lava-3906497/1
    2024-01-11T08:19:57.107163  =

    2024-01-11T08:19:57.148036  / # /lava-3906497/bin/lava-test-runner /lav=
a-3906497/1
    2024-01-11T08:19:57.236421  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-11T08:19:57.236853  + cd /lava-3906497/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | clang-17 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/659fa4e44a4d22a00452a425

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659fa4e44a4d22a00452a42e
        failing since 218 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-01-11T08:20:14.537514  + set +x
    2024-01-11T08:20:14.539268  [   21.944556] <LAVA_SIGNAL_ENDRUN 0_dmesg =
451925_1.5.2.4.1>
    2024-01-11T08:20:14.648272  / # #
    2024-01-11T08:20:14.749881  export SHELL=3D/bin/sh
    2024-01-11T08:20:14.750386  #
    2024-01-11T08:20:14.851304  / # export SHELL=3D/bin/sh. /lava-451925/en=
vironment
    2024-01-11T08:20:14.851805  =

    2024-01-11T08:20:14.952734  / # . /lava-451925/environment/lava-451925/=
bin/lava-test-runner /lava-451925/1
    2024-01-11T08:20:14.953497  =

    2024-01-11T08:20:14.957324  / # /lava-451925/bin/lava-test-runner /lava=
-451925/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/659f9c3f7d8eaedd7952a4f5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659f9c3f7d8eaedd7952a4fe
        failing since 224 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-01-11T07:43:25.646795  <8>[   15.730861] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3906366_1.5.2.4.1>
    2024-01-11T07:43:25.754575  / # #
    2024-01-11T07:43:25.856832  export SHELL=3D/bin/sh
    2024-01-11T07:43:25.857608  #
    2024-01-11T07:43:25.958957  / # export SHELL=3D/bin/sh. /lava-3906366/e=
nvironment
    2024-01-11T07:43:25.960072  =

    2024-01-11T07:43:26.061622  / # . /lava-3906366/environment/lava-390636=
6/bin/lava-test-runner /lava-3906366/1
    2024-01-11T07:43:26.063281  =

    2024-01-11T07:43:26.079414  / # /lava-3906366/bin/lava-test-runner /lav=
a-3906366/1
    2024-01-11T07:43:26.190952  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659f9ebc1d0af2421352a42f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659f9ebc1d0af2421352a438
        failing since 218 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-01-11T07:54:24.224611  + set +x
    2024-01-11T07:54:24.226018  <8>[   13.760833] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3906394_1.5.2.4.1>
    2024-01-11T07:54:24.332919  / # #
    2024-01-11T07:54:24.435426  export SHELL=3D/bin/sh
    2024-01-11T07:54:24.436269  #
    2024-01-11T07:54:24.537654  / # export SHELL=3D/bin/sh. /lava-3906394/e=
nvironment
    2024-01-11T07:54:24.538648  =

    2024-01-11T07:54:24.640196  / # . /lava-3906394/environment/lava-390639=
4/bin/lava-test-runner /lava-3906394/1
    2024-01-11T07:54:24.640693  =

    2024-01-11T07:54:24.657249  / # /lava-3906394/bin/lava-test-runner /lav=
a-3906394/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/659f9f878399d2ebf452a3fa

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659f9f878399d2ebf452a402
        failing since 218 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-01-11T07:57:35.175065  / # #
    2024-01-11T07:57:35.276129  export SHELL=3D/bin/sh
    2024-01-11T07:57:35.276465  #
    2024-01-11T07:57:35.377160  / # export SHELL=3D/bin/sh. /lava-3906403/e=
nvironment
    2024-01-11T07:57:35.377508  =

    2024-01-11T07:57:35.478180  / # . /lava-3906403/environment/lava-390640=
3/bin/lava-test-runner /lava-3906403/1
    2024-01-11T07:57:35.479033  =

    2024-01-11T07:57:35.500283  / # /lava-3906403/bin/lava-test-runner /lav=
a-3906403/1
    2024-01-11T07:57:35.620015  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-11T07:57:35.625969  + cd /lava-3906403/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/659f9c2a7d8eaedd7952a460

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659f9c2a7d8eaedd7952a469
        failing since 224 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-01-11T07:43:09.874824  + set +x
    2024-01-11T07:43:09.876596  [   21.389373] <LAVA_SIGNAL_ENDRUN 0_dmesg =
451894_1.5.2.4.1>
    2024-01-11T07:43:09.984754  / # #
    2024-01-11T07:43:10.086275  export SHELL=3D/bin/sh
    2024-01-11T07:43:10.086797  #
    2024-01-11T07:43:10.187769  / # export SHELL=3D/bin/sh. /lava-451894/en=
vironment
    2024-01-11T07:43:10.188278  =

    2024-01-11T07:43:10.289371  / # . /lava-451894/environment/lava-451894/=
bin/lava-test-runner /lava-451894/1
    2024-01-11T07:43:10.290332  =

    2024-01-11T07:43:10.293073  / # /lava-451894/bin/lava-test-runner /lava=
-451894/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659f9fa8af3117682d52a3f1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659f9fa8af3117682d52a3fa
        failing since 218 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-01-11T07:58:00.875175  + set +x
    2024-01-11T07:58:00.876943  [   20.749535] <LAVA_SIGNAL_ENDRUN 0_dmesg =
451907_1.5.2.4.1>
    2024-01-11T07:58:00.985429  / # #
    2024-01-11T07:58:01.087137  export SHELL=3D/bin/sh
    2024-01-11T07:58:01.087660  #
    2024-01-11T07:58:01.188629  / # export SHELL=3D/bin/sh. /lava-451907/en=
vironment
    2024-01-11T07:58:01.189171  =

    2024-01-11T07:58:01.290170  / # . /lava-451907/environment/lava-451907/=
bin/lava-test-runner /lava-451907/1
    2024-01-11T07:58:01.290995  =

    2024-01-11T07:58:01.293601  / # /lava-451907/bin/lava-test-runner /lava=
-451907/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/659fa00cfc246b4a4952a3f1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240111/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659fa00cfc246b4a4952a3fa
        failing since 218 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-01-11T07:59:50.831633  + set +x
    2024-01-11T07:59:50.833397  [   19.444575] <LAVA_SIGNAL_ENDRUN 0_dmesg =
451910_1.5.2.4.1>
    2024-01-11T07:59:50.943892  / # #
    2024-01-11T07:59:51.045479  export SHELL=3D/bin/sh
    2024-01-11T07:59:51.046008  #
    2024-01-11T07:59:51.146976  / # export SHELL=3D/bin/sh. /lava-451910/en=
vironment
    2024-01-11T07:59:51.147493  =

    2024-01-11T07:59:51.248490  / # . /lava-451910/environment/lava-451910/=
bin/lava-test-runner /lava-451910/1
    2024-01-11T07:59:51.249321  =

    2024-01-11T07:59:51.252053  / # /lava-451910/bin/lava-test-runner /lava=
-451910/1 =

    ... (12 line(s) more)  =

 =20

