Return-Path: <linux-next+bounces-756-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2990830AAB
	for <lists+linux-next@lfdr.de>; Wed, 17 Jan 2024 17:13:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 571D928BC02
	for <lists+linux-next@lfdr.de>; Wed, 17 Jan 2024 16:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4DF2231F;
	Wed, 17 Jan 2024 16:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="03zUgl5d"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3072231D
	for <linux-next@vger.kernel.org>; Wed, 17 Jan 2024 16:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705507880; cv=none; b=TbErAlK2DGeEMzI1oP6y1rKYN0sk8Vro4aXk/LAajSyDVXbwhf7dpNfJZdI3tHhagRdbPFPkPi9/JJngNk0TvJETdXd7hCVkiEtraioC4+Lg1i5IWH17YfHpZ0wh714twvzxKYsRSEt1KM0bqXS1GUhu6PfaYC/2zNPz1XLs9R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705507880; c=relaxed/simple;
	bh=UgchAHJaFFk4Dn3oOlDNzDTUTVgvywmpSqkhtbh3f5U=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:X-Kernelci-Branch:X-Kernelci-Tree:
	 X-Kernelci-Kernel:X-Kernelci-Report-Type:Subject:To:From; b=IljAxE5JEeO6Ae/YvMyB586c8Dj/J3h5FTy9wDLNJfPHiAwYkBcVCl+QuJTtZyppOl7lrL2FepgToZJRBQyhp2KXE3/ZRUV6FJwwUSm+ePfS1Revdxn2PH/DwyMVM91qrVn14xOL2YfzVO9tCyGVJPgn+jII/MZKp9NHEo/zqkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=03zUgl5d; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d5cdb4a444so28512735ad.1
        for <linux-next@vger.kernel.org>; Wed, 17 Jan 2024 08:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705507876; x=1706112676; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4tHA/GR62rvGN3W/t52tZQgwGw0ZDPD81gUp4nPQEwc=;
        b=03zUgl5dNY/w3ouIYUnWDV6IefHFAviKuM0WWwW+sN0sycWhJvjirld1+ciSGIiwZb
         5hGTgKlFTiU3lR4YiyarYxyqN5mXI2n58dBEhG3dyXL/b2qwzljUv8AWNU/zmrrGc4RV
         wSKu+3B+kVn3B9/52SaqPFxWzOM8lVjo0xolir3dnwszqDvWTR29U3XYjIfuF1FFr7aU
         6shFRW8RzxdeIR2VcWZTN4D0clvw/BxsocfAlXPPYC+BDYA+wgToi+x9vgCyxENnJ5ON
         F5MQVrXUCzU1mjOHofuaqf+Hy6/iWpgxYtLxjlzpO4bcb2+vtSI26HdX/onLLDrwA7N6
         4Qrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705507876; x=1706112676;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4tHA/GR62rvGN3W/t52tZQgwGw0ZDPD81gUp4nPQEwc=;
        b=eQlgOJgEpw9yOTaY34qDS3G0gkzXkUfmJUsBvvYdWRU7KtnNSHMIxx4YjUU1EQkhtB
         JpmEMhk5ma4p2SzfPjqNSvrWqgOW+QjnJrlTyE3to/BDdscT0KYX2kCoVEju3melIhDj
         0DJVu7rkAl6jI+rljOqZBUNqg3BKQQbKcSHr9MBG0Ac+RaDec9Twmpingymq1mRsArCs
         87WcDE1wyXtE1mSdE4DGLrZTtVrQvFc0oMDN1pKNqkD31B86IYIZLmqFENPTLwJqoGUx
         B5XNndoEHhso4uNi/OmvIRitFGC4glvvKfv+K7K0GF81N9xGpV+iy3boVYw7OMb7gzPs
         Saxg==
X-Gm-Message-State: AOJu0Yxoj1M+3uojFnhJn7WmKlswjQY/JPkMYgXpaQCtMuzGotspzHZp
	Ar77WTBXISE1YrZ1GxPncV15IoLdZP4P/ZoztCVMB6jKLnoZAw==
X-Google-Smtp-Source: AGHT+IEeiyv5K8zIL6tqx4XlsyLOczOQWIWzanGQkEYeioHU8QnucKBfo8YPIpsnda3BgtHMPdtpTA==
X-Received: by 2002:a17:902:e751:b0:1d5:8ce6:e4b1 with SMTP id p17-20020a170902e75100b001d58ce6e4b1mr10644340plf.43.1705507875234;
        Wed, 17 Jan 2024 08:11:15 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p19-20020a170902e35300b001d6ff1795b8sm63075plc.66.2024.01.17.08.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 08:11:14 -0800 (PST)
