Return-Path: <linux-next+bounces-405-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AE68144BC
	for <lists+linux-next@lfdr.de>; Fri, 15 Dec 2023 10:39:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA1F01F236C1
	for <lists+linux-next@lfdr.de>; Fri, 15 Dec 2023 09:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A7818AE1;
	Fri, 15 Dec 2023 09:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Y+M7utqo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097D518AE8
	for <linux-next@vger.kernel.org>; Fri, 15 Dec 2023 09:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6d2350636d6so394078b3a.2
        for <linux-next@vger.kernel.org>; Fri, 15 Dec 2023 01:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702633154; x=1703237954; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F5jfVBsfmw2sl/iU3R4VL9eWoMUJee1a/bl7KPftgOc=;
        b=Y+M7utqoaJ71P30shKfMUh/WakjBgu5eo5/ZDEPX0J+qzeEyBWFRkHEwBGWw3+F0J8
         3Gfoc3dT1AH9iWBpFYyBxbz41UZSfOtu2HtU3Knv3Gs7ikpeVofRNsEH3otKhCQd2occ
         wnHhAxyyEg5hzuKzAy86iuSk5zFZt/u25xQ83ySE/8v4HeQXZHlCKSILf/M2pK/kj7JX
         L2lup5BLGJXxKGe8bUsuPPePKn/unJSMtCZ05LKNKC6kI44BrvjLRh8OwmiLPGeOVtmA
         Mkf2oswCz0jSA5VfyAoea8USHbvG9E5JJ/M4ecVIrsboAUnKwrpEv2xuuvTmmvux9mxX
         6ppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702633154; x=1703237954;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5jfVBsfmw2sl/iU3R4VL9eWoMUJee1a/bl7KPftgOc=;
        b=dGd/dXzZd6GJtfv4L0ZEXlyHs4DNrhgr2UYLwqBxDvaovFcrpF+S37f4ojXJ8VjLKt
         uoyFzH7fKoRp660kr7AK3oQoJlb/jc/62S3QRwZ37f9M8kNvWhSwm5wzEnQqZBln4I6R
         qPk62vkg8LAnCwr5XhnP/mtRjKI5CFUnY2wMd0kSAyqq9XUF1xlvfr/itUUtErhrKUYD
         aqX04Z7VMVKu8HtaPo23X4Ld7yQqkqCPTNM6Sazh6XONGwjzk4WRSWiLvmLShkn7rb20
         0co1oJDE2bRGT34T9ToTK6dCk3TY4/h3ltAH2BOpp4G+YC8CpGuhoHovBCvRHjROUuy6
         Lv5A==
X-Gm-Message-State: AOJu0Yz3JU7eV20zByR/oPwNysA/8cwDvbk1P1wL1ukkBFDyyaj+LY9A
	A831HlwLnEo2IHJHzInAVzX3xsvl+fs7cBxlzlw=
X-Google-Smtp-Source: AGHT+IHi5fjaq+AqSfORdlWVAn1cvyPRnuajvrauu1MORYM7DplVs9KL1moDNLTnodBWEDT22VfJ8Q==
X-Received: by 2002:a05:6a21:9989:b0:18c:4811:cf69 with SMTP id ve9-20020a056a21998900b0018c4811cf69mr15896873pzb.61.1702633153206;
        Fri, 15 Dec 2023 01:39:13 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id c12-20020aa7880c000000b006ce7ff254b9sm13104114pfo.68.2023.12.15.01.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 01:39:12 -0800 (PST)
Message-ID: <657c1ec0.a70a0220.7ebdd.9d71@mx.google.com>
Date: Fri, 15 Dec 2023 01:39:12 -0800 (PST)
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
X-Kernelci-Kernel: next-20231215
Subject: next/master baseline: 429 runs, 48 regressions (next-20231215)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 429 runs, 48 regressions (next-20231215)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
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

beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defconfig           | 1          =

beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

k3-am625-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =

