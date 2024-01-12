Return-Path: <linux-next+bounces-741-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3933D82BC6B
	for <lists+linux-next@lfdr.de>; Fri, 12 Jan 2024 09:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61361B24945
	for <lists+linux-next@lfdr.de>; Fri, 12 Jan 2024 08:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34A517987;
	Fri, 12 Jan 2024 08:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="PVSEGTzu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E7A15AC0
	for <linux-next@vger.kernel.org>; Fri, 12 Jan 2024 08:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d420aaa2abso39241515ad.3
        for <linux-next@vger.kernel.org>; Fri, 12 Jan 2024 00:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705048570; x=1705653370; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1sfzSrY4WspStdQJKL4vXdTfKtO8tZtEs02kCyfCkDQ=;
        b=PVSEGTzu33K7FOkuGqvJ4EZHbkAv1aWsD/j9K6rAe+iCagKegVR6JIJXhDeabK0Sq5
         vlus4x5xhFM9RuA7W/fpJ2IMpoQ6wpFxovnPoOLnSqv00jBeXvGi3LH4rQSRpjO2H2bK
         ly02j1QC8UF08+imyMIgXrI1ypRO98iTNAkfKTq0Hy8jnW8RmrPy7788vTeebwJPPt4R
         wGelzzEAcdo3HI+cYRo76qCAVkRjRWFRntfOTkA+PgvsK5JGVJJ19J4I3x+yFWEexQfB
         H5xuVIjLS8rKNK3g5UwhxWVcxlpgAsjVltHppQmwgy4eoEzTrqwd05x1exLdCSJYcLoX
         PJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705048570; x=1705653370;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1sfzSrY4WspStdQJKL4vXdTfKtO8tZtEs02kCyfCkDQ=;
        b=VHH5F4zf7rgrPhHQXb/JDq8j7nY/z52TshXwTC3+a72XpWOVNKyZO9BW981vElrdNZ
         EwOECu5vdsUAfFxj12N+DWnyIV+0NbXpUUtkof2DBdKGGSz732rs8sVSvCLrs0jTVGn4
         jQy18mfl4M8i2JopBqE2kNT+i4jrbjxLkdrMhOoCYntrtmle3ZQf+V30UATJuCx23Nei
         bRpG+yuoaqAGMnPSoUl/YUsGRbv6MuSXK7iTWD584b5Pic6wmoC+oKBoMCDpZY2YeiT+
         ZCx8TPycGb6no9gIUfL4EyWcm+xn0Kng94oUzhZEppWDaPqiHuvgA1kAxMAdiPAn+3f9
         iPBg==
X-Gm-Message-State: AOJu0YyeR9yCGbi+lxe7z45d2sY4IvIPdzGm6xEDsNsBUwsT12/LN18w
	+PlTs5cVHgw5U96cWv/9E+61+HVm11Z9BKXHQASnPAo+mJYMQA==
X-Google-Smtp-Source: AGHT+IHUs1iRhJVoDuWL2kLwzD2BPC/BNA9UUAj6jpGRCCYytbamF+L7dN4xpgDFdREndS6ksH8kwA==
X-Received: by 2002:a17:903:11d2:b0:1d4:e0dd:1510 with SMTP id q18-20020a17090311d200b001d4e0dd1510mr550142plh.48.1705048569317;
        Fri, 12 Jan 2024 00:36:09 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id v3-20020a170902d68300b001d49e742d51sm2564469ply.30.2024.01.12.00.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 00:36:08 -0800 (PST)
Message-ID: <65a0f9f8.170a0220.5764e.7e88@mx.google.com>
Date: Fri, 12 Jan 2024 00:36:08 -0800 (PST)
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
X-Kernelci-Kernel: next-20240112
X-Kernelci-Report-Type: test
Subject: next/master baseline: 313 runs, 31 regressions (next-20240112)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 313 runs, 31 regressions (next-20240112)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
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

beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defconfig           | 1          =

beaglebone-black             | arm   | lab-cip       | gcc-10   | omap2plus=
_defconfig          | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

k3-am625-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =

k3-j721e-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 2          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =

mt8195-cherry-tomato-r2      | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+videodec           | 1          =

rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3399-rock-pi-4b            | arm64 | lab-collabora | gcc-10   | defconfig=
                    | 1          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