Message-ID: <65a7fc22.170a0220.8a826.0717@mx.google.com>
Date: Wed, 17 Jan 2024 08:11:14 -0800 (PST)
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
X-Kernelci-Kernel: next-20240117
X-Kernelci-Report-Type: test
Subject: next/master baseline: 423 runs, 49 regressions (next-20240117)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 423 runs, 49 regressions (next-20240117)

Regressions Summary
-------------------

platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
at91sam9g20ek               | arm   | lab-broonie     | gcc-10   | at91_dt_=
defconfig            | 1          =

at91sam9g20ek               | arm   | lab-broonie     | gcc-10   | multi_v5=
_defconfig           | 1          =

bcm2836-rpi-2-b             | arm   | lab-collabora   | gcc-10   | bcm2835_=
defconfig            | 1          =

bcm2836-rpi-2-b             | arm   | lab-collabora   | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black            | arm   | lab-cip         | gcc-10   | multi_v7=
_defconfig           | 1          =

imx8mm-innocomm-wb15-evk    | arm64 | lab-pengutronix | gcc-10   | defconfi=
g                    | 1          =

jetson-tk1                  | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

kontron-kbox-a-230-ls       | arm64 | lab-kontron     | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 5          =

kontron-kbox-a-230-ls       | arm64 | lab-kontron     | gcc-10   | defconfi=
g+videodec           | 5          =

kontron-kbox-a-230-ls       | arm64 | lab-kontron     | gcc-10   | defconfi=
g                    | 5          =

kontron-kbox-a-230-ls       | arm64 | lab-kontron     | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 5          =

kontron-sl28-var3-ads2      | arm64 | lab-kontron     | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2      | arm64 | lab-kontron     | gcc-10   | defconfi=
g+videodec           | 2          =

kontron-sl28-var3-ads2      | arm64 | lab-kontron     | gcc-10   | defconfi=
g                    | 2          =

kontron-sl28-var3-ads2      | arm64 | lab-kontron     | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =

qemu_arm64-virt-gicv2       | arm64 | lab-collabora   | gcc-10   | defconfi=
g+debug              | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64 | lab-collabora   | gcc-10   | defconfi=
g+debug              | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64 | lab-collabora   | gcc-10   | defconfi=
g+debug              | 1          =

r8a774a1-hihope-rzg2m-ex    | arm64 | lab-cip         | gcc-10   | defconfi=
g+videodec           | 1          =

rk3288-rock2-square         | arm   | lab-collabora   | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq           | arm   | lab-collabora   | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe      | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

sun7i-a20-cubieboard2       | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2       | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defconfig           | 1          =

sun7i-a20-cubieboard2       | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2       | arm   | lab-clabbe      | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2       | arm   | lab-clabbe      | gcc-10   | multi_v7=
_defconfig           | 1          =

sun7i-a20-cubieboard2       | arm   | lab-clabbe      | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

zynqmp-zcu102               | arm64 | lab-cip         | gcc-10   | defconfi=
g+debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240117/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240117
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      943b9f0ab2cfbaea148dd6ac279957eb08b96904 =



Test Regressions
---------------- =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
at91sam9g20ek               | arm   | lab-broonie     | gcc-10   | at91_dt_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65a7bdfb0c111f94ee52a415

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/65a7bdfb0c111f94ee52a435
        failing since 226 days (last pass: next-20230601, first fail: next-=
20230605)

    2024-01-17T11:45:56.310362  /lava-466059/1/../bin/lava-test-case
    2024-01-17T11:45:56.353006  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
at91sam9g20ek               | arm   | lab-broonie     | gcc-10   | multi_v5=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65a7bcf7743260b74a52a3fb

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/65a7bcf7743260b74a52a41a
        failing since 226 days (last pass: next-20230601, first fail: next-=
20230605)

    2024-01-17T11:41:16.675666  /lava-466001/1/../bin/lava-test-case
    2024-01-17T11:41:16.716612  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b             | arm   | lab-collabora   | gcc-10   | bcm2835_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65a7bc2bb371842a9052a3f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a7bc2bb371842a9052a=
