Return-Path: <linux-next+bounces-789-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E2083596B
	for <lists+linux-next@lfdr.de>; Mon, 22 Jan 2024 03:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE8ACB20AE5
	for <lists+linux-next@lfdr.de>; Mon, 22 Jan 2024 02:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53CAD136A;
	Mon, 22 Jan 2024 02:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="l8ZSB4D6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D4F1368
	for <linux-next@vger.kernel.org>; Mon, 22 Jan 2024 02:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705891058; cv=none; b=hdmcnDGIVEGBzfht5JRDEdY3Ul9bnBMRrmJXy2ENoOPwoFn2iGFh5todONKFNY7lw2cgtDkZr7YkWYe+YQwpONz/7A29jze+qD3lpvq2LdBk8MXLa0e7ES+8OCz0IZ36NMw03HwwFUbCEDSiTxuQfwNLksJznjWxUpmzkoMWmXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705891058; c=relaxed/simple;
	bh=5e4zNP9Pv/X/HJyfJGKpZnuJNV2vwRsMfiwrfKmya6U=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Z4PCcS8W7yCgdhyi62wWpnm3cDOGUUYqBDsHTBiB4Oq3f/Kt18K9EzplkgP+QNfxswkhCyevFhfUi7IheU7Xh3lz/xS1N2StV6B1+ncC3dS8Qz2aSTfLK+rlZa7slM6kRVsKDz0vLteLNGdavcbokwrfYrVZ5ZS4OPLhXXRyaSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=l8ZSB4D6; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5c65ca2e1eeso977158a12.2
        for <linux-next@vger.kernel.org>; Sun, 21 Jan 2024 18:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705891055; x=1706495855; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ERgm82i+49EFMQNsXeWzZv6AbTcC/2K1kE8w+rcAFPs=;
        b=l8ZSB4D6lWcOvzIjQBPlaPu/5DCYKvdEgujY9MET/9DdrrCv90/WKyZR3Wa5uzbkob
         kc5K2espctFC33HbhYKRrpdhA05bx2IfSZLDvctIOgXUY8/GJC/CSv3xBWwQGpa4H+2s
         MjOLQrIfa1Sh5M23b4e/hB8ZUudFifCllyHkC/7kcA7Yn1iPcindg3DOv8ju3v4gdzDt
         6OHFegJ5m4X0X/Ip8je6TCxfzJERjTXgMOlPUoz0CEBSrc6AMqiPZ2K/xa+LwxFiKrSS
         lQT5JQ4O3HDRhbxw/zF+aFyzTxhm3ttZSqjIWRhEq5clnTU/S4CH1ulaqhXKJM/ikO6L
         OwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705891055; x=1706495855;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ERgm82i+49EFMQNsXeWzZv6AbTcC/2K1kE8w+rcAFPs=;
        b=ZdRLd9UCgdy28//pyQY203RtRS4/eFLUdCq05mCWTctfeBGCNh6UhfAbQhxvGSHMuk
         oP63TA8MDWUl5fAYyvKZJKa/XaXKlVQ+BKsXWJoCvHH8B1w2qZaM7RsK1wmRViE79dLE
         KsjnoPdhdOllKdixmqTf056muTmCAbO10UPVYHIjRxUMpCCbXmgyIS6n77o89GxSXMvP
         chydpDIblPVSlDkBjEq7F4uZ5HKAx4qGdHRCX5F/n9XlYuUCoHM/7PcIMOgpDBTlTmko
         3esaTMNcCvgcQgv0HJz6Q5NJjv/zjtgrsMwi3/TFwaMzmul/yriaK+oy54a2UY4dwcZv
         oucQ==
X-Gm-Message-State: AOJu0YwJcXGD22Zwnk5AMDo51UDqCMQEfvPjDByDw0Xlx5g3iHlKwOMf
	Qv8YoY4BbtEu9tvmxEkzX26dos+sLiKFo2If4s3f9E/6mZwWwMRW+VRf941Gq+e6x+jIKoV9nWi
	jdv0=
X-Google-Smtp-Source: AGHT+IEdqN6v3b/WU/g5SSJbP7yvlr2C5/8iXoo1qfXG9m67KcDhG1XVmfUgsTeDiT87sDzpAV1peA==
X-Received: by 2002:a17:902:c40a:b0:1d7:2047:80d0 with SMTP id k10-20020a170902c40a00b001d7204780d0mr1841188plk.79.1705891055055;
        Sun, 21 Jan 2024 18:37:35 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id u2-20020a17090341c200b001d4593a2e8fsm6317530ple.83.2024.01.21.18.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 18:37:34 -0800 (PST)
