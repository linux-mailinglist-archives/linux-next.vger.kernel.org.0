Return-Path: <linux-next+bounces-1169-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8B7854FAD
	for <lists+linux-next@lfdr.de>; Wed, 14 Feb 2024 18:15:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAFE328F120
	for <lists+linux-next@lfdr.de>; Wed, 14 Feb 2024 17:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 691937B3D2;
	Wed, 14 Feb 2024 17:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="BmfXbYvY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30477AE78
	for <linux-next@vger.kernel.org>; Wed, 14 Feb 2024 17:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707930945; cv=none; b=VPY8gwUAHFv4LlxjvLw5G21zFE5oIGHiCHcAS8sQ93k/5GgBTz1kN4NpycaMawtd7329tEAXjQWcAb14aX/3fmOvs98a92C5PsnJ836ow7mGtlIf134UnD9UOVwUS8ReXxgClOaZ0xakkd+5hyD2aOyrAnQzed0mgYOvusN6UaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707930945; c=relaxed/simple;
	bh=E2aMHn3tkm7hEMc9xeIjksoJXCdLlEjZgAS8668+sMs=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=qyAYH+DTvgvZqEvm/VlnYQ/vy2SvG0L6Uzc8ioWdh0P1d/BZlD7ExM5nouYIkukp0q4iT8m2iV0uXPosrCuQXlmkX1wVnhKE+Tr8dhjuXSB7S5IHobDAohjVx12EDmQF8bLb6alxMtga8fyaP6orKT+Dvu0rl/RFPn+EEgc/LlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=BmfXbYvY; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e08dd0c7eeso12050b3a.1
        for <linux-next@vger.kernel.org>; Wed, 14 Feb 2024 09:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707930942; x=1708535742; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ff96mVKXO0n3ZxJ5JrDeXFRjgLGHx5lmvYJFz6PzD0=;
        b=BmfXbYvYBBIo7slUBTwoWVDs/C/JamwAqxSKQMcZBzax/RZvHuViwA8klBnYrxAhwA
         Gxd1M/zofz+qauev9tWE1onmB4U5yGcqz3/2vcfGuVA5jHmkcat3lxzx09LRLzc5MbiG
         BFqkbf9WX7dxFBQgKUlhpFr2E+rnimNC02HOPMchJjp1/1gxUUqE2ZkZ6m31tPREDyk3
         6iFsZ3CmKkkwHkL9yZtHXwRMVu8ccQGJ+XEwO97u2FFvMCm4gWQtPi45uVzX2NpJwGps
         yPJ6TGriqWGs6Bse9CMuQa3tAVaPolcmvEprDaiW42CrCOzdd4bZOOgaPAwZSIEuFhBO
         jzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707930942; x=1708535742;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Ff96mVKXO0n3ZxJ5JrDeXFRjgLGHx5lmvYJFz6PzD0=;
        b=DEWFGn8rufFFE50D/Xe7VVBBDZiJydMVa0O5Zq1adMlKbnwxrdvFMldBRvQtf4KcxV
         Zouq+dyPM8s4y0uULqT7BxXLTGztPsaxG6IEnoAU0Dk6EqdeFLE4dwEGhHzl+P9PNNSZ
         iWNSjfYHRFGDTJ7q11BTebd4xnHlEgs70sGQhMoLOPftG5LTB7kB62pgYwORRyfDe9Vy
         l9K7Ok+D13h/6EZgnaPNHopnV4gPIGAfuxafJFIReR94mTcCFN+3q6uhbihLuu53AEsv
         vtC3fylAHF6aeb0akyh4bQaqWfImCpRfHzhglnh2ez5gQvVyQqmsPJmFfpZ9sW2ETpmk
         x93A==
X-Gm-Message-State: AOJu0YwOrtlxeQhDsGKASWYSLP4A8NnkIxB6zhk1Yi/eo05H6zSfrZ1R
	VQ+XI++CpDdE1D1RKPR1kqPSr2XRFkQuLq2/aAzn2Ntu4pMxvLwRjCq6r9t/Rz5FYBS40Rdv9d0
	KT9k=
X-Google-Smtp-Source: AGHT+IGFVwR7hTOpJnU9EIqBhOszc+6iUbP42HTWYvFlGJTsRdKrE9TAKTriLsowbSrM29T7qRWxxA==
X-Received: by 2002:a05:6a20:9f49:b0:19b:56f0:c880 with SMTP id ml9-20020a056a209f4900b0019b56f0c880mr3878461pzb.39.1707930941386;
        Wed, 14 Feb 2024 09:15:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXzNk4yNbOjuq9xQmYVHPlq1ctTx+fSWnlqIWfJb1Mnd5sFGeQnU9bNhuOyQZhETcwlDwgd1w5zyUfeVK+iqyv2DI5tQ8PSPUDcUhJuoId2yHwxCWt1NH5eWUkTNn37klcbDnvDXHlwsvDmYsBeSW/1Fw==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id b18-20020aa78712000000b006db9604bf8csm9507213pfo.131.2024.02.14.09.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 09:15:40 -0800 (PST)