+kselftest          | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240112/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240112
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      8d04a7e2ee3fd6aabb8096b00c64db0d735bc874 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0bcdc1ae8d9b6f352a3fb

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/65a0bcdc1ae8d9b6f352a41b
        failing since 220 days (last pass: next-20230601, first fail: next-=
20230605)

    2024-01-12T04:15:14.970487  /lava-450883/1/../bin/lava-test-case
    2024-01-12T04:15:15.013136  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | multi_v5_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0be30e74d30e85052a41c

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/65a0be30e74d30e85052a437
        failing since 220 days (last pass: next-20230601, first fail: next-=
20230605)

    2024-01-12T04:20:39.151356  /lava-450892/1/../bin/lava-test-case
    2024-01-12T04:20:39.192427  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0bbc249ac6782c352a400

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a0bbc249ac6782c352a=
401
        failing since 220 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0c499f0093c3af952a3f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a0c499f0093c3af952a=
3fa
        failing since 289 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0c58a5e17c85ca952a3f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a0c58a5e17c85ca952a=
3f9
        failing since 286 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-10   | omap2plus=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0c42009cea28dbd52a425

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a0c42009cea28dbd52a=
426
        failing since 0 day (last pass: next-20240109, first fail: next-202=
40111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0c5fd12a7b6731552a402

  Results:     40 PASS, 9 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/65a0c5fd12a7b673=
1552a407
        new failure (last pass: next-20240111)
        1 lines

    2024-01-12T04:53:49.293473  / # =

    2024-01-12T04:53:49.303987  =

    2024-01-12T04:53:49.406136  / # #
    2024-01-12T04:53:49.415945  #
    2024-01-12T04:53:49.516767  / # export SHELL=3D/bin/sh
    2024-01-12T04:53:49.527872  export SHELL=3D/bin/sh
    2024-01-12T04:53:49.628621  / # . /lava-1074665/environment
    2024-01-12T04:53:49.639826  . /lava-1074665/environment
    2024-01-12T04:53:49.740802  / # /lava-1074665/bin/lava-test-runner /lav=
a-1074665/0
    2024-01-12T04:53:49.751708  /lava-1074665/bin/lava-test-runner /lava-10=
74665/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | omap2plus=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0cd9130062924de52a3f1

  Results:     51 PASS, 4 FAIL, 1 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/65a0cd9130062924=
de52a3f6
        failing since 0 day (last pass: next-20240109, first fail: next-202=
40111)
        1 lines

    2024-01-12T05:26:29.408489  / # =

    2024-01-12T05:26:29.420346  =

    2024-01-12T05:26:29.522731  / # #
    2024-01-12T05:26:29.532200  #
    2024-01-12T05:26:29.633126  / # export SHELL=3D/bin/sh
    2024-01-12T05:26:29.644126  export SHELL=3D/bin/sh
    2024-01-12T05:26:29.745322  / # . /lava-1074715/environment
    2024-01-12T05:26:29.756034  . /lava-1074715/environment
    2024-01-12T05:26:29.857036  / # /lava-1074715/bin/lava-test-runner /lav=
a-1074715/0
    2024-01-12T05:26:29.867868  /lava-1074715/bin/lava-test-runner /lava-10=
74715/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0b931324a90a9c352a4fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a0b931324a90a9c352a=
4fe
        failing since 640 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
k3-am625-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0bdd1f7f949735d52a43b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a0bdd1f7f949735d52a=
43c
        failing since 63 days (last pass: next-20231103, first fail: next-2=
0231110) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
k3-j721e-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0bdcff7f949735d52a438

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-j721e-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-j721e-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a0bdcff7f949735d52a=
439
        failing since 70 days (last pass: next-20231025, first fail: next-2=
0231103) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 2          =


  Details:     https://kernelci.org/test/plan/id/65a0bd5d80cc74f61f52a421

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65a0bd5d80cc74f=
61f52a424
        failing since 37 days (last pass: next-20231120, first fail: next-2=
0231205)
        2 lines

    2024-01-12T04:17:19.120661  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004, ISS2 =3D 0x00000000
    2024-01-12T04:17:19.121346  kern  :alert :   CM =3D 0, WnR =3D 0, TnD =
=3D 0, TagAccess =3D 0
    2024-01-12T04:17:19.121852  kern  :alert :   GCS =3D 0, Overlay =3D 0, =
DirtyBit =3D 0, Xs =3D 0
    2024-01-12T04:17:19.122344  kern  :alert : [cccccccccccccccc] address b=
etween user a<8>[   19.726285] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg R=
ESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2024-01-12T04:17:19.122688  nd kernel address ranges
    2024-01-12T04:17:19.123002  kern  :emerg :<8>[   19.737850] <LAVA_SIGNA=
L_ENDRUN 0_dmesg 3907396_1.5.2.4.1>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/65a0bd5d80cc74f=
61f52a425
        failing since 37 days (last pass: next-20231120, first fail: next-2=
0231205)
        12 lines

    2024-01-12T04:17:19.077085  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address cccccccccccccccc
    2024-01-12T04:17:19.077674  kern  :alert : Mem abort info:
    2024-01-12T04:17:19.078410  kern  :alert :   ESR =3D 0x0000000096000<8>=
[   19.678931] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNI=
TS=3Dlines MEASUREMENT=3D12>
    2024-01-12T04:17:19.078782  004
    2024-01-12T04:17:19.079175  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2024-01-12T04:17:19.079587  kern  :alert :   SET =3D 0, FnV =3D 0
    2024-01-12T04:17:19.079965  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2024-01-12T04:17:19.080485  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2024-01-12T04:17:19.080845  kern  :alert : Data abort info:   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0be46440d105d0752a3f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a0be46440d105d0752a=
3f2
        failing since 338 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0bd08c60df6439052a3fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a0bd08c60df6439052a=
3ff
        failing since 338 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0bcf01ae8d9b6f352a476

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-=
cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-=
cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a0bcf01ae8d9b6f352a=
477
        failing since 338 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8195-cherry-tomato-r2      | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0c2e11a6502a3c652a501

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8195-=
cherry-tomato-r2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8195-=
cherry-tomato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a0c2e11a6502a3c652a=
502
        new failure (last pass: next-20240110) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0b83dcb3486197e52a3fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a0b83dcb3486197e52a=
3fb
        failing since 21 days (last pass: next-20231220, first fail: next-2=
0231221) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0bd3d10b7dd677f52a3f8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a0bd3d10b7dd677f52a401
        failing since 156 days (last pass: next-20230710, first fail: next-=
20230808)

    2024-01-12T04:16:49.720648  + set +x
    2024-01-12T04:16:49.723978  <8>[   28.561480] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1074634_1.5.2.4.1>
    2024-01-12T04:16:49.832268  / # #
    2024-01-12T04:16:51.289168  export SHELL=3D/bin/sh
    2024-01-12T04:16:51.309954  #
    2024-01-12T04:16:51.310367  / # export SHELL=3D/bin/sh
    2024-01-12T04:16:53.258646  / # . /lava-1074634/environment
    2024-01-12T04:16:56.842834  /lava-1074634/bin/lava-test-runner /lava-10=
74634/1
    2024-01-12T04:16:56.864017  . /lava-1074634/environment
    2024-01-12T04:16:56.864342  / # /lava-1074634/bin/lava-test-runner /lav=
a-1074634/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0ba32a97729098052a3f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a0ba32a97729098052a=
3f2
        failing since 415 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0b92e72649cd01d52a404

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a0b92e72649cd01d52a=
405
        failing since 415 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0c18a465ff4827b52a459

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a0c18a465ff4827b52a=
45a
        new failure (last pass: next-20240111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0bd699f2317f65b52a40b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plu=
s.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plu=
s.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a0bd699f2317f65b52a=
40c
        failing since 90 days (last pass: next-20230125, first fail: next-2=
0231013) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0bd187368d6383f52a3f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a0bd187368d6383f52a=
3f8
        failing since 335 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0bcda0c64dc38e452a425

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a0bcda0c64dc38e452a=
426
        failing since 335 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0bf3a87c3a11d0252a473

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a0bf3a87c3a11d0252a47c
        failing since 224 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-01-12T04:25:05.274309  =

    2024-01-12T04:25:05.375137  / # #export SHELL=3D/bin/sh
    2024-01-12T04:25:05.375501  =

    2024-01-12T04:25:05.476252  / # e. /lava-3907415/environment
    2024-01-12T04:25:05.476773  xport SHELL=3D/bin/sh
    2024-01-12T04:25:05.577940  / # . /lava-3907415/environment/lava-390741=
5/bin/lava-test-runner /lava-3907415/1
    2024-01-12T04:25:05.579378  =

    2024-01-12T04:25:05.620638  / # /lava-3907415/bin/lava-test-runner /lav=
a-3907415/1
    2024-01-12T04:25:05.668058  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-12T04:25:05.702702  + cd /lava-3907415/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0c2ac7303fd90cc52a401

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a0c2ac7303fd90cc52a40a
        failing since 218 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-01-12T04:39:39.478143  / # #
    2024-01-12T04:39:39.580674  export SHELL=3D/bin/sh
    2024-01-12T04:39:39.581791  #
    2024-01-12T04:39:39.683278  / # export SHELL=3D/bin/sh. /lava-3907460/e=
nvironment
    2024-01-12T04:39:39.684144  =

    2024-01-12T04:39:39.785611  / # . /lava-3907460/environment/lava-390746=
0/bin/lava-test-runner /lava-3907460/1
    2024-01-12T04:39:39.786218  =

    2024-01-12T04:39:39.802331  / # /lava-3907460/bin/lava-test-runner /lav=
a-3907460/1
    2024-01-12T04:39:39.916668  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-12T04:39:39.917998  + cd /lava-3907460/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0c458c4232cb49d52a478

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a0c458c4232cb49d52a481
        failing since 218 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-01-12T04:47:12.114295  / # #
    2024-01-12T04:47:12.217242  export SHELL=3D/bin/sh
    2024-01-12T04:47:12.218076  #
    2024-01-12T04:47:12.319360  / # export SHELL=3D/bin/sh. /lava-3907464/e=
nvironment
    2024-01-12T04:47:12.319832  =

    2024-01-12T04:47:12.420917  / # . /lava-3907464/environment/lava-390746=
4/bin/lava-test-runner /lava-3907464/1
    2024-01-12T04:47:12.422323  =

    2024-01-12T04:47:12.437098  / # /lava-3907464/bin/lava-test-runner /lav=
a-3907464/1
    2024-01-12T04:47:12.557607  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-12T04:47:12.558227  + cd /lava-3907464/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0bf21854e6dc37d52a445

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a0bf21854e6dc37d52a44e
        failing since 224 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-01-12T04:24:46.345433  + set +x[   21.606998] <LAVA_SIGNAL_ENDRUN =
0_dmesg 452214_1.5.2.4.1>
    2024-01-12T04:24:46.345767  =

    2024-01-12T04:24:46.453818  / # #
    2024-01-12T04:24:46.555535  export SHELL=3D/bin/sh
    2024-01-12T04:24:46.556220  #
    2024-01-12T04:24:46.657263  / # export SHELL=3D/bin/sh. /lava-452214/en=
vironment
    2024-01-12T04:24:46.657953  =

    2024-01-12T04:24:46.759020  / # . /lava-452214/environment/lava-452214/=
bin/lava-test-runner /lava-452214/1
    2024-01-12T04:24:46.759996  =

    2024-01-12T04:24:46.762767  / # /lava-452214/bin/lava-test-runner /lava=
-452214/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0c2ce0419f46b1252a40f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a0c2ce0419f46b1252a418
        failing since 218 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-01-12T04:40:26.777159  + set +x
    2024-01-12T04:40:26.778932  [   22.168552] <LAVA_SIGNAL_ENDRUN 0_dmesg =
452229_1.5.2.4.1>
    2024-01-12T04:40:26.886028  / # #
    2024-01-12T04:40:26.987374  export SHELL=3D/bin/sh
    2024-01-12T04:40:26.987949  #
    2024-01-12T04:40:27.088763  / # export SHELL=3D/bin/sh. /lava-452229/en=
vironment
    2024-01-12T04:40:27.089332  =

    2024-01-12T04:40:27.190164  / # . /lava-452229/environment/lava-452229/=
bin/lava-test-runner /lava-452229/1
    2024-01-12T04:40:27.190974  =

    2024-01-12T04:40:27.193410  / # /lava-452229/bin/lava-test-runner /lava=
-452229/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65a0c47308c1fea8c852a402

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240112/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240112/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a0c47308c1fea8c852a40b
        failing since 218 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-01-12T04:47:22.243363  + set +x
    2024-01-12T04:47:22.245168  [   19.527312] <LAVA_SIGNAL_ENDRUN 0_dmesg =
452233_1.5.2.4.1>
    2024-01-12T04:47:22.353194  / # #
    2024-01-12T04:47:22.454704  export SHELL=3D/bin/sh
    2024-01-12T04:47:22.455234  #
    2024-01-12T04:47:22.556197  / # export SHELL=3D/bin/sh. /lava-452233/en=
vironment
    2024-01-12T04:47:22.556716  =

    2024-01-12T04:47:22.657777  / # . /lava-452233/environment/lava-452233/=
bin/lava-test-runner /lava-452233/1
    2024-01-12T04:47:22.658735  =

    2024-01-12T04:47:22.661612  / # /lava-452233/bin/lava-test-runner /lava=
-452233/1 =

    ... (12 line(s) more)  =

 =20

