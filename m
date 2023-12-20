Return-Path: <linux-next+bounces-486-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 860E281A2D0
	for <lists+linux-next@lfdr.de>; Wed, 20 Dec 2023 16:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC361B218EC
	for <lists+linux-next@lfdr.de>; Wed, 20 Dec 2023 15:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9DD940BE8;
	Wed, 20 Dec 2023 15:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Y7aCWBII"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B521405F0
	for <linux-next@vger.kernel.org>; Wed, 20 Dec 2023 15:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d3ce28ac3cso21145375ad.0
        for <linux-next@vger.kernel.org>; Wed, 20 Dec 2023 07:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1703086631; x=1703691431; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IlPEO4zunRuL8S6Kupb/D//vOW6dsXldyCiKBpGQ1H8=;
        b=Y7aCWBIItz0moLAAlg6/J6Q6dPY1U7U8SkwPoOMuxY4lYll5RmuvsDERmYdG9wdgU2
         Y7o3Nmv2Z+xk0ZeUoe1yRUyJQ7tmYPR3Od/Tpb0AskeCEfUqJ9P1uliM4XRNMtEoH2a3
         sBqsEsc+SPpcnH5oDSOn3CH2v8gadAedCDkjnBEp1sQegzr++0R7tEAD2VFmpeHBpfX4
         FjlYHrv376i9NIGrAPfGUsF9pRIs/Ksc5UjRGHJejC4/3nXdOwADsyq97Bf1KBI7QC0p
         45QgrVLEYxCmJlcYzS+iEemtqYaCXsIwo0ZaE7l3qN2Xo7q23VaD5iP5rV2R/OOkatZQ
         0CqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703086631; x=1703691431;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IlPEO4zunRuL8S6Kupb/D//vOW6dsXldyCiKBpGQ1H8=;
        b=ZJPN1XQ5wb7knBL543YnTEzDkCkutFwREoZVNAOz1FD0WPoJF3jmC8H40+btYTuRpd
         pGUemVCMNJ5XRc0VIQr/RxTNTA36h83PZWu5c7rQzigQZMQEVK6euhVXpaUgTkIUMHXd
         CZwhWCX0C7nt6pEjkyF/BWwhhh9SuIWM9QZDSS4cqkg39yzh2xPew2lg/9kbHVIoifJ7
         /h/m9LoCjJ1beKoggDUgMPep0JbGOBhQNI1TV4bsoj87aASR45+oUpCeXWrn9G8jRaYU
         1BqVUnX5yRpFMHWyCkMYsUxBjKBjwPgdDQPY4taYBD96YGukGf7rJUq2nsLYDOUo9n0+
         384g==
X-Gm-Message-State: AOJu0Ywl2pUstSrVZXuZsGVByILDdUlDWWgevHdtoPPTFzEmuBjc2Xsl
	EArreh+8QTDbWttkOmgKlRa1LUpDlceJag5uY24=
X-Google-Smtp-Source: AGHT+IHjQXSeXkXWNNrN87lnFGW1+TPPHTmkG4nSUmq/daYvgnZcxkAaj8Fd42Cor3bbyAlbusug8w==
X-Received: by 2002:a17:903:2303:b0:1d0:ab57:2483 with SMTP id d3-20020a170903230300b001d0ab572483mr11174815plh.98.1703086630271;
        Wed, 20 Dec 2023 07:37:10 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id u2-20020a17090282c200b001d2e958e34bsm14165700plz.159.2023.12.20.07.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 07:37:09 -0800 (PST)
Message-ID: <65830a25.170a0220.1c9c8.ac6a@mx.google.com>
Date: Wed, 20 Dec 2023 07:37:09 -0800 (PST)
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
X-Kernelci-Kernel: next-20231220
Subject: next/master baseline: 590 runs, 71 regressions (next-20231220)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 590 runs, 71 regressions (next-20231220)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig            | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm   | lab-cip       | clang-17 | multi_v7_=
defconfig           | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

k3-am625-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+videodec           | 1          =

k3-j721e-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 5          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 2          =

meson-g12a-u200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-collabora | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora | gcc-10   | defconfig=
+debug              | 1          =

qemu_mips-malta              | mips  | lab-collabora | gcc-10   | malta_def=
config              | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+videodec           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ok+kselftest | 1          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ok+kselftest | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe    | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe    | gcc-10   | defconfig=
+videodec           | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe    | gcc-10   | defconfig=
                    | 1          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe    | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

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

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =

sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231220/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231220
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      20d857259d7d10cd0d5e8b60608455986167cfad =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6582cff5f390b72c1ae13500

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/6582cff5f390b72c1ae13517
        failing since 198 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-12-20T11:28:46.200554  /lava-377107/1/../bin/lava-test-case
    2023-12-20T11:28:46.243623  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6582d33779bd85211ee13494

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6582d33779bd85211ee13=
495
        failing since 198 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6582ceebe3e3c76db5e13477

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6582ceebe3e3c76db5e13=
478
        failing since 266 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | clang-17 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6582e289f923104687e13476

  Results:     40 PASS, 9 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm/=