k3-j721e-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 5          =

kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+kselftest          | 1          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 2          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

rk3399-rock-pi-4b            | arm64 | lab-collabora | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
+kselftest          | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =

sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231215/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231215
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      17cb8a20bde66a520a2ca7aad1063e1ce7382240 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | sama5_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/657bdd283c9e5d7ac8e134c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657bdd283c9e5d7ac8e13=
4c7
        failing since 317 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/657bdbda857b553e31e1347d

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/657bdbda857b553e31e134ad
        failing since 193 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-12-15T04:53:19.697662  /lava-356934/1/../bin/lava-test-case
    2023-12-15T04:53:19.738602  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | multi_v5_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/657be7576876dae37fe134be

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/657be7576876dae37fe134d8
        failing since 193 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-12-15T05:42:23.674030  /lava-357130/1/../bin/lava-test-case
    2023-12-15T05:42:23.715805  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/657bdfa4fbbc650f64e13486

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657bdfa4fbbc650f64e13=
487
        failing since 192 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657be226a0c8849270e134bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657be226a0c8849270e13=
4be
        failing since 261 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657be2eea491634bb8e1347c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657be2eea491634bb8e13=
47d
        failing since 258 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-10   | omap2plus=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/657be7a6e27fb4d8c6e1347d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657be7a6e27fb4d8c6e13=
47e
        failing since 1 day (last pass: next-20231212, first fail: next-202=
31213) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/657be17c993e6898bde1348f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657be17c993e6898bde13=
490
        new failure (last pass: next-20231214) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657beaa021042eb31de1347b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657beaa021042eb31de13=
47c
        new failure (last pass: next-20231214) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
k3-am625-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/657be34955b9815384e1347c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657be34955b9815384e13=
47d
        failing since 35 days (last pass: next-20231103, first fail: next-2=
0231110) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
k3-j721e-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/657be3a3b02ad1f679e13486

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-j721e-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-j721e-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657be3a3b02ad1f679e13=
487
        failing since 42 days (last pass: next-20231025, first fail: next-2=
0231103) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/657bdee75c97aca821e134e4

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657bdee75c97aca821e134eb
        failing since 3 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-15T05:06:23.946558  / # #
    2023-12-15T05:06:24.048616  export SHELL=3D/bin/sh
    2023-12-15T05:06:24.049359  #
    2023-12-15T05:06:24.150749  / # export SHELL=3D/bin/sh. /lava-406398/en=
vironment
    2023-12-15T05:06:24.151456  =

    2023-12-15T05:06:24.253013  / # . /lava-406398/environment/lava-406398/=
bin/lava-test-runner /lava-406398/1
    2023-12-15T05:06:24.254213  =

    2023-12-15T05:06:24.273764  / # /lava-406398/bin/lava-test-runner /lava=
-406398/1
    2023-12-15T05:06:24.318729  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-15T05:06:24.318940  + <8>[   20.632494] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 406398_1.5.2.4.5> =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/657bdee75c97aca821e134ef
        failing since 3 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-15T05:06:26.425280  /lava-406398/1/../bin/lava-test-case
    2023-12-15T05:06:26.425673  <8>[   22.739462] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-12-15T05:06:26.426022  /lava-406398/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
7bdee75c97aca821e134f1
        failing since 3 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-15T05:06:27.483890  /lava-406398/1/../bin/lava-test-case
    2023-12-15T05:06:27.484360  <8>[   23.777836] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-12-15T05:06:27.484737  /lava-406398/1/../bin/lava-test-case
    2023-12-15T05:06:27.485024  <8>[   23.795482] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/657bdee75c97aca821e134f6
        failing since 3 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-15T05:06:28.559237  /lava-406398/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/657bdee75c97aca821e134f7
        failing since 3 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-15T05:06:28.562557  <8>[   24.890927] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-15T05:06:29.619563  /lava-406398/1/../bin/lava-test-case
    2023-12-15T05:06:29.619738  <8>[   25.911790] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-12-15T05:06:29.619862  /lava-406398/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/657be309bafaf0f61de135ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657be309bafaf0f61de13=
