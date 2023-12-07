Return-Path: <linux-next+bounces-264-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BE9807F90
	for <lists+linux-next@lfdr.de>; Thu,  7 Dec 2023 05:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5388BB20C66
	for <lists+linux-next@lfdr.de>; Thu,  7 Dec 2023 04:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B4263CD;
	Thu,  7 Dec 2023 04:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="FRR+T1IJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D198A9
	for <linux-next@vger.kernel.org>; Wed,  6 Dec 2023 20:25:32 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6ce6b62746dso187347b3a.2
        for <linux-next@vger.kernel.org>; Wed, 06 Dec 2023 20:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701923131; x=1702527931; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3Vfu+47m11LNSrdC0S2/6xYsOvKFJst4UP6YElWnqgw=;
        b=FRR+T1IJaxkgJV4uXdzMVqb99IOxpiG7+Ak5udxlLZhUugYiWbsMQjTsjp4O6eodof
         tOzeVCnJAhtfRz/gLUQ6/W3UUMCdxWe6eF2U6aY1WdP2FZZfWtUmIpwGcs7leMqHVz+1
         mkpSnodzDF7RuMn59CEpSbW7XeebAwo7ccZbTypt8Ifr6M+dp0fGwNNRFQXZUO7dzc9l
         F3z9gEDzdlziZYChOeKukywArd+th8vkh5z9TBSVxp7dvOSDIfEc1TURZnWewI9rOL1K
         5Gxz6wUIl08lMatfuZWcbV7yNJid4LUqREG0onN4Tb/o/AgHsUNFRZrK/qbNmgvjWLnd
         3AbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701923131; x=1702527931;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Vfu+47m11LNSrdC0S2/6xYsOvKFJst4UP6YElWnqgw=;
        b=NBTBeOEOSAaUI5rpJj5bF7C0Cl/QoFNPGbJb28NKheequWZeMuLa3w3rpPMw2MYg2N
         KfQ03BYY5fxAGSpx7yTE0yZqMrSgD6OntnxUlSoiNv8dz74kf8jGntqxkzfMvbNSrGGz
         fjxDsWrObwTDfspSc0IF/pgOKVIlzJL4OfPlUoFBUUDScdepFseUNex88BmNxjvcs69c
         VI087z0+0n+Y8gjzxMmNeIRYLsMDpSq4dgFB25OsGJWT+RaU8u41jVyMVYJw0dh8lkMC
         vsvTGqPJIUZkh1I1DkUcgNXklJO6EQClLJB4zgeJpVwta7YUUUJKkJFO9H1Vif2COBvD
         FBdw==
X-Gm-Message-State: AOJu0Yw7BvJEa6MmJKJ+XSKT6YpT0Nh0XC8zx42BaTzJVp8JH9CcdF/+
	3ixt06QzV15nEk6u8eFQxkqmq0StvRyjxlXzhW1+NA==
X-Google-Smtp-Source: AGHT+IFaazaaP95AIWAeANK81PiOJ6EaI7kecARehOZ6HgTuNvyoP5OEAiAod8C1vBg0GnDPFEbEKA==
X-Received: by 2002:a05:6a00:1d8b:b0:6ce:2731:d5cb with SMTP id z11-20020a056a001d8b00b006ce2731d5cbmr1783322pfw.60.1701923131091;
        Wed, 06 Dec 2023 20:25:31 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id b27-20020a63715b000000b005c66b54476bsm259319pgn.63.2023.12.06.20.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 20:25:30 -0800 (PST)
Message-ID: <6571493a.630a0220.70fae.0d34@mx.google.com>
Date: Wed, 06 Dec 2023 20:25:30 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc4-354-g2e06d594f8593
Subject: next/pending-fixes baseline: 108 runs,
 3 regressions (v6.7-rc4-354-g2e06d594f8593)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 108 runs, 3 regressions (v6.7-rc4-354-g2e06d59=
4f8593)

Regressions Summary
-------------------

platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
panda                 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =

sun7i-a20-cubieboard2 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =

sun7i-a20-cubieboard2 | arm  | lab-clabbe   | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-rc4-354-g2e06d594f8593/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-rc4-354-g2e06d594f8593
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2e06d594f8593e3baa6f3d7619bf4dcb6404a6f8 =



Test Regressions
---------------- =



platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
panda                 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/6571182b67c1ec5589e1350c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc4-35=
4-g2e06d594f8593/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc4-35=
4-g2e06d594f8593/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6571182b67c1ec5589e13511
        new failure (last pass: v6.0-12387-ge54e01f1826aa)

    2023-12-07T00:55:54.911109  <8>[   14.146087] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3864034_1.5.2.4.1>
    2023-12-07T00:55:55.017825  / # #
    2023-12-07T00:55:55.119008  export SHELL=3D/bin/sh
    2023-12-07T00:55:55.119422  #
    2023-12-07T00:55:55.220191  / # export SHELL=3D/bin/sh. /lava-3864034/e=
nvironment
    2023-12-07T00:55:55.220608  =

    2023-12-07T00:55:55.321416  / # . /lava-3864034/environment/lava-386403=
4/bin/lava-test-runner /lava-3864034/1
    2023-12-07T00:55:55.322087  =

    2023-12-07T00:55:55.327383  / # /lava-3864034/bin/lava-test-runner /lav=
a-3864034/1
    2023-12-07T00:55:55.386643  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
sun7i-a20-cubieboard2 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/6571184f259e4ef271e13502

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc4-35=
4-g2e06d594f8593/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-=
a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc4-35=
4-g2e06d594f8593/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-=
a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6571184f259e4ef271e13507
        failing since 22 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2023-12-07T00:56:24.942158  <8>[   14.219827] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3864046_1.5.2.4.1>
    2023-12-07T00:56:25.050253  / # #
    2023-12-07T00:56:25.151551  export SHELL=3D/bin/sh
    2023-12-07T00:56:25.152099  #
    2023-12-07T00:56:25.252923  / # export SHELL=3D/bin/sh. /lava-3864046/e=
nvironment
    2023-12-07T00:56:25.253404  =

    2023-12-07T00:56:25.354171  / # . /lava-3864046/environme/lava-3864046/=
bin/lava-test-runner /lava-3864046/1
    2023-12-07T00:56:25.354761  nt
    2023-12-07T00:56:25.373845  / # /lava-3864046/bin/lava-test-runner /lav=
a-3864046/1
    2023-12-07T00:56:25.495400  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
sun7i-a20-cubieboard2 | arm  | lab-clabbe   | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/65711826761035984ce134a6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc4-35=
4-g2e06d594f8593/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a2=
0-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc4-35=
4-g2e06d594f8593/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a2=
0-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65711826761035984ce134ab
        failing since 22 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2023-12-07T00:55:39.594106  + set +x
    2023-12-07T00:55:39.595936  [   21.028531] <LAVA_SIGNAL_ENDRUN 0_dmesg =
446839_1.5.2.4.1>
    2023-12-07T00:55:39.704640  / # #
    2023-12-07T00:55:39.806285  export SHELL=3D/bin/sh
    2023-12-07T00:55:39.806891  #
    2023-12-07T00:55:39.907878  / # export SHELL=3D/bin/sh. /lava-446839/en=
vironment
    2023-12-07T00:55:39.908421  =

    2023-12-07T00:55:40.009423  / # . /lava-446839/environment/lava-446839/=
bin/lava-test-runner /lava-446839/1
    2023-12-07T00:55:40.010268  =

    2023-12-07T00:55:40.013127  / # /lava-446839/bin/lava-test-runner /lava=
-446839/1 =

    ... (12 line(s) more)  =

 =20