multi_v7_defconfig/clang-17/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm/=
multi_v7_defconfig/clang-17/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6582e28af9231046=
87e134aa
        new failure (last pass: next-20231219)
        1 lines

    2023-12-20T12:47:38.521688  / # =

    2023-12-20T12:47:38.532532  =

    2023-12-20T12:47:38.634612  / # #
    2023-12-20T12:47:38.644476  #
    2023-12-20T12:47:38.745324  / # export SHELL=3D/bin/sh
    2023-12-20T12:47:38.756401  export SHELL=3D/bin/sh
    2023-12-20T12:47:38.857338  / # . /lava-1062770/environment
    2023-12-20T12:47:38.868327  . /lava-1062770/environment
    2023-12-20T12:47:38.969325  / # /lava-1062770/bin/lava-test-runner /lav=
a-1062770/0
    2023-12-20T12:47:38.980252  /lava-1062770/bin/lava-test-runner /lava-10=
62770/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6582cfc71a3765c93ae13482

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6582cfc71a3765c93ae13=
483
        failing since 617 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
k3-am625-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6582ccf1e98e2dc5e9e1353b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6582ccf1e98e2dc5e9e13=
53c
        new failure (last pass: next-20231219) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
k3-j721e-sk                  | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6582d59da028761022e134d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-k3-j721=
e-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-k3-j721=
e-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6582d59da028761022e13=
4d6
        new failure (last pass: next-20231215) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/6582d8513a5c9066b0e1349c

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6582d8513a5c9066b0e1349f
        failing since 5 days (last pass: next-20231208, first fail: next-20=
231214)

    2023-12-20T12:04:06.488034  / # #
    2023-12-20T12:04:06.588777  export SHELL=3D/bin/sh
    2023-12-20T12:04:06.589069  #
    2023-12-20T12:04:06.689613  / # export SHELL=3D/bin/sh. /lava-408414/en=
vironment
    2023-12-20T12:04:06.689953  =

    2023-12-20T12:04:06.790516  / # . /lava-408414/environment/lava-408414/=
bin/lava-test-runner /lava-408414/1
    2023-12-20T12:04:06.790889  =

    2023-12-20T12:04:06.802400  / # /lava-408414/bin/lava-test-runner /lava=
-408414/1
    2023-12-20T12:04:06.844728  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-20T12:04:06.858669  + <8>[   20.712645] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 408414_1.5.2.4.5> =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/6582d8513a5c9066b0e134a3
        failing since 5 days (last pass: next-20231208, first fail: next-20=
231214)

    2023-12-20T12:04:07.926911  <8>[   21.799789] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-driver-present RESULT=3Dpass>
    2023-12-20T12:04:08.962636  /lava-408414/1/../bin/lava-test-case
    2023-12-20T12:04:08.963027  <8>[   22.821631] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-12-20T12:04:08.963438  /lava-408414/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
82d8513a5c9066b0e134a5
        failing since 5 days (last pass: next-20231208, first fail: next-20=
231214)

    2023-12-20T12:04:10.020703  /lava-408414/1/../bin/lava-test-case
    2023-12-20T12:04:10.020872  <8>[   23.860950] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-12-20T12:04:10.020979  /lava-408414/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/6582d8513a5c9066b0e134aa
        failing since 5 days (last pass: next-20231208, first fail: next-20=
231214)

    2023-12-20T12:04:10.078772  <8>[   23.952289] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-driver-present RESULT=3Dpass>
    2023-12-20T12:04:11.097275  /lava-408414/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/6582d8513a5c9066b0e134ab
        failing since 5 days (last pass: next-20231208, first fail: next-20=
231214)

    2023-12-20T12:04:11.100360  <8>[   24.973564] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-20T12:04:12.155973  /lava-408414/1/../bin/lava-test-case
    2023-12-20T12:04:12.156116  <8>[   25.994264] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-12-20T12:04:12.156205  /lava-408414/1/../bin/lava-test-case
    2023-12-20T12:04:12.156278  <8>[   26.010476] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-12-20T12:04:12.156348  /lava-408414/1/../bin/lava-test-case
    2023-12-20T12:04:12.156416  <8>[   26.029990] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-probed RESULT=3Dpass>
    2023-12-20T12:04:12.156482  /lava-408414/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/6582cb7f96fae629a0e134a7

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6582cb7f96fae629a0e134aa
        failing since 7 days (last pass: next-20231208, first fail: next-20=
231213)

    2023-12-20T11:09:21.689369  <8>[   20.267826] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 408331_1.5.2.4.1>
    2023-12-20T11:09:21.794631  / # #
    2023-12-20T11:09:21.896735  export SHELL=3D/bin/sh
    2023-12-20T11:09:21.897441  #
    2023-12-20T11:09:21.998986  / # export SHELL=3D/bin/sh. /lava-408331/en=
vironment
    2023-12-20T11:09:21.999691  =

    2023-12-20T11:09:22.100989  / # . /lava-408331/environment/lava-408331/=
bin/lava-test-runner /lava-408331/1
    2023-12-20T11:09:22.102119  =

    2023-12-20T11:09:22.120519  / # /lava-408331/bin/lava-test-runner /lava=
-408331/1
    2023-12-20T11:09:22.164885  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/6582cb7f96fae629a0e134ae
        failing since 7 days (last pass: next-20231208, first fail: next-20=
231213)

    2023-12-20T11:09:24.273388  /lava-408331/1/../bin/lava-test-case
    2023-12-20T11:09:24.273829  <8>[   22.840341] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-12-20T11:09:24.274259  /lava-408331/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