5cb
        new failure (last pass: next-20231205) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/657be81e654161ffa3e13475

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657be81e654161ffa3e1347c
        failing since 1 day (last pass: next-20231208, first fail: next-202=
31213)

    2023-12-15T05:45:49.191520  <8>[   20.295336] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 406426_1.5.2.4.1>
    2023-12-15T05:45:49.296925  / # #
    2023-12-15T05:45:49.399052  export SHELL=3D/bin/sh
    2023-12-15T05:45:49.399777  #
    2023-12-15T05:45:49.501322  / # export SHELL=3D/bin/sh. /lava-406426/en=
vironment
    2023-12-15T05:45:49.502038  =

    2023-12-15T05:45:49.603441  / # . /lava-406426/environment/lava-406426/=
bin/lava-test-runner /lava-406426/1
    2023-12-15T05:45:49.604571  =

    2023-12-15T05:45:49.623159  / # /lava-406426/bin/lava-test-runner /lava=
-406426/1
    2023-12-15T05:45:49.667395  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/657be81e654161ffa3e13480
        failing since 1 day (last pass: next-20231208, first fail: next-202=
31213)

    2023-12-15T05:45:51.773781  /lava-406426/1/../bin/lava-test-case
    2023-12-15T05:45:51.773940  <8>[   22.860028] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-12-15T05:45:51.774063  /lava-406426/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
7be81f654161ffa3e13482
        failing since 1 day (last pass: next-20231208, first fail: next-202=
31213)

    2023-12-15T05:45:52.832611  /lava-406426/1/../bin/lava-test-case
    2023-12-15T05:45:52.833156  <8>[   23.899893] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-12-15T05:45:52.833428  /lava-406426/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/657be81f654161ffa3e13487
        failing since 1 day (last pass: next-20231208, first fail: next-202=
31213)

    2023-12-15T05:45:53.908982  /lava-406426/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/657be81f654161ffa3e13488
        failing since 1 day (last pass: next-20231208, first fail: next-202=
31213)

    2023-12-15T05:45:53.912329  <8>[   25.011982] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-15T05:45:54.970609  /lava-406426/1/../bin/lava-test-case
    2023-12-15T05:45:54.971108  <8>[   26.033451] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-12-15T05:45:54.971380  /lava-406426/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657be922adfa0f8158e134a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657be922adfa0f8158e13=
4aa
        failing since 1 day (last pass: next-20231208, first fail: next-202=
31213) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/657bdee55c97aca821e1347e

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657bdee55c97aca821e13485
        failing since 3 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-15T05:06:25.315999  / # #
    2023-12-15T05:06:25.418129  export SHELL=3D/bin/sh
    2023-12-15T05:06:25.418826  #
    2023-12-15T05:06:25.520348  / # export SHELL=3D/bin/sh. /lava-406397/en=
vironment
    2023-12-15T05:06:25.521089  =

    2023-12-15T05:06:25.622470  / # . /lava-406397/environment/lava-406397/=
bin/lava-test-runner /lava-406397/1
    2023-12-15T05:06:25.623605  =

    2023-12-15T05:06:25.643555  / # /lava-406397/bin/lava-test-runner /lava=
-406397/1
    2023-12-15T05:06:25.698457  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-15T05:06:25.698883  + <8>[   21.052348] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 406397_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/657bdee55c97aca821e13498
        failing since 3 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-15T05:06:28.118455  /lava-406397/1/../bin/lava-test-case
    2023-12-15T05:06:28.118908  <8>[   23.463475] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-15T05:06:28.119193  /lava-406397/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/657be31dbafaf0f61de135cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657be31dbafaf0f61de13=
