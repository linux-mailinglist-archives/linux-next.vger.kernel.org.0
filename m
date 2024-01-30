Return-Path: <linux-next+bounces-909-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF816842723
	for <lists+linux-next@lfdr.de>; Tue, 30 Jan 2024 15:49:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 730C7284A79
	for <lists+linux-next@lfdr.de>; Tue, 30 Jan 2024 14:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544357CF13;
	Tue, 30 Jan 2024 14:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="LUfpL6rq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A536BB2B
	for <linux-next@vger.kernel.org>; Tue, 30 Jan 2024 14:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706626180; cv=none; b=U8U+C7VX/Vd7rjQYZR98Sd+2Y6+bwDRdNecb0INfVho/ybM02YjPY+31v+qa69CTEwyv5NWWXB9FozKXGPdHQB7yz8IeSryp/fN6N67g+pwFkFEGwIDCCio1hqIHcKuBtGxAbxaF7+SH6dxkMEG2TsNd9H5hq6xKf5rC0TLKhCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706626180; c=relaxed/simple;
	bh=pg3pWrARNw+BAC9bnPMzC/zT9MLCKkhHJFf5JSdZ9Uc=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=i0ibiHwpIXAGd+nz3WUVh3Sb+A7PkYBb5E9P549zkGGZpF4eDBlrsDV45KUU64IY8tPSOsaXai/VkBU5NdQm4jddUs6G7ERJ/B32rRs0zidKNqU9QRDtCEwH6BZzdPvSjs2mhv4Av4lUDsHNtn8SPIG0fBpIvDrsW6t/DGrKO3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=LUfpL6rq; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d51ba18e1bso36505025ad.0
        for <linux-next@vger.kernel.org>; Tue, 30 Jan 2024 06:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1706626177; x=1707230977; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oq7P9OM0eq7cEvif9J/QtpXiK7hX5LdrLP0ogDcf8Lw=;
        b=LUfpL6rqy18lYqC5uqMO939ISZMV8h12oNH5LkovrjI6SGlyFgWcFOjuYuwE+mbyRr
         2rlOGS5F6j0AnLib1y0cKxDX+TGaQJ6F2Yl4PjXM45aLK9BoD8w1hfqdnLdTq75CZZcf
         WkGbBwJBDdOZUIn/fa3OW6DU8vL4RzG6YjFiQKMz8UWfY+1rNKxRCJR8nCSXBQZMn/G5
         ICYhshyZ4I/JHFcP35fLQN3bMJNnQWzykJXF2jPMEP5t3GgTwLYawThnG17OJipGU1tK
         j3BZsZRGu6YpCnOhuWwtNWwTH9jf5pyW/m1sJyPQNUY7iAd7jG/xvem4aDmwy4TLFIcg
         B9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706626177; x=1707230977;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oq7P9OM0eq7cEvif9J/QtpXiK7hX5LdrLP0ogDcf8Lw=;
        b=WBCXQh0BGYJwHowME9EDFjUmr5akzeaWESbY/7UhFjbClYcpPl8wyCQZ9eB8blgrQ7
         rOog8W8JKBX7RyawcIFGkp2lFL2cMgOR2lmHYZnf+7ZzJiVfL79kawTMmd4yHBVM7oKZ
         0GdJpt9RJPT+E/xANVtBGHMMXiLFuE1VhpK7vPjVZ7/63os2Yy/2XG+HBf7NSHH3R32E
         L/Qc5rhnfjmiyL8au6RQwWnhZYmVxURhDL/eTJ9o8tJpWLX1BodMK6q40gkYmiIi1skK
         yvzVwFuE4gG/aRQr9gqSBW431rzDhytdYcHWG5EwWO/z4ZeDauH7SHXVeXfmJuWxRcsJ
         EN5g==
X-Gm-Message-State: AOJu0YxNyPdcUOMorWtvOaM6bqCaVckOWiPe9wzqF5oqzUm5pBps4ZPj
	xp7IP5ZepJ4dx087PqSEyM2QCRV1CcFzRRKUKxEGJHGVPS+8nORYstVV4eXe/ax44klO84iHyS1
	F
