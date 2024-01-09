Return-Path: <linux-next+bounces-692-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F54B82840F
	for <lists+linux-next@lfdr.de>; Tue,  9 Jan 2024 11:35:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECF051C2393F
	for <lists+linux-next@lfdr.de>; Tue,  9 Jan 2024 10:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD76229429;
	Tue,  9 Jan 2024 10:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="HcIfEaAI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5117F13FE0
	for <linux-next@vger.kernel.org>; Tue,  9 Jan 2024 10:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3bb9d54575cso2631254b6e.2
        for <linux-next@vger.kernel.org>; Tue, 09 Jan 2024 02:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1704796502; x=1705401302; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mkSjI/IvNpIikExZMG3/sh2BR4XeaXdamP1n53JKPTo=;
        b=HcIfEaAIPzxccG3j3ixrfbwUZH204hAEdcS5oB0ajfVHmEt3z9b7/zHVfHnfJKqSp4
         W6sR/wjQLIh9tc1OXHISD8pXsaXvjyFy+KIi7PYVQZ3lW8PYNi+sV63qavjxonGOtoFF
         DujnuZtQdkdPB5DqqVd1SUwFdfFQgWhizFTPFPL575+O9yZ6w+38Vs82hyTXTf8Dq+OO
         cqOAY9zFq5qfK2vUz/vmWl6ONWFEbS5l/T94jcMESKfkeDL2gxaA+vOEgfFctTc7nnS1
         +dBr6vrHYEYeTBCnonD0aFbI3MH466pmdYnGra6vJhtmzPzut9FODJK3xxefZYFDX+lI
         fA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704796502; x=1705401302;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mkSjI/IvNpIikExZMG3/sh2BR4XeaXdamP1n53JKPTo=;
        b=GlbAP0UlzYiXqvm+MgzLH9VdgH2S+YpLiUaipT29Ka2MFmBmavlTP9zyej/7evfFSk
         u+2a1lonf5q0irfyVV5vFaMsxEMY1Gm5EN+xxJDEWajcgARqs943H3+lLJXlw5XFrOBi
         aDYmv1LowT7BVQGh39pf/fdn24Xms2N1zoNS94VgOxDUS2y6AByokumeD9P33uCOA7na
         aPWiwjgJZR5rGG2YlhrNsJloah9w/Oyb8ztc35gKQo8L54m4eRV+UQFlukQjscnrYSJ6
         Et26d851ka0bF6e2vV3mHsDoXRsewcYNS8dRNKvAcZ90D1bS4svbvLVn9nDFp8iyGVPs
         sH9w==
X-Gm-Message-State: AOJu0YzcYYag1DuA7kP46mZpo5ecy7XsjU8KaE+DDNHoGoO1mdr3hqeA
	vFLR11dsGTl44SHlNiH3PBcaWdVsuD+ddfC05D9Y2eVvJcA=
X-Google-Smtp-Source: AGHT+IHtL4/0KTxyQpxwVXkw79qMD1CjHSBJn05JHNoa0KR64wsO44Qz0OCPvg7/KwlccpjkYOUkHQ==
X-Received: by 2002:a05:6358:7204:b0:175:86ae:9131 with SMTP id h4-20020a056358720400b0017586ae9131mr4390952rwa.6.1704796501291;
        Tue, 09 Jan 2024 02:35:01 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p29-20020a056a000a1d00b006dab0d72cd0sm1328069pfh.214.2024.01.09.02.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 02:35:00 -0800 (PST)
Message-ID: <659d2154.050a0220.78564.522b@mx.google.com>
Date: Tue, 09 Jan 2024 02:35:00 -0800 (PST)
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
X-Kernelci-Kernel: next-20240109
X-Kernelci-Report-Type: test
Subject: next/master baseline: 424 runs, 49 regressions (next-20240109)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 424 runs, 49 regressions (next-20240109)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

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

beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

juno-uboot                   | arm64 | lab-broonie   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

juno-uboot                   | arm64 | lab-broonie   | gcc-10   | defconfig=
                    | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 5          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 2          =

meson-g12a-u200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =

rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ok+kselftest | 1          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ok+kselftest | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | clang-17 | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | clang-17 | multi_v7_=
defconfig           | 1          =

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
240109/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240109
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      0f067394dd3b2af3263339cf7183bdb6ee0ac1f8 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/659ce470e818c4886852a424

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659ce470e818c4886852a=
425
        failing since 0 day (last pass: next-20240105, first fail: next-202=
40108) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | sama5_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/659ce5e3149c464d8252a3f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659ce5e3149c464d8252a=
3f7
        failing since 342 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/659ce6f1e84a83e35e52a40b

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/659ce6f2e84a83e35e52a42b
        failing since 218 days (last pass: next-20230601, first fail: next-=
20230605)

    2024-01-09T06:25:46.619411  /lava-439769/1/../bin/lava-test-case
    2024-01-09T06:25:46.661691  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | multi_v5_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/659ce45d87b057c84352a3f1

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/659ce45d87b057c84352a40f
        failing since 218 days (last pass: next-20230601, first fail: next-=
20230605)

    2024-01-09T06:14:29.286361  /lava-439694/1/../bin/lava-test-case
    2024-01-09T06:14:29.328596  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/659ce8ab5b51eae51852a420

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659ce8ab5b51eae51852a=
421
        failing since 218 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659ceba37e9150ce0b52a3f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659ceba37e9150ce0b52a=
3f3
        failing since 286 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659cec1ee27b10923752a445

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659cec1ee27b10923752a=
446
        failing since 284 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/659d04385946d0e31252a3f1

  Results:     40 PASS, 9 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-beaglebone-black.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-beaglebone-black.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/659d04385946d0e3=
1252a3f6
        new failure (last pass: next-20240108)
        1 lines

    2024-01-09T08:30:19.729160  / # =

    2024-01-09T08:30:19.740812  =

    2024-01-09T08:30:19.842931  / # #
    2024-01-09T08:30:19.852677  #
    2024-01-09T08:30:19.953523  / # export SHELL=3D/bin/sh
    2024-01-09T08:30:19.964641  export SHELL=3D/bin/sh
    2024-01-09T08:30:20.065371  / # . /lava-1072653/environment
    2024-01-09T08:30:20.076615  . /lava-1072653/environment
    2024-01-09T08:30:20.177642  / # /lava-1072653/bin/lava-test-runner /lav=
a-1072653/0
    2024-01-09T08:30:20.188448  /lava-1072653/bin/lava-test-runner /lava-10=
72653/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659ce3d6bdec472fac52a433

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659ce3d6bdec472fac52a=
434
        failing since 637 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
juno-uboot                   | arm64 | lab-broonie   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659ce71af9d16d490a52a410

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-juno-uboo=
t.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-juno-uboo=
t.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659ce71af9d16d490a52a=
411
        new failure (last pass: next-20240108) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
juno-uboot                   | arm64 | lab-broonie   | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/659ce9c2492882bc9852a45e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-juno-uboot.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-juno-uboot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659ce9c2492882bc9852a=
45f
        new failure (last pass: next-20240108) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/659ce5c80c0ff8ae6852a432

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659ce5c80c0ff8ae6852a439
        failing since 26 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-09T06:20:33.046901  / # #
    2024-01-09T06:20:33.147641  export SHELL=3D/bin/sh
    2024-01-09T06:20:33.147898  #
    2024-01-09T06:20:33.248403  / # export SHELL=3D/bin/sh. /lava-414660/en=
vironment
    2024-01-09T06:20:33.248736  =

    2024-01-09T06:20:33.349261  / # . /lava-414660/environment/lava-414660/=
bin/lava-test-runner /lava-414660/1
    2024-01-09T06:20:33.349638  =

    2024-01-09T06:20:33.361464  / # /lava-414660/bin/lava-test-runner /lava=
-414660/1
    2024-01-09T06:20:33.454363  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-09T06:20:33.454501  + cd /lava-414660/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/659ce5c80c0ff8ae6852a43d
        failing since 26 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-09T06:20:35.668111  /lava-414660/1/../bin/lava-test-case
    2024-01-09T06:20:35.695181  <8>[   26.044653] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