5d0
        new failure (last pass: next-20231205) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/657be82163216fa82ae13493

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657be82163216fa82ae1349a
        failing since 1 day (last pass: next-20231208, first fail: next-202=
31213)

    2023-12-15T05:45:46.772079  / # #
    2023-12-15T05:45:46.874180  export SHELL=3D/bin/sh
    2023-12-15T05:45:46.874906  #
    2023-12-15T05:45:46.976383  / # export SHELL=3D/bin/sh. /lava-406431/en=
vironment
    2023-12-15T05:45:46.977134  =

    2023-12-15T05:45:47.078398  / # . /lava-406431/environment/lava-406431/=
bin/lava-test-runner /lava-406431/1
    2023-12-15T05:45:47.079535  =

    2023-12-15T05:45:47.084243  / # /lava-406431/bin/lava-test-runner /lava=
-406431/1
    2023-12-15T05:45:47.152098  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-15T05:45:47.152526  + <8>[   20.965116] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 406431_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/657be82163216fa82ae134ad
        failing since 1 day (last pass: next-20231208, first fail: next-202=
31213)

    2023-12-15T05:45:49.580610  /lava-406431/1/../bin/lava-test-case
    2023-12-15T05:45:49.581136  <8>[   23.381249] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-15T05:45:49.581474  /lava-406431/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+kselftest          | 2          =


  Details:     https://kernelci.org/test/plan/id/657be32eb2e597163de13477

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/657be32eb2e5971=
63de1347e
        failing since 9 days (last pass: next-20231120, first fail: next-20=
231205)
        2 lines

    2023-12-15T05:24:37.666095  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-12-15T05:24:37.666479  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2023-12-15T05:24:37.667390  kern  :alert : Data abort info:
    2023-12-15T05:24:37.703035  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004, ISS2 =3D 0x00000000
    2023-12-15T05:24:37.703329  kern  :alert :   CM =3D 0, WnR =3D 0, TnD =
=3D 0, TagAccess <8>[   19.634551] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Deme=
rg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-12-15T05:24:37.703514  =3D 0
    2023-12-15T05:24:37.703696  kern  :alert :   GCS =3D 0<8>[   19.644520]=
 <LAVA_SIGNAL_ENDRUN 0_dmesg 3881990_1.5.2.4.1>
    2023-12-15T05:24:37.703851  , Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
    2023-12-15T05:24:37.703996  kern  :alert : [cccccccccccccccc] address b=
etween user and kernel address ranges   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/657be32eb2e5971=
63de1347f
        failing since 9 days (last pass: next-20231120, first fail: next-20=
231205)
        12 lines

    2023-12-15T05:24:37.660749  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address cccccccccccccccc
    2023-12-15T05:24:37.661459  kern  :alert : Mem abort info:
    2023-12-15T05:24:37.661830  kern  :alert :   ESR =3D 0x0000000096000004
    2023-12-15T05:24:37.662327  kern  :alert :   EC =3D 0x25:<8>[   19.5998=
28] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines =
MEASUREMENT=3D12>
    2023-12-15T05:24:37.662869   DABT (current EL), IL =3D 32 bits
    2023-12-15T05:24:37.663367  kern  :alert :   SET =3D 0, FnV =3D 0   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657be1ac5a7a321139e134f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
m-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
m-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657be1ac5a7a321139e13=
4f2
        new failure (last pass: next-20231212) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/657bdfa12dfe95e13ae134af

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657bdfa12dfe95e13ae134b4
        failing since 7 days (last pass: next-20221014, first fail: next-20=
231207)

    2023-12-15T05:09:39.344156  <8>[   14.285888] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3881869_1.5.2.4.1>
    2023-12-15T05:09:39.450657  / # #
    2023-12-15T05:09:39.551737  export SHELL=3D/bin/sh
    2023-12-15T05:09:39.552065  #
    2023-12-15T05:09:39.652840  / # export SHELL=3D/bin/sh. /lava-3881869/e=
nvironment
    2023-12-15T05:09:39.653179  =

    2023-12-15T05:09:39.753955  / # . /lava-3881869/environment/lava-388186=
