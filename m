Return-Path: <linux-next+bounces-674-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E79826B89
	for <lists+linux-next@lfdr.de>; Mon,  8 Jan 2024 11:24:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09AD21C22030
	for <lists+linux-next@lfdr.de>; Mon,  8 Jan 2024 10:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F63713ADD;
	Mon,  8 Jan 2024 10:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="k1sO9mcM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087C613AC7
	for <linux-next@vger.kernel.org>; Mon,  8 Jan 2024 10:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6d9a795cffbso1072906b3a.0
        for <linux-next@vger.kernel.org>; Mon, 08 Jan 2024 02:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1704709459; x=1705314259; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qK1MXojV4TgQSxsR0zBeAfay9ZCh/JxiXp39luaDOtk=;
        b=k1sO9mcM5RqWLkr/Fk0MF87n1E5L83IB+usS6LA4pgYhj3mln8sDkiIDu32gNXSnFl
         Q5F8qFN9FUAS8WLGnH+j2B+Dq1IpZo7CYD9c2GBgjZ4Gs4OAq+c22iJmWu4x2O5WzwyP
         AuzVDa+PZX+kZ19ze0OIq1iRvVAo9bAY8gFbzaJ+zK+nCDOriOgw44YpJo7amaV/HmMu
         vkuqueLFn7jDVqn+N7RDCa89UyK5c4khmezhVTDfCa1a6Yq1/03K2mAqJL9KlRPOHe5X
         2B2bUWIkbmzfaeB/Henv4oepOQCn8+CiwICh12132BdtdhyhYY+zoWyNWsUCfR5iGMuX
         NNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704709459; x=1705314259;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qK1MXojV4TgQSxsR0zBeAfay9ZCh/JxiXp39luaDOtk=;
        b=pVdHJUOjtOit3SUBrSM6CFGO2W7z4WoOG0T0TJztL9Xk4WMDIPadovHvUvjyB9cAQH
         TuM/24LZ88qddemslj85cObBn4TVsCRdfj+EL5F8E8KTmpzppMQ5sK0w56DpKsna3r7y
         wlD6IttpJWho4mhSFuKaZnE5H62uSvGLdoa7FBBvb5jAvcKTPEuI3rb5HcBv6VAJ/gJv
         Vn3p5Kj5xd+aKeX4Uno19IpYb/Co9wENDVig7zPBKzIymmWJLK95JFXQnR1RZDj19pdT
         WjjEfEXPuXkUiRQ9CDmHR3KJRjWrfpKitcpAM1qkOp+nJUQTCqWulPEuVBngZcHLsp4u
         hsnA==
X-Gm-Message-State: AOJu0Yx+BznkyotTnBkaKEhXiW0Aw9jAXSm8EY6KnZ498h1Lk3rH2+us
	4Oafod6LyjN7G8ExFViufhbd75ruXLmd3F8YxSeuvNTvL88=
X-Google-Smtp-Source: AGHT+IFcZngDd+Go0LC1yroq8MsEBf5Tzwnh3LQROe7L9s+Uh8XV9mJP2uA0a9hRMTZ+ijrtc952XQ==
X-Received: by 2002:a05:6a00:2793:b0:6d9:d7fe:e925 with SMTP id bd19-20020a056a00279300b006d9d7fee925mr4503931pfb.22.1704709458203;
        Mon, 08 Jan 2024 02:24:18 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id y2-20020aa79e02000000b006d9bcf301ffsm5628799pfq.194.2024.01.08.02.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 02:24:17 -0800 (PST)
Message-ID: <659bcd51.a70a0220.3078e.c2b4@mx.google.com>
Date: Mon, 08 Jan 2024 02:24:17 -0800 (PST)
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
X-Kernelci-Kernel: next-20240108
X-Kernelci-Report-Type: test
Subject: next/master baseline: 439 runs, 49 regressions (next-20240108)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 439 runs, 49 regressions (next-20240108)

Regressions Summary
-------------------

platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained      | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig           | 1          =

at91-sama5d4_xplained      | arm   | lab-baylibre    | gcc-10   | sama5_def=
config              | 1          =

at91sam9g20ek              | arm   | lab-broonie     | gcc-10   | at91_dt_d=
efconfig            | 1          =