Message-ID: <65add4ee.170a0220.361b2.5d5c@mx.google.com>
Date: Sun, 21 Jan 2024 18:37:34 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-13113-gcbba68b0eb609
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 74 runs,
 12 regressions (v6.7-13113-gcbba68b0eb609)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 74 runs, 12 regressions (v6.7-13113-gcbba68b0e=
b609)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
beaglebone-black         | arm   | lab-cip         | gcc-10   | multi_v7_de=
fconfig | 1          =

imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig  =
        | 1          =

kontron-kbox-a-230-ls    | arm64 | lab-kontron     | gcc-10   | defconfig  =
        | 5          =

kontron-sl28-var3-ads2   | arm64 | lab-kontron     | gcc-10   | defconfig  =
        | 2          =

odroid-xu3               | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fconfig | 1          =

sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig | 1          =

sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-13113-gcbba68b0eb609/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-13113-gcbba68b0eb609
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      cbba68b0eb60974be6fa2552800d549defb0adeb =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
beaglebone-black         | arm   | lab-cip         | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65adb99be41776c00952a446

  Results:     40 PASS, 9 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-13113-=
gcbba68b0eb609/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-bl=
ack.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-13113-=
gcbba68b0eb609/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-bl=
ack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/65adb99be41776c0=
0952a44b
        new failure (last pass: v6.7-12142-g865a3df089bf)
        1 lines

    2024-01-22T00:40:23.002986  / # =

    2024-01-22T00:40:23.010477  =

    2024-01-22T00:40:23.116084  / # #
    2024-01-22T00:40:23.122336  #
    2024-01-22T00:40:23.240429  / # export SHELL=3D/bin/sh
    2024-01-22T00:40:23.250350  export SHELL=3D/bin/sh
    2024-01-22T00:40:23.351983  / # . /lava-1080626/environment
    2024-01-22T00:40:23.362426  . /lava-1080626/environment
    2024-01-22T00:40:23.464354  / # /lava-1080626/bin/lava-test-runner /lav=
a-1080626/0
    2024-01-22T00:40:23.474253  /lava-1080626/bin/lava-test-runner /lava-10=
