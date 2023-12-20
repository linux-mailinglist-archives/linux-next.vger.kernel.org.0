Return-Path: <linux-next+bounces-482-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F4C81978F
	for <lists+linux-next@lfdr.de>; Wed, 20 Dec 2023 05:12:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27C97288646
	for <lists+linux-next@lfdr.de>; Wed, 20 Dec 2023 04:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 766B9FBE0;
	Wed, 20 Dec 2023 04:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="lCJr4Lyn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803B2FBE1
	for <linux-next@vger.kernel.org>; Wed, 20 Dec 2023 04:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6d099d316a8so4866558b3a.0
        for <linux-next@vger.kernel.org>; Tue, 19 Dec 2023 20:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1703045519; x=1703650319; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M8luU/Yq/gzeVcLhjsKYaweNNqNZ24fh1f7JD34sET4=;
        b=lCJr4LynF5E8vkmsHn8T1/V2T9ebhfm4JNARH7Yi1Xy1ClXZKN9Xky1BAlE/Lap0+E
         Nw46rl/r4jMHxtx3I+xEn1xXh05RkK6W5SFCJbAl3yX/5ocWVY2yNPYdTWgDEBwQcisG
         sONZlqgpbZM7++itaUonbvobjUCtvQZvt0ASYPle3rWyOyJviD3Fx0vfSiUw0TGK7XCF
         7dSbOphP127ctjbnxN5AnbYeBtDFS+Q6r31/dxXo2EYI3k0fLwfvm8rRKm9QbPd3fl/L
         tFB+Sz/ZuQvUUzd25zyzHyftWhUHEt/HTCrSQZqLELcD2a29URgbR+Km9c4wtmWgXqOp
         4Edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703045519; x=1703650319;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M8luU/Yq/gzeVcLhjsKYaweNNqNZ24fh1f7JD34sET4=;
        b=AWJXegDQlu9qhCWBpgGwO2lchgA1eTNs9A7/MBWV8xXx5fywOL6EwLISj501mNiW4n
         WNgd/AuCcsg1C4dfCRP67IXj3Cqf7qklcY24AtCjJYKgvKJ6PVzMbcuaGMde7cb6Y+A8
         kghbfneLzotnzUb8u9iB/utQE9zZ/479yaHKsHcMSqK2Mk6CSasteb9qrAo84dphvAIK
         0QAOJfS17xnulnOpSN9JlzeN1MAGeyWe3T8DmHgEtlIkVmDjr2Rp2V8POCu1T0EbdOTW
         fbXPKAoGGMMUofjYb4CNvPmCBs0mH8r6Eri09pRRVxFqpOql/FLCTBZwFK9pbe7KZ/68
         pK6Q==
X-Gm-Message-State: AOJu0YyRHlrrEI92o4USgAhzVEeyqlc5u1M8NY5WT4qA4yTl5FnQXoQd
	feHYn0Dq87xEfBxYeZUeyyQK4Tr5h7AbbnmAlPY=
X-Google-Smtp-Source: AGHT+IHpT0jf4vXcq5dvOk9bh72KlMY6/MAMJtJHufSFFZgj2S69Q7i17D3lPZRgurcq7ALG6DN/bw==
X-Received: by 2002:a05:6a00:1d84:b0:6d7:5e29:937a with SMTP id z4-20020a056a001d8400b006d75e29937amr5016363pfw.61.1703045519187;
        Tue, 19 Dec 2023 20:11:59 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id a18-20020a62e212000000b006ce6bf5491dsm5954728pfi.198.2023.12.19.20.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 20:11:58 -0800 (PST)
Message-ID: <6582698e.620a0220.3736d.0649@mx.google.com>
Date: Tue, 19 Dec 2023 20:11:58 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc6-238-g46bcd2aac1f1f
Subject: next/pending-fixes baseline: 104 runs,
 4 regressions (v6.7-rc6-238-g46bcd2aac1f1f)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 104 runs, 4 regressions (v6.7-rc6-238-g46bcd2a=
ac1f1f)

Regressions Summary
-------------------

platform                    | arch  | lab          | compiler | defconfig  =
        | regressions
----------------------------+-------+--------------+----------+------------=
--------+------------
sun50i-h6-orangepi-3        | arm64 | lab-clabbe   | gcc-10   | defconfig  =
        | 1          =

sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe   | gcc-10   | defconfig  =
        | 1          =

sun7i-a20-cubieboard2       | arm   | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =

sun7i-a20-cubieboard2       | arm   | lab-clabbe   | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-rc6-238-g46bcd2aac1f1f/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-rc6-238-g46bcd2aac1f1f
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      46bcd2aac1f1fabb3d1b44562d5d898d2d99350f =