9/bin/lava-test-runner /lava-3881869/1
    2023-12-15T05:09:39.754543  =

    2023-12-15T05:09:39.759342  / # /lava-3881869/bin/lava-test-runner /lav=
a-3881869/1
    2023-12-15T05:09:39.825743  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657be210a0c8849270e13483

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-pa=
nda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-pa=
nda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657be210a0c8849270e13488
        failing since 7 days (last pass: next-20221014, first fail: next-20=
231207)

    2023-12-15T05:20:06.068948  <8>[   14.986114] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3881941_1.5.2.4.1>
    2023-12-15T05:20:06.175716  / # #
    2023-12-15T05:20:06.277073  export SHELL=3D/bin/sh
    2023-12-15T05:20:06.277479  #
    2023-12-15T05:20:06.378264  / # export SHELL=3D/bin/sh. /lava-3881941/e=
nvironment
    2023-12-15T05:20:06.378662  =

    2023-12-15T05:20:06.479498  / # . /lava-3881941/environment/lava-388194=
1/bin/lava-test-runner /lava-3881941/1
    2023-12-15T05:20:06.480154  =

    2023-12-15T05:20:06.485014  / # /lava-3881941/bin/lava-test-runner /lav=
a-3881941/1
    2023-12-15T05:20:06.545433  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/657be29924ab4e355de134ad

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657be29924ab4e355de134b2
        failing since 7 days (last pass: next-20221017, first fail: next-20=
231207)

    2023-12-15T05:22:20.157733  <8>[   20.224029] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3881969_1.5.2.4.1>
    2023-12-15T05:22:20.262731  / # #
    2023-12-15T05:22:20.364040  export SHELL=3D/bin/sh
    2023-12-15T05:22:20.364449  #
    2023-12-15T05:22:20.465301  / # export SHELL=3D/bin/sh. /lava-3881969/e=
nvironment
    2023-12-15T05:22:20.465694  =

    2023-12-15T05:22:20.566546  / # . /lava-3881969/environment/lava-388196=
9/bin/lava-test-runner /lava-3881969/1
    2023-12-15T05:22:20.567220  =

    2023-12-15T05:22:20.571852  / # /lava-3881969/bin/lava-test-runner /lav=
a-3881969/1
    2023-12-15T05:22:20.624906  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/657be3dd61e58821b9e13587

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657be3dd61e58821b9e13=
588
        failing since 0 day (last pass: next-20231213, first fail: next-202=
31214) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657bdfb92dfe95e13ae13539

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657bdfb92dfe95e13ae1353e
        failing since 135 days (last pass: next-20230712, first fail: next-=
20230801)

    2023-12-15T05:09:59.445784  + set +x
    2023-12-15T05:09:59.448903  <8>[   28.535895] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1059771_1.5.2.4.1>
    2023-12-15T05:09:59.554275  / # #
    2023-12-15T05:10:01.009238  export SHELL=3D/bin/sh
    2023-12-15T05:10:01.029661  #
    2023-12-15T05:10:01.029840  / # export SHELL=3D/bin/sh
    2023-12-15T05:10:02.975961  / # . /lava-1059771/environment
    2023-12-15T05:10:06.557188  /lava-1059771/bin/lava-test-runner /lava-10=
59771/1
    2023-12-15T05:10:06.579831  . /lava-1059771/environment
    2023-12-15T05:10:06.580033  / # /lava-1059771/bin/lava-test-runner /lav=
a-1059771/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657be923adfa0f8158e134ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-rk3399-=
rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-rk3399-=
rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657be923adfa0f8158e13=
4ad
        new failure (last pass: next-20231213) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/657bdcac99bdb53af6e134b6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-sc7180-trogdor-l=
azor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-sc7180-trogdor-l=
azor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657bdcac99bdb53af6e13=
4b7
        new failure (last pass: next-20231214) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/657be3277c672db38be13646

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657be3277c672db38be13=
647
        failing since 307 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/657be3140df5b59816e134c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657be3140df5b59816e13=