9ce5c80c0ff8ae6852a43f
        failing since 26 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-09T06:20:36.757059  /lava-414660/1/../bin/lava-test-case
    2024-01-09T06:20:36.783508  <8>[   27.133036] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/659ce5c80c0ff8ae6852a444
        failing since 26 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-09T06:20:38.015730  /lava-414660/1/../bin/lava-test-case
    2024-01-09T06:20:38.042733  <8>[   28.392733] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/659ce5c80c0ff8ae6852a445
        failing since 26 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-09T06:20:39.066502  /lava-414660/1/../bin/lava-test-case
    2024-01-09T06:20:39.093580  <8>[   29.442675] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 5          =


  Details:     https://kernelci.org/test/plan/id/659ce8eb46a5dbf58c52a425

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659ce8eb46a5dbf58c52a42c
        failing since 28 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-09T06:33:59.874771  / # #
    2024-01-09T06:33:59.976702  export SHELL=3D/bin/sh
    2024-01-09T06:33:59.977358  #
    2024-01-09T06:34:00.078745  / # export SHELL=3D/bin/sh. /lava-414678/en=
vironment
    2024-01-09T06:34:00.079491  =

    2024-01-09T06:34:00.180844  / # . /lava-414678/environment/lava-414678/=
bin/lava-test-runner /lava-414678/1
    2024-01-09T06:34:00.182096  =

    2024-01-09T06:34:00.222340  / # /lava-414678/bin/lava-test-runner /lava=
-414678/1
    2024-01-09T06:34:00.251004  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-09T06:34:00.284908  + cd /lava-414678/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/659ce8eb46a5dbf58c52a430
        failing since 28 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-09T06:34:02.500070  /lava-414678/1/../bin/lava-test-case
    2024-01-09T06:34:02.527171  <8>[   26.147759] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
9ce8eb46a5dbf58c52a432
        failing since 28 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-09T06:34:03.588533  /lava-414678/1/../bin/lava-test-case
    2024-01-09T06:34:03.614206  <8>[   27.235856] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/659ce8eb46a5dbf58c52a437
        failing since 28 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-09T06:34:04.846967  /lava-414678/1/../bin/lava-test-case
    2024-01-09T06:34:04.874818  <8>[   28.495422] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/659ce8eb46a5dbf58c52a438
        failing since 28 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-09T06:34:05.897559  /lava-414678/1/../bin/lava-test-case
    2024-01-09T06:34:05.925894  <8>[   29.545862] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/659ceba7013eab5b2352a44d

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659ceba7013eab5b2352a454
        failing since 28 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-09T06:45:37.302095  / # #
    2024-01-09T06:45:37.404067  export SHELL=3D/bin/sh
    2024-01-09T06:45:37.404699  #
    2024-01-09T06:45:37.505899  / # export SHELL=3D/bin/sh. /lava-414697/en=
vironment
    2024-01-09T06:45:37.506576  =

    2024-01-09T06:45:37.607750  / # . /lava-414697/environment/lava-414697/=
bin/lava-test-runner /lava-414697/1
    2024-01-09T06:45:37.608686  =

    2024-01-09T06:45:37.613746  / # /lava-414697/bin/lava-test-runner /lava=
-414697/1
    2024-01-09T06:45:37.708834  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-09T06:45:37.709258  + cd /lava-414697/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/659ceba7013eab5b2352a458
        failing since 28 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-09T06:45:39.888827  /lava-414697/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
9ceba7013eab5b2352a45a
        failing since 28 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-09T06:45:40.954485  /lava-414697/1/../bin/lava-test-case
    2024-01-09T06:45:40.957731  <8>[   26.856599] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/659ceba7013eab5b2352a45f
        failing since 28 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-09T06:45:42.172724  /lava-414697/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/659ceba7013eab5b2352a460
        failing since 28 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-09T06:45:42.175937  <8>[   28.069288] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-01-09T06:45:43.213590  /lava-414697/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/659ce52868e3e05d7d52a417

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659ce52868e3e05d7d52a41e
        failing since 26 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-09T06:18:01.485325  / # #
    2024-01-09T06:18:01.587596  export SHELL=3D/bin/sh
    2024-01-09T06:18:01.588253  #
    2024-01-09T06:18:01.689679  / # export SHELL=3D/bin/sh. /lava-414657/en=