at91sam9g20ek              | arm   | lab-broonie     | gcc-10   | multi_v5_=
defconfig           | 1          =

bcm2836-rpi-2-b            | arm   | lab-collabora   | gcc-10   | bcm2835_d=
efconfig            | 1          =

bcm2836-rpi-2-b            | arm   | lab-collabora   | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                  | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                  | arm   | lab-baylibre    | gcc-10   | omap2plus=
_defconfig          | 1          =

imx8mm-innocomm-wb15-evk   | arm64 | lab-pengutronix | gcc-10   | defconfig=
+videodec           | 1          =

kontron-kbox-a-230-ls      | arm64 | lab-kontron     | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 5          =

kontron-kbox-a-230-ls      | arm64 | lab-kontron     | gcc-10   | defconfig=
                    | 5          =

kontron-kbox-a-230-ls      | arm64 | lab-kontron     | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 5          =

kontron-kbox-a-230-ls      | arm64 | lab-kontron     | gcc-10   | defconfig=
+videodec           | 5          =

kontron-sl28-var3-ads2     | arm64 | lab-kontron     | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2     | arm64 | lab-kontron     | gcc-10   | defconfig=
                    | 2          =

kontron-sl28-var3-ads2     | arm64 | lab-kontron     | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2     | arm64 | lab-kontron     | gcc-10   | defconfig=
+videodec           | 2          =

mt8192-asurada-spherion-r0 | arm64 | lab-collabora   | gcc-10   | defconfig=
+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0 | arm64 | lab-collabora   | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

r8a7743-iwg20d-q7          | arm   | lab-cip         | gcc-10   | shmobile_=
defconfig           | 1          =

r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip         | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun7i-a20-cubieboard2      | arm   | lab-baylibre    | clang-17 | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2      | arm   | lab-clabbe      | clang-17 | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2      | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2      | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2      | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2      | arm   | lab-clabbe      | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2      | arm   | lab-clabbe      | gcc-10   | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2      | arm   | lab-clabbe      | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240108/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240108
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      bffdfd2e7e63175ae261131a620f809d946cf9a7 =



Test Regressions
---------------- =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained      | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/659b9322099ebcd3fe52a3ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659b9322099ebcd3fe52a=
400
        new failure (last pass: next-20240105) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained      | arm   | lab-baylibre    | gcc-10   | sama5_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/659b906014c7756a2652a48d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659b906014c7756a2652a=
48e
        failing since 341 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
at91sam9g20ek              | arm   | lab-broonie     | gcc-10   | at91_dt_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/659b911aa51790cfa752a441

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/659b911aa51790cfa752a461
        failing since 217 days (last pass: next-20230601, first fail: next-=
20230605)

    2024-01-08T06:07:13.848735  /lava-432472/1/../bin/lava-test-case
    2024-01-08T06:07:13.892065  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
at91sam9g20ek              | arm   | lab-broonie     | gcc-10   | multi_v5_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/659b96f76dce2052e052a3f9

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/659b96f76dce2052e052a418
        failing since 217 days (last pass: next-20230601, first fail: next-=
20230605)

    2024-01-08T06:31:58.912550  /lava-432773/1/../bin/lava-test-case
    2024-01-08T06:31:58.954292  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora   | gcc-10   | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/659b8f0bbf0295b99452a3fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659b8f0bbf0295b99452a=
3ff
        failing since 217 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora   | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659b91a1bb50fb5b2552a3f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659b91a1bb50fb5b2552a=
3f5
        failing since 285 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
beagle-xm                  | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659b9295eac5a1a59252a3f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659b9295eac5a1a59252a=
3f9
        failing since 283 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
beagle-xm                  | arm   | lab-baylibre    | gcc-10   | omap2plus=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/659b9555ad923c956652a4a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659b9555ad923c956652a=
4a5
        failing since 25 days (last pass: next-20231212, first fail: next-2=
0231213) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mm-innocomm-wb15-evk   | arm64 | lab-pengutronix | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/659b99b536dc584fe352a409

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm6=
4/defconfig+videodec/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm6=
4/defconfig+videodec/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659b99b536dc584fe352a=
40a
        new failure (last pass: next-20240105) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls      | arm64 | lab-kontron     | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/659b8f1a205506d51052a404

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659b8f1a205506d51052a40b
        failing since 25 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-08T05:58:26.978946  / # #
    2024-01-08T05:58:27.080958  export SHELL=3D/bin/sh
    2024-01-08T05:58:27.081834  #
    2024-01-08T05:58:27.183135  / # export SHELL=3D/bin/sh. /lava-413954/en=