3f2
        failing since 226 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b             | arm   | lab-collabora   | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65a7c7e50bb58585e152a454

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a7c7e50bb58585e152a=
455
        failing since 294 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
beaglebone-black            | arm   | lab-cip         | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65a7c80337ec2d297252a417

  Results:     40 PASS, 9 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/65a7c80337ec2d29=
7252a41c
        failing since 5 days (last pass: next-20240111, first fail: next-20=
240112)
        1 lines

    2024-01-17T12:28:30.149666  / # =

    2024-01-17T12:28:30.159035  =

    2024-01-17T12:28:30.264206  / # #
    2024-01-17T12:28:30.270788  #
    2024-01-17T12:28:30.414386  / # export SHELL=3D/bin/sh
    2024-01-17T12:28:30.430805  export SHELL=3D/bin/sh
    2024-01-17T12:28:30.532346  / # . /lava-1076998/environment
    2024-01-17T12:28:30.542552  . /lava-1076998/environment
    2024-01-17T12:28:30.644438  / # /lava-1076998/bin/lava-test-runner /lav=
a-1076998/0
    2024-01-17T12:28:30.654465  /lava-1076998/bin/lava-test-runner /lava-10=
76998/0 =

    ... (9 line(s) more)  =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
imx8mm-innocomm-wb15-evk    | arm64 | lab-pengutronix | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65a7c4e50d93127ccb52a406

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a7c4e50d93127ccb52a=
407
        new failure (last pass: next-20240112) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
jetson-tk1                  | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65a7c3aa405e7f0b1752a3f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a7c3aa405e7f0b1752a=
3f3
        failing since 645 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls       | arm64 | lab-kontron     | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/65a7bd8bc42614b57c52a3f1

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a7bd8bc42614b57c52a3f8
        failing since 37 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-17T11:43:53.128942  / # #
    2024-01-17T11:43:53.230987  export SHELL=3D/bin/sh
    2024-01-17T11:43:53.231654  #
    2024-01-17T11:43:53.332897  / # export SHELL=3D/bin/sh. /lava-417474/en=
vironment
    2024-01-17T11:43:53.333610  =

    2024-01-17T11:43:53.434978  / # . /lava-417474/environment/lava-417474/=
bin/lava-test-runner /lava-417474/1
    2024-01-17T11:43:53.436381  =

    2024-01-17T11:43:53.443453  / # /lava-417474/bin/lava-test-runner /lava=
-417474/1
    2024-01-17T11:43:53.491757  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-17T11:43:53.538599  + cd /lava-417474/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65a7bd8bc42614b57c52a3fc
        failing since 37 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-17T11:43:55.715970  /lava-417474/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
a7bd8bc42614b57c52a3fe
        failing since 37 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-17T11:43:56.782148  /lava-417474/1/../bin/lava-test-case
    2024-01-17T11:43:56.785197  <8>[   26.825112] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65a7bd8bc42614b57c52a403
        failing since 37 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-17T11:43:57.998373  /lava-417474/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65a7bd8bc42614b57c52a404
        failing since 37 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-17T11:43:58.001419  <8>[   28.036405] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-01-17T11:43:59.040096  /lava-417474/1/../bin/lava-test-case   =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls       | arm64 | lab-kontron     | gcc-10   | defconfi=
g+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/65a7bf1cc86ed4592c52a43c

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a7bf1cc86ed4592c52a443
        failing since 36 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-17T11:50:27.541074  / # #
    2024-01-17T11:50:27.641693  export SHELL=3D/bin/sh
    2024-01-17T11:50:27.641979  #
    2024-01-17T11:50:27.742539  / # export SHELL=3D/bin/sh. /lava-417488/en=
vironment
    2024-01-17T11:50:27.742817  =

    2024-01-17T11:50:27.843645  / # . /lava-417488/environment/lava-417488/=
bin/lava-test-runner /lava-417488/1
    2024-01-17T11:50:27.844749  =

    2024-01-17T11:50:27.855987  / # /lava-417488/bin/lava-test-runner /lava=
-417488/1
    2024-01-17T11:50:27.948925  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-17T11:50:27.949325  + cd /lava-417488/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65a7bf1cc86ed4592c52a447
        failing since 36 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-17T11:50:30.163087  /lava-417488/1/../bin/lava-test-case
    2024-01-17T11:50:30.189427  <8>[   26.022821] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