82cb7f96fae629a0e134b0
        failing since 7 days (last pass: next-20231208, first fail: next-20=
231213)

    2023-12-20T11:09:25.337043  /lava-408331/1/../bin/lava-test-case
    2023-12-20T11:09:25.337470  <8>[   23.880388] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-12-20T11:09:25.337800  /lava-408331/1/../bin/lava-test-case
    2023-12-20T11:09:25.338080  <8>[   23.897667] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-12-20T11:09:25.338356  /lava-408331/1/../bin/lava-test-case
    2023-12-20T11:09:25.338624  <8>[   23.917925] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2023-12-20T11:09:25.338888  /lava-408331/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/6582cb7f96fae629a0e134b5
        failing since 7 days (last pass: next-20231208, first fail: next-20=
231213)

    2023-12-20T11:09:26.413369  /lava-408331/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/6582cb7f96fae629a0e134b6
        failing since 7 days (last pass: next-20231208, first fail: next-20=
231213)

    2023-12-20T11:09:26.416614  <8>[   24.997171] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-20T11:09:27.469543  /lava-408331/1/../bin/lava-test-case
    2023-12-20T11:09:27.469993  <8>[   26.017629] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-12-20T11:09:27.470286  /lava-408331/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/6582cbf71b3921ca30e134ec

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6582cbf71b3921ca30e134ef
        failing since 8 days (last pass: next-20231207, first fail: next-20=
231212)

    2023-12-20T11:11:29.907504  / # #
    2023-12-20T11:11:30.008312  export SHELL=3D/bin/sh
    2023-12-20T11:11:30.008596  #
    2023-12-20T11:11:30.109182  / # export SHELL=3D/bin/sh. /lava-408333/en=
vironment
    2023-12-20T11:11:30.109498  =

    2023-12-20T11:11:30.210167  / # . /lava-408333/environment/lava-408333/=
bin/lava-test-runner /lava-408333/1
    2023-12-20T11:11:30.211012  =

    2023-12-20T11:11:30.221844  / # /lava-408333/bin/lava-test-runner /lava=
-408333/1
    2023-12-20T11:11:30.264749  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-20T11:11:30.278109  + <8>[   20.670262] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 408333_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/6582cbf71b3921ca30e134f3
        failing since 8 days (last pass: next-20231207, first fail: next-20=
231212)

    2023-12-20T11:11:32.381686  /lava-408333/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
82cbf71b3921ca30e134f5
        failing since 8 days (last pass: next-20231207, first fail: next-20=
231212)

    2023-12-20T11:11:33.440621  /lava-408333/1/../bin/lava-test-case
    2023-12-20T11:11:33.440784  <8>[   23.818782] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-12-20T11:11:33.440875  /lava-408333/1/../bin/lava-test-case
    2023-12-20T11:11:33.440953  <8>[   23.835873] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-12-20T11:11:33.441026  /lava-408333/1/../bin/lava-test-case
    2023-12-20T11:11:33.441095  <8>[   23.855317] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2023-12-20T11:11:33.441163  /lava-408333/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/6582cbf71b3921ca30e134fa
        failing since 8 days (last pass: next-20231207, first fail: next-20=
231212)

    2023-12-20T11:11:34.519105  /lava-408333/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/6582cbf71b3921ca30e134fb
        failing since 8 days (last pass: next-20231207, first fail: next-20=
231212)

    2023-12-20T11:11:34.522384  <8>[   24.934058] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-20T11:11:35.581035  /lava-408333/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 5          =


  Details:     https://kernelci.org/test/plan/id/6582cdff0795a0a63ae135b4

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6582cdff0795a0a63ae135b7
        failing since 9 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-20T11:20:14.324975  / # #
    2023-12-20T11:20:14.425728  export SHELL=3D/bin/sh
    2023-12-20T11:20:14.426048  #
    2023-12-20T11:20:14.526568  / # export SHELL=3D/bin/sh. /lava-408364/en=
vironment
    2023-12-20T11:20:14.526847  =

    2023-12-20T11:20:14.627657  / # . /lava-408364/environment/lava-408364/=
bin/lava-test-runner /lava-408364/1
    2023-12-20T11:20:14.628589  =

    2023-12-20T11:20:14.636825  / # /lava-408364/bin/lava-test-runner /lava=