Message-ID: <65ccf53c.a70a0220.6e2ef.c3a8@mx.google.com>
Date: Wed, 14 Feb 2024 09:15:40 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20240214
X-Kernelci-Report-Type: test
Subject: next/master baseline: 296 runs, 22 regressions (next-20240214)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 296 runs, 22 regressions (next-20240214)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | sama5_def=
config              | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 5          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3399-roc-pc                | arm64 | lab-broonie   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240214/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240214
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2c3b09aac00d7835023bbc4473ee06696be64fa8 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | sama5_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/65ccb5614c7577576e637012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240214/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240214/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65ccb5614c7577576e637=
013
        failing since 378 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65ccc05f3415fb717163704d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240214/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240214/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65ccc05f3415fb7171637=
04e
        failing since 254 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65ccbaed310eeb1202637019

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240214/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240214/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65ccbaed310eeb1202637=
01a
        failing since 673 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/65ccbfd793da3eb80f637012

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ccbfd793da3eb80f637019
        failing since 63 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-14T13:27:24.828099  / # #
    2024-02-14T13:27:24.930052  export SHELL=3D/bin/sh
    2024-02-14T13:27:24.930691  #
    2024-02-14T13:27:25.031874  / # export SHELL=3D/bin/sh. /lava-429596/en=
vironment
    2024-02-14T13:27:25.032597  =

    2024-02-14T13:27:25.133896  / # . /lava-429596/environment/lava-429596/=
bin/lava-test-runner /lava-429596/1
    2024-02-14T13:27:25.135100  =

    2024-02-14T13:27:25.139635  / # /lava-429596/bin/lava-test-runner /lava=
-429596/1
    2024-02-14T13:27:25.197864  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-14T13:27:25.198310  + <8>[   21.103658] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 429596_1.5.2.4.5> =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65ccbfd793da3eb80f63701d
        failing since 63 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-14T13:27:27.305362  /lava-429596/1/../bin/lava-test-case
    2024-02-14T13:27:27.305791  <8>[   23.212102] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-14T13:27:27.306210  /lava-429596/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
ccbfd793da3eb80f63701f
        failing since 63 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-14T13:27:28.364011  /lava-429596/1/../bin/lava-test-case
    2024-02-14T13:27:28.364465  <8>[   24.250864] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-14T13:27:28.364831  /lava-429596/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65ccbfd793da3eb80f637024
        failing since 63 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-14T13:27:29.444132  /lava-429596/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65ccbfd793da3eb80f637025
        failing since 63 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-14T13:27:29.447341  <8>[   25.367735] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-14T13:27:30.504799  /lava-429596/1/../bin/lava-test-case
    2024-02-14T13:27:30.505054  <8>[   26.389172] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-14T13:27:30.505200  /lava-429596/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65ccbf0c63e73a246e637026

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ccbf0c63e73a246e63702d
        failing since 63 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-14T13:24:17.812082  / # #
    2024-02-14T13:24:17.914164  export SHELL=3D/bin/sh
    2024-02-14T13:24:17.914937  #
    2024-02-14T13:24:18.016299  / # export SHELL=3D/bin/sh. /lava-429595/en=
vironment
    2024-02-14T13:24:18.017007  =

    2024-02-14T13:24:18.118345  / # . /lava-429595/environment/lava-429595/=
bin/lava-test-runner /lava-429595/1
    2024-02-14T13:24:18.119438  =

    2024-02-14T13:24:18.124107  / # /lava-429595/bin/lava-test-runner /lava=
-429595/1
    2024-02-14T13:24:18.192108  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-14T13:24:18.192536  + <8>[   21.119695] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 429595_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65ccbf0c63e73a246e637040
        failing since 63 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-14T13:24:20.619520  /lava-429595/1/../bin/lava-test-case
    2024-02-14T13:24:20.619972  <8>[   23.535692] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-14T13:24:20.620268  /lava-429595/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65ccc01d395e453979637013

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65ccc01d395e453979637=
014
        failing since 0 day (last pass: next-20240212, first fail: next-202=
40213) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65ccb81b1b0e4c8ad8637012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240214/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240214/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65ccb81b1b0e4c8ad8637=
013
        failing since 0 day (last pass: next-20240212, first fail: next-202=
40213) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/65ccc0fd63dd3e1d0e637012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-=
ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-=
ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65ccc0fd63dd3e1d0e637=
013
        new failure (last pass: next-20240206) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65ccc1bee6713b346a63706b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hiho=
pe-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hiho=
pe-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65ccc1bee6713b346a637=
06c
        failing since 0 day (last pass: next-20240212, first fail: next-202=
40213) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65ccbbfb78b91d5a62637012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240214/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240214/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65ccbbfb78b91d5a62637=
013
        failing since 449 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65ccbae4310eeb1202637012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240214/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240214/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65ccbae4310eeb1202637=
013
        failing since 449 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-roc-pc                | arm64 | lab-broonie   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65ccc036bf4edb7eee63707d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-rk3399-ro=
