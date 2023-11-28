Return-Path: <linux-next+bounces-104-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B72F37FC44B
	for <lists+linux-next@lfdr.de>; Tue, 28 Nov 2023 20:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D4AB2826AB
	for <lists+linux-next@lfdr.de>; Tue, 28 Nov 2023 19:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395A946BBB;
	Tue, 28 Nov 2023 19:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="GMYEBPKy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A300F10E7
	for <linux-next@vger.kernel.org>; Tue, 28 Nov 2023 11:33:26 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3b837d974ecso3654776b6e.2
        for <linux-next@vger.kernel.org>; Tue, 28 Nov 2023 11:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701200005; x=1701804805; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IPmb7SdsfaBlDa0P3/h0HArQNeiSmQihiwteCWorIhg=;
        b=GMYEBPKyzT1+Y7egzUxyF1X8SCPmqJN8agya11CNx4qHmS0nsV6yH9FZrHkUkKN9P3
         PUaFYkYmYE99TqRvqiYJ51YLPbod4uZOXuoBVB5mb2azS5Li/bzIvkWhlR0bMYn5wRL9
         sYcXHef38fZpMVsGeOfhYtfGFT/6J72sEVUGxWhvZ7xUIavDtTC4U4OpRXlgLcYv0BY7
         GJTZW+elX3R6G1lxR4fm3SjXY003nzrWZtyLgoIR9ZG65YZlJEH0WG+kWJpa6Q21vOeU
         FAxWKkrtO5X0UrVY7wKNOPXYwqNjMN0UeDBDhf/2WTTawHZhaj4vP313jq6F3LH/LSx4
         rwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701200005; x=1701804805;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IPmb7SdsfaBlDa0P3/h0HArQNeiSmQihiwteCWorIhg=;
        b=o/8wsYuKj5tMxCkjHbzDkbpqNnQ+p77FdQore4NnHob1BGLbnjgI+4VPLTQBLk4BRW
         7eIldbYGymtV1C05aY6y2j5lJeTWltGegKZYugwt1wWTDS1tcGWVlUZxlI9Cnxbf+jqB
         8xuwJ5Rc8pxGVIRVpj4n6L6mU46+T5SjcTia4PSY3WQ/VOw4Z9MuDZq2MLHdM2Yyxi3C
         MMIIEY7ZlLx548gJD4/+jpals+e3fuAdyWuBh71t7sWi/gN7a49fVf3jzEl1tN/2jG23
         FfuF/NRNpT/sWWmS9o0/E4D73R+UAuJE3PBM/DOYuhVYGvE8baZbtOfBhOE40p35bwe/
         S7/g==
X-Gm-Message-State: AOJu0YyM1B06XrOeoagWHcR0tjVfsTsTC5mM/BXVqXffKGTb8JpzOrRn
	pwgjC/JkHGWSOBXeCgnH8X/coyVQHJbXRjyO2S0=
X-Google-Smtp-Source: AGHT+IFMiV5twehhWPW7hTjvqbiFcgyITgd0hW4TBdMks8a84vy1SdBU9hukZJ8W2dksIm0lsLycvA==
X-Received: by 2002:a05:6808:c7:b0:3b8:37c8:865c with SMTP id t7-20020a05680800c700b003b837c8865cmr18153180oic.21.1701200005499;
        Tue, 28 Nov 2023 11:33:25 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id n38-20020a635c66000000b0057825bd3448sm9697564pgm.51.2023.11.28.11.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 11:33:24 -0800 (PST)
Message-ID: <65664084.630a0220.d4322.7c91@mx.google.com>
Date: Tue, 28 Nov 2023 11:33:24 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20231128
Subject: next/master baseline: 227 runs, 10 regressions (next-20231128)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 227 runs, 10 regressions (next-20231128)

Regressions Summary
-------------------

platform              | arch | lab           | compiler | defconfig        =
            | regressions
----------------------+------+---------------+----------+------------------=
------------+------------
at91sam9g20ek         | arm  | lab-broonie   | gcc-10   | at91_dt_defconfig=
            | 1          =