4c6
        failing since 307 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/657bdfaf2dfe95e13ae134f3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657bdfaf2dfe95e13ae134f8
        failing since 196 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-15T05:09:52.867099  / # #
    2023-12-15T05:09:52.969271  export SHELL=3D/bin/sh
    2023-12-15T05:09:52.969824  #
    2023-12-15T05:09:53.070768  / # export SHELL=3D/bin/sh. /lava-3881864/e=
nvironment
    2023-12-15T05:09:53.071240  =

    2023-12-15T05:09:53.172213  / # . /lava-3881864/environment/lava-388186=
4/bin/lava-test-runner /lava-3881864/1
    2023-12-15T05:09:53.172942  =

    2023-12-15T05:09:53.216049  / # /lava-3881864/bin/lava-test-runner /lav=
a-3881864/1
    2023-12-15T05:09:53.308498  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-15T05:09:53.309360  + cd /lava-3881864/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657be29624ab4e355de134a2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657be29624ab4e355de134a7
        failing since 191 days (last pass: next-20230517, first fail: next-=
20230607)

    2023-12-15T05:21:45.007271  + set +x<8>[   13.902832] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3881934_1.5.2.4.1>
    2023-12-15T05:21:45.007413  =

    2023-12-15T05:21:45.110362  / # #
    2023-12-15T05:21:45.211363  export SHELL=3D/bin/sh
    2023-12-15T05:21:45.211743  #
    2023-12-15T05:21:45.312395  / # export SHELL=3D/bin/sh. /lava-3881934/e=
nvironment
    2023-12-15T05:21:45.312732  =

    2023-12-15T05:21:45.413398  / # . /lava-3881934/environment/lava-388193=
4/bin/lava-test-runner /lava-3881934/1
    2023-12-15T05:21:45.413941  =

    2023-12-15T05:21:45.455777  / # /lava-3881934/bin/lava-test-runner /lav=
a-3881934/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/657be3294bcd0ddb71e13475

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657be3294bcd0ddb71e1347a
        failing since 196 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-15T05:24:34.732445  + set +x
    2023-12-15T05:24:34.732636  <8>[   15.853864] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3881948_1.5.2.4.1>
    2023-12-15T05:24:34.836934  / # #
    2023-12-15T05:24:34.938314  export SHELL=3D/bin/sh
    2023-12-15T05:24:34.938838  #
    2023-12-15T05:24:35.039660  / # export SHELL=3D/bin/sh. /lava-3881948/e=
nvironment
    2023-12-15T05:24:35.040137  =

    2023-12-15T05:24:35.141018  / # . /lava-3881948/environment/lava-388194=
8/bin/lava-test-runner /lava-3881948/1
    2023-12-15T05:24:35.141751  =

    2023-12-15T05:24:35.184125  / # /lava-3881948/bin/lava-test-runner /lav=
a-3881948/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/657bdf7c7b3fa2c860e13499

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657bdf7c7b3fa2c860e1349e
        failing since 196 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-15T05:08:56.639323  + set +x[   20.766456] <LAVA_SIGNAL_ENDRUN =
0_dmesg 448186_1.5.2.4.1>
    2023-12-15T05:08:56.639661  =

    2023-12-15T05:08:56.747827  / # #
    2023-12-15T05:08:56.849437  export SHELL=3D/bin/sh
    2023-12-15T05:08:56.849979  #
    2023-12-15T05:08:56.950977  / # export SHELL=3D/bin/sh. /lava-448186/en=
vironment
    2023-12-15T05:08:56.951548  =

    2023-12-15T05:08:57.052544  / # . /lava-448186/environment/lava-448186/=
bin/lava-test-runner /lava-448186/1
    2023-12-15T05:08:57.053380  =

    2023-12-15T05:08:57.056570  / # /lava-448186/bin/lava-test-runner /lava=