c-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-rk3399-ro=
c-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65ccc036bf4edb7eee637=
07e
        failing since 7 days (last pass: next-20240125, first fail: next-20=
240207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65ccbc7500ef60d957637027

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240214/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240214/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ccbc7500ef60d957637030
        failing since 258 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-14T13:12:59.404890  /#
    2024-02-14T13:12:59.506037   # #export SHELL=3D/bin/sh
    2024-02-14T13:12:59.506395  =

    2024-02-14T13:12:59.607097  / # export SHEL. /lava-3927829/environment
    2024-02-14T13:12:59.607453  L=3D/bin/sh
    2024-02-14T13:12:59.708133  / # . /lava-3927829/environment/lava-392782=
9/bin/lava-test-runner /lava-3927829/1
    2024-02-14T13:12:59.708649  =

    2024-02-14T13:12:59.719971  / # /lava-3927829/bin/lava-test-runner /lav=
a-3927829/1
    2024-02-14T13:12:59.850913  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-14T13:12:59.851484  + cd /lava-3927829/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65ccbe1c42ceb3e893637018

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240214/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240214/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ccbe1c42ceb3e893637021
        failing since 258 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-14T13:19:48.806254  / # #
    2024-02-14T13:19:48.909105  export SHELL=3D/bin/sh
    2024-02-14T13:19:48.910219  #
    2024-02-14T13:19:49.011919  / # export SHELL=3D/bin/sh. /lava-3927864/e=
nvironment
    2024-02-14T13:19:49.012788  =

    2024-02-14T13:19:49.114206  / # . /lava-3927864/environment/lava-392786=
4/bin/lava-test-runner /lava-3927864/1
    2024-02-14T13:19:49.115462  =

    2024-02-14T13:19:49.130365  / # /lava-3927864/bin/lava-test-runner /lav=
a-3927864/1
    2024-02-14T13:19:49.248668  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-14T13:19:49.249380  + cd /lava-3927864/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65ccbc621f860182fe637015

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240214/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240214/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ccbc621f860182fe63701e
        failing since 258 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-14T13:12:50.288252  + set +x
    2024-02-14T13:12:50.289993  [   21.324274] <LAVA_SIGNAL_ENDRUN 0_dmesg =
458294_1.5.2.4.1>
    2024-02-14T13:12:50.398914  / # #
    2024-02-14T13:12:50.500646  export SHELL=3D/bin/sh
    2024-02-14T13:12:50.501248  #
    2024-02-14T13:12:50.602247  / # export SHELL=3D/bin/sh. /lava-458294/en=
vironment
    2024-02-14T13:12:50.602818  =

    2024-02-14T13:12:50.703824  / # . /lava-458294/environment/lava-458294/=
bin/lava-test-runner /lava-458294/1
    2024-02-14T13:12:50.704672  =

    2024-02-14T13:12:50.707579  / # /lava-458294/bin/lava-test-runner /lava=
-458294/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65ccbdf246c2bf56b8637022

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240214/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240214/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ccbdf246c2bf56b863702b
        failing since 258 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-02-14T13:19:31.229637  + set +x
    2024-02-14T13:19:31.231503  [   22.045239] <LAVA_SIGNAL_ENDRUN 0_dmesg =
458295_1.5.2.4.1>
    2024-02-14T13:19:31.339548  / # #
    2024-02-14T13:19:31.442757  export SHELL=3D/bin/sh
    2024-02-14T13:19:31.443375  #
    2024-02-14T13:19:31.544498  / # export SHELL=3D/bin/sh. /lava-458295/en=
vironment
    2024-02-14T13:19:31.545134  =

    2024-02-14T13:19:31.646157  / # . /lava-458295/environment/lava-458295/=
bin/lava-test-runner /lava-458295/1
    2024-02-14T13:19:31.647041  =

    2024-02-14T13:19:31.649592  / # /lava-458295/bin/lava-test-runner /lava=
-458295/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/65ccb8dccea484e15e63701d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240214/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240214/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ccb8dccea484e15e637026
        failing since 65 days (last pass: next-20231208, first fail: next-2=
0231211)

    2024-02-14T12:57:39.325557  <8>[   10.319525] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3927813_1.5.2.4.1>
    2024-02-14T12:57:39.430194  / # #
    2024-02-14T12:57:39.531467  export SHELL=3D/bin/sh
    2024-02-14T12:57:39.531813  #
    2024-02-14T12:57:39.632585  / # export SHELL=3D/bin/sh. /lava-3927813/e=
nvironment
    2024-02-14T12:57:39.632931  =

    2024-02-14T12:57:39.733700  / # . /lava-3927813/environment/lava-392781=
3/bin/lava-test-runner /lava-3927813/1
    2024-02-14T12:57:39.734246  =

    2024-02-14T12:57:39.743038  / # /lava-3927813/bin/lava-test-runner /lav=
a-3927813/1
    2024-02-14T12:57:39.893951  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =20