Test Regressions
---------------- =



platform                    | arch  | lab          | compiler | defconfig  =
        | regressions
----------------------------+-------+--------------+----------+------------=
--------+------------
sun50i-h6-orangepi-3        | arm64 | lab-clabbe   | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/658238879140d02e0be13486

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-23=
8-g46bcd2aac1f1f/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orang=
epi-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-23=
8-g46bcd2aac1f1f/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orang=
epi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/658238879140d02e0be1348f
        failing since 349 days (last pass: v6.1-2435-g5c02e5d167d0, first f=
ail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-12-20T00:42:36.247550  <8>[   18.963604] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 449035_1.5.2.4.1>
    2023-12-20T00:42:36.353104  / # #
    2023-12-20T00:42:36.454985  export SHELL=3D/bin/sh
    2023-12-20T00:42:36.455653  #
    2023-12-20T00:42:36.556640  / # export SHELL=3D/bin/sh. /lava-449035/en=
vironment
    2023-12-20T00:42:36.557291  =

    2023-12-20T00:42:36.658403  / # . /lava-449035/environment/lava-449035/=
bin/lava-test-runner /lava-449035/1
    2023-12-20T00:42:36.659401  =

    2023-12-20T00:42:36.662527  / # /lava-449035/bin/lava-test-runner /lava=
-449035/1
    2023-12-20T00:42:36.747557  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform                    | arch  | lab          | compiler | defconfig  =
        | regressions
----------------------------+-------+--------------+----------+------------=
--------+------------
sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe   | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/6582399f71fc42df84e134b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-23=
8-g46bcd2aac1f1f/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orang=
epi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-23=
8-g46bcd2aac1f1f/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orang=
epi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6582399f71fc42df84e13=
4b5
        new failure (last pass: v6.7-rc6-203-g6c40edd32f70) =

 =



platform                    | arch  | lab          | compiler | defconfig  =
        | regressions
----------------------------+-------+--------------+----------+------------=
--------+------------
sun7i-a20-cubieboard2       | arm   | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65823811d41c044c45e13485

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-23=
8-g46bcd2aac1f1f/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-=
a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-23=
8-g46bcd2aac1f1f/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-=
a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65823811d41c044c45e1348e
        failing since 35 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2023-12-20T00:40:20.485248  + set +x<8>[   14.069105] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3889558_1.5.2.4.1>
    2023-12-20T00:40:20.485607  =

    2023-12-20T00:40:20.593291  / # #
    2023-12-20T00:40:20.695810  export SHELL=3D/bin/sh
    2023-12-20T00:40:20.696845  #
    2023-12-20T00:40:20.798358  / # export SHELL=3D/bin/sh. /lava-3889558/e=
nvironment
    2023-12-20T00:40:20.799298  =

    2023-12-20T00:40:20.900983  / # . /lava-3889558/environment/lava-388955=
8/bin/lava-test-runner /lava-3889558/1
    2023-12-20T00:40:20.902223  =

    2023-12-20T00:40:20.917843  / # /lava-3889558/bin/lava-test-runner /lav=
a-3889558/1 =

    ... (12 line(s) more)  =

 =



platform                    | arch  | lab          | compiler | defconfig  =
        | regressions
----------------------------+-------+--------------+----------+------------=
--------+------------
sun7i-a20-cubieboard2       | arm   | lab-clabbe   | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/658237d36a7a4ff2a3e13481

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-23=
8-g46bcd2aac1f1f/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a2=
0-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc6-23=
8-g46bcd2aac1f1f/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a2=
0-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/658237d46a7a4ff2a3e1348a
        failing since 35 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2023-12-20T00:39:29.663997  + set +x
    2023-12-20T00:39:29.665792  [   20.071282] <LAVA_SIGNAL_ENDRUN 0_dmesg =
449031_1.5.2.4.1>
    2023-12-20T00:39:29.773996  / # #
    2023-12-20T00:39:29.875587  export SHELL=3D/bin/sh
    2023-12-20T00:39:29.876110  #
    2023-12-20T00:39:29.977088  / # export SHELL=3D/bin/sh. /lava-449031/en=
vironment
    2023-12-20T00:39:29.977730  =

    2023-12-20T00:39:30.078742  / # . /lava-449031/environment/lava-449031/=
bin/lava-test-runner /lava-449031/1
    2023-12-20T00:39:30.079624  =

    2023-12-20T00:39:30.083941  / # /lava-449031/bin/lava-test-runner /lava=
-449031/1 =

    ... (12 line(s) more)  =

 =20