a7bf1cc86ed4592c52a449
        failing since 36 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-17T11:50:31.250913  /lava-417488/1/../bin/lava-test-case
    2024-01-17T11:50:31.278102  <8>[   27.110201] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65a7bf1cc86ed4592c52a44e
        failing since 36 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-17T11:50:32.509208  /lava-417488/1/../bin/lava-test-case
    2024-01-17T11:50:32.535209  <8>[   28.368014] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65a7bf1cc86ed4592c52a44f
        failing since 36 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-17T11:50:33.558387  /lava-417488/1/../bin/lava-test-case
    2024-01-17T11:50:33.585652  <8>[   29.418143] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls       | arm64 | lab-kontron     | gcc-10   | defconfi=
g                    | 5          =


  Details:     https://kernelci.org/test/plan/id/65a7c66276403ae93e52a3fe

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a7c66276403ae93e52a405
        failing since 37 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-17T12:21:23.830525  =

    2024-01-17T12:21:23.931901  / # #export SHELL=3D/bin/sh
    2024-01-17T12:21:23.932556  =

    2024-01-17T12:21:24.033995  / # export SHELL=3D/bin/sh. /lava-417516/en=
vironment
    2024-01-17T12:21:24.034751  =

    2024-01-17T12:21:24.136024  / # . /lava-417516/environment/lava-417516/=
bin/lava-test-runner /lava-417516/1
    2024-01-17T12:21:24.136426  =

    2024-01-17T12:21:24.143165  / # /lava-417516/bin/lava-test-runner /lava=
-417516/1
    2024-01-17T12:21:24.207457  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-17T12:21:24.241324  + cd /lava-417516/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65a7c66276403ae93e52a409
        failing since 37 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-17T12:21:26.457166  /lava-417516/1/../bin/lava-test-case
    2024-01-17T12:21:26.484331  <8>[   26.017532] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
a7c66276403ae93e52a40b
        failing since 37 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-17T12:21:27.544844  /lava-417516/1/../bin/lava-test-case
    2024-01-17T12:21:27.572302  <8>[   27.105808] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65a7c66276403ae93e52a410
        failing since 37 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-17T12:21:28.804951  /lava-417516/1/../bin/lava-test-case
    2024-01-17T12:21:28.831259  <8>[   28.364620] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65a7c66276403ae93e52a411
        failing since 37 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-17T12:21:29.854607  /lava-417516/1/../bin/lava-test-case
    2024-01-17T12:21:29.881664  <8>[   29.414817] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls       | arm64 | lab-kontron     | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/65a7c8bb7dd317680652a4ef

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a7c8bb7dd317680652a4f6
        failing since 35 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-17T12:31:26.704039  /#
    2024-01-17T12:31:26.804893   # #export SHELL=3D/bin/sh
    2024-01-17T12:31:26.805190  =

    2024-01-17T12:31:26.905831  / # export SHELL=3D/bin/sh. /lava-417530/en=
vironment
    2024-01-17T12:31:26.906131  =

    2024-01-17T12:31:27.007017  / # . /lava-417530/environment/lava-417530/=
bin/lava-test-runner /lava-417530/1
    2024-01-17T12:31:27.008161  =

    2024-01-17T12:31:27.019939  / # /lava-417530/bin/lava-test-runner /lava=
-417530/1
    2024-01-17T12:31:27.113218  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-17T12:31:27.113660  + cd /lava-417530/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65a7c8bb7dd317680652a4fa
        failing since 35 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-17T12:31:29.328215  /lava-417530/1/../bin/lava-test-case
    2024-01-17T12:31:29.355256  <8>[   26.025544] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
a7c8bb7dd317680652a4fc
        failing since 35 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-17T12:31:30.415706  /lava-417530/1/../bin/lava-test-case
    2024-01-17T12:31:30.442754  <8>[   27.112727] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65a7c8bb7dd317680652a501
        failing since 35 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-17T12:31:31.673660  /lava-417530/1/../bin/lava-test-case
    2024-01-17T12:31:31.699645  <8>[   28.370709] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65a7c8bb7dd317680652a502
        failing since 35 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-17T12:31:32.723605  /lava-417530/1/../bin/lava-test-case
    2024-01-17T12:31:32.750652  <8>[   29.420607] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