vironment
    2024-01-08T05:58:27.183796  =

    2024-01-08T05:58:27.284963  / # . /lava-413954/environment/lava-413954/=
bin/lava-test-runner /lava-413954/1
    2024-01-08T05:58:27.286181  =

    2024-01-08T05:58:27.326153  / # /lava-413954/bin/lava-test-runner /lava=
-413954/1
    2024-01-08T05:58:27.354608  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-08T05:58:27.394412  + cd /lava-413954/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/659b8f1a205506d51052a40f
        failing since 25 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-08T05:58:29.604970  /lava-413954/1/../bin/lava-test-case
    2024-01-08T05:58:29.631955  <8>[   25.987072] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
9b8f1a205506d51052a411
        failing since 25 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-08T05:58:30.693342  /lava-413954/1/../bin/lava-test-case
    2024-01-08T05:58:30.720305  <8>[   27.075382] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/659b8f1a205506d51052a416
        failing since 25 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-08T05:58:31.952515  /lava-413954/1/../bin/lava-test-case
    2024-01-08T05:58:31.978576  <8>[   28.334901] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/659b8f1a205506d51052a417
        failing since 25 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-08T05:58:33.002926  /lava-413954/1/../bin/lava-test-case
    2024-01-08T05:58:33.029977  <8>[   29.385458] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls      | arm64 | lab-kontron     | gcc-10   | defconfig=
                    | 5          =


  Details:     https://kernelci.org/test/plan/id/659b956f14a5e37ec452a463

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659b956f14a5e37ec452a46a
        failing since 27 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-08T06:25:20.255905  / # #
    2024-01-08T06:25:20.357840  export SHELL=3D/bin/sh
    2024-01-08T06:25:20.358569  #
    2024-01-08T06:25:20.459714  / # export SHELL=3D/bin/sh. /lava-413984/en=
vironment
    2024-01-08T06:25:20.460394  =

    2024-01-08T06:25:20.561636  / # . /lava-413984/environment/lava-413984/=
bin/lava-test-runner /lava-413984/1
    2024-01-08T06:25:20.562905  =

    2024-01-08T06:25:20.567803  / # /lava-413984/bin/lava-test-runner /lava=
-413984/1
    2024-01-08T06:25:20.631853  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-08T06:25:20.665697  + cd /lava-413984/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/659b956f14a5e37ec452a46e
        failing since 27 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-08T06:25:22.882246  /lava-413984/1/../bin/lava-test-case
    2024-01-08T06:25:22.908680  <8>[   26.011928] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
9b956f14a5e37ec452a470
        failing since 27 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-08T06:25:23.970786  /lava-413984/1/../bin/lava-test-case
    2024-01-08T06:25:23.997242  <8>[   27.100589] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/659b956f14a5e37ec452a475
        failing since 27 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-08T06:25:25.231352  /lava-413984/1/../bin/lava-test-case
    2024-01-08T06:25:25.258316  <8>[   28.360415] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/659b956f14a5e37ec452a476
        failing since 27 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-08T06:25:26.281892  /lava-413984/1/../bin/lava-test-case
    2024-01-08T06:25:26.307850  <8>[   29.410575] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls      | arm64 | lab-kontron     | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/659b95d36c75d1795652a4d7

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659b95d36c75d1795652a4de
        failing since 27 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-08T06:27:07.907832  / # #
    2024-01-08T06:27:08.008780  export SHELL=3D/bin/sh
    2024-01-08T06:27:08.009246  #
    2024-01-08T06:27:08.110484  / # export SHELL=3D/bin/sh. /lava-413993/en=
vironment
    2024-01-08T06:27:08.110874  =

    2024-01-08T06:27:08.211883  / # . /lava-413993/environment/lava-413993/=