-408364/1
    2023-12-20T11:20:14.693098  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-20T11:20:14.693492  + <8>[   20.595051] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 408364_1.5.2.4.5> =

    ... (18 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/6582cdff0795a0a63ae135bb
        failing since 9 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-20T11:20:16.800110  /lava-408364/1/../bin/lava-test-case
    2023-12-20T11:20:16.800244  <8>[   22.705304] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-12-20T11:20:16.800314  /lava-408364/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
82cdff0795a0a63ae135bd
        failing since 9 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-20T11:20:17.857921  /lava-408364/1/../bin/lava-test-case
    2023-12-20T11:20:17.858066  <8>[   23.744058] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-12-20T11:20:17.858153  /lava-408364/1/../bin/lava-test-case
    2023-12-20T11:20:17.858226  <8>[   23.761094] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-12-20T11:20:17.858298  /lava-408364/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/6582cdff0795a0a63ae135c2
        failing since 9 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-20T11:20:18.935216  /lava-408364/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/6582cdff0795a0a63ae135c3
        failing since 9 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-20T11:20:18.938290  <8>[   24.857309] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-20T11:20:19.999445  /lava-408364/1/../bin/lava-test-case
    2023-12-20T11:20:19.999598  <8>[   25.879710] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-12-20T11:20:19.999689  /lava-408364/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/6582d3f2d21e03bc65e13475

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6582d3f2d21e03bc65e13478
        failing since 9 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-20T11:45:30.501255  / # #
    2023-12-20T11:45:30.603216  export SHELL=3D/bin/sh
    2023-12-20T11:45:30.603873  #
    2023-12-20T11:45:30.705262  / # export SHELL=3D/bin/sh. /lava-408379/en=
vironment
    2023-12-20T11:45:30.705842  =

    2023-12-20T11:45:30.807268  / # . /lava-408379/environment/lava-408379/=
bin/lava-test-runner /lava-408379/1
    2023-12-20T11:45:30.808392  =

    2023-12-20T11:45:30.828420  / # /lava-408379/bin/lava-test-runner /lava=
-408379/1
    2023-12-20T11:45:30.872786  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-20T11:45:30.873213  + <8>[   20.680968] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 408379_1.5.2.4.5> =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/6582d3f2d21e03bc65e1347c
        failing since 9 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-20T11:45:32.977975  /lava-408379/1/../bin/lava-test-case
    2023-12-20T11:45:32.978388  <8>[   22.787896] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-12-20T11:45:32.978685  /lava-408379/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
82d3f2d21e03bc65e1347e
        failing since 9 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-20T11:45:34.036480  /lava-408379/1/../bin/lava-test-case
    2023-12-20T11:45:34.036992  <8>[   23.825284] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-12-20T11:45:34.037346  /lava-408379/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/6582d3f2d21e03bc65e13483
        failing since 9 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-20T11:45:35.113676  /lava-408379/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/6582d3f2d21e03bc65e13484
        failing since 9 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-20T11:45:35.117022  <8>[   24.940306] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-20T11:45:36.175412  /lava-408379/1/../bin/lava-test-case
    2023-12-20T11:45:36.175868  <8>[   25.961123] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-12-20T11:45:36.176217  /lava-408379/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6582d8653a5c9066b0e134ff

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6582d8653a5c9066b0e13502
        failing since 5 days (last pass: next-20231208, first fail: next-20=
231214)

    2023-12-20T12:04:27.037262  / # #
    2023-12-20T12:04:27.139248  export SHELL=3D/bin/sh
    2023-12-20T12:04:27.139960  #
    2023-12-20T12:04:27.241375  / # export SHELL=3D/bin/sh. /lava-408407/en=
vironment
    2023-12-20T12:04:27.242110  =

    2023-12-20T12:04:27.343681  / # . /lava-408407/environment/lava-408407/=
bin/lava-test-runner /lava-408407/1
    2023-12-20T12:04:27.344855  =

    2023-12-20T12:04:27.385181  / # /lava-408407/bin/lava-test-runner /lava=
-408407/1
    2023-12-20T12:04:27.419370  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-20T12:04:27.419796  + <8>[   21.234480] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 408407_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/6582d8653a5c9066b0e13515
        failing since 5 days (last pass: next-20231208, first fail: next-20=
231214)

    2023-12-20T12:04:29.842206  /lava-408407/1/../bin/lava-test-case
    2023-12-20T12:04:29.842648  <8>[   23.650484] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-20T12:04:29.842948  /lava-408407/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6582cb6b6c3fc75577e1349e

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6582cb6b6c3fc75577e134a1
        failing since 7 days (last pass: next-20231208, first fail: next-20=
231213)

    2023-12-20T11:09:12.256748  / # #
    2023-12-20T11:09:12.358631  export SHELL=3D/bin/sh
    2023-12-20T11:09:12.359213  #
    2023-12-20T11:09:12.460270  / # export SHELL=3D/bin/sh. /lava-408329/en=
vironment
    2023-12-20T11:09:12.460800  =

    2023-12-20T11:09:12.561837  / # . /lava-408329/environment/lava-408329/=
bin/lava-test-runner /lava-408329/1
    2023-12-20T11:09:12.562844  =

    2023-12-20T11:09:12.565909  / # /lava-408329/bin/lava-test-runner /lava=
-408329/1
    2023-12-20T11:09:12.634856  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-20T11:09:12.635221  + <8>[   20.989989] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 408329_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/6582cb6b6c3fc75577e134b4
        failing since 7 days (last pass: next-20231208, first fail: next-20=
231213)

    2023-12-20T11:09:15.064130  /lava-408329/1/../bin/lava-test-case
    2023-12-20T11:09:15.064769  <8>[   23.408035] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-20T11:09:15.065039  /lava-408329/1/../bin/lava-test-case
    2023-12-20T11:09:15.065269  <8>[   23.425703] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-12-20T11:09:15.065489  /lava-408329/1/../bin/lava-test-case
    2023-12-20T11:09:15.065695  <8>[   23.444942] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-probed RESULT=3Dpass>
    2023-12-20T11:09:15.065897  /lava-408329/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/6582cbe31b3921ca30e13475

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6582cbe31b3921ca30e13478
        failing since 8 days (last pass: next-20231207, first fail: next-20=
231212)

    2023-12-20T11:11:08.758908  / # #
    2023-12-20T11:11:08.859664  export SHELL=3D/bin/sh
    2023-12-20T11:11:08.859986  #
    2023-12-20T11:11:08.970074  / # export SHELL=3D/bin/sh. /lava-408338/en=
vironment
    2023-12-20T11:11:08.971327  =

    2023-12-20T11:11:09.072482  / # . /lava-408338/environment/lava-408338/=
bin/lava-test-runner /lava-408338/1
    2023-12-20T11:11:09.073155  =

    2023-12-20T11:11:09.086746  / # /lava-408338/bin/lava-test-runner /lava=
-408338/1
    2023-12-20T11:11:09.145675  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-20T11:11:09.146055  + <8>[   20.981980] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 408338_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/6582cbe31b3921ca30e1348b
        failing since 8 days (last pass: next-20231207, first fail: next-20=
231212)

    2023-12-20T11:11:11.569532  /lava-408338/1/../bin/lava-test-case
    2023-12-20T11:11:11.570015  <8>[   23.393141] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-20T11:11:11.570299  /lava-408338/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6582cdebe87a6c3f99e13477

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6582cdebe87a6c3f99e1347a
        failing since 9 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-20T11:19:55.134506  / # #
    2023-12-20T11:19:55.235541  export SHELL=3D/bin/sh
    2023-12-20T11:19:55.236408  #
    2023-12-20T11:19:55.337981  / # export SHELL=3D/bin/sh. /lava-408360/en=
vironment
    2023-12-20T11:19:55.338734  =

    2023-12-20T11:19:55.439958  / # . /lava-408360/environment/lava-408360/=
bin/lava-test-runner /lava-408360/1
    2023-12-20T11:19:55.440912  =

    2023-12-20T11:19:55.447691  / # /lava-408360/bin/lava-test-runner /lava=
-408360/1
    2023-12-20T11:19:55.513598  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-20T11:19:55.514029  + <8>[   20.993846] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 408360_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/6582cdebe87a6c3f99e1348d
        failing since 9 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-20T11:19:57.950504  /lava-408360/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6582d3f08a5f5f286ee13531

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6582d3f08a5f5f286ee13534
        failing since 9 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-20T11:45:35.227238  / # #
    2023-12-20T11:45:35.329499  export SHELL=3D/bin/sh
    2023-12-20T11:45:35.330230  #
    2023-12-20T11:45:35.431710  / # export SHELL=3D/bin/sh. /lava-408375/en=
vironment
    2023-12-20T11:45:35.432435  =

    2023-12-20T11:45:35.533828  / # . /lava-408375/environment/lava-408375/=
bin/lava-test-runner /lava-408375/1
    2023-12-20T11:45:35.534958  =

    2023-12-20T11:45:35.539124  / # /lava-408375/bin/lava-test-runner /lava=
-408375/1
    2023-12-20T11:45:35.609308  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-20T11:45:35.609738  + <8>[   20.991164] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 408375_1.5.2.4.5> =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/6582d3f08a5f5f286ee13547
        failing since 9 days (last pass: next-20231207, first fail: next-20=
231211)

    2023-12-20T11:45:38.028599  /lava-408375/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12a-u200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6582d15c99f7f3ca6ce13475

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6582d15c99f7f3ca6ce13=
476
        new failure (last pass: next-20231115) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6582cd6d992645c680e13477

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6582cd6d992645c680e13=
478
        new failure (last pass: next-20231215) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6582cf8220cae23a75e13475

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6582cf8220cae23a75e13=
476
        new failure (last pass: next-20231213) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-collabora | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6582cf356f3679a360e1348d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6582cf356f3679a360e13=
48e
        new failure (last pass: next-20231213) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6582cf5afcdf7db9b2e134e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6582cf5afcdf7db9b2e13=
4e1
        failing since 8 days (last pass: next-20231211, first fail: next-20=
231212) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6582cf336f3679a360e13487

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6582cf336f3679a360e13=
488
        failing since 8 days (last pass: next-20231211, first fail: next-20=
231212) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_mips-malta              | mips  | lab-collabora | gcc-10   | malta_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/6582cdd1701793d453e13487

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6582cdd1701793d453e13=
488
        new failure (last pass: next-20231219) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6582cd4ae5edb69024e13478

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6582cd4ae5edb69024e1347d
        failing since 134 days (last pass: next-20230710, first fail: next-=
20230808)

    2023-12-20T11:17:10.773787  + set +x
    2023-12-20T11:17:10.776878  <8>[   28.232026] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1062639_1.5.2.4.1>
    2023-12-20T11:17:10.883894  / # #
    2023-12-20T11:17:12.339629  export SHELL=3D/bin/sh
    2023-12-20T11:17:12.360077  #
    2023-12-20T11:17:12.360283  / # export SHELL=3D/bin/sh
    2023-12-20T11:17:14.306439  / # . /lava-1062639/environment
    2023-12-20T11:17:17.887660  /lava-1062639/bin/lava-test-runner /lava-10=
62639/1
    2023-12-20T11:17:17.908260  . /lava-1062639/environment
    2023-12-20T11:17:17.908367  / # /lava-1062639/bin/lava-test-runner /lav=
a-1062639/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6582d4017caa07bfcbe134bd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6582d4017caa07bfcbe134c2
        failing since 141 days (last pass: next-20230712, first fail: next-=
20230801)

    2023-12-20T11:45:50.751528  + set +x
    2023-12-20T11:45:50.754673  <8>[   28.148359] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1062745_1.5.2.4.1>
    2023-12-20T11:45:50.860094  / # #
    2023-12-20T11:45:52.315198  export SHELL=3D/bin/sh
    2023-12-20T11:45:52.335669  #
    2023-12-20T11:45:52.335888  / # export SHELL=3D/bin/sh
    2023-12-20T11:45:54.282138  / # . /lava-1062745/environment
    2023-12-20T11:45:57.863493  /lava-1062745/bin/lava-test-runner /lava-10=
62745/1
    2023-12-20T11:45:57.884101  . /lava-1062745/environment
    2023-12-20T11:45:57.884202  / # /lava-1062745/bin/lava-test-runner /lav=
a-1062745/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6582ceec84a7354edce13485

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6582ceec84a7354edce13=
486
        failing since 393 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6582cded0795a0a63ae13485

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6582cded0795a0a63ae13=
486
        failing since 393 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6582d7e585c539290fe1347f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6582d7e585c539290fe13=
480
        failing since 315 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6582d7e3adb2d8fb9fe13481

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6582d7e3adb2d8fb9fe13=
482
        failing since 315 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe    | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6582cb636c3fc75577e13491

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6582cb636c3fc75577e13496
        failing since 327 days (last pass: next-20221215, first fail: next-=
20230127)

    2023-12-20T11:09:03.770865  / # #
    2023-12-20T11:09:03.872498  export SHELL=3D/bin/sh
    2023-12-20T11:09:03.873137  #
    2023-12-20T11:09:03.873411  / # <3>[   18.888002] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-12-20T11:09:03.974398  export SHELL=3D/bin/sh. /lava-449063/enviro=
nment
    2023-12-20T11:09:03.975060  =

    2023-12-20T11:09:04.076052  / # . /lava-449063/environment/lava-449063/=
bin/lava-test-runner /lava-449063/1
    2023-12-20T11:09:04.077356  =

    2023-12-20T11:09:04.093235  / # /lava-449063/bin/lava-test-runner /lava=
-449063/1
    2023-12-20T11:09:04.164228  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe    | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6582cbc6c5f14699cae134a4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6582cbc6c5f14699cae134a9
        failing since 329 days (last pass: next-20221219, first fail: next-=
20230125)

    2023-12-20T11:10:51.374175  / # #
    2023-12-20T11:10:51.475804  export SHELL=3D/bin/sh
    2023-12-20T11:10:51.476360  <3>[   18.821731] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-12-20T11:10:51.476674  #
    2023-12-20T11:10:51.577604  / # export SHELL=3D/bin/sh. /lava-449066/en=
vironment
    2023-12-20T11:10:51.578146  =

    2023-12-20T11:10:51.679136  / # . /lava-449066/environment/lava-449066/=
bin/lava-test-runner /lava-449066/1
    2023-12-20T11:10:51.680026  =

    2023-12-20T11:10:51.693491  / # /lava-449066/bin/lava-test-runner /lava=
-449066/1
    2023-12-20T11:10:51.767383  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe    | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6582cdfa95144f6ebce1349a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6582cdfa95144f6ebce1349f
        failing since 329 days (last pass: next-20221219, first fail: next-=
20230125)

    2023-12-20T11:20:17.418529  <8>[   18.770207] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 449082_1.5.2.4.1>
    2023-12-20T11:20:17.525037  / # #
    2023-12-20T11:20:17.626504  export SHELL=3D/bin/sh
    2023-12-20T11:20:17.626984  #
    2023-12-20T11:20:17.727966  / # export SHELL=3D/bin/sh. /lava-449082/en=
vironment
    2023-12-20T11:20:17.728662  =

    2023-12-20T11:20:17.829616  / # . /lava-449082/environment/lava-449082/=
bin/lava-test-runner /lava-449082/1
    2023-12-20T11:20:17.830472  =

    2023-12-20T11:20:17.833963  / # /lava-449082/bin/lava-test-runner /lava=
-449082/1
    2023-12-20T11:20:17.917943  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6582d96483af4794f4e1347b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-clabbe/baseline-sun50i-=
h6-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-clabbe/baseline-sun50i-=
h6-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6582d96483af4794f4e13=
47c
        new failure (last pass: next-20231010) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe    | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6582d8331261c348c9e13477

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-clabbe/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-clabbe/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6582d8331261c348c9e1347c
        failing since 71 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20231010)

    2023-12-20T12:03:54.481838  / # #
    2023-12-20T12:03:54.583457  export SHELL=3D/bin/sh
    2023-12-20T12:03:54.584104  #
    2023-12-20T12:03:54.685073  / # export SHELL=3D/bin/sh. /lava-449108/en=