kontron-sl28-var3-ads2      | arm64 | lab-kontron     | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65a7bd9fe7f180c19c52a43a

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a7bd9fe7f180c19c52a441
        failing since 37 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-17T11:44:18.319074  / # #
    2024-01-17T11:44:18.421301  export SHELL=3D/bin/sh
    2024-01-17T11:44:18.422094  #
    2024-01-17T11:44:18.523533  / # export SHELL=3D/bin/sh. /lava-417471/en=
vironment
    2024-01-17T11:44:18.524288  =

    2024-01-17T11:44:18.625600  / # . /lava-417471/environment/lava-417471/=
bin/lava-test-runner /lava-417471/1
    2024-01-17T11:44:18.626820  =

    2024-01-17T11:44:18.646308  / # /lava-417471/bin/lava-test-runner /lava=
-417471/1
    2024-01-17T11:44:18.734344  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-17T11:44:18.734771  + cd /lava-417471/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65a7bd9fe7f180c19c52a454
        failing since 37 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-17T11:44:21.487367  /lava-417471/1/../bin/lava-test-case   =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
kontron-sl28-var3-ads2      | arm64 | lab-kontron     | gcc-10   | defconfi=
g+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/65a7bf09f8ad2ea46952a3f6

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a7bf09f8ad2ea46952a3fd
        failing since 36 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-17T11:50:16.801479  / # #
    2024-01-17T11:50:16.903443  export SHELL=3D/bin/sh
    2024-01-17T11:50:16.904145  #
    2024-01-17T11:50:17.005446  / # export SHELL=3D/bin/sh. /lava-417490/en=
vironment
    2024-01-17T11:50:17.006197  =

    2024-01-17T11:50:17.107453  / # . /lava-417490/environment/lava-417490/=
bin/lava-test-runner /lava-417490/1
    2024-01-17T11:50:17.108345  =

    2024-01-17T11:50:17.113263  / # /lava-417490/bin/lava-test-runner /lava=
-417490/1
    2024-01-17T11:50:17.177046  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-17T11:50:17.217361  + cd /lava-417490/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65a7bf09f8ad2ea46952a410
        failing since 36 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-17T11:50:20.143201  /lava-417490/1/../bin/lava-test-case
    2024-01-17T11:50:20.170352  <8>[   27.013223] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
kontron-sl28-var3-ads2      | arm64 | lab-kontron     | gcc-10   | defconfi=
g                    | 2          =


  Details:     https://kernelci.org/test/plan/id/65a7c599d15595110552a3ff

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a7c599d15595110552a406
        failing since 37 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-17T12:18:17.916756  / # #
    2024-01-17T12:18:18.018033  export SHELL=3D/bin/sh
    2024-01-17T12:18:18.018498  #
    2024-01-17T12:18:18.119556  / # export SHELL=3D/bin/sh. /lava-417514/en=
vironment
    2024-01-17T12:18:18.120283  =

    2024-01-17T12:18:18.221583  / # . /lava-417514/environment/lava-417514/=
bin/lava-test-runner /lava-417514/1
    2024-01-17T12:18:18.222853  =

    2024-01-17T12:18:18.227727  / # /lava-417514/bin/lava-test-runner /lava=
-417514/1
    2024-01-17T12:18:18.291797  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-17T12:18:18.331270  + cd /lava-417514/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65a7c599d15595110552a419
        failing since 37 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-17T12:18:21.255424  /lava-417514/1/../bin/lava-test-case
    2024-01-17T12:18:21.283036  <8>[   27.059650] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
kontron-sl28-var3-ads2      | arm64 | lab-kontron     | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65a7c8424a9214a87a52a3f1

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a7c8424a9214a87a52a3f8
        failing since 35 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-17T12:29:30.189081  / # #
    2024-01-17T12:29:30.290932  export SHELL=3D/bin/sh
    2024-01-17T12:29:30.291646  #
    2024-01-17T12:29:30.392881  / # export SHELL=3D/bin/sh. /lava-417529/en=
vironment
    2024-01-17T12:29:30.393607  =

    2024-01-17T12:29:30.494854  / # . /lava-417529/environment/lava-417529/=
bin/lava-test-runner /lava-417529/1
    2024-01-17T12:29:30.495804  =

    2024-01-17T12:29:30.500678  / # /lava-417529/bin/lava-test-runner /lava=