80626/0 =

    ... (9 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/65ada3bd87267a9e6352a419

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-13113-=
gcbba68b0eb609/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innoc=
omm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-13113-=
gcbba68b0eb609/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innoc=
omm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65ada3bd87267a9e6352a=
41a
        failing since 3 days (last pass: v6.7-10328-g7e88b70257d4e, first f=
ail: v6.7-10708-g52db520a0959c) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
kontron-kbox-a-230-ls    | arm64 | lab-kontron     | gcc-10   | defconfig  =
        | 5          =


  Details:     https://kernelci.org/test/plan/id/65ada41587267a9e6352a4a0

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-13113-=
gcbba68b0eb609/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-2=
30-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-13113-=
gcbba68b0eb609/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-2=
30-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ada41587267a9e6352a4a7
        failing since 2 days (last pass: v6.7-10708-g52db520a0959c, first f=
ail: v6.7-12142-g865a3df089bf)

    2024-01-21T23:08:43.226183  <8>[   23.271870] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 420032_1.5.2.4.1>
    2024-01-21T23:08:43.329380  / # #
    2024-01-21T23:08:43.430349  export SHELL=3D/bin/sh
    2024-01-21T23:08:43.430647  #
    2024-01-21T23:08:43.531313  / # export SHELL=3D/bin/sh. /lava-420032/en=
vironment
    2024-01-21T23:08:43.531642  =

    2024-01-21T23:08:43.632173  / # . /lava-420032/environment/lava-420032/=
bin/lava-test-runner /lava-420032/1
    2024-01-21T23:08:43.632755  =

    2024-01-21T23:08:43.642050  / # /lava-420032/bin/lava-test-runner /lava=
-420032/1
    2024-01-21T23:08:43.736686  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65ada41587267a9e6352a4ab
        failing since 2 days (last pass: v6.7-10708-g52db520a0959c, first f=
ail: v6.7-12142-g865a3df089bf)

    2024-01-21T23:08:45.950698  /lava-420032/1/../bin/lava-test-case
    2024-01-21T23:08:45.977647  <8>[   26.028611] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
ada41587267a9e6352a4ad
        failing since 2 days (last pass: v6.7-10708-g52db520a0959c, first f=
ail: v6.7-12142-g865a3df089bf)

    2024-01-21T23:08:47.038222  /lava-420032/1/../bin/lava-test-case
    2024-01-21T23:08:47.065187  <8>[   27.116170] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65ada41587267a9e6352a4b2
        failing since 2 days (last pass: v6.7-10708-g52db520a0959c, first f=
ail: v6.7-12142-g865a3df089bf)

    2024-01-21T23:08:48.296556  /lava-420032/1/../bin/lava-test-case
    2024-01-21T23:08:48.323558  <8>[   28.374870] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65ada41587267a9e6352a4b3
        failing since 2 days (last pass: v6.7-10708-g52db520a0959c, first f=
ail: v6.7-12142-g865a3df089bf)

    2024-01-21T23:08:49.347378  /lava-420032/1/../bin/lava-test-case
    2024-01-21T23:08:49.374145  <8>[   29.425040] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
kontron-sl28-var3-ads2   | arm64 | lab-kontron     | gcc-10   | defconfig  =
        | 2          =


  Details:     https://kernelci.org/test/plan/id/65ada3b23c5b7f26f152a407

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-13113-=
gcbba68b0eb609/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var=
3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-13113-=
gcbba68b0eb609/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var=
3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ada3b23c5b7f26f152a40e
        failing since 2 days (last pass: v6.7-10708-g52db520a0959c, first f=
ail: v6.7-12142-g865a3df089bf)

    2024-01-21T23:07:12.955889  =

    2024-01-21T23:07:13.057253  / # #export SHELL=3D/bin/sh
    2024-01-21T23:07:13.057904  =

    2024-01-21T23:07:13.159128  / # export SHELL=3D/bin/sh. /lava-420034/en=
vironment
    2024-01-21T23:07:13.159858  =

    2024-01-21T23:07:13.260980  / # . /lava-420034/environment/lava-420034/=
bin/lava-test-runner /lava-420034/1
    2024-01-21T23:07:13.261961  =

    2024-01-21T23:07:13.302098  / # /lava-420034/bin/lava-test-runner /lava=
-420034/1
    2024-01-21T23:07:13.330780  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-21T23:07:13.364781  + cd /lava-420034/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65ada3b23c5b7f26f152a421
        failing since 2 days (last pass: v6.7-10708-g52db520a0959c, first f=
ail: v6.7-12142-g865a3df089bf)

    2024-01-21T23:07:16.296025  /lava-420034/1/../bin/lava-test-case
    2024-01-21T23:07:16.324187  <8>[   27.085296] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
odroid-xu3               | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65ada4784adb81108d52a442

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-13113-=
gcbba68b0eb609/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid-=
xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-13113-=
gcbba68b0eb609/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid-=
xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65ada4784adb81108d52a=
443
        new failure (last pass: v6.7-12142-g865a3df089bf) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65ada45f9bfef9cd8152a4c5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-13113-=
gcbba68b0eb609/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a2=
0-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-13113-=
gcbba68b0eb609/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a2=
0-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ada45f9bfef9cd8152a4ce
        failing since 67 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2024-01-21T23:09:51.810236  <8>[   14.152828] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3912670_1.5.2.4.1>
    2024-01-21T23:09:51.913910  / # #
    2024-01-21T23:09:52.015026  export SHELL=3D/bin/sh
    2024-01-21T23:09:52.015380  #
    2024-01-21T23:09:52.116066  / # export SHELL=3D/bin/sh. /lava-3912670/e=
nvironment
    2024-01-21T23:09:52.116424  =

    2024-01-21T23:09:52.217125  / # . /lava-3912670/environment/lava-391267=
0/bin/lava-test-runner /lava-3912670/1
    2024-01-21T23:09:52.217642  =

    2024-01-21T23:09:52.259999  / # /lava-3912670/bin/lava-test-runner /lav=
a-3912670/1
    2024-01-21T23:09:52.354416  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65ada415f8529ba33752a404

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-13113-=
gcbba68b0eb609/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-=
cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-13113-=
gcbba68b0eb609/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-=
cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ada416f8529ba33752a40d
        failing since 67 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2024-01-21T23:08:50.058055  + set +x[   20.216715] <LAVA_SIGNAL_ENDRUN =
0_dmesg 454220_1.5.2.4.1>
    2024-01-21T23:08:50.058375  =

    2024-01-21T23:08:50.166678  / # #
    2024-01-21T23:08:50.268234  export SHELL=3D/bin/sh
    2024-01-21T23:08:50.268790  #
    2024-01-21T23:08:50.369769  / # export SHELL=3D/bin/sh. /lava-454220/en=
vironment
    2024-01-21T23:08:50.370293  =

    2024-01-21T23:08:50.471285  / # . /lava-454220/environment/lava-454220/=
bin/lava-test-runner /lava-454220/1
    2024-01-21T23:08:50.472117  =

    2024-01-21T23:08:50.475077  / # /lava-454220/bin/lava-test-runner /lava=
-454220/1 =

    ... (12 line(s) more)  =

 =20