at91sam9g20ek         | arm  | lab-broonie   | gcc-10   | multi_v5_defconfi=
g           | 1          =

bcm2836-rpi-2-b       | arm  | lab-collabora | gcc-10   | bcm2835_defconfig=
            | 1          =

bcm2836-rpi-2-b       | arm  | lab-collabora | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =

imx6ul-14x14-evk      | arm  | lab-nxp       | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =

odroid-xu3            | arm  | lab-collabora | gcc-10   | exynos_defconfig =
            | 1          =

rk3288-rock2-square   | arm  | lab-collabora | gcc-10   | multi_v7_defc...G=
_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq     | arm  | lab-collabora | gcc-10   | multi_v7_defc...G=
_ARM_LPAE=3Dy | 1          =

sun7i-a20-cubieboard2 | arm  | lab-clabbe    | gcc-10   | multi_v7_defconfi=
g           | 1          =

sun7i-a20-cubieboard2 | arm  | lab-clabbe    | gcc-10   | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231128/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231128
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      8c87404c76c1911a7ec5b61bf3b2c3858cb95de1 =



Test Regressions
---------------- =



platform              | arch | lab           | compiler | defconfig        =
            | regressions
----------------------+------+---------------+----------+------------------=
------------+------------
at91sam9g20ek         | arm  | lab-broonie   | gcc-10   | at91_dt_defconfig=
            | 1          =


  Details:     https://kernelci.org/test/plan/id/6566073c2fc16999107e4a76

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231128/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231128/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/6566073c2fc16999107e4a94
        failing since 176 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-11-28T15:28:34.946946  /lava-282180/1/../bin/lava-test-case
    2023-11-28T15:28:34.987600  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform              | arch | lab           | compiler | defconfig        =
            | regressions
----------------------+------+---------------+----------+------------------=
------------+------------
at91sam9g20ek         | arm  | lab-broonie   | gcc-10   | multi_v5_defconfi=
g           | 1          =


  Details:     https://kernelci.org/test/plan/id/65660547cabc3767ec7e4a7e

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231128/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231128/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/65660547cabc3767ec7e4a9d
        failing since 176 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-11-28T15:20:20.993771  /lava-282090/1/../bin/lava-test-case
    2023-11-28T15:20:21.035514  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform              | arch | lab           | compiler | defconfig        =
            | regressions
----------------------+------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b       | arm  | lab-collabora | gcc-10   | bcm2835_defconfig=
            | 1          =


  Details:     https://kernelci.org/test/plan/id/656604540c5c6cd3f97e4a7a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231128/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231128/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656604540c5c6cd3f97e4=
a7b
        failing since 176 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform              | arch | lab           | compiler | defconfig        =
            | regressions
----------------------+------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b       | arm  | lab-collabora | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6566096913014cd89e7e4b24

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231128/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231128/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6566096913014cd89e7e4=
b25
        failing since 244 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform              | arch | lab           | compiler | defconfig        =
            | regressions
----------------------+------+---------------+----------+------------------=
------------+------------
imx6ul-14x14-evk      | arm  | lab-nxp       | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/65660259b0e814a9167e4af8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231128/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231128/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65660259b0e814a9167e4aff
        failing since 14 days (last pass: next-20230428, first fail: next-2=
0231114)

    2023-11-28T15:07:52.470668  + set +x
    2023-11-28T15:07:52.473825  <8>[   19.797120] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1261029_1.5.2.4.1>
    2023-11-28T15:07:52.585351  / # #
    2023-11-28T15:07:53.741309  export SHELL=3D/bin/sh
    2023-11-28T15:07:53.746920  #
    2023-11-28T15:07:55.289073  / # export SHELL=3D/bin/sh. /lava-1261029/e=
nvironment
    2023-11-28T15:07:55.294740  =

    2023-11-28T15:07:58.106787  / # . /lava-1261029/environment/lava-126102=
9/bin/lava-test-runner /lava-1261029/1
    2023-11-28T15:07:58.112807  =

    2023-11-28T15:07:58.115348  / # /lava-1261029/bin/lava-test-runner /lav=