-417529/1
    2024-01-17T12:29:30.564592  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-17T12:29:30.598365  + cd /lava-417529/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65a7c8424a9214a87a52a40b
        failing since 35 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-17T12:29:33.527380  /lava-417529/1/../bin/lava-test-case
    2024-01-17T12:29:33.556156  <8>[   27.105846] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2       | arm64 | lab-collabora   | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65a7c12eb9c88c5d8852a447

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a7c12eb9c88c5d8852a=
448
        new failure (last pass: next-20240109) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64 | lab-collabora   | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65a7c0f2f1c074a09352a436

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a7c0f2f1c074a09352a=
437
        new failure (last pass: next-20240109) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64 | lab-collabora   | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65a7c0f3f1c074a09352a439

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a7c0f3f1c074a09352a=
43a
        new failure (last pass: next-20240109) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
r8a774a1-hihope-rzg2m-ex    | arm64 | lab-cip         | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65a7bf40c86ed4592c52a4ef

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a7bf40c86ed4592c52a4f8
        failing since 162 days (last pass: next-20230710, first fail: next-=
20230808)

    2024-01-17T11:51:14.967646  + set +x
    2024-01-17T11:51:14.974120  <8>[   27.133249] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1077012_1.5.2.4.1>
    2024-01-17T11:51:15.081217  / # #
    2024-01-17T11:51:16.538737  export SHELL=3D/bin/sh
    2024-01-17T11:51:16.559516  #
    2024-01-17T11:51:16.559934  / # export SHELL=3D/bin/sh
    2024-01-17T11:51:18.508989  / # . /lava-1077012/environment
    2024-01-17T11:51:22.092390  /lava-1077012/bin/lava-test-runner /lava-10=
77012/1
    2024-01-17T11:51:22.113739  . /lava-1077012/environment
    2024-01-17T11:51:22.114104  / # /lava-1077012/bin/lava-test-runner /lav=
a-1077012/1 =

    ... (27 line(s) more)  =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
rk3288-rock2-square         | arm   | lab-collabora   | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65a7c26f4fb354b73652a478

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a7c26f4fb354b73652a=
479
        failing since 421 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
rk3288-veyron-jaq           | arm   | lab-collabora   | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65a7c168d3695d2c7452a3fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a7c168d3695d2c7452a=
3fc
        failing since 421 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe      | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65a7c8f75cd5c6105c52a403

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65a7c8f75cd5c6105c52a=
404
        new failure (last pass: next-20240112) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65a7be51de3c3a743852a508

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a7be51de3c3a743852a511
        failing since 230 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-01-17T11:47:15.935125  / # #
    2024-01-17T11:47:16.037648  export SHELL=3D/bin/sh
    2024-01-17T11:47:16.038313  #
    2024-01-17T11:47:16.139691  / # export SHELL=3D/bin/sh. /lava-3909841/e=
nvironment
    2024-01-17T11:47:16.140168  =

    2024-01-17T11:47:16.240881  / # . /lava-3909841/environment/lava-390984=
1/bin/lava-test-runner /lava-3909841/1
    2024-01-17T11:47:16.241375  =

    2024-01-17T11:47:16.284033  / # /lava-3909841/bin/lava-test-runner /lav=
a-3909841/1
    2024-01-17T11:47:16.373304  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-17T11:47:16.373731  + cd /lava-3909841/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65a7bec8b84d5d9e3052a492

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a7bec8b84d5d9e3052a49b
        failing since 230 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-01-17T11:49:12.166911  / # #
    2024-01-17T11:49:12.268199  export SHELL=3D/bin/sh
    2024-01-17T11:49:12.268606  #
    2024-01-17T11:49:12.369370  / # export SHELL=3D/bin/sh. /lava-3909846/e=
nvironment
    2024-01-17T11:49:12.369743  =

    2024-01-17T11:49:12.470524  / # . /lava-3909846/environment/lava-390984=
6/bin/lava-test-runner /lava-3909846/1
    2024-01-17T11:49:12.471134  =

    2024-01-17T11:49:12.512036  / # /lava-3909846/bin/lava-test-runner /lav=
a-3909846/1
    2024-01-17T11:49:12.615853  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-17T11:49:12.616255  + cd /lava-3909846/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65a7c7f79edf2b886c52a5e1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a7c7f79edf2b886c52a5ea
        failing since 224 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-01-17T12:28:10.371477  + set +x
    2024-01-17T12:28:10.374264  <8>[   13.553975] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3909964_1.5.2.4.1>
    2024-01-17T12:28:10.477050  / # #
    2024-01-17T12:28:10.579272  export SHELL=3D/bin/sh
    2024-01-17T12:28:10.579747  #
    2024-01-17T12:28:10.680577  / # export SHELL=3D/bin/sh. /lava-3909964/e=