bin/lava-test-runner /lava-413993/1
    2024-01-08T06:27:08.212657  =

    2024-01-08T06:27:08.221930  / # /lava-413993/bin/lava-test-runner /lava=
-413993/1
    2024-01-08T06:27:08.310695  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-08T06:27:08.310911  + cd /lava-413993/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/659b95d36c75d1795652a4e2
        failing since 27 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-08T06:27:10.492531  /lava-413993/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
9b95d36c75d1795652a4e4
        failing since 27 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-08T06:27:11.558899  /lava-413993/1/../bin/lava-test-case
    2024-01-08T06:27:11.561994  <8>[   26.867725] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/659b95d36c75d1795652a4e9
        failing since 27 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-08T06:27:12.776207  /lava-413993/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/659b95d36c75d1795652a4ea
        failing since 27 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-08T06:27:12.779327  <8>[   28.079094] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-01-08T06:27:13.816620  /lava-413993/1/../bin/lava-test-case   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls      | arm64 | lab-kontron     | gcc-10   | defconfig=
+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/659b99bc57ff7a0f4052a3f1

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659b99bc57ff7a0f4052a3f8
        failing since 26 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-08T06:43:51.080810  / # #
    2024-01-08T06:43:51.183053  export SHELL=3D/bin/sh
    2024-01-08T06:43:51.183784  #
    2024-01-08T06:43:51.285331  / # export SHELL=3D/bin/sh. /lava-414014/en=
vironment
    2024-01-08T06:43:51.286076  =

    2024-01-08T06:43:51.387534  / # . /lava-414014/environment/lava-414014/=
bin/lava-test-runner /lava-414014/1
    2024-01-08T06:43:51.388709  =

    2024-01-08T06:43:51.407816  / # /lava-414014/bin/lava-test-runner /lava=
-414014/1
    2024-01-08T06:43:51.495651  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-08T06:43:51.496072  + cd /lava-414014/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/659b99bc57ff7a0f4052a3fc
        failing since 26 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-08T06:43:53.707657  /lava-414014/1/../bin/lava-test-case
    2024-01-08T06:43:53.734581  <8>[   26.078294] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
9b99bc57ff7a0f4052a3fe
        failing since 26 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-08T06:43:54.796067  /lava-414014/1/../bin/lava-test-case
    2024-01-08T06:43:54.822578  <8>[   27.166588] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/659b99bc57ff7a0f4052a403
        failing since 26 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-08T06:43:56.055198  /lava-414014/1/../bin/lava-test-case
    2024-01-08T06:43:56.082344  <8>[   28.425761] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/659b99bc57ff7a0f4052a404
        failing since 26 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-08T06:43:57.105739  /lava-414014/1/../bin/lava-test-case
    2024-01-08T06:43:57.132949  <8>[   29.476159] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2     | arm64 | lab-kontron     | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/659b8ecaafdf365d5e52a414

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659b8ecaafdf365d5e52a41b
        failing since 25 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-08T05:57:09.049886  / # #
    2024-01-08T05:57:09.151849  export SHELL=3D/bin/sh
    2024-01-08T05:57:09.152552  #
    2024-01-08T05:57:09.254029  / # export SHELL=3D/bin/sh. /lava-413955/en=
vironment
    2024-01-08T05:57:09.254748  =

    2024-01-08T05:57:09.356260  / # . /lava-413955/environment/lava-413955/=
bin/lava-test-runner /lava-413955/1
    2024-01-08T05:57:09.357467  =

    2024-01-08T05:57:09.377431  / # /lava-413955/bin/lava-test-runner /lava=
-413955/1
    2024-01-08T05:57:09.465283  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-08T05:57:09.465711  + cd /lava-413955/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/659b8ecaafdf365d5e52a42e
        failing since 25 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-01-08T05:57:12.397672  /lava-413955/1/../bin/lava-test-case
    2024-01-08T05:57:12.426679  <8>[   27.149861] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2     | arm64 | lab-kontron     | gcc-10   | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/659b955b43c426871952a3f6

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659b955b43c426871952a3fd
        failing since 27 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-08T06:25:15.390975  / # #
    2024-01-08T06:25:15.491834  export SHELL=3D/bin/sh
    2024-01-08T06:25:15.492057  #
    2024-01-08T06:25:15.592570  / # export SHELL=3D/bin/sh. /lava-413989/en=