vironment
    2023-12-20T12:03:54.685664  =

    2023-12-20T12:03:54.786635  / # . /lava-449108/environment/lava-449108/=
bin/lava-test-runner /lava-449108/1
    2023-12-20T12:03:54.787532  =

    2023-12-20T12:03:54.792168  / # /lava-449108/bin/lava-test-runner /lava=
-449108/1
    2023-12-20T12:03:54.873171  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-20T12:03:54.873645  + cd /lava-449108/<8>[   19.281430] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 449108_1.5.2.4.5> =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | clang-17 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6582d826112125d1d7e1349f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6582d826112125d1d7e134a4
        failing since 71 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20231010)

    2023-12-20T12:11:16.663574  / # #

    2023-12-20T12:11:16.765741  export SHELL=3D/bin/sh

    2023-12-20T12:11:16.766386  #

    2023-12-20T12:11:16.867670  / # export SHELL=3D/bin/sh. /lava-12326149/=
environment

    2023-12-20T12:11:16.868481  =


    2023-12-20T12:11:16.970272  / # . /lava-12326149/environment/lava-12326=
149/bin/lava-test-runner /lava-12326149/1

    2023-12-20T12:11:16.971330  =


    2023-12-20T12:11:16.987972  / # /lava-12326149/bin/lava-test-runner /la=
