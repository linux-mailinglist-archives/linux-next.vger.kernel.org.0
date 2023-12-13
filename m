Return-Path: <linux-next+bounces-382-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE56810F22
	for <lists+linux-next@lfdr.de>; Wed, 13 Dec 2023 11:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3D6B281965
	for <lists+linux-next@lfdr.de>; Wed, 13 Dec 2023 10:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 743AC22EF7;
	Wed, 13 Dec 2023 10:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="tQXXoeew"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7960C110
	for <linux-next@vger.kernel.org>; Wed, 13 Dec 2023 02:58:53 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6d8029dae41so5242794a34.0
        for <linux-next@vger.kernel.org>; Wed, 13 Dec 2023 02:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702465132; x=1703069932; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qKjO/J5oG9Gqk0ZRT7UitWQInxAX8PNGxA1loIYh6KI=;
        b=tQXXoeewOZO4kyXyU/fiZ/ckOVLGVLcz+j+bSrdAx7KTksXDibwSB269u6DPsSeRqD
         1qEpz1K0rzN2Q84eCzaEk+QtoRa4SMQLXyrgBMf4scDUrg2SmLBrhy20IC1DHJKbtd4V
         fXNt3nzE2P6oxHkMdqcR36TQ8CDQDd1S6uKdlZSJHz0lFKGHhd5sVrCG82tj9Gh5Q3yJ
         0qu3oWZEaob3YcJgUVgNamXuI87RMOxj5jglVPqxAMlC0XVmhtctHN/QDpXQAt+jpakc
         /uX4OOI5puy3AzjCa4vB7NOuK0jdRqhCXlCxciJdkFmm6C1GYpSOa7A35+pYlEBODy2O
         ALUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702465132; x=1703069932;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKjO/J5oG9Gqk0ZRT7UitWQInxAX8PNGxA1loIYh6KI=;
        b=Gn00K4QhaxHs1V7YVGXV52ZCIP5ztMgjQT/gQ3zS+03E/fkT8uUwCK5GRqbTMIYEsT
         0S6mzTMWUA03A1b4Akq9Qk1PxZs8mX5DjgX5Ndhq71HdvKQ20vsL8n0VH4CISIyx0CJk
         RCF3OAgQGm5PIfV0SXogaiGDZ/cyMTy1YDU8OrkorpeJBrbon9QszEsCWFIyjNWSYCOs
         mF2lpWnQg4uYlxC41NiHFekVKfmDI7ers2Fe8u06YD8eO5H2IRZ8SnkPoGYw0J0uSBeL
         ca0Zwev7woZJoZ26vE7TAqkmWlWIzTYKkmH8oVUNbOuaF9G9Ej4r7zCnmu7rnI6RHWec
         ybrw==
X-Gm-Message-State: AOJu0YzIN8b/mRfdQaUG/0T3uyMs9p57ztY3+61+WtYMYVrD+zXmz3QM
	qm2wa/6Sd+5tRlj6XdqgdOv2zcZX8lH3uvDeXtZFXA==
X-Google-Smtp-Source: AGHT+IGRVreavQQJtt+ycStiHtUuRF9+uvT3pyYqdwXanXiaJBpdXN8i6gLjuIBz3GXBxieZRAti+Q==
X-Received: by 2002:a05:6808:21a9:b0:3b9:e13b:642e with SMTP id be41-20020a05680821a900b003b9e13b642emr9536749oib.72.1702465131345;
        Wed, 13 Dec 2023 02:58:51 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id bh2-20020a170902a98200b001cfc34965aesm6527800plb.50.2023.12.13.02.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 02:58:50 -0800 (PST)
Message-ID: <65798e6a.170a0220.61f02.347d@mx.google.com>
Date: Wed, 13 Dec 2023 02:58:50 -0800 (PST)
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
X-Kernelci-Kernel: next-20231213
Subject: next/master baseline: 536 runs, 65 regressions (next-20231213)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 536 runs, 65 regressions (next-20231213)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

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

imx6dl-udoo                  | arm   | lab-broonie     | clang-17 | multi_v=
7_defconfig           | 2          =

imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig+videodec           | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 5          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+videodec           | 1          =

panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | defconf=
ig+videodec           | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

sc7180-trogdor-kingoftown    | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre    | clang-17 | multi_v=
7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | clang-17 | multi_v=
7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231213/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231213
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      48e8992e33abf054bcc0bb2e77b2d43bb899212e =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6579521f448bcd7334e13475

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-at91-sama5d4=
_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-at91-sama5d4=
_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6579521f448bcd7334e13=
476
        new failure (last pass: next-20231212) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | sama5_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/657950a6a9ffbfcdb2e134c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657950a6a9ffbfcdb2e13=
