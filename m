Return-Path: <linux-next+bounces-145-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D8D7FEE79
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 13:01:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86C61B20CF8
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 12:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B17A3D3B8;
	Thu, 30 Nov 2023 12:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="CmflYQ5T"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 808501990
	for <linux-next@vger.kernel.org>; Thu, 30 Nov 2023 04:01:28 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6cb55001124so1575125b3a.0
        for <linux-next@vger.kernel.org>; Thu, 30 Nov 2023 04:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701345687; x=1701950487; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nnXbw6V+d4Cf/BI6OKqPkLjemtoeQUhqyqzeK9Avd8I=;
        b=CmflYQ5T4CyJ22xT2oodTFRC+ytX7z7q9cucOL5J23hj45NLhYsp+mQIYbzz1DurPx
         LpTJWFAMdJdkm76qAP7WeFy+q4I4NTenICPKV+hpN3WKeRLgr9sexEvifHSfrLgH0YAf
         RzNeoV1LgVag+FhgtFTevngS1WWx0W6iZFjUko2BdmlgUAvSI8dpDSoVBUeWtar2pJzu
         89ngJ5dktMSErThzkhi/p1DFjU8yYCBagAq7cYbAWHeLsKBXiiawQTJu0J3RF9SIAohs
         80xkFpSwlvYcAaG3Rdr9CqINQbaydXQDChfqNc/RPTvpMhnGYwfsNWcQp5P3lm2l1qfC
         FJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701345687; x=1701950487;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnXbw6V+d4Cf/BI6OKqPkLjemtoeQUhqyqzeK9Avd8I=;
        b=icP/mHfshcFzgPhQ6lTVVaQcRIC75zU/UYEi0zvHivLkNSLcKNz3ph8ODB3ognOV+N
         igMUyOBlCwu7fEgyyufnqd9gqzZunhpCoIo59Ra2vafa0yDWc8obsj075K23LIfgmHcT
         h/LEiXUeTb7T6KIYc70pwpSrhz7Z7Jy+YG1G1Z+0gQJE2PU/hGCSdm0RD8A6GgFI7oE2
         auRfcEKK8kq9PA6Dm1HD3jFJ61ddc2nml2BKxDUhT2sEEJqkQrDsOhw5lKfpsQRHOowB
         JXA7YbcICI1YbuUfcpet/cdnnBmEMvLtdw5znOw/QjPYkxgPKRSwzrnFvf7coxl883rh
         9vQw==
X-Gm-Message-State: AOJu0YxZhuSkCc/OHTWE+06Ken3nfD6kF8OBEm2/B7JgfdzbAmpsNyHy
	jYmyp3BoilfKJsdr5jhLGsZHAa+0BYtmXI4H6VQOEQ==
X-Google-Smtp-Source: AGHT+IHofhcq1msN4RYGQubW9BKnTc59J1v10Xn5eP7wW/EI2dY6L5c4PXEJeLI9JyR9lMHH9XKiGQ==
X-Received: by 2002:a17:903:1207:b0:1c6:11ca:8861 with SMTP id l7-20020a170903120700b001c611ca8861mr36610394plh.21.1701345686998;
        Thu, 30 Nov 2023 04:01:26 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id z15-20020a170903018f00b001bc676df6a9sm1187058plg.132.2023.11.30.04.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 04:01:26 -0800 (PST)
Message-ID: <65687996.170a0220.3fde0.26bd@mx.google.com>
Date: Thu, 30 Nov 2023 04:01:26 -0800 (PST)
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
X-Kernelci-Kernel: next-20231130
Subject: next/master baseline: 467 runs, 28 regressions (next-20231130)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 467 runs, 28 regressions (next-20231130)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
at91sam9g20ek            | arm   | lab-broonie   | gcc-10   | at91_dt_defco=
nfig            | 1          =

at91sam9g20ek            | arm   | lab-broonie   | gcc-10   | multi_v5_defc=
onfig           | 1          =

bcm2836-rpi-2-b          | arm   | lab-collabora | gcc-10   | bcm2835_defco=
nfig            | 1          =

bcm2836-rpi-2-b          | arm   | lab-collabora | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =

imx6dl-udoo              | arm   | lab-broonie   | gcc-10   | imx_v6_v7_def=
config          | 2          =

imx6ul-14x14-evk         | arm   | lab-nxp       | clang-17 | multi_v7_defc=
onfig           | 1          =

imx6ul-14x14-evk         | arm   | lab-nxp       | gcc-10   | imx_v6_v7_def=
config          | 1          =

imx6ul-14x14-evk         | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

imx6ul-14x14-evk         | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =

imx6ul-14x14-evk         | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
onfig           | 1          =

imx7d-sdb                | arm   | lab-nxp       | clang-17 | multi_v7_defc=
onfig           | 1          =