va-12326149/1

    2023-12-20T12:11:17.060312  + export 'TESTRUN_ID=3D1_bootrr'

    2023-12-20T12:11:17.060463  + cd /lava-1232614<8>[   19.473614] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 12326149_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | clang-17 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6582d6cfaee6b2b22ae134e3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6582d6cfaee6b2b22ae134e8
        failing since 202 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-20T11:57:38.189211  / # #
    2023-12-20T11:57:38.292271  export SHELL=3D/bin/sh
    2023-12-20T11:57:38.293750  #
    2023-12-20T11:57:38.395435  / # export SHELL=3D/bin/sh. /lava-3890243/e=
nvironment
    2023-12-20T11:57:38.396133  =

    2023-12-20T11:57:38.497937  / # . /lava-3890243/environment/lava-389024=
3/bin/lava-test-runner /lava-3890243/1
    2023-12-20T11:57:38.498653  =

    2023-12-20T11:57:38.512828  / # /lava-3890243/bin/lava-test-runner /lav=
a-3890243/1
    2023-12-20T11:57:38.636458  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-20T11:57:38.636933  + cd /lava-3890243/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | clang-17 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6582d6675fd6307840e13498

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6582d6675fd6307840e1349d
        failing since 202 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-20T11:56:02.626121  + set +x
    2023-12-20T11:56:02.628004  [   19.352761] <LAVA_SIGNAL_ENDRUN 0_dmesg =