4c3
        failing since 315 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91sam9g20ek                | arm   | lab-broonie     | gcc-10   | at91_dt=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/657952a15d2d8fe2a2e134d7

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/657952a15d2d8fe2a2e134f7
        failing since 191 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-12-13T06:43:19.258525  /lava-347983/1/../bin/lava-test-case
    2023-12-13T06:43:19.300424  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91sam9g20ek                | arm   | lab-broonie     | gcc-10   | multi_v=
5_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6579532dfef19789b5e1347e

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/6579532dfef19789b5e1349b
        failing since 191 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-12-13T06:45:39.028069  /lava-347988/1/../bin/lava-test-case
    2023-12-13T06:45:39.070636  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65794f3d0876b6ca71e1347f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65794f3d0876b6ca71e13=
480
        failing since 191 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657953756d2f41556ae1349b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657953756d2f41556ae13=
49c
        failing since 259 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65795652cd95cf1547e1350f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65795652cd95cf1547e13=
510
        failing since 257 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-10   | omap2pl=
us_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6579527ef860d44bb4e134c1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6579527ef860d44bb4e13=
4c2
        new failure (last pass: next-20231212) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-udoo                  | arm   | lab-broonie     | clang-17 | multi_v=
7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/65795a4a91bc617d73e134aa

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig/clang-17/lab-broonie/baseline-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig/clang-17/lab-broonie/baseline-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/65795a4a9=
1bc617d73e134b3
        new failure (last pass: next-20231212)

    2023-12-13T07:16:19.919439  /lava-348144/1/../bin/lava-test-case
    2023-12-13T07:16:19.948740  <8>[   25.027194] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/65=
795a4a91bc617d73e134b4
        new failure (last pass: next-20231212)

    2023-12-13T07:16:18.865046  /lava-348144/1/../bin/lava-test-case
    2023-12-13T07:16:18.895052  <8>[   23.973472] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/657957ffae4fe13002e134e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+videodec/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+videodec/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657957ffae4fe13002e13=
4e9
        new failure (last pass: next-20231212) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65795204ee9e1ad525e13491

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65795204ee9e1ad525e13=
492
        failing since 610 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/65795402a68904a9ffe13515

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65795402a68904a9ffe1351c
        new failure (last pass: next-20231208)

    2023-12-13T06:49:13.791116  <8>[   20.231779] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 405285_1.5.2.4.1>
    2023-12-13T06:49:13.896254  / # #
    2023-12-13T06:49:13.998275  export SHELL=3D/bin/sh
    2023-12-13T06:49:13.998658  #
    2023-12-13T06:49:14.099652  / # export SHELL=3D/bin/sh. /lava-405285/en=
vironment
    2023-12-13T06:49:14.100378  =

    2023-12-13T06:49:14.201772  / # . /lava-405285/environment/lava-405285/=
bin/lava-test-runner /lava-405285/1
    2023-12-13T06:49:14.202899  =

    2023-12-13T06:49:14.222754  / # /lava-405285/bin/lava-test-runner /lava=
-405285/1
    2023-12-13T06:49:14.269133  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65795402a68904a9ffe13520
        new failure (last pass: next-20231208)

    2023-12-13T06:49:16.373437  /lava-405285/1/../bin/lava-test-case
    2023-12-13T06:49:16.373719  <8>[   22.796201] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-12-13T06:49:16.373891  /lava-405285/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
795402a68904a9ffe13522
        new failure (last pass: next-20231208)

    2023-12-13T06:49:17.431721  /lava-405285/1/../bin/lava-test-case
    2023-12-13T06:49:17.432389  <8>[   23.835102] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-12-13T06:49:17.432686  /lava-405285/1/../bin/lava-test-case
    2023-12-13T06:49:17.432984  <8>[   23.852424] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-12-13T06:49:17.433262  /lava-405285/1/../bin/lava-test-case
    2023-12-13T06:49:17.433534  <8>[   23.871757] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2023-12-13T06:49:17.433802  /lava-405285/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65795402a68904a9ffe13527
        new failure (last pass: next-20231208)

    2023-12-13T06:49:18.509773  /lava-405285/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65795402a68904a9ffe13528
        new failure (last pass: next-20231208)

    2023-12-13T06:49:18.512928  <8>[   24.949702] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-13T06:49:19.573597  /lava-405285/1/../bin/lava-test-case
    2023-12-13T06:49:19.574103  <8>[   25.971302] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-12-13T06:49:19.574385  /lava-405285/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/657957ffae4fe13002e13487

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657957ffae4fe13002e1348e
        failing since 0 day (last pass: next-20231207, first fail: next-202=
31212)

    2023-12-13T07:06:14.337098  #
    2023-12-13T07:06:14.439666  / # #export SHELL=3D/bin/sh
    2023-12-13T07:06:14.440429  =

    2023-12-13T07:06:14.541875  / # export SHELL=3D/bin/sh. /lava-405289/en=