imx7d-sdb                | arm   | lab-nxp       | gcc-10   | imx_v6_v7_def=
config          | 1          =

imx7d-sdb                | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

imx7d-sdb                | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =

imx7d-sdb                | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
onfig           | 1          =

odroid-xu3               | arm   | lab-collabora | gcc-10   | exynos_defcon=
fig             | 1          =

odroid-xu3               | arm   | lab-collabora | gcc-10   | multi_v7_defc=
onfig           | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | gcc-10   | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

rk3288-rock2-square      | arm   | lab-collabora | gcc-10   | multi_v7_defc=
...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq        | arm   | lab-collabora | gcc-10   | multi_v7_defc=
...G_ARM_LPAE=3Dy | 1          =

sun50i-h6-pine-h64       | arm64 | lab-clabbe    | clang-17 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64       | arm64 | lab-collabora | clang-17 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64       | arm64 | lab-clabbe    | gcc-10   | defconfig+kse=
lftest          | 1          =

sun50i-h6-pine-h64       | arm64 | lab-collabora | gcc-10   | defconfig+kse=
lftest          | 1          =

sun7i-a20-cubieboard2    | arm   | lab-clabbe    | clang-17 | multi_v7_defc=
onfig           | 1          =

sun7i-a20-cubieboard2    | arm   | lab-clabbe    | gcc-10   | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2    | arm   | lab-clabbe    | gcc-10   | multi_v7_defc=
onfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231130/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231130
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3cd3fe06ff81cfb3a969acb12a56796cff5af23d =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
at91sam9g20ek            | arm   | lab-broonie   | gcc-10   | at91_dt_defco=
nfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65683f1ff0ab5588417e4aa6

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231130/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231130/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/65683f1ff0ab5588417e4ac6
        failing since 178 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-11-30T07:51:51.855531  /lava-290260/1/../bin/lava-test-case
    2023-11-30T07:51:51.896011  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
at91sam9g20ek            | arm   | lab-broonie   | gcc-10   | multi_v5_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6568413bf5082d0ad67e4ade

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/6568413bf5082d0ad67e4afd
        failing since 178 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-11-30T08:00:48.755244  /lava-290352/1/../bin/lava-test-case
    2023-11-30T08:00:48.796139  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2836-rpi-2-b          | arm   | lab-collabora | gcc-10   | bcm2835_defco=
nfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/656839b1e4b82f774d7e4a7f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231130/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231130/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656839b1e4b82f774d7e4=
a80
        failing since 178 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2836-rpi-2-b          | arm   | lab-collabora | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6568413184920ec2d27e4a84

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6568413184920ec2d27e4=
a85
        failing since 246 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6dl-udoo              | arm   | lab-broonie   | gcc-10   | imx_v6_v7_def=
config          | 2          =


  Details:     https://kernelci.org/test/plan/id/656842d4eee6c5cd677e4b1b

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231130/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231130/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/656842d4e=
ee6c5cd677e4b28
        new failure (last pass: next-20231129)

    2023-11-30T08:07:25.537172  /lava-290411/1/../bin/lava-test-case
    2023-11-30T08:07:25.564641  <8>[   18.424041] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/65=
6842d4eee6c5cd677e4b29
        new failure (last pass: next-20231129)

    2023-11-30T08:07:24.482813  /lava-290411/1/../bin/lava-test-case
    2023-11-30T08:07:24.512126  <8>[   17.370845] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6ul-14x14-evk         | arm   | lab-nxp       | clang-17 | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65684209193032f5557e4a6d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231120125900+f857=
5ff46f89-1~exp1~20231120125915.67))
  Plain log:   https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig/clang-17/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig/clang-17/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65684209193032f5557e4=
a6e
        failing since 0 day (last pass: next-20231123, first fail: next-202=
31129) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6ul-14x14-evk         | arm   | lab-nxp       | gcc-10   | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/656842de560435a0757e4a70

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231130/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231130/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656842de560435a0757e4=
a71
        failing since 0 day (last pass: next-20231128, first fail: next-202=
31129) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6ul-14x14-evk         | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65683df5f4c474198f7e4a9b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65683df5f4c474198f7e4=
a9c
        failing since 0 day (last pass: next-20231128, first fail: next-202=
31129) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6ul-14x14-evk         | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6568414ef5082d0ad67e4b5b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx6ul-=
14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx6ul-=
14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6568414ef5082d0ad67e4=
b5c
        failing since 0 day (last pass: next-20231128, first fail: next-202=
31129) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6ul-14x14-evk         | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/656843a6891adbc27a7e4a71

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656843a6891adbc27a7e4=
a72
        new failure (last pass: next-20231128) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx7d-sdb                | arm   | lab-nxp       | clang-17 | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/656840c92862fedb307e4ad2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231120125900+f857=