vironment
    2024-01-09T06:18:01.690460  =

    2024-01-09T06:18:01.791782  / # . /lava-414657/environment/lava-414657/=
bin/lava-test-runner /lava-414657/1
    2024-01-09T06:18:01.792983  =

    2024-01-09T06:18:01.797277  / # /lava-414657/bin/lava-test-runner /lava=
-414657/1
    2024-01-09T06:18:01.901224  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-09T06:18:01.901648  + cd /lava-414657/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/659ce52868e3e05d7d52a431
        failing since 26 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-09T06:18:04.829957  /lava-414657/1/../bin/lava-test-case
    2024-01-09T06:18:04.857187  <8>[   27.034067] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/659ce8e87984b68b8552a3f3

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659ce8e87984b68b8552a3fa
        failing since 28 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-09T06:33:59.521132  / # #
    2024-01-09T06:33:59.623383  export SHELL=3D/bin/sh
    2024-01-09T06:33:59.624147  #
    2024-01-09T06:33:59.725333  / # export SHELL=3D/bin/sh. /lava-414675/en=
vironment
    2024-01-09T06:33:59.725796  =

    2024-01-09T06:33:59.827074  / # . /lava-414675/environment/lava-414675/=
bin/lava-test-runner /lava-414675/1
    2024-01-09T06:33:59.828003  =

    2024-01-09T06:33:59.831832  / # /lava-414675/bin/lava-test-runner /lava=
-414675/1
    2024-01-09T06:33:59.896347  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-09T06:33:59.936205  + cd /lava-414675/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/659ce8e87984b68b8552a40d
        failing since 28 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-09T06:34:02.865203  /lava-414675/1/../bin/lava-test-case
    2024-01-09T06:34:02.893125  <8>[   27.073077] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/659cebaa013eab5b2352a4b6

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659cebaa013eab5b2352a4bd
        failing since 28 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-09T06:45:36.929799  / # #
    2024-01-09T06:45:37.031691  export SHELL=3D/bin/sh
    2024-01-09T06:45:37.032417  #
    2024-01-09T06:45:37.133805  / # export SHELL=3D/bin/sh. /lava-414698/en=
vironment
    2024-01-09T06:45:37.134642  =

    2024-01-09T06:45:37.235907  / # . /lava-414698/environment/lava-414698/=
bin/lava-test-runner /lava-414698/1
    2024-01-09T06:45:37.236933  =

    2024-01-09T06:45:37.240876  / # /lava-414698/bin/lava-test-runner /lava=
-414698/1
    2024-01-09T06:45:37.345992  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-09T06:45:37.346422  + cd /lava-414698/1/tests/1_bootrr<8>[   23=
.879514] <LAVA_SIGNAL_STARTRUN 1_bootrr 414698_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/659cebaa013eab5b2352a4d0
        failing since 28 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-09T06:45:40.102662  /lava-414698/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12a-u200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/659cef4e1be2d0c12052a403

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659cef4e1be2d0c12052a=
404
        failing since 19 days (last pass: next-20231115, first fail: next-2=
0231220) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/659cef4b1be2d0c12052a400

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659cef4b1be2d0c12052a=
401
        failing since 5 days (last pass: next-20231106, first fail: next-20=
240103) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/659ce31e791d5a28fc52a425

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659ce31e791d5a28fc52a=
426
        failing since 19 days (last pass: next-20231215, first fail: next-2=
0231220) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/659ceb4becc6a986b752a5a2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8192-=
asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8192-=
asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659ceb4becc6a986b752a=
5a3
        failing since 18 days (last pass: next-20231219, first fail: next-2=
0231221) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/659ce7aa693232d07252a55e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659ce7aa693232d07252a=
55f
        failing since 18 days (last pass: next-20231220, first fail: next-2=
0231221) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659ce4ae93b8e394fd52a412

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659ce4ae93b8e394fd52a=
413
        failing since 412 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659ce382ec6a1649e452a3f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659ce382ec6a1649e452a=