vironment
    2024-01-08T06:25:15.592774  =

    2024-01-08T06:25:15.693293  / # . /lava-413989/environment/lava-413989/=
bin/lava-test-runner /lava-413989/1
    2024-01-08T06:25:15.693604  =

    2024-01-08T06:25:15.705318  / # /lava-413989/bin/lava-test-runner /lava=
-413989/1
    2024-01-08T06:25:15.798268  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-08T06:25:15.798381  + cd /lava-413989/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/659b955b43c426871952a410
        failing since 27 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-08T06:25:18.732426  /lava-413989/1/../bin/lava-test-case
    2024-01-08T06:25:18.761404  <8>[   27.031059] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2     | arm64 | lab-kontron     | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/659b95c06c75d1795652a404

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659b95c06c75d1795652a40b
        failing since 27 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-08T06:26:49.894210  / # #
    2024-01-08T06:26:49.995297  export SHELL=3D/bin/sh
    2024-01-08T06:26:49.995583  #
    2024-01-08T06:26:50.096148  / # export SHELL=3D/bin/sh. /lava-413996/en=
vironment
    2024-01-08T06:26:50.096442  =

    2024-01-08T06:26:50.196952  / # . /lava-413996/environment/lava-413996/=
bin/lava-test-runner /lava-413996/1
    2024-01-08T06:26:50.197319  =

    2024-01-08T06:26:50.208722  / # /lava-413996/bin/lava-test-runner /lava=
-413996/1
    2024-01-08T06:26:50.305738  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-08T06:26:50.305914  + cd /lava-413996/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/659b95c06c75d1795652a41e
        failing since 27 days (last pass: next-20231207, first fail: next-2=
0231211)

    2024-01-08T06:26:53.061657  /lava-413996/1/../bin/lava-test-case   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2     | arm64 | lab-kontron     | gcc-10   | defconfig=
+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/659b99a817ac4683bc52a567

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659b99a817ac4683bc52a56e
        failing since 26 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-08T06:43:34.113060  / # #
    2024-01-08T06:43:34.215013  export SHELL=3D/bin/sh
    2024-01-08T06:43:34.215657  #
    2024-01-08T06:43:34.316789  / # export SHELL=3D/bin/sh. /lava-414015/en=
vironment
    2024-01-08T06:43:34.317504  =

    2024-01-08T06:43:34.418732  / # . /lava-414015/environment/lava-414015/=
bin/lava-test-runner /lava-414015/1
    2024-01-08T06:43:34.419653  =

    2024-01-08T06:43:34.439171  / # /lava-414015/bin/lava-test-runner /lava=
-414015/1
    2024-01-08T06:43:34.527036  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-08T06:43:34.527205  + cd /lava-414015/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/659b99a817ac4683bc52a581
        failing since 26 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-01-08T06:43:37.457409  /lava-414015/1/../bin/lava-test-case
    2024-01-08T06:43:37.485403  <8>[   27.133502] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
mt8192-asurada-spherion-r0 | arm64 | lab-collabora   | gcc-10   | defconfig=
+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/659b9723e67f9a622652a400

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8192-=
asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8192-=
asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659b9723e67f9a622652a=
401
        failing since 17 days (last pass: next-20231219, first fail: next-2=
0231221) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
mt8192-asurada-spherion-r0 | arm64 | lab-collabora   | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/659b978e68103952f152a4c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659b978e68103952f152a=
4c7
        failing since 18 days (last pass: next-20231215, first fail: next-2=
0231220) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a7743-iwg20d-q7          | arm   | lab-cip         | gcc-10   | shmobile_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/659b90c1edd044762752a435

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/659b90c1edd044762752a=
436
        failing since 17 days (last pass: next-20231220, first fail: next-2=
0231221) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip         | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659b9c1e97a9b3c72452a50b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659b9c1e97a9b3c72452a514
        failing since 160 days (last pass: next-20230712, first fail: next-=
20230801)

    2024-01-08T06:54:05.084914  + set +x
    2024-01-08T06:54:05.088049  <8>[   28.206302] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1071347_1.5.2.4.1>
    2024-01-08T06:54:05.193421  / # #
    2024-01-08T06:54:06.649109  export SHELL=3D/bin/sh
    2024-01-08T06:54:06.669551  #
    2024-01-08T06:54:06.669788  / # export SHELL=3D/bin/sh
    2024-01-08T06:54:08.615605  / # . /lava-1071347/environment
    2024-01-08T06:54:12.196762  /lava-1071347/bin/lava-test-runner /lava-10=