a-1261029/1 =

    ... (12 line(s) more)  =

 =



platform              | arch | lab           | compiler | defconfig        =
            | regressions
----------------------+------+---------------+----------+------------------=
------------+------------
odroid-xu3            | arm  | lab-collabora | gcc-10   | exynos_defconfig =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/656607252c495cff7e7e4a6f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231128/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231128/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656607252c495cff7e7e4=
a70
        failing since 14 days (last pass: next-20230621, first fail: next-2=
0231114) =

 =



platform              | arch | lab           | compiler | defconfig        =
            | regressions
----------------------+------+---------------+----------+------------------=
------------+------------
rk3288-rock2-square   | arm  | lab-collabora | gcc-10   | multi_v7_defc...G=
_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65660a59b0c7ef71a17e4ae7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231128/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231128/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65660a59b0c7ef71a17e4=
ae8
        failing since 371 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform              | arch | lab           | compiler | defconfig        =
            | regressions
----------------------+------+---------------+----------+------------------=
------------+------------
rk3288-veyron-jaq     | arm  | lab-collabora | gcc-10   | multi_v7_defc...G=
_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6566099149a27f7d537e4a82

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231128/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231128/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6566099149a27f7d537e4=
a83
        failing since 371 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform              | arch | lab           | compiler | defconfig        =
            | regressions
----------------------+------+---------------+----------+------------------=
------------+------------
sun7i-a20-cubieboard2 | arm  | lab-clabbe    | gcc-10   | multi_v7_defconfi=
g           | 1          =


  Details:     https://kernelci.org/test/plan/id/6566068fdfd4ddc07b7e4a6d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231128/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231128/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6566068fdfd4ddc07b7e4a76
        failing since 180 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-28T15:25:47.683437  + set +x
    2023-11-28T15:25:47.685199  [   19.566838] <LAVA_SIGNAL_ENDRUN 0_dmesg =
445618_1.5.2.4.1>
    2023-11-28T15:25:47.793925  / # #
    2023-11-28T15:25:47.895594  export SHELL=3D/bin/sh
    2023-11-28T15:25:47.896195  #
    2023-11-28T15:25:47.997194  / # export SHELL=3D/bin/sh. /lava-445618/en=
vironment
    2023-11-28T15:25:47.997825  =

    2023-11-28T15:25:48.098830  / # . /lava-445618/environment/lava-445618/=
bin/lava-test-runner /lava-445618/1
    2023-11-28T15:25:48.099733  =

    2023-11-28T15:25:48.102534  / # /lava-445618/bin/lava-test-runner /lava=
-445618/1 =

    ... (12 line(s) more)  =

 =



platform              | arch | lab           | compiler | defconfig        =
            | regressions
----------------------+------+---------------+----------+------------------=
------------+------------
sun7i-a20-cubieboard2 | arm  | lab-clabbe    | gcc-10   | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/656609c4a0b4233f9d7e4a79

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231128/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231128/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/656609c4a0b4233f9d7e4a82
        failing since 180 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-28T15:39:31.749469  + set +x
    2023-11-28T15:39:31.751560  [   24.097354] <LAVA_SIGNAL_ENDRUN 0_dmesg =
445631_1.5.2.4.1>
    2023-11-28T15:39:31.860427  / # #
    2023-11-28T15:39:31.962299  export SHELL=3D/bin/sh
    2023-11-28T15:39:31.962920  #
    2023-11-28T15:39:32.064039  / # export SHELL=3D/bin/sh. /lava-445631/en=
vironment
    2023-11-28T15:39:32.064683  =

    2023-11-28T15:39:32.165802  / # . /lava-445631/environment/lava-445631/=
bin/lava-test-runner /lava-445631/1
    2023-11-28T15:39:32.166870  =

    2023-11-28T15:39:32.169261  / # /lava-445631/bin/lava-test-runner /lava=
-445631/1 =

    ... (12 line(s) more)  =

 =20