3f9
        failing since 412 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/659ce32592dd16ee9752a402

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659ce32592dd16ee9752a=
403
        failing since 335 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/659ce32692dd16ee9752a407

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659ce32692dd16ee9752a=
408
        failing since 335 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | clang-17 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/659ce8804bce2dbed452a489

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659ce8804bce2dbed452a492
        failing since 222 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-01-09T06:32:18.532564  / # #
    2024-01-09T06:32:18.633841  export SHELL=3D/bin/sh
    2024-01-09T06:32:18.634918  #
    2024-01-09T06:32:18.736738  / # export SHELL=3D/bin/sh. /lava-3905060/e=
nvironment
    2024-01-09T06:32:18.737630  =

    2024-01-09T06:32:18.839359  / # . /lava-3905060/environment/lava-390506=
0/bin/lava-test-runner /lava-3905060/1
    2024-01-09T06:32:18.839990  =

    2024-01-09T06:32:18.856199  / # /lava-3905060/bin/lava-test-runner /lav=
a-3905060/1
    2024-01-09T06:32:18.968178  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-09T06:32:18.968869  + cd /lava-3905060/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | clang-17 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/659ce852b28f0bf20552a419

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659ce852b28f0bf20552a422
        failing since 222 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-01-09T06:31:26.675518  + set +x[   19.999000] <LAVA_SIGNAL_ENDRUN =
0_dmesg 451613_1.5.2.4.1>
    2024-01-09T06:31:26.675837  =

    2024-01-09T06:31:26.783800  / # #
    2024-01-09T06:31:26.885386  export SHELL=3D/bin/sh
    2024-01-09T06:31:26.885972  #
    2024-01-09T06:31:26.986945  / # export SHELL=3D/bin/sh. /lava-451613/en=
vironment
    2024-01-09T06:31:26.987558  =

    2024-01-09T06:31:27.088652  / # . /lava-451613/environment/lava-451613/=
bin/lava-test-runner /lava-451613/1
    2024-01-09T06:31:27.089584  =

    2024-01-09T06:31:27.092568  / # /lava-451613/bin/lava-test-runner /lava=
-451613/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/659ce362aa56b8736052a447

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659ce362aa56b8736052a450
        failing since 222 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-01-09T06:10:32.745073  <8>[   14.023748] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3905001_1.5.2.4.1>
    2024-01-09T06:10:32.848488  / # #
    2024-01-09T06:10:32.949616  export SHELL=3D/bin/sh
    2024-01-09T06:10:32.950232  #
    2024-01-09T06:10:33.050990  / # export SHELL=3D/bin/sh. /lava-3905001/e=
nvironment
    2024-01-09T06:10:33.051411  =

    2024-01-09T06:10:33.152193  / # . /lava-3905001/environment/lava-390500=
1/bin/lava-test-runner /lava-3905001/1
    2024-01-09T06:10:33.153211  =

    2024-01-09T06:10:33.195991  / # /lava-3905001/bin/lava-test-runner /lav=
a-3905001/1
    2024-01-09T06:10:33.289397  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/659ce98421ae9c7ad552a410

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659ce98421ae9c7ad552a419
        failing since 216 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-01-09T06:36:21.724720  <8>[   16.021374] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3905092_1.5.2.4.1>
    2024-01-09T06:36:21.832177  / # #
    2024-01-09T06:36:21.934557  export SHELL=3D/bin/sh
    2024-01-09T06:36:21.935357  #
    2024-01-09T06:36:22.036712  / # export SHELL=3D/bin/sh. /lava-3905092/e=
nvironment
    2024-01-09T06:36:22.037176  =

    2024-01-09T06:36:22.137940  / # . /lava-3905092/envir/lava-3905092/bin/=