vironment
    2023-12-13T07:06:14.542640  =

    2023-12-13T07:06:14.643876  / # . /lava-405289/environment/lava-405289/=
bin/lava-test-runner /lava-405289/1
    2023-12-13T07:06:14.644507  =

    2023-12-13T07:06:14.685029  / # /lava-405289/bin/lava-test-runner /lava=
-405289/1
    2023-12-13T07:06:14.707319  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-13T07:06:14.707748  + <8>[   20.788660] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 405289_1.5.2.4.5> =

    ... (18 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/657957ffae4fe13002e13492
        failing since 0 day (last pass: next-20231207, first fail: next-202=
31212)

    2023-12-13T07:06:16.814930  /lava-405289/1/../bin/lava-test-case
    2023-12-13T07:06:16.815353  <8>[   22.896885] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-12-13T07:06:16.815662  /lava-405289/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
7957ffae4fe13002e13494
        failing since 0 day (last pass: next-20231207, first fail: next-202=
31212)

    2023-12-13T07:06:17.874741  /lava-405289/1/../bin/lava-test-case
    2023-12-13T07:06:17.875165  <8>[   23.935724] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-12-13T07:06:17.875476  /lava-405289/1/../bin/lava-test-case
    2023-12-13T07:06:17.875702  <8>[   23.954535] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-12-13T07:06:17.875917  /lava-405289/1/../bin/lava-test-case
    2023-12-13T07:06:17.876125  <8>[   23.973910] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2023-12-13T07:06:17.876327  /lava-405289/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/657957ffae4fe13002e13499
        failing since 0 day (last pass: next-20231207, first fail: next-202=
31212)

    2023-12-13T07:06:18.949091  /lava-405289/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/657957ffae4fe13002e1349a
        failing since 0 day (last pass: next-20231207, first fail: next-202=
31212)

    2023-12-13T07:06:18.952375  <8>[   25.048757] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-13T07:06:20.011357  /lava-405289/1/../bin/lava-test-case
    2023-12-13T07:06:20.011832  <8>[   26.070369] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-12-13T07:06:20.012102  /lava-405289/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 5          =


  Details:     https://kernelci.org/test/plan/id/657959065d77de80f3e13499

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657959065d77de80f3e134a0
        failing since 1 day (last pass: next-20231207, first fail: next-202=
31211)

    2023-12-13T07:10:41.933797  / # #
    2023-12-13T07:10:42.034643  export SHELL=3D/bin/sh
    2023-12-13T07:10:42.035308  #
    2023-12-13T07:10:42.136455  / # export SHELL=3D/bin/sh. /lava-405304/en=
vironment
    2023-12-13T07:10:42.137377  =

    2023-12-13T07:10:42.238536  / # . /lava-405304/environment/lava-405304/=
bin/lava-test-runner /lava-405304/1
    2023-12-13T07:10:42.239599  =

    2023-12-13T07:10:42.248394  / # /lava-405304/bin/lava-test-runner /lava=
-405304/1
    2023-12-13T07:10:42.304702  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-13T07:10:42.305168  + <8>[   20.876674] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 405304_1.5.2.4.5> =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/657959065d77de80f3e134a4
        failing since 1 day (last pass: next-20231207, first fail: next-202=
31211)

    2023-12-13T07:10:43.372909  <8>[   21.962026] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-driver-present RESULT=3Dpass>
    2023-12-13T07:10:44.411217  /lava-405304/1/../bin/lava-test-case
    2023-12-13T07:10:44.411640  <8>[   22.986226] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-12-13T07:10:44.412000  /lava-405304/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
7959065d77de80f3e134a6
        failing since 1 day (last pass: next-20231207, first fail: next-202=
31211)

    2023-12-13T07:10:45.470399  /lava-405304/1/../bin/lava-test-case
    2023-12-13T07:10:45.470897  <8>[   24.026496] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-12-13T07:10:45.471240  /lava-405304/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/657959065d77de80f3e134ab
        failing since 1 day (last pass: next-20231207, first fail: next-202=
31211)

    2023-12-13T07:10:46.544021  /lava-405304/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/657959065d77de80f3e134ac
        failing since 1 day (last pass: next-20231207, first fail: next-202=
31211)

    2023-12-13T07:10:46.546608  <8>[   25.136560] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-13T07:10:47.607284  /lava-405304/1/../bin/lava-test-case
    2023-12-13T07:10:47.607744  <8>[   26.158275] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-12-13T07:10:47.608099  /lava-405304/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/65795cc47f56b18c13e1349c

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65795cc47f56b18c13e134a3
        failing since 1 day (last pass: next-20231207, first fail: next-202=
31211)

    2023-12-13T07:26:33.546707  / # #
    2023-12-13T07:26:33.648707  export SHELL=3D/bin/sh
    2023-12-13T07:26:33.649403  #
    2023-12-13T07:26:33.750927  / # export SHELL=3D/bin/sh. /lava-405324/en=
vironment
    2023-12-13T07:26:33.751635  =

    2023-12-13T07:26:33.853002  / # . /lava-405324/environment/lava-405324/=
bin/lava-test-runner /lava-405324/1
    2023-12-13T07:26:33.854100  =

    2023-12-13T07:26:33.858677  / # /lava-405324/bin/lava-test-runner /lava=
-405324/1
    2023-12-13T07:26:33.918707  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-13T07:26:33.919125  + <8>[   20.583379] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 405324_1.5.2.4.5> =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65795cc47f56b18c13e134a7
        failing since 1 day (last pass: next-20231207, first fail: next-202=
31211)

    2023-12-13T07:26:36.021706  /lava-405324/1/../bin/lava-test-case
    2023-12-13T07:26:36.022191  <8>[   22.689199] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-12-13T07:26:36.022603  /lava-405324/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
795cc47f56b18c13e134a9
        failing since 1 day (last pass: next-20231207, first fail: next-202=
31211)

    2023-12-13T07:26:37.078243  /lava-405324/1/../bin/lava-test-case
    2023-12-13T07:26:37.078735  <8>[   23.726138] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-12-13T07:26:37.079002  /lava-405324/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65795cc47f56b18c13e134ae
        failing since 1 day (last pass: next-20231207, first fail: next-202=
31211)

    2023-12-13T07:26:38.154875  /lava-405324/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65795cc47f56b18c13e134af
        failing since 1 day (last pass: next-20231207, first fail: next-202=
31211)

    2023-12-13T07:26:38.158061  <8>[   24.837587] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-13T07:26:39.211443  /lava-405324/1/../bin/lava-test-case
    2023-12-13T07:26:39.211879  <8>[   25.858746] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-12-13T07:26:39.212231  /lava-405324/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657955059d788c2678e134c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657955059d788c2678e13=
4c3
        new failure (last pass: next-20231208) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/657953f0a68904a9ffe1347b

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657953f0a68904a9ffe13482
        new failure (last pass: next-20231208)

    2023-12-13T06:49:02.594623  / # #
    2023-12-13T06:49:02.696632  export SHELL=3D/bin/sh
    2023-12-13T06:49:02.697450  #
    2023-12-13T06:49:02.798923  / # export SHELL=3D/bin/sh. /lava-405283/en=
vironment
    2023-12-13T06:49:02.799635  =

    2023-12-13T06:49:02.900913  / # . /lava-405283/environment/lava-405283/=
bin/lava-test-runner /lava-405283/1
    2023-12-13T06:49:02.902185  =

    2023-12-13T06:49:02.909538  / # /lava-405283/bin/lava-test-runner /lava=
-405283/1
    2023-12-13T06:49:02.975541  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-13T06:49:02.975969  + <8>[   21.012605] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 405283_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/657953f0a68904a9ffe13495
        new failure (last pass: next-20231208)

    2023-12-13T06:49:05.404154  /lava-405283/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/65795802f0a8de6189e13476

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65795802f0a8de6189e1347d
        failing since 0 day (last pass: next-20231207, first fail: next-202=
31212)

    2023-12-13T07:06:13.112899  / # #
    2023-12-13T07:06:13.215053  export SHELL=3D/bin/sh
    2023-12-13T07:06:13.215797  #
    2023-12-13T07:06:13.317625  / # export SHELL=3D/bin/sh. /lava-405293/en=
vironment
    2023-12-13T07:06:13.318326  =

    2023-12-13T07:06:13.419642  / # . /lava-405293/environment/lava-405293/=
bin/lava-test-runner /lava-405293/1
    2023-12-13T07:06:13.420859  =

    2023-12-13T07:06:13.439935  / # /lava-405293/bin/lava-test-runner /lava=
-405293/1
    2023-12-13T07:06:13.493608  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-13T07:06:13.493980  + <8>[   21.132847] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 405293_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65795802f0a8de6189e13490
        failing since 0 day (last pass: next-20231207, first fail: next-202=
31212)

    2023-12-13T07:06:15.923541  /lava-405293/1/../bin/lava-test-case
    2023-12-13T07:06:15.924001  <8>[   23.550042] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-13T07:06:15.924276  /lava-405293/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6579590973f70540e9e13502

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6579590973f70540e9e13509
        failing since 1 day (last pass: next-20231207, first fail: next-202=
31211)

    2023-12-13T07:10:42.638587  / # #
    2023-12-13T07:10:42.740703  export SHELL=3D/bin/sh
    2023-12-13T07:10:42.741404  #
    2023-12-13T07:10:42.842945  / # export SHELL=3D/bin/sh. /lava-405306/en=
vironment
    2023-12-13T07:10:42.843645  =

    2023-12-13T07:10:42.945042  / # . /lava-405306/environment/lava-405306/=
bin/lava-test-runner /lava-405306/1
    2023-12-13T07:10:42.946188  =

    2023-12-13T07:10:42.950360  / # /lava-405306/bin/lava-test-runner /lava=
-405306/1
    2023-12-13T07:10:43.019516  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-13T07:10:43.019939  + <8>[   21.129730] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 405306_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/6579590973f70540e9e1351c
        failing since 1 day (last pass: next-20231207, first fail: next-202=
31211)

    2023-12-13T07:10:45.451719  /lava-405306/1/../bin/lava-test-case
    2023-12-13T07:10:45.452210  <8>[   23.552418] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-13T07:10:45.452502  /lava-405306/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65795d14bfca0dbb20e13475

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65795d14bfca0dbb20e1347c
        failing since 1 day (last pass: next-20231207, first fail: next-202=
31211)

    2023-12-13T07:28:03.122065  / # #
    2023-12-13T07:28:03.223426  export SHELL=3D/bin/sh
    2023-12-13T07:28:03.223721  #
    2023-12-13T07:28:03.324413  / # export SHELL=3D/bin/sh. /lava-405325/en=
vironment
    2023-12-13T07:28:03.324738  =

    2023-12-13T07:28:03.425446  / # . /lava-405325/environment/lava-405325/=
bin/lava-test-runner /lava-405325/1
    2023-12-13T07:28:03.426031  =

    2023-12-13T07:28:03.435934  / # /lava-405325/bin/lava-test-runner /lava=
-405325/1
    2023-12-13T07:28:03.476783  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-13T07:28:03.496830  + <8>[   20.970824] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 405325_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65795d14bfca0dbb20e1348f
        failing since 1 day (last pass: next-20231207, first fail: next-202=
31211)

    2023-12-13T07:28:05.926033  /lava-405325/1/../bin/lava-test-case
    2023-12-13T07:28:05.926340  <8>[   23.384116] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-13T07:28:05.926583  /lava-405325/1/../bin/lava-test-case
    2023-12-13T07:28:05.926803  <8>[   23.401540] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-12-13T07:28:05.926962  /lava-405325/1/../bin/lava-test-case
    2023-12-13T07:28:05.927100  <8>[   23.422644] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-probed RESULT=3Dpass>
    2023-12-13T07:28:05.927238  /lava-405325/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/657958eab65e59b656e1347a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657958eab65e59b656e13=
47b
        new failure (last pass: next-20231212) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65794fbaeed81a50ace134a2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65794fbbeed81a50ace134ab
        failing since 6 days (last pass: next-20221017, first fail: next-20=
231207)

    2023-12-13T06:31:02.159952  <8>[   19.781982] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3878062_1.5.2.4.1>
    2023-12-13T06:31:02.264697  / # #
    2023-12-13T06:31:02.366085  export SHELL=3D/bin/sh
    2023-12-13T06:31:02.366674  #
    2023-12-13T06:31:02.467565  / # export SHELL=3D/bin/sh. /lava-3878062/e=
nvironment
    2023-12-13T06:31:02.468098  =

    2023-12-13T06:31:02.569025  / # . /lava-3878062/environment/lava-387806=
2/bin/lava-test-runner /lava-3878062/1
    2023-12-13T06:31:02.569801  =

    2023-12-13T06:31:02.574202  / # /lava-3878062/bin/lava-test-runner /lav=
a-3878062/1
    2023-12-13T06:31:02.620981  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6579515cf2294a0414e134a4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6579515cf2294a0414e134ad
        failing since 6 days (last pass: next-20221014, first fail: next-20=
231207)

    2023-12-13T06:38:10.976396  <8>[   14.926239] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3878142_1.5.2.4.1>
    2023-12-13T06:38:11.083177  / # #
    2023-12-13T06:38:11.184420  export SHELL=3D/bin/sh
    2023-12-13T06:38:11.184803  #
    2023-12-13T06:38:11.285592  / # export SHELL=3D/bin/sh. /lava-3878142/e=
nvironment
    2023-12-13T06:38:11.285966  =

    2023-12-13T06:38:11.386765  / # . /lava-3878142/environment/lava-387814=
2/bin/lava-test-runner /lava-3878142/1
    2023-12-13T06:38:11.387356  =

    2023-12-13T06:38:11.392323  / # /lava-3878142/bin/lava-test-runner /lav=
a-3878142/1
    2023-12-13T06:38:11.458134  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6579526f28fea6d8ace1348c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-pa=
nda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-pa=
nda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6579526f28fea6d8ace13495
        failing since 6 days (last pass: next-20221014, first fail: next-20=
231207)

    2023-12-13T06:42:37.830858  + <8>[   14.493713] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 3878176_1.5.2.4.1>
    2023-12-13T06:42:37.831072  set +x
    2023-12-13T06:42:37.935409  / # #
    2023-12-13T06:42:38.036633  export SHELL=3D/bin/sh
    2023-12-13T06:42:38.037010  #
    2023-12-13T06:42:38.137777  / # export SHELL=3D/bin/sh. /lava-3878176/e=
nvironment
    2023-12-13T06:42:38.138139  =

    2023-12-13T06:42:38.238910  / # . /lava-3878176/environment/lava-387817=
6/bin/lava-test-runner /lava-3878176/1
    2023-12-13T06:42:38.239489  =

    2023-12-13T06:42:38.244691  / # /lava-3878176/bin/lava-test-runner /lav=
a-3878176/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65795926ab21a38b03e13484

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65795926ab21a38b03e13=
485
        new failure (last pass: next-20231212) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6579591cab21a38b03e13481

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6579591cab21a38b03e13=
482
        new failure (last pass: next-20231212) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/657959647c95c2cd87e13475

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657959647c95c2cd87e13=
476
        new failure (last pass: next-20231212) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6579592fab21a38b03e134d4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6579592fab21a38b03e13=
4d5
        new failure (last pass: next-20231212) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/657959657c95c2cd87e1347a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657959657c95c2cd87e13=
47b
        failing since 0 day (last pass: next-20231211, first fail: next-202=
31212) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65795944ab21a38b03e134e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65795944ab21a38b03e13=
4e4
        failing since 0 day (last pass: next-20231211, first fail: next-202=
31212) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65795826960cce3dafe13485

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65795826960cce3dafe1348e
        failing since 127 days (last pass: next-20230710, first fail: next-=
20230808)

    2023-12-13T07:06:54.934325  + set +x
    2023-12-13T07:06:54.937629  <8>[   28.451496] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1057974_1.5.2.4.1>
    2023-12-13T07:06:55.044021  / # #
    2023-12-13T07:06:56.499116  export SHELL=3D/bin/sh
    2023-12-13T07:06:56.519613  #
    2023-12-13T07:06:56.519866  / # export SHELL=3D/bin/sh
    2023-12-13T07:06:58.465737  / # . /lava-1057974/environment
    2023-12-13T07:07:02.044347  /lava-1057974/bin/lava-test-runner /lava-10=
57974/1
    2023-12-13T07:07:02.065162  . /lava-1057974/environment
    2023-12-13T07:07:02.065385  / # /lava-1057974/bin/lava-test-runner /lav=
a-1057974/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657952c17b1b7114ece13489

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657952c17b1b7114ece13=
48a
        failing since 385 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657951bda0aed4effee13475

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657951bda0aed4effee13=
476
        failing since 385 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sc7180-trogdor-kingoftown    | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65794ffe8fe54e1a83e1348e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65794ffe8fe54e1a83e13=
48f
        failing since 308 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/65794ffa0c4ba0f870e13480

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65794ffa0c4ba0f870e13=
481
        failing since 308 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | clang-17 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65795a99b5647984a4e13482

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65795a99b5647984a4e1348b
        failing since 195 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-13T07:16:57.768453  / ##
    2023-12-13T07:16:57.870228  export SHELL=3D/bin/sh
    2023-12-13T07:16:57.871020   #
    2023-12-13T07:16:57.972254  / # export SHELL=3D/bin/sh. /lava-3878402/e=
nvironment
    2023-12-13T07:16:57.973275  =

    2023-12-13T07:16:58.074745  / # . /lava-3878402/environment/lava-387840=
2/bin/lava-test-runner /lava-3878402/1
    2023-12-13T07:16:58.075312  =

    2023-12-13T07:16:58.090908  / # /lava-3878402/bin/lava-test-runner /lav=
a-3878402/1
    2023-12-13T07:16:58.202646  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-13T07:16:58.203251  + cd /lava-3878402/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | clang-17 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/657959f1d04cadf5e0e13491

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657959f1d04cadf5e0e1349a
        failing since 195 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-13T07:14:37.933679  + set +x
    2023-12-13T07:14:37.935466  [   18.106892] <LAVA_SIGNAL_ENDRUN 0_dmesg =
447885_1.5.2.4.1>
    2023-12-13T07:14:38.045597  / # #
    2023-12-13T07:14:38.147198  export SHELL=3D/bin/sh
    2023-12-13T07:14:38.147791  #
    2023-12-13T07:14:38.248798  / # export SHELL=3D/bin/sh. /lava-447885/en=
vironment
    2023-12-13T07:14:38.249391  =

    2023-12-13T07:14:38.350404  / # . /lava-447885/environment/lava-447885/=
bin/lava-test-runner /lava-447885/1
    2023-12-13T07:14:38.351304  =

    2023-12-13T07:14:38.354550  / # /lava-447885/bin/lava-test-runner /lava=
-447885/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65794fdde18a15b24ce134b1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65794fdde18a15b24ce134ba
        failing since 189 days (last pass: next-20230525, first fail: next-=
20230607)

    2023-12-13T06:31:16.008630  / # #
    2023-12-13T06:31:16.109582  export SHELL=3D/bin/sh
    2023-12-13T06:31:16.109987  #
    2023-12-13T06:31:16.210728  / # export SHELL=3D/bin/sh. /lava-3878072/e=
nvironment
    2023-12-13T06:31:16.211153  =

    2023-12-13T06:31:16.311892  / # . /lava-3878072/environment/lava-387807=
2/bin/lava-test-runner /lava-3878072/1
    2023-12-13T06:31:16.312479  =

    2023-12-13T06:31:16.322348  / # /lava-3878072/bin/lava-test-runner /lav=
a-3878072/1
    2023-12-13T06:31:16.436054  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-13T06:31:16.436481  + cd /lava-3878072/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/657951695c14a7a6b3e134ec

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657951695c14a7a6b3e134f5
        failing since 195 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-13T06:37:49.983208  / # #
    2023-12-13T06:37:50.084361  export SHELL=3D/bin/sh
    2023-12-13T06:37:50.084831  #
    2023-12-13T06:37:50.185587  / # export SHELL=3D/bin/sh. /lava-3878146/e=
nvironment
    2023-12-13T06:37:50.186106  =

    2023-12-13T06:37:50.286983  / # . /lava-3878146/environment/lava-387814=
6/bin/lava-test-runner /lava-3878146/1
    2023-12-13T06:37:50.287681  =

    2023-12-13T06:37:50.332072  / # /lava-3878146/bin/lava-test-runner /lav=
a-3878146/1
    2023-12-13T06:37:50.392026  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-13T06:37:50.426797  + cd /lava-3878146/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6579526728fea6d8ace13481

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6579526728fea6d8ace1348a
        failing since 189 days (last pass: next-20230517, first fail: next-=
20230607)

    2023-12-13T06:42:36.470637  <8>[   13.224235] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3878183_1.5.2.4.1>
    2023-12-13T06:42:36.578906  / # #
    2023-12-13T06:42:36.681702  export SHELL=3D/bin/sh
    2023-12-13T06:42:36.682579  #
    2023-12-13T06:42:36.784150  / # export SHELL=3D/bin/sh. /lava-3878183/e=
nvironment
    2023-12-13T06:42:36.784960  =

    2023-12-13T06:42:36.886488  / # . /lava-3878183/environment/lava-387818=
3/bin/lava-test-runner /lava-3878183/1
    2023-12-13T06:42:36.888195  =

    2023-12-13T06:42:36.902704  / # /lava-3878183/bin/lava-test-runner /lav=
a-3878183/1
    2023-12-13T06:42:37.021292  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/657950045d2c7a3869e13481

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657950045d2c7a3869e1348a
        failing since 189 days (last pass: next-20230525, first fail: next-=
20230607)

    2023-12-13T06:32:21.076384  + set +x
    2023-12-13T06:32:21.078106  [   22.885778] <LAVA_SIGNAL_ENDRUN 0_dmesg =
447861_1.5.2.4.1>
    2023-12-13T06:32:21.186308  / # #
    2023-12-13T06:32:21.287964  export SHELL=3D/bin/sh
    2023-12-13T06:32:21.288616  #
    2023-12-13T06:32:21.389619  / # export SHELL=3D/bin/sh. /lava-447861/en=
vironment
    2023-12-13T06:32:21.390217  =

    2023-12-13T06:32:21.491244  / # . /lava-447861/environment/lava-447861/=
bin/lava-test-runner /lava-447861/1
    2023-12-13T06:32:21.492160  =

    2023-12-13T06:32:21.494668  / # /lava-447861/bin/lava-test-runner /lava=
-447861/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/657951443f2eebbe56e13489

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657951443f2eebbe56e13492
        failing since 195 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-13T06:37:35.483282  + set +x
    2023-12-13T06:37:35.484951  [   20.028970] <LAVA_SIGNAL_ENDRUN 0_dmesg =
447866_1.5.2.4.1>
    2023-12-13T06:37:35.592712  / # #
    2023-12-13T06:37:35.694322  export SHELL=3D/bin/sh
    2023-12-13T06:37:35.694930  #
    2023-12-13T06:37:35.795914  / # export SHELL=3D/bin/sh. /lava-447866/en=
vironment
    2023-12-13T06:37:35.796480  =

    2023-12-13T06:37:35.897478  / # . /lava-447866/environment/lava-447866/=
bin/lava-test-runner /lava-447866/1
    2023-12-13T06:37:35.898310  =

    2023-12-13T06:37:35.900921  / # /lava-447866/bin/lava-test-runner /lava=
-447866/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657952706c31fb4b31e134f9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657952706c31fb4b31e13502
        failing since 189 days (last pass: next-20230517, first fail: next-=
20230607)

    2023-12-13T06:42:35.151614  + set +x[   19.574011] <LAVA_SIGNAL_ENDRUN =
0_dmesg 447875_1.5.2.4.1>
    2023-12-13T06:42:35.151925  =

    2023-12-13T06:42:35.259883  / # #
    2023-12-13T06:42:35.361685  export SHELL=3D/bin/sh
    2023-12-13T06:42:35.362359  #
    2023-12-13T06:42:35.463351  / # export SHELL=3D/bin/sh. /lava-447875/en=
vironment
    2023-12-13T06:42:35.463920  =

    2023-12-13T06:42:35.564950  / # . /lava-447875/environment/lava-447875/=
bin/lava-test-runner /lava-447875/1
    2023-12-13T06:42:35.565889  =

    2023-12-13T06:42:35.568989  / # /lava-447875/bin/lava-test-runner /lava=
-447875/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/65794b57bbe9440d61e13482

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231213/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231213/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65794b57bbe9440d61e1348b
        failing since 1 day (last pass: next-20231208, first fail: next-202=
31211)

    2023-12-13T06:12:09.731732  / # #
    2023-12-13T06:12:09.832820  export SHELL=3D/bin/sh
    2023-12-13T06:12:09.833146  #
    2023-12-13T06:12:09.933881  / # export SHELL=3D/bin/sh. /lava-3877926/e=
nvironment
    2023-12-13T06:12:09.934207  =

    2023-12-13T06:12:10.034947  / # . /lava-3877926/environment/lava-387792=
6/bin/lava-test-runner /lava-3877926/1
    2023-12-13T06:12:10.035486  =

    2023-12-13T06:12:10.044552  / # /lava-3877926/bin/lava-test-runner /lav=
a-3877926/1
    2023-12-13T06:12:10.193482  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-13T06:12:10.193899  + cd /lava-3877926/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =20