71347/1
    2024-01-08T06:54:12.217360  . /lava-1071347/environment
    2024-01-08T06:54:12.217460  / # /lava-1071347/bin/lava-test-runner /lav=
a-1071347/1 =

    ... (27 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-baylibre    | clang-17 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/659b97b1856c093b2c52a595

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659b97b1856c093b2c52a59e
        failing since 215 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-01-08T06:34:58.025627  / # #
    2024-01-08T06:34:58.128585  export SHELL=3D/bin/sh
    2024-01-08T06:34:58.129424  #
    2024-01-08T06:34:58.230899  / # export SHELL=3D/bin/sh. /lava-3904436/e=
nvironment
    2024-01-08T06:34:58.231456  =

    2024-01-08T06:34:58.332483  / # . /lava-3904436/environment/lava-390443=
6/bin/lava-test-runner /lava-3904436/1
    2024-01-08T06:34:58.333474  =

    2024-01-08T06:34:58.348717  / # /lava-3904436/bin/lava-test-runner /lav=
a-3904436/1
    2024-01-08T06:34:58.472490  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-08T06:34:58.473446  + cd /lava-3904436/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-clabbe      | clang-17 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/659b986a821aed7a3052a468

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659b986a821aed7a3052a471
        failing since 215 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-01-08T06:38:04.670562  + set +x[   20.451972] <LAVA_SIGNAL_ENDRUN =
0_dmesg 451412_1.5.2.4.1>
    2024-01-08T06:38:04.670881  =

    2024-01-08T06:38:04.779169  / # #
    2024-01-08T06:38:04.880690  export SHELL=3D/bin/sh
    2024-01-08T06:38:04.881210  #
    2024-01-08T06:38:04.982178  / # export SHELL=3D/bin/sh. /lava-451412/en=
vironment
    2024-01-08T06:38:04.982686  =

    2024-01-08T06:38:05.083666  / # . /lava-451412/environment/lava-451412/=
bin/lava-test-runner /lava-451412/1
    2024-01-08T06:38:05.084484  =

    2024-01-08T06:38:05.087284  / # /lava-451412/bin/lava-test-runner /lava=
-451412/1 =

    ... (12 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659b91acff3b9d1f2f52a3f1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659b91acff3b9d1f2f52a3fa
        failing since 215 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-01-08T06:09:16.389585  <8>[   12.149768] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3904308_1.5.2.4.1>
    2024-01-08T06:09:16.494844  / # #
    2024-01-08T06:09:16.595872  export SHELL=3D/bin/sh
    2024-01-08T06:09:16.596203  #
    2024-01-08T06:09:16.696982  / # export SHELL=3D/bin/sh. /lava-3904308/e=
nvironment
    2024-01-08T06:09:16.698064  =

    2024-01-08T06:09:16.799934  / # . /lava-3904308/environment/lava-390430=
8/bin/lava-test-runner /lava-3904308/1
    2024-01-08T06:09:16.801513  =

    2024-01-08T06:09:16.817288  / # /lava-3904308/bin/lava-test-runner /lav=
a-3904308/1
    2024-01-08T06:09:16.929926  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/659b92086c25d634ba52a456

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659b92086c25d634ba52a45f
        failing since 221 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-01-08T06:11:03.567179  <8>[   14.072581] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3904314_1.5.2.4.1>
    2024-01-08T06:11:03.670311  / # #
    2024-01-08T06:11:03.771209  export SHELL=3D/bin/sh
    2024-01-08T06:11:03.771627  #
    2024-01-08T06:11:03.872422  / # export SHELL=3D/bin/sh. /lava-3904314/e=
nvironment
    2024-01-08T06:11:03.872903  =

    2024-01-08T06:11:03.973749  / # . /lava-3904314/environment/lava-390431=
4/bin/lava-test-runner /lava-3904314/1
    2024-01-08T06:11:03.974394  =

    2024-01-08T06:11:04.020054  / # /lava-3904314/bin/lava-test-runner /lav=
a-3904314/1
    2024-01-08T06:11:04.112423  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/659b9721e682bb311c52a3f8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659b9721e682bb311c52a401
        failing since 215 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-01-08T06:32:25.082842  <8>[   16.093785] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3904419_1.5.2.4.1>
    2024-01-08T06:32:25.191628  / # #
    2024-01-08T06:32:25.294180  export SHELL=3D/bin/sh
    2024-01-08T06:32:25.294967  #
    2024-01-08T06:32:25.396338  / # export SHELL=3D/bin/sh. /lava-3904419/e=
nvironment
    2024-01-08T06:32:25.397195  =

    2024-01-08T06:32:25.498598  / # . /lava-3904419/environment/lava-390441=
9/bin/lava-test-runner /lava-3904419/1
    2024-01-08T06:32:25.499991  =

    2024-01-08T06:32:25.515005  / # /lava-3904419/bin/lava-test-runner /lav=
a-3904419/1
    2024-01-08T06:32:25.626811  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-clabbe      | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/659b916146d73d878552a3fa

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659b916146d73d878552a403
        failing since 215 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-01-08T06:08:12.003818  + set +x
    2024-01-08T06:08:12.005548  [   19.685606] <LAVA_SIGNAL_ENDRUN 0_dmesg =
451390_1.5.2.4.1>
    2024-01-08T06:08:12.113427  / # #
    2024-01-08T06:08:12.214989  export SHELL=3D/bin/sh
    2024-01-08T06:08:12.215605  #
    2024-01-08T06:08:12.316629  / # export SHELL=3D/bin/sh. /lava-451390/en=
vironment
    2024-01-08T06:08:12.318314  =

    2024-01-08T06:08:12.419697  / # . /lava-451390/environment/lava-451390/=
bin/lava-test-runner /lava-451390/1
    2024-01-08T06:08:12.420608  =

    2024-01-08T06:08:12.423341  / # /lava-451390/bin/lava-test-runner /lava=
-451390/1 =

    ... (12 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-clabbe      | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/659b91c5c564405c0452a461

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659b91c5c564405c0452a46a
        failing since 221 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-01-08T06:09:55.326223  + set +x
    2024-01-08T06:09:55.327963  [   20.663885] <LAVA_SIGNAL_ENDRUN 0_dmesg =
451391_1.5.2.4.1>
    2024-01-08T06:09:55.436652  / # #
    2024-01-08T06:09:55.538276  export SHELL=3D/bin/sh
    2024-01-08T06:09:55.538836  #
    2024-01-08T06:09:55.639846  / # export SHELL=3D/bin/sh. /lava-451391/en=
vironment
    2024-01-08T06:09:55.640422  =

    2024-01-08T06:09:55.741478  / # . /lava-451391/environment/lava-451391/=
bin/lava-test-runner /lava-451391/1
    2024-01-08T06:09:55.742372  =

    2024-01-08T06:09:55.745006  / # /lava-451391/bin/lava-test-runner /lava=
-451391/1 =

    ... (12 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-clabbe      | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/659b97f23c7cd887c452a511

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240108/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240108/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/659b97f23c7cd887c452a51a
        failing since 215 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-01-08T06:36:19.781493  + set +x
    2024-01-08T06:36:19.783164  [   22.788007] <LAVA_SIGNAL_ENDRUN 0_dmesg =
451408_1.5.2.4.1>
    2024-01-08T06:36:19.890681  / # #
    2024-01-08T06:36:19.992200  export SHELL=3D/bin/sh
    2024-01-08T06:36:19.992710  #
    2024-01-08T06:36:20.093765  / # export SHELL=3D/bin/sh. /lava-451408/en=
vironment
    2024-01-08T06:36:20.094363  =

    2024-01-08T06:36:20.195369  / # . /lava-451408/environment/lava-451408/=
bin/lava-test-runner /lava-451408/1
    2024-01-08T06:36:20.196198  =

    2024-01-08T06:36:20.198445  / # /lava-451408/bin/lava-test-runner /lava=
-451408/1 =

    ... (12 line(s) more)  =

 =20

