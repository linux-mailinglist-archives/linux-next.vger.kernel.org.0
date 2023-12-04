Return-Path: <linux-next+bounces-217-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C35080301C
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 11:24:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9B551F2102C
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 10:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE5D720324;
	Mon,  4 Dec 2023 10:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="zv/EXp2y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50AE8D41
	for <linux-next@vger.kernel.org>; Mon,  4 Dec 2023 02:23:24 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1d04d286bc0so13929795ad.3
        for <linux-next@vger.kernel.org>; Mon, 04 Dec 2023 02:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701685395; x=1702290195; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mv4cTngAlxs8Z6RVQxA+37IUfr/rmYTeZcKtGSLYREg=;
        b=zv/EXp2y/kPx7JqZXvIZUqvERWE6Elx0XVrc6bwAeafLSDLRtz8vWy/YD2kZ2E9zhc
         ooDZf1VWWLOS5HhpWzjV4ob9v0JByDfc63wTIS8OYLqXdPsXk//BLWeZSrzz4HeIkb5B
         /vOKQQ4lsJGBmhhJCEPrK1UWT1THznmdmhwaXBtwcrENsjcpWD2emNe7+JCsm2Nrb9HT
         kXPlyq9jUNRursxf7e4MEFrM4dr018ZvfA0/PaY2sd7GYBpWtJLgVnSUdzLI2Lf3jIU4
         bkVtQZqJZylkNhTu4kk7+cuIgeeVZE8YUxeEzViaZRLJCbJ/J+mA3X0kkg6xRhLLJUv1
         BCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701685395; x=1702290195;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mv4cTngAlxs8Z6RVQxA+37IUfr/rmYTeZcKtGSLYREg=;
        b=iJvY/IhnrPZHf/2rpWm+JaUWKgXMvZz6X9g733IK8DmZ8a0KbQIFWmdlFsIRMO2/zB
         de01+C00e0qiYCJK3/yioDeG58J7izgi1+S0QIUplV6gOtu2fl4SMlgDPs28ww27WAG/
         Ir3dbaIwQnYJvH6OsRQL10CLBbVr8haJJE80hf+jBFkXP/hU3iFJqvLdRXOeRAS6VKkT
         aFZczVZHDXyRIDYrBkbMW//8QnRFS0JThYFGWADMY3c6QxU4EdUYmEgaUcrFgd7G85qH
         KEPjSik+IiVgVyg/3/7yn8DT1HxnLobCo/ou10b5AnoJ58F7H0tQUMhphYThO81lkCfm
         6FNQ==
X-Gm-Message-State: AOJu0YzYtaMTOkoqoFzm7g8JMkC5HyUbGRPRj0NuPeVjWZHcmhyMskBU
	dYnkE+eZCpzUcA7t/qV0yD9tIcU9d2sdfBBk4GRmeQ==
X-Google-Smtp-Source: AGHT+IHrq485dhRsF+qNrnIfGHB1GLxwGU4/3DvaeEVm2aXo/6hJw3IfHoQ46j1/iJpVhRSVKNHB3g==
X-Received: by 2002:a17:90b:38c7:b0:286:5252:e49e with SMTP id nn7-20020a17090b38c700b002865252e49emr1401887pjb.12.1701685394719;
        Mon, 04 Dec 2023 02:23:14 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id lt19-20020a17090b355300b0028678d55b65sm3517766pjb.21.2023.12.04.02.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 02:23:14 -0800 (PST)
Message-ID: <656da892.170a0220.777a.6569@mx.google.com>
Date: Mon, 04 Dec 2023 02:23:14 -0800 (PST)
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
X-Kernelci-Kernel: next-20231204
Subject: next/master baseline: 127 runs, 5 regressions (next-20231204)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 127 runs, 5 regressions (next-20231204)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
at91sam9g20ek     | arm  | lab-broonie   | gcc-10   | at91_dt_defconfig  | =
1          =

at91sam9g20ek     | arm  | lab-broonie   | gcc-10   | multi_v5_defconfig | =
1          =

bcm2836-rpi-2-b   | arm  | lab-collabora | gcc-10   | bcm2835_defconfig  | =
1          =

odroid-xu3        | arm  | lab-collabora | gcc-10   | exynos_defconfig   | =
1          =

r8a7743-iwg20d-q7 | arm  | lab-cip       | gcc-10   | shmobile_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231204/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231204
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      629a3b49f3f957e975253c54846090b8d5ed2e9b =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
at91sam9g20ek     | arm  | lab-broonie   | gcc-10   | at91_dt_defconfig  | =
1          =


  Details:     https://kernelci.org/test/plan/id/656d6f228ab70bc29be1350f

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231204/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231204/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/656d6f228ab70bc29be1352f
        failing since 182 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-12-04T06:17:59.731020  /lava-304606/1/../bin/lava-test-case
    2023-12-04T06:17:59.773569  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
at91sam9g20ek     | arm  | lab-broonie   | gcc-10   | multi_v5_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/656d6b893d4e340dbde1349b

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231204/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231204/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/656d6b893d4e340dbde134ba
        failing since 182 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-12-04T06:02:24.044805  /lava-304505/1/../bin/lava-test-case
    2023-12-04T06:02:24.084598  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
bcm2836-rpi-2-b   | arm  | lab-collabora | gcc-10   | bcm2835_defconfig  | =
1          =


  Details:     https://kernelci.org/test/plan/id/656d711166604173cce13481

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231204/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231204/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656d711166604173cce13=
482
        failing since 182 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
odroid-xu3        | arm  | lab-collabora | gcc-10   | exynos_defconfig   | =
1          =


  Details:     https://kernelci.org/test/plan/id/656d6fa91117ef0f81e134c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231204/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231204/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656d6fa91117ef0f81e13=
4c9
        failing since 3 days (last pass: next-20231129, first fail: next-20=
231130) =

 =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
r8a7743-iwg20d-q7 | arm  | lab-cip       | gcc-10   | shmobile_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/656d6a07817ccb7fb5e13486

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231204/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231204/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656d6a07817ccb7fb5e13=
487
        new failure (last pass: next-20231130) =

 =20