X-Google-Smtp-Source: AGHT+IG8HPqMMlRQknTxbG5A2aMG1IfrXXuw2AVB9gCF4rpSQdA+RBectDuxvv06rCOaEuyBhMCskw==
X-Received: by 2002:a05:6a21:6da7:b0:19c:773c:570e with SMTP id wl39-20020a056a216da700b0019c773c570emr8466472pzb.39.1706626177059;
        Tue, 30 Jan 2024 06:49:37 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id e7-20020aa79807000000b006da96503d9fsm7882639pfl.109.2024.01.30.06.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 06:49:36 -0800 (PST)
Message-ID: <65b90c80.a70a0220.28733.83d7@mx.google.com>
Date: Tue, 30 Jan 2024 06:49:36 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.8-rc2-275-g21abc01c4bcb5
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 75 runs,
 11 regressions (v6.8-rc2-275-g21abc01c4bcb5)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 75 runs, 11 regressions (v6.8-rc2-275-g21abc01=
c4bcb5)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig  =
        | 1          =

kontron-kbox-a-230-ls    | arm64 | lab-kontron     | gcc-10   | defconfig  =
        | 5          =

kontron-sl28-var3-ads2   | arm64 | lab-kontron     | gcc-10   | defconfig  =
        | 2          =

rk3399-roc-pc            | arm64 | lab-broonie     | gcc-10   | defconfig  =
        | 1          =

sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig | 1          =

sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.8-rc2-275-g21abc01c4bcb5/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-rc2-275-g21abc01c4bcb5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      21abc01c4bcb50e8eb38cc07192ed520641e7285 =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/65b8db563d342f422200a06f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc2-27=
5-g21abc01c4bcb5/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inn=
ocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc2-27=
5-g21abc01c4bcb5/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inn=
ocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65b8db563d342f422200a=
070
        new failure (last pass: v6.8-rc1-322-ga9b7e214d92ca) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
kontron-kbox-a-230-ls    | arm64 | lab-kontron     | gcc-10   | defconfig  =
        | 5          =


  Details:     https://kernelci.org/test/plan/id/65b8db36aaf77ffb4e00a058

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc2-27=
5-g21abc01c4bcb5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc2-27=
5-g21abc01c4bcb5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b8db36aaf77ffb4e00a05f
        failing since 11 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-01-30T11:18:42.265648  =

    2024-01-30T11:18:42.367095  / # #export SHELL=3D/bin/sh
    2024-01-30T11:18:42.367401  =

    2024-01-30T11:18:42.468300  / # export SHELL=3D/bin/sh. /lava-424083/en=
vironment
    2024-01-30T11:18:42.469058  =

    2024-01-30T11:18:42.570519  / # . /lava-424083/environment/lava-424083/=
bin/lava-test-runner /lava-424083/1
    2024-01-30T11:18:42.571568  =

    2024-01-30T11:18:42.576588  / # /lava-424083/bin/lava-test-runner /lava=
-424083/1
    2024-01-30T11:18:42.680568  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-30T11:18:42.680997  + cd /lava-424083/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65b8db36aaf77ffb4e00a063
        failing since 11 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-01-30T11:18:44.891246  /lava-424083/1/../bin/lava-test-case
    2024-01-30T11:18:44.919359  <8>[   26.106325] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
b8db36aaf77ffb4e00a065
        failing since 11 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-01-30T11:18:45.979581  /lava-424083/1/../bin/lava-test-case
    2024-01-30T11:18:46.007086  <8>[   27.194757] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65b8db36aaf77ffb4e00a06a
        failing since 11 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-01-30T11:18:47.240812  /lava-424083/1/../bin/lava-test-case
    2024-01-30T11:18:47.267945  <8>[   28.455024] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65b8db36aaf77ffb4e00a06b
        failing since 11 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-01-30T11:18:48.291195  /lava-424083/1/../bin/lava-test-case
    2024-01-30T11:18:48.318267  <8>[   29.505554] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