5ff46f89-1~exp1~20231120125915.67))
  Plain log:   https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig/clang-17/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig/clang-17/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656840c92862fedb307e4=
ad3
        failing since 0 day (last pass: next-20231123, first fail: next-202=
31129) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx7d-sdb                | arm   | lab-nxp       | gcc-10   | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/656842f4560435a0757e4a9e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231130/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231130/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656842f4560435a0757e4=
a9f
        failing since 0 day (last pass: next-20231128, first fail: next-202=
31129) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx7d-sdb                | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65683df27c2acb6b3d7e4a81

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65683df27c2acb6b3d7e4=
a82
        failing since 0 day (last pass: next-20231128, first fail: next-202=
31129) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx7d-sdb                | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65683ffa1d5ddc325d7e4a7b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx7d-s=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx7d-s=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65683ffa1d5ddc325d7e4=
a7c
        failing since 0 day (last pass: next-20231128, first fail: next-202=
31129) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx7d-sdb                | arm   | lab-nxp       | gcc-10   | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6568439324ff26d0197e4a95

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6568439324ff26d0197e4=
a96
        new failure (last pass: next-20231128) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
odroid-xu3               | arm   | lab-collabora | gcc-10   | exynos_defcon=
fig             | 1          =


  Details:     https://kernelci.org/test/plan/id/65683aa068c5ab76f07e4a73

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231130/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231130/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65683aa068c5ab76f07e4=
a74
        new failure (last pass: next-20231129) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
odroid-xu3               | arm   | lab-collabora | gcc-10   | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/656843ed2006f31e1d7e4a7f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656843ed2006f31e1d7e4=
a80
        new failure (last pass: next-20231128) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | gcc-10   | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6568448493481b50507e4a8f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231130/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231130/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6568448493481b50507e4a98
        failing since 121 days (last pass: next-20230712, first fail: next-=
20230801)

    2023-11-30T08:14:46.988788  + set +x
    2023-11-30T08:14:46.995154  <8>[   27.225944] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1048755_1.5.2.4.1>
    2023-11-30T08:14:47.098322  / # #
    2023-11-30T08:14:48.554265  export SHELL=3D/bin/sh
    2023-11-30T08:14:48.575117  #
    2023-11-30T08:14:48.575535  / # export SHELL=3D/bin/sh
    2023-11-30T08:14:50.523314  / # . /lava-1048755/environment
    2023-11-30T08:14:54.107302  /lava-1048755/bin/lava-test-runner /lava-10=
48755/1
    2023-11-30T08:14:54.128644  . /lava-1048755/environment
    2023-11-30T08:14:54.129036  / # /lava-1048755/bin/lava-test-runner /lav=
a-1048755/1 =

    ... (27 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
rk3288-rock2-square      | arm   | lab-collabora | gcc-10   | multi_v7_defc=
...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65683dd9bdd12f9d0d7e4bfe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65683dd9bdd12f9d0d7e4=
bff
        failing since 372 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
rk3288-veyron-jaq        | arm   | lab-collabora | gcc-10   | multi_v7_defc=
...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65683cd0c3e260221d7e4a7d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65683cd0c3e260221d7e4=
a7e
        failing since 372 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
sun50i-h6-pine-h64       | arm64 | lab-clabbe    | clang-17 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/656842b57382eeac617e4a88

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231120125900+f857=
5ff46f89-1~exp1~20231120125915.67))
  Plain log:   https://storage.kernelci.org//next/master/next-20231130/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-clabbe/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231130/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-clabbe/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/656842b57382eeac617e4a91
        failing since 51 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20231010)

    2023-11-30T08:06:54.540494  <8>[   18.546862] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 445911_1.5.2.4.1>
    2023-11-30T08:06:54.645581  / # #
    2023-11-30T08:06:54.747238  export SHELL=3D/bin/sh
    2023-11-30T08:06:54.747868  #
    2023-11-30T08:06:54.848853  / # export SHELL=3D/bin/sh. /lava-445911/en=
vironment
    2023-11-30T08:06:54.849514  =

    2023-11-30T08:06:54.950522  / # . /lava-445911/environment/lava-445911/=
bin/lava-test-runner /lava-445911/1
    2023-11-30T08:06:54.951392  =

    2023-11-30T08:06:54.954091  / # /lava-445911/bin/lava-test-runner /lava=
-445911/1
    2023-11-30T08:06:55.040109  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
sun50i-h6-pine-h64       | arm64 | lab-collabora | clang-17 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/656842ae7382eeac617e4a7b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231120125900+f857=
5ff46f89-1~exp1~20231120125915.67))
  Plain log:   https://storage.kernelci.org//next/master/next-20231130/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231130/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/656842ae7382eeac617e4a84
        failing since 51 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20231010)

    2023-11-30T08:13:26.938730  / # #

    2023-11-30T08:13:27.040907  export SHELL=3D/bin/sh

    2023-11-30T08:13:27.041649  #

    2023-11-30T08:13:27.143091  / # export SHELL=3D/bin/sh. /lava-12132592/=
