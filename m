Return-Path: <linux-next+bounces-457-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B28018182A5
	for <lists+linux-next@lfdr.de>; Tue, 19 Dec 2023 08:55:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF4221C23772
	for <lists+linux-next@lfdr.de>; Tue, 19 Dec 2023 07:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C717A11700;
	Tue, 19 Dec 2023 07:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="NjSn/vqX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BC711702
	for <linux-next@vger.kernel.org>; Tue, 19 Dec 2023 07:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6d532e4f6d6so1135976b3a.2
        for <linux-next@vger.kernel.org>; Mon, 18 Dec 2023 23:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702972517; x=1703577317; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SkF31qW8o35qqEZ1pFilafcXDdytBPE/rmg2euVVH1Y=;
        b=NjSn/vqXwdVF8nKX59xkBav7zycEa4eeLTG4VReYLw1991T5aAk5ofg8WTLHWH512B
         8QCERDYSuk6JoiTeMv78+DSPj5Ii+O6UIjrkB7s4fBQk2LARvrbStwfPuBpu78m/o70D
         1mMNjt9uQkPwJMaxmrarxHoIljT0X3nVh/WcXFiapCuI2Hk5xqQja/tFdobD8DrrxmRu
         zs8rtDL0o6+lmqZVtdM2axWlVW73uXrwFu6OHhFq6Oly5BqxpQbhovpTa19cquZ7+97b
         Sq+U1wmM7oP1WwO3J+TiEGrY39A9lsHAAhU3VeZSwkLu0wsk5fFN4e6/Knffxdd2B+Gy
         xVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702972517; x=1703577317;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SkF31qW8o35qqEZ1pFilafcXDdytBPE/rmg2euVVH1Y=;
        b=xBQGFjuXeTZh+IloO2Ov4pp8v8c4fk3YqaYUDzI4FAuKw8uSDOZdDwpGGfypsZ9pBP
         0mBpL53bK+dik836b2GMMbGBJRxpYFGoN5Ogol/BaH+BQseBoPSUbZ1mILNqfswJuImC
         fYI6zqDbI+W9mnEgBaFNNGi86j3cuBjei8cdYn5Dr6x6fqhEa0gkMC2KbyDFjbtzoUC/
         sEslaXQ/R3N7m5u6Ya3Y/WzbQzgpRrdJrvx8jo/xPB2GK8QLTrm0uTCj7xQsTnrBUAlc
         Tqp083b4h119sJ8NR+1Vs8vTjenpwW6MJuqD6hyLNQu+Ux9MqVktL/Qu8qxAjFt5j0cb
         S61w==
X-Gm-Message-State: AOJu0YxlZNnkSZ5cqSEID7qLCylGVPTfsfqdQgWaRUDGtEU4SkbeZPyn
	RJ4ovEMoqyeGhGmIDbh69bi5HATGLLNj+YDzlao=
X-Google-Smtp-Source: AGHT+IFd2xvCFCACkw2fCfns2/J2NKBx6X/9yzVwpMrkYdzixh6UYQHvn6EdoF+9pxwVew+n8zUkMQ==
X-Received: by 2002:a05:6a20:1586:b0:18f:dcd6:e685 with SMTP id h6-20020a056a20158600b0018fdcd6e685mr9483808pzj.70.1702972517533;
        Mon, 18 Dec 2023 23:55:17 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id g13-20020a170902d5cd00b001d1d6f6b67dsm20378965plh.147.2023.12.18.23.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 23:55:16 -0800 (PST)
Message-ID: <65814c64.170a0220.e41cb.bb15@mx.google.com>
Date: Mon, 18 Dec 2023 23:55:16 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.7-rc6-203-g6c40edd32f70
Subject: next/pending-fixes baseline: 107 runs,
 9 regressions (v6.7-rc6-203-g6c40edd32f70)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 107 runs, 9 regressions (v6.7-rc6-203-g6c40edd=
32f70)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
beaglebone-black      | arm   | lab-broonie   | gcc-10   | multi_v7_defconf=
ig | 1          =