kontron-sl28-var3-ads2   | arm64 | lab-kontron     | gcc-10   | defconfig  =
        | 2          =


  Details:     https://kernelci.org/test/plan/id/65b8db33fd81d09c5f00a045

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc2-27=
5-g21abc01c4bcb5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc2-27=
5-g21abc01c4bcb5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b8db33fd81d09c5f00a04c
        failing since 11 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-01-30T11:19:03.353637  / # #
    2024-01-30T11:19:03.455809  export SHELL=3D/bin/sh
    2024-01-30T11:19:03.456535  #
    2024-01-30T11:19:03.558016  / # export SHELL=3D/bin/sh. /lava-424081/en=
vironment
    2024-01-30T11:19:03.558745  =

    2024-01-30T11:19:03.659981  / # . /lava-424081/environment/lava-424081/=
bin/lava-test-runner /lava-424081/1
    2024-01-30T11:19:03.660432  =

    2024-01-30T11:19:03.664784  / # /lava-424081/bin/lava-test-runner /lava=
-424081/1
    2024-01-30T11:19:03.768984  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-30T11:19:03.769409  + cd /lava-424081/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65b8db33fd81d09c5f00a05f
        failing since 11 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-01-30T11:19:06.699633  /lava-424081/1/../bin/lava-test-case
    2024-01-30T11:19:06.727831  <8>[   27.166411] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
rk3399-roc-pc            | arm64 | lab-broonie     | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/65b8dc1acd5dd259f100a0a1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc2-27=
5-g21abc01c4bcb5/arm64/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-pc.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc2-27=
5-g21abc01c4bcb5/arm64/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-pc.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65b8dc1acd5dd259f100a=
0a2
        new failure (last pass: v6.7-12142-g865a3df089bf) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65b8dbebe16c1e876100a074

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc2-27=
5-g21abc01c4bcb5/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-=
a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc2-27=
5-g21abc01c4bcb5/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-=
a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b8dbece16c1e876100a07c
        failing since 76 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2024-01-30T11:22:11.505549  / # #
    2024-01-30T11:22:11.606835  export SHELL=3D/bin/sh
    2024-01-30T11:22:11.607310  #
    2024-01-30T11:22:11.708062  / # export SHELL=3D/bin/sh. /lava-3916103/e=
nvironment
    2024-01-30T11:22:11.708542  =

    2024-01-30T11:22:11.809415  / # . /lava-3916103/environment/lava-391610=
3/bin/lava-test-runner /lava-3916103/1
    2024-01-30T11:22:11.810187  =

    2024-01-30T11:22:11.852084  / # /lava-3916103/bin/lava-test-runner /lav=
a-3916103/1
    2024-01-30T11:22:11.948211  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-30T11:22:11.948714  + cd /lava-3916103/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65b8dbcaa022ed75ce00a07b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc2-27=
5-g21abc01c4bcb5/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a2=
0-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc2-27=
5-g21abc01c4bcb5/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a2=
0-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b8dbcaa022ed75ce00a084
        failing since 76 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2024-01-30T11:21:12.068147  + set +x[   21.441242] <LAVA_SIGNAL_ENDRUN =
0_dmesg 455852_1.5.2.4.1>
    2024-01-30T11:21:12.068393  =

    2024-01-30T11:21:12.176667  / # #
    2024-01-30T11:21:12.278073  export SHELL=3D/bin/sh
    2024-01-30T11:21:12.279963  #
    2024-01-30T11:21:12.381111  / # export SHELL=3D/bin/sh. /lava-455852/en=
vironment
    2024-01-30T11:21:12.381625  =

    2024-01-30T11:21:12.482429  / # . /lava-455852/environment/lava-455852/=
bin/lava-test-runner /lava-455852/1
    2024-01-30T11:21:12.483183  =

    2024-01-30T11:21:12.489664  / # /lava-455852/bin/lava-test-runner /lava=
-455852/1 =

    ... (12 line(s) more)  =

 =20