449102_1.5.2.4.1>
    2023-12-20T11:56:02.736610  / # #
    2023-12-20T11:56:02.838144  export SHELL=3D/bin/sh
    2023-12-20T11:56:02.838677  #
    2023-12-20T11:56:02.939671  / # export SHELL=3D/bin/sh. /lava-449102/en=
vironment
    2023-12-20T11:56:02.940275  =

    2023-12-20T11:56:03.041276  / # . /lava-449102/environment/lava-449102/=
bin/lava-test-runner /lava-449102/1
    2023-12-20T11:56:03.042087  =

    2023-12-20T11:56:03.047583  / # /lava-449102/bin/lava-test-runner /lava=
-449102/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6582cc44b3409f8be4e13506

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6582cc44b3409f8be4e1350b
        failing since 202 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-20T11:12:42.406889  / # #
    2023-12-20T11:12:42.508352  export SHELL=3D/bin/sh
    2023-12-20T11:12:42.508837  #
    2023-12-20T11:12:42.609788  / # export SHELL=3D/bin/sh. /lava-3889993/e=
nvironment
    2023-12-20T11:12:42.610245  =

    2023-12-20T11:12:42.711045  / # . /lava-3889993/environment/lava-388999=
3/bin/lava-test-runner /lava-3889993/1
    2023-12-20T11:12:42.711798  =

    2023-12-20T11:12:42.732623  / # /lava-3889993/bin/lava-test-runner /lav=
a-3889993/1
    2023-12-20T11:12:42.812596  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-20T11:12:42.853110  + cd /lava-3889993/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6582cca585c7dbc99de13483

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6582cca585c7dbc99de13488
        failing since 196 days (last pass: next-20230525, first fail: next-=
20230607)

    2023-12-20T11:14:29.183696  / # #
    2023-12-20T11:14:29.284568  export SHELL=3D/bin/sh
    2023-12-20T11:14:29.284940  #
    2023-12-20T11:14:29.385603  / # export SHELL=3D/bin/sh. /lava-3890007/e=
nvironment
    2023-12-20T11:14:29.386235  =

    2023-12-20T11:14:29.487168  / # . /lava-3890007/environment/lava-389000=
7/bin/lava-test-runner /lava-3890007/1
    2023-12-20T11:14:29.487896  =

    2023-12-20T11:14:29.532086  / # /lava-3890007/bin/lava-test-runner /lav=
a-3890007/1
    2023-12-20T11:14:29.607104  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-20T11:14:29.607607  + cd /lava-3890007/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6582cd68c90cdfdbb4e134aa

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6582cd68c90cdfdbb4e134af
        failing since 196 days (last pass: next-20230517, first fail: next-=
20230607)

    2023-12-20T11:17:34.373626  <8>[   13.408953] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3890022_1.5.2.4.1>
    2023-12-20T11:17:34.481959  / # #
    2023-12-20T11:17:34.585108  export SHELL=3D/bin/sh
    2023-12-20T11:17:34.586027  #
    2023-12-20T11:17:34.687355  / # export SHELL=3D/bin/sh. /lava-3890022/e=
nvironment
    2023-12-20T11:17:34.688444  =

    2023-12-20T11:17:34.789948  / # . /lava-3890022/environment/lava-389002=