environment

    2023-11-30T08:13:27.143792  =


    2023-11-30T08:13:27.245253  / # . /lava-12132592/environment/lava-12132=
592/bin/lava-test-runner /lava-12132592/1

    2023-11-30T08:13:27.246350  =


    2023-11-30T08:13:27.249483  / # /lava-12132592/bin/lava-test-runner /la=
va-12132592/1

    2023-11-30T08:13:27.336598  + export 'TESTRUN_ID=3D1_bootrr'

    2023-11-30T08:13:27.337095  + cd /lava-12132592/1/tests/1_boot<8>[   19=
.357749] <LAVA_SIGNAL_STARTRUN 1_bootrr 12132592_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
sun50i-h6-pine-h64       | arm64 | lab-clabbe    | gcc-10   | defconfig+kse=
lftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/656846c681708bfdce7e4a76

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231130/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231130/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656846c681708bfdce7e4=
a77
        failing since 293 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
sun50i-h6-pine-h64       | arm64 | lab-collabora | gcc-10   | defconfig+kse=
lftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/656846e691136aae3f7e4a7a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231130/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231130/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/656846e691136aae3f7e4=
a7b
        failing since 293 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
sun7i-a20-cubieboard2    | arm   | lab-clabbe    | clang-17 | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65684177fae32411c77e4a7d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231120125900+f857=
5ff46f89-1~exp1~20231120125915.67))
  Plain log:   https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65684177fae32411c77e4a86
        failing since 182 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-30T08:01:46.408410  + set +x
    2023-11-30T08:01:46.410222  [   21.852690] <LAVA_SIGNAL_ENDRUN 0_dmesg =
445908_1.5.2.4.1>
    2023-11-30T08:01:46.519130  / # #
    2023-11-30T08:01:46.620905  export SHELL=3D/bin/sh
    2023-11-30T08:01:46.621524  #
    2023-11-30T08:01:46.722543  / # export SHELL=3D/bin/sh. /lava-445908/en=
vironment
    2023-11-30T08:01:46.723127  =

    2023-11-30T08:01:46.824140  / # . /lava-445908/environment/lava-445908/=
bin/lava-test-runner /lava-445908/1
    2023-11-30T08:01:46.825011  =

    2023-11-30T08:01:46.827945  / # /lava-445908/bin/lava-test-runner /lava=
-445908/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
sun7i-a20-cubieboard2    | arm   | lab-clabbe    | gcc-10   | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65683db842267866e27e4a8f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65683db842267866e27e4a98
        failing since 182 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-30T07:45:42.040123  + set +x
    2023-11-30T07:45:42.042691  [   22.577958] <LAVA_SIGNAL_ENDRUN 0_dmesg =
445893_1.5.2.4.1>
    2023-11-30T07:45:42.151518  / # #
    2023-11-30T07:45:42.253768  export SHELL=3D/bin/sh
    2023-11-30T07:45:42.254408  #
    2023-11-30T07:45:42.355440  / # export SHELL=3D/bin/sh. /lava-445893/en=
vironment
    2023-11-30T07:45:42.356409  =

    2023-11-30T07:45:42.457740  / # . /lava-445893/environment/lava-445893/=
bin/lava-test-runner /lava-445893/1
    2023-11-30T07:45:42.458732  =

    2023-11-30T07:45:42.461472  / # /lava-445893/bin/lava-test-runner /lava=
-445893/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
sun7i-a20-cubieboard2    | arm   | lab-clabbe    | gcc-10   | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6568436beee719b4c67e4ade

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231130/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6568436beee719b4c67e4ae7
        failing since 182 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-30T08:09:58.674314  + set +x
    2023-11-30T08:09:58.676163  [   19.911823] <LAVA_SIGNAL_ENDRUN 0_dmesg =
445914_1.5.2.4.1>
    2023-11-30T08:09:58.783981  / # #
    2023-11-30T08:09:58.885269  export SHELL=3D/bin/sh
    2023-11-30T08:09:58.885747  #
    2023-11-30T08:09:58.986639  / # export SHELL=3D/bin/sh. /lava-445914/en=
vironment
    2023-11-30T08:09:58.987243  =

    2023-11-30T08:09:59.088277  / # . /lava-445914/environment/lava-445914/=
bin/lava-test-runner /lava-445914/1
    2023-11-30T08:09:59.088988  =

    2023-11-30T08:09:59.092622  / # /lava-445914/bin/lava-test-runner /lava=
-445914/1 =

    ... (12 line(s) more)  =

 =20