nvironment
    2024-01-17T12:28:10.680942  =

    2024-01-17T12:28:10.781697  / # . /lava-3909964/environment/lava-390996=
4/bin/lava-test-runner /lava-3909964/1
    2024-01-17T12:28:10.783290  =

    2024-01-17T12:28:10.824508  / # /lava-3909964/bin/lava-test-runner /lav=
a-3909964/1 =

    ... (12 line(s) more)  =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-clabbe      | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65a7be43de3c3a743852a4ad

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a7be43de3c3a743852a4b6
        failing since 230 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-01-17T11:46:57.646537  + set +x
    2024-01-17T11:46:57.648298  [   23.778748] <LAVA_SIGNAL_ENDRUN 0_dmesg =
453104_1.5.2.4.1>
    2024-01-17T11:46:57.755619  / # #
    2024-01-17T11:46:57.857158  export SHELL=3D/bin/sh
    2024-01-17T11:46:57.857691  #
    2024-01-17T11:46:57.958670  / # export SHELL=3D/bin/sh. /lava-453104/en=
vironment
    2024-01-17T11:46:57.959194  =

    2024-01-17T11:46:58.060187  / # . /lava-453104/environment/lava-453104/=
bin/lava-test-runner /lava-453104/1
    2024-01-17T11:46:58.061014  =

    2024-01-17T11:46:58.063622  / # /lava-453104/bin/lava-test-runner /lava=
-453104/1 =

    ... (12 line(s) more)  =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-clabbe      | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65a7bea620f687721b52a406

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a7bea620f687721b52a40f
        failing since 230 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-01-17T11:48:39.964566  + set +x
    2024-01-17T11:48:39.966322  [   19.864425] <LAVA_SIGNAL_ENDRUN 0_dmesg =
453109_1.5.2.4.1>
    2024-01-17T11:48:40.075258  / # #
    2024-01-17T11:48:40.176770  export SHELL=3D/bin/sh
    2024-01-17T11:48:40.177277  #
    2024-01-17T11:48:40.278241  / # export SHELL=3D/bin/sh. /lava-453109/en=
vironment
    2024-01-17T11:48:40.278759  =

    2024-01-17T11:48:40.379726  / # . /lava-453109/environment/lava-453109/=
bin/lava-test-runner /lava-453109/1
    2024-01-17T11:48:40.380529  =

    2024-01-17T11:48:40.383557  / # /lava-453109/bin/lava-test-runner /lava=
-453109/1 =

    ... (12 line(s) more)  =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-clabbe      | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65a7c95ba0d4206e8352a402

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65a7c95ba0d4206e8352a40b
        failing since 224 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-01-17T12:34:13.874985  + set +x
    2024-01-17T12:34:13.876756  [   19.057040] <LAVA_SIGNAL_ENDRUN 0_dmesg =
453140_1.5.2.4.1>
    2024-01-17T12:34:13.984777  / # #
    2024-01-17T12:34:14.086548  export SHELL=3D/bin/sh
    2024-01-17T12:34:14.087312  #
    2024-01-17T12:34:14.188820  / # export SHELL=3D/bin/sh. /lava-453140/en=
vironment
    2024-01-17T12:34:14.189480  =

    2024-01-17T12:34:14.290624  / # . /lava-453140/environment/lava-453140/=
bin/lava-test-runner /lava-453140/1
    2024-01-17T12:34:14.291576  =

    2024-01-17T12:34:14.294440  / # /lava-453140/bin/lava-test-runner /lava=
-453140/1 =

    ... (12 line(s) more)  =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
zynqmp-zcu102               | arm64 | lab-cip         | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65a7c0cb4a8f191b2152a44a

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240117/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65a7c0cb4a8f191=
b2152a44d
        new failure (last pass: next-20240109)
        1 lines

    2024-01-17T11:57:41.016856  kern  :emerg : watchdog: BUG: soft lockup -=
 CPU#0 stuck for 53s! [kworker/u8:2:51]
    2024-01-17T11:57:42.050829  <8>[  204.591745][  T208] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =20