2/bin/lava-test-runner /lava-3890022/1
    2023-12-20T11:17:34.791257  =

    2023-12-20T11:17:34.805492  / # /lava-3890022/bin/lava-test-runner /lav=
a-3890022/1
    2023-12-20T11:17:34.910342  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6582cc16d9ad443c8be1348b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6582cc16d9ad443c8be13490
        failing since 202 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-20T11:12:06.023948  + set +x
    2023-12-20T11:12:06.025800  [   21.137864] <LAVA_SIGNAL_ENDRUN 0_dmesg =
449070_1.5.2.4.1>
    2023-12-20T11:12:06.134228  / # #
    2023-12-20T11:12:06.235787  export SHELL=3D/bin/sh
    2023-12-20T11:12:06.236377  #
    2023-12-20T11:12:06.337383  / # export SHELL=3D/bin/sh. /lava-449070/en=
vironment
    2023-12-20T11:12:06.337916  =

    2023-12-20T11:12:06.438904  / # . /lava-449070/environment/lava-449070/=
bin/lava-test-runner /lava-449070/1
    2023-12-20T11:12:06.439717  =

    2023-12-20T11:12:06.442386  / # /lava-449070/bin/lava-test-runner /lava=
-449070/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6582ccb742094d755ae1356a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6582ccb742094d755ae1356f
        failing since 196 days (last pass: next-20230525, first fail: next-=
20230607)

    2023-12-20T11:14:41.754669  + set +x
    2023-12-20T11:14:41.756293  [   21.944993] <LAVA_SIGNAL_ENDRUN 0_dmesg =
449074_1.5.2.4.1>
    2023-12-20T11:14:41.864454  / # #
    2023-12-20T11:14:41.966039  export SHELL=3D/bin/sh
    2023-12-20T11:14:41.966716  #
    2023-12-20T11:14:42.067689  / # export SHELL=3D/bin/sh. /lava-449074/en=
vironment
    2023-12-20T11:14:42.068203  =

    2023-12-20T11:14:42.169207  / # . /lava-449074/environment/lava-449074/=
bin/lava-test-runner /lava-449074/1
    2023-12-20T11:14:42.170067  =

    2023-12-20T11:14:42.172219  / # /lava-449074/bin/lava-test-runner /lava=
-449074/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6582cd5735c31ef603e13478

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6582cd5735c31ef603e1347d
        failing since 196 days (last pass: next-20230517, first fail: next-=
20230607)

    2023-12-20T11:17:22.259456  + set +x
    2023-12-20T11:17:22.261185  [   19.224330] <LAVA_SIGNAL_ENDRUN 0_dmesg =
449076_1.5.2.4.1>
    2023-12-20T11:17:22.369688  / # #
    2023-12-20T11:17:22.471210  export SHELL=3D/bin/sh
    2023-12-20T11:17:22.471733  #
    2023-12-20T11:17:22.572695  / # export SHELL=3D/bin/sh. /lava-449076/en=
vironment
    2023-12-20T11:17:22.573203  =

    2023-12-20T11:17:22.674186  / # . /lava-449076/environment/lava-449076/=
bin/lava-test-runner /lava-449076/1
    2023-12-20T11:17:22.675007  =

    2023-12-20T11:17:22.677935  / # /lava-449076/bin/lava-test-runner /lava=
-449076/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/6582d01029e7fbb36de134ae

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6582d01029e7fbb36de134b3
        failing since 9 days (last pass: next-20231208, first fail: next-20=
231211)

    2023-12-20T11:29:00.710926  <8>[   10.288600] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3890150_1.5.2.4.1>
    2023-12-20T11:29:00.816003  / # #
    2023-12-20T11:29:00.917588  export SHELL=3D/bin/sh
    2023-12-20T11:29:00.918114  #
    2023-12-20T11:29:01.019159  / # export SHELL=3D/bin/sh. /lava-3890150/e=
nvironment
    2023-12-20T11:29:01.019657  =

    2023-12-20T11:29:01.120627  / # . /lava-3890150/environment/lava-389015=
0/bin/lava-test-runner /lava-3890150/1
    2023-12-20T11:29:01.121326  =

    2023-12-20T11:29:01.127377  / # /lava-3890150/bin/lava-test-runner /lav=
a-3890150/1
    2023-12-20T11:29:01.291052  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/6582d00e5e12811f82e13475

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231220/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231220/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6582d00e5e12811f82e1347a
        failing since 5 days (last pass: next-20231213, first fail: next-20=
231214)

    2023-12-20T11:28:56.122031  <8>[   10.041336] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3890149_1.5.2.4.1>
    2023-12-20T11:28:56.227181  / # #
    2023-12-20T11:28:56.328728  export SHELL=3D/bin/sh
    2023-12-20T11:28:56.329204  #
    2023-12-20T11:28:56.430208  / # export SHELL=3D/bin/sh. /lava-3890149/e=
nvironment
    2023-12-20T11:28:56.430708  =

    2023-12-20T11:28:56.531638  / # . /lava-3890149/environment/lava-389014=
9/bin/lava-test-runner /lava-3890149/1
    2023-12-20T11:28:56.532470  =

    2023-12-20T11:28:56.551650  / # /lava-3890149/bin/lava-test-runner /lav=
a-3890149/1
    2023-12-20T11:28:56.682219  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =20