beaglebone-black      | arm   | lab-cip       | gcc-10   | multi_v7_defconf=
ig | 1          =

k3-am625-sk           | arm64 | lab-baylibre  | gcc-10   | defconfig       =
   | 1          =

kontron-pitx-imx8m    | arm64 | lab-kontron   | gcc-10   | defconfig       =
   | 2          =

rk3399-rock-pi-4b     | arm64 | lab-collabora | gcc-10   | defconfig       =
   | 1          =

sun50i-h6-orangepi-3  | arm64 | lab-clabbe    | gcc-10   | defconfig       =
   | 1          =

sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-10   | multi_v7_defconf=
ig | 1          =

sun7i-a20-cubieboard2 | arm   | lab-clabbe    | gcc-10   | multi_v7_defconf=
ig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-rc6-203-g6c40edd32f70/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-rc6-203-g6c40edd32f70
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6c40edd32f7024a7cc59e69c5cbb6cd045ddd64a =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
beaglebone-black      | arm   | lab-broonie   | gcc-10   | multi_v7_defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/65811ab6ef59895d30e134c7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-20=
3-g6c40edd32f70/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebo=
ne-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-20=
3-g6c40edd32f70/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebo=
ne-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65811ab6ef59895d30e13=
4c8
        failing since 4 days (last pass: v6.7-rc5-272-gc68cf4cd434e0, first=
 fail: v6.7-rc5-313-g501631e4f287a) =

 =



platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
beaglebone-black      | arm   | lab-cip       | gcc-10   | multi_v7_defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/65811a437ba9d05f1de13477

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-20=
3-g6c40edd32f70/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-b=
lack.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-20=
3-g6c40edd32f70/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-b=
lack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65811a437ba9d05f1de13=
478
        failing since 4 days (last pass: v6.7-rc5-272-gc68cf4cd434e0, first=
 fail: v6.7-rc5-313-g501631e4f287a) =

 =



platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
k3-am625-sk           | arm64 | lab-baylibre  | gcc-10   | defconfig       =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/65811c9a9b0dc64a2ae13478

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-20=
3-g6c40edd32f70/arm64/defconfig/gcc-10/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-20=
3-g6c40edd32f70/arm64/defconfig/gcc-10/lab-baylibre/baseline-k3-am625-sk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65811c9a9b0dc64a2ae13=
479
        new failure (last pass: v6.7-rc5-456-g002453f88f609) =

 =



platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
kontron-pitx-imx8m    | arm64 | lab-kontron   | gcc-10   | defconfig       =
   | 2          =


  Details:     https://kernelci.org/test/plan/id/65811b68ecdd39ecfbe13551

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-20=
3-g6c40edd32f70/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-im=
x8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-20=
3-g6c40edd32f70/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-im=
x8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65811b68ecdd39ecfbe13554
        new failure (last pass: v6.7-rc5-456-g002453f88f609)

    2023-12-19T04:25:51.989235  / # #
    2023-12-19T04:25:52.091403  export SHELL=3D/bin/sh
    2023-12-19T04:25:52.092040  #
    2023-12-19T04:25:52.193276  / # export SHELL=3D/bin/sh. /lava-407719/en=
vironment
    2023-12-19T04:25:52.193977  =

    2023-12-19T04:25:52.295291  / # . /lava-407719/environment/lava-407719/=
bin/lava-test-runner /lava-407719/1
    2023-12-19T04:25:52.296484  =

    2023-12-19T04:25:52.337189  / # /lava-407719/bin/lava-test-runner /lava=
-407719/1
    2023-12-19T04:25:52.366653  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-19T04:25:52.367079  + cd /lava-407719/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/658=
11b69ecdd39ecfbe13564
        new failure (last pass: v6.7-rc5-456-g002453f88f609)

    2023-12-19T04:25:54.753648  /lava-407719/1/../bin/lava-test-case
    2023-12-19T04:25:54.754066  <8>[   19.388411] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-12-19T04:25:54.754358  /lava-407719/1/../bin/lava-test-case   =

 =



platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
rk3399-rock-pi-4b     | arm64 | lab-collabora | gcc-10   | defconfig       =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/65811c9524e6bbcad5e13479

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-20=
3-g6c40edd32f70/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-p=
i-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-20=
3-g6c40edd32f70/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-p=
i-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65811c9524e6bbcad5e13=
47a
        new failure (last pass: v6.7-rc5-456-g002453f88f609) =

 =



platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
sun50i-h6-orangepi-3  | arm64 | lab-clabbe    | gcc-10   | defconfig       =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/65811b8287b35f4056e134a6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-20=
3-g6c40edd32f70/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orange=
pi-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-20=
3-g6c40edd32f70/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orange=
pi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65811b8287b35f4056e134ab
        failing since 348 days (last pass: v6.1-2435-g5c02e5d167d0, first f=
ail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-12-19T04:26:35.679249  <8>[   19.218630] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 448819_1.5.2.4.1>
    2023-12-19T04:26:35.784299  / # #
    2023-12-19T04:26:35.886161  export SHELL=3D/bin/sh
    2023-12-19T04:26:35.886790  #
    2023-12-19T04:26:35.987877  / # export SHELL=3D/bin/sh. /lava-448819/en=
vironment
    2023-12-19T04:26:35.988366  =

    2023-12-19T04:26:36.089400  / # . /lava-448819/environment/lava-448819/=
bin/lava-test-runner /lava-448819/1
    2023-12-19T04:26:36.090387  =

    2023-12-19T04:26:36.094297  / # /lava-448819/bin/lava-test-runner /lava=
-448819/1
    2023-12-19T04:26:36.178365  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-10   | multi_v7_defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/6581196dbb73ede42fe134c4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-20=
3-g6c40edd32f70/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a=
20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-20=
3-g6c40edd32f70/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a=
20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6581196dbb73ede42fe134c7
        failing since 34 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2023-12-19T04:17:28.015401  / # #
    2023-12-19T04:17:28.118756  export SHELL=3D/bin/sh
    2023-12-19T04:17:28.119895  #
    2023-12-19T04:17:28.221649  / # export SHELL=3D/bin/sh. /lava-3887737/e=
nvironment
    2023-12-19T04:17:28.222593  =

    2023-12-19T04:17:28.324311  / # . /lava-3887737/environment/lava-388773=
7/bin/lava-test-runner /lava-3887737/1
    2023-12-19T04:17:28.325888  =

    2023-12-19T04:17:28.339214  / # /lava-3887737/bin/lava-test-runner /lav=
a-3887737/1
    2023-12-19T04:17:28.446211  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-19T04:17:28.447229  + cd /lava-3887737/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
sun7i-a20-cubieboard2 | arm   | lab-clabbe    | gcc-10   | multi_v7_defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/65811965f0b95df21fe135fa

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-20=
3-g6c40edd32f70/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20=
-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-20=
3-g6c40edd32f70/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20=
-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65811965f0b95df21fe135ff
        failing since 34 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2023-12-19T04:17:22.849425  + set +x[   19.575396] <LAVA_SIGNAL_ENDRUN =
0_dmesg 448814_1.5.2.4.1>
    2023-12-19T04:17:22.849872  =

    2023-12-19T04:17:22.957630  / # #
    2023-12-19T04:17:23.059243  export SHELL=3D/bin/sh
    2023-12-19T04:17:23.059844  #
    2023-12-19T04:17:23.160807  / # export SHELL=3D/bin/sh. /lava-448814/en=
vironment
    2023-12-19T04:17:23.161322  =

    2023-12-19T04:17:23.262335  / # . /lava-448814/environment/lava-448814/=
bin/lava-test-runner /lava-448814/1
    2023-12-19T04:17:23.263234  =

    2023-12-19T04:17:23.266015  / # /lava-448814/bin/lava-test-runner /lava=
-448814/1 =

    ... (12 line(s) more)  =

 =20