-448186/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657be1fca6380c2a29e135b1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657be1fca6380c2a29e135b6
        failing since 191 days (last pass: next-20230517, first fail: next-=
20230607)

    2023-12-15T05:19:35.473129  + set +x
    2023-12-15T05:19:35.474882  [   19.394576] <LAVA_SIGNAL_ENDRUN 0_dmesg =
448198_1.5.2.4.1>
    2023-12-15T05:19:35.583622  / # #
    2023-12-15T05:19:35.685323  export SHELL=3D/bin/sh
    2023-12-15T05:19:35.685955  #
    2023-12-15T05:19:35.787015  / # export SHELL=3D/bin/sh. /lava-448198/en=
vironment
    2023-12-15T05:19:35.787644  =

    2023-12-15T05:19:35.888722  / # . /lava-448198/environment/lava-448198/=
bin/lava-test-runner /lava-448198/1
    2023-12-15T05:19:35.889625  =

    2023-12-15T05:19:35.895840  / # /lava-448198/bin/lava-test-runner /lava=
-448198/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/657be274fbbdb0e333e13551

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657be274fbbdb0e333e13556
        failing since 196 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-15T05:21:27.847267  + set +x
    2023-12-15T05:21:27.849046  [   21.695856] <LAVA_SIGNAL_ENDRUN 0_dmesg =
448202_1.5.2.4.1>
    2023-12-15T05:21:27.957177  / # #
    2023-12-15T05:21:28.058748  export SHELL=3D/bin/sh
    2023-12-15T05:21:28.059281  #
    2023-12-15T05:21:28.160268  / # export SHELL=3D/bin/sh. /lava-448202/en=
vironment
    2023-12-15T05:21:28.160825  =

    2023-12-15T05:21:28.261820  / # . /lava-448202/environment/lava-448202/=
bin/lava-test-runner /lava-448202/1
    2023-12-15T05:21:28.262670  =

    2023-12-15T05:21:28.265683  / # /lava-448202/bin/lava-test-runner /lava=
-448202/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/657be159ba407528f1e134ad

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657be159ba407528f1e134b2
        failing since 3 days (last pass: next-20231208, first fail: next-20=
231211)

    2023-12-15T05:16:53.077687  / # #
    2023-12-15T05:16:53.178894  export SHELL=3D/bin/sh
    2023-12-15T05:16:53.179255  #
    2023-12-15T05:16:53.280056  / # export SHELL=3D/bin/sh. /lava-3881893/e=
nvironment
    2023-12-15T05:16:53.280438  =

    2023-12-15T05:16:53.381254  / # . /lava-3881893/environment/lava-388189=
3/bin/lava-test-runner /lava-3881893/1
    2023-12-15T05:16:53.381859  =

    2023-12-15T05:16:53.389518  / # /lava-3881893/bin/lava-test-runner /lav=
a-3881893/1
    2023-12-15T05:16:53.554332  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-15T05:16:53.554770  + cd /lava-3881893/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/657be133564827008fe134bd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231215/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231215/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657be133564827008fe134c2
        failing since 0 day (last pass: next-20231213, first fail: next-202=
31214)

    2023-12-15T05:16:10.697803  / # #
    2023-12-15T05:16:10.798846  export SHELL=3D/bin/sh
    2023-12-15T05:16:10.799169  #
    2023-12-15T05:16:10.899919  / # export SHELL=3D/bin/sh. /lava-3881896/e=
nvironment
    2023-12-15T05:16:10.900291  =

    2023-12-15T05:16:11.001097  / # . /lava-3881896/environment/lava-388189=
6/bin/lava-test-runner /lava-3881896/1
    2023-12-15T05:16:11.001679  =

    2023-12-15T05:16:11.008998  / # /lava-3881896/bin/lava-test-runner /lav=
a-3881896/1
    2023-12-15T05:16:11.105039  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-15T05:16:11.144703  + cd /lava-3881896/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =20