lava-test-runner /lava-3905092/1
    2024-01-09T06:36:22.138440  onment
    2024-01-09T06:36:22.156088  / # /lava-3905092/bin/lava-test-runner /lav=
a-3905092/1
    2024-01-09T06:36:22.274758  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659ceb1c0c434a413552a446

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659ceb1c0c434a413552a44f
        failing since 216 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-01-09T06:43:13.503900  + set +x<8>[   13.692211] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3905108_1.5.2.4.1>
    2024-01-09T06:43:13.504337  =

    2024-01-09T06:43:13.612379  / # #
    2024-01-09T06:43:13.714839  export SHELL=3D/bin/sh
    2024-01-09T06:43:13.715848  #
    2024-01-09T06:43:13.817513  / # export SHELL=3D/bin/sh. /lava-3905108/e=
nvironment
    2024-01-09T06:43:13.818584  =

    2024-01-09T06:43:13.920296  / # . /lava-3905108/environment/lava-390510=
8/bin/lava-test-runner /lava-3905108/1
    2024-01-09T06:43:13.921737  =

    2024-01-09T06:43:13.935018  / # /lava-3905108/bin/lava-test-runner /lav=
a-3905108/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/659ce3510c640328c052a476

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659ce3510c640328c052a47f
        failing since 222 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-01-09T06:10:00.546469  + set +x
    2024-01-09T06:10:00.548198  [   19.174066] <LAVA_SIGNAL_ENDRUN 0_dmesg =
451604_1.5.2.4.1>
    2024-01-09T06:10:00.656608  / # #
    2024-01-09T06:10:00.758183  export SHELL=3D/bin/sh
    2024-01-09T06:10:00.758708  #
    2024-01-09T06:10:00.859688  / # export SHELL=3D/bin/sh. /lava-451604/en=
vironment
    2024-01-09T06:10:00.860226  =

    2024-01-09T06:10:00.961216  / # . /lava-451604/environment/lava-451604/=
bin/lava-test-runner /lava-451604/1
    2024-01-09T06:10:00.962046  =

    2024-01-09T06:10:00.967858  / # /lava-451604/bin/lava-test-runner /lava=
-451604/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/659ce99216ee98655552a3f1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659ce99216ee98655552a3fa
        failing since 216 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-01-09T06:36:48.915363  + set +x
    2024-01-09T06:36:48.917179  [   22.320486] <LAVA_SIGNAL_ENDRUN 0_dmesg =
451616_1.5.2.4.1>
    2024-01-09T06:36:49.025150  / # #
    2024-01-09T06:36:49.126708  export SHELL=3D/bin/sh
    2024-01-09T06:36:49.127231  #
    2024-01-09T06:36:49.228204  / # export SHELL=3D/bin/sh. /lava-451616/en=
vironment
    2024-01-09T06:36:49.228715  =

    2024-01-09T06:36:49.329748  / # . /lava-451616/environment/lava-451616/=
bin/lava-test-runner /lava-451616/1
    2024-01-09T06:36:49.330671  =

    2024-01-09T06:36:49.333295  / # /lava-451616/bin/lava-test-runner /lava=
-451616/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659ceae663a657001f52a405

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240109/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659ceae663a657001f52a40e
        failing since 216 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-01-09T06:42:28.440626  + set +x[   20.584155] <LAVA_SIGNAL_ENDRUN =
0_dmesg 451623_1.5.2.4.1>
    2024-01-09T06:42:28.440950  =

    2024-01-09T06:42:28.548789  / # #
    2024-01-09T06:42:28.650314  export SHELL=3D/bin/sh
    2024-01-09T06:42:28.650852  #
    2024-01-09T06:42:28.751816  / # export SHELL=3D/bin/sh. /lava-451623/en=
vironment
    2024-01-09T06:42:28.752359  =

    2024-01-09T06:42:28.853332  / # . /lava-451623/environment/lava-451623/=
bin/lava-test-runner /lava-451623/1
    2024-01-09T06:42:28.854147  =

    2024-01-09T06:42:28.856954  / # /lava-451623/bin/lava-test-runner /lava=
-451623/1 =

    ... (12 line(s) more)  =

 =20

