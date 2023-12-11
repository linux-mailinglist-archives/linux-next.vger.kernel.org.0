Return-Path: <linux-next+bounces-310-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9684780C058
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 05:19:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 255E81F20CFE
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 04:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F4281946C;
	Mon, 11 Dec 2023 04:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="s7ctsyyr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AED3DA
	for <linux-next@vger.kernel.org>; Sun, 10 Dec 2023 20:19:32 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1cfabcbda7bso37358545ad.0
        for <linux-next@vger.kernel.org>; Sun, 10 Dec 2023 20:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702268371; x=1702873171; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=swyTBvZletipMDwuyKla2R0FmYGX5+f5BClbXHqwi58=;
        b=s7ctsyyr6B/9JkUFyVTD64VOz9KOPE2nVYh100hWXutpYqibB9hsyUPzQ3LvxUsa3N
         U9KH2LrASfL3h/dFsxxaXqj78+8M3AGx+lwuFXPMICjAF3q8v9pnfQHF8vsP5H2bxfdU
         47Cxi+0VCvvlX9o4JKlJ4W18Nj25Er9wtW5/PB4pvu3JrrOJHPxd0vU+COz/v790yjht
         ozLBVt9SiQ0Llx6kaGZohqmTwugKd9o4vfe676ymychCsr+4teGmgYVKbP83f8T3o+Vd
         m2+Sufy+tOhnV0WsvgXXam3REFLD+5mZXCqU08yVDUliNMmNyUFV+9fohGVL9ANU2mXT
         m54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702268371; x=1702873171;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swyTBvZletipMDwuyKla2R0FmYGX5+f5BClbXHqwi58=;
        b=H3mxwve5DmKjyjUgD5mvWNuvALc4bLpnx2OHoqtJSzaTcINsv/U/CdXvyej2ma+VfS
         FjnEwan5oDL/nxoHW9Zl1kOssXOyDx5/QMKlag/PsbwRVtIideokPlBomp7VRg9hXuKx
         StKRaRTOmcT6XuLx15Z4lDVbKiMbarwsVCrh6k4a+BzdpM7TOxKsXStToEj3wiA2PoBE
         Y145dE1M23QvAoiIdQnXM+aTbQnayjFtx74Gi0k1hVfM5XgCQj3ZX4eTbYV7RZEPjdHb
         N3zTygwSgtC4nCcsgT6dOiXoODmr2gP1b7Dt2lUNqFkKf8JH9pe39nEXtc4dg9SIGqfC
         hbsg==
X-Gm-Message-State: AOJu0YxXjzBh0bMcfubu1l/ZbzV2/88rVCGLVuHfELnr+hEMdUX9jvOB
	+W7k+oKrtFDfeOJLrNhP0ixaBAWpnuRRw6mh+AcFmw==
X-Google-Smtp-Source: AGHT+IEXKEoYBdZr+GgIQ6tFPvJ5U9lSbaaSDhjDHNIuSyeDYaQdCMPfeGzCKsHGM7IvuaBgRf8fBg==
X-Received: by 2002:a17:902:e2d5:b0:1d0:b902:de23 with SMTP id l21-20020a170902e2d500b001d0b902de23mr4293093plc.33.1702268371032;
        Sun, 10 Dec 2023 20:19:31 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p17-20020a170903249100b001cfbe348ca5sm5498893plw.187.2023.12.10.20.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 20:19:29 -0800 (PST)
Message-ID: <65768dd1.170a0220.cb4ed.f532@mx.google.com>
Date: Sun, 10 Dec 2023 20:19:29 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc4-604-g5336570f87c90
Subject: next/pending-fixes baseline: 92 runs,
 4 regressions (v6.7-rc4-604-g5336570f87c90)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 92 runs, 4 regressions (v6.7-rc4-604-g5336570f=
87c90)

Regressions Summary
-------------------

platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
beaglebone-black      | arm  | lab-cip      | gcc-10   | multi_v7_defconfig=
 | 1          =

panda                 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =

sun7i-a20-cubieboard2 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =

sun7i-a20-cubieboard2 | arm  | lab-clabbe   | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-rc4-604-g5336570f87c90/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-rc4-604-g5336570f87c90
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5336570f87c901f966fbe40006777f1c8e94626e =



Test Regressions
---------------- =



platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
beaglebone-black      | arm  | lab-cip      | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/65766c0375305b3b16e13485

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc4-60=
4-g5336570f87c90/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc4-60=
4-g5336570f87c90/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65766c0375305b3b16e13=
486
        new failure (last pass: v6.7-rc4-412-ge142e0e4b174b) =

 =



platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
panda                 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/65765d0b6f599d5077e1348b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc4-60=
4-g5336570f87c90/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc4-60=
4-g5336570f87c90/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65765d0b6f599d5077e13490
        failing since 3 days (last pass: v6.0-12387-ge54e01f1826aa, first f=
ail: v6.7-rc4-354-g2e06d594f8593)

    2023-12-11T00:51:04.120057  <8>[   13.317657] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3874358_1.5.2.4.1>
    2023-12-11T00:51:04.226746  / # #
    2023-12-11T00:51:04.328066  export SHELL=3D/bin/sh
    2023-12-11T00:51:04.328580  #
    2023-12-11T00:51:04.429405  / # export SHELL=3D/bin/sh. /lava-3874358/e=
nvironment
    2023-12-11T00:51:04.429931  =

    2023-12-11T00:51:04.530789  / # . /lava-3874358/environment/lava-387435=
8/bin/lava-test-runner /lava-3874358/1
    2023-12-11T00:51:04.531565  =

    2023-12-11T00:51:04.536676  / # /lava-3874358/bin/lava-test-runner /lav=
a-3874358/1
    2023-12-11T00:51:04.596897  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
sun7i-a20-cubieboard2 | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/65765e466acd8f676de134d8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc4-60=
4-g5336570f87c90/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-=
a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc4-60=
4-g5336570f87c90/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-=
a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65765e466acd8f676de134dd
        failing since 26 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2023-12-11T00:56:24.726697  <8>[   14.110918] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3874354_1.5.2.4.1>
    2023-12-11T00:56:24.833402  / # #
    2023-12-11T00:56:24.935006  export SHELL=3D/bin/sh
    2023-12-11T00:56:24.936226  #
    2023-12-11T00:56:25.037918  / # export SHELL=3D/bin/sh. /lava-3874354/e=
nvironment
    2023-12-11T00:56:25.039009  =

    2023-12-11T00:56:25.140926  / # . /lava-3874354/environment/lava-387435=
4/bin/lava-test-runner /lava-3874354/1
    2023-12-11T00:56:25.142961  =

    2023-12-11T00:56:25.157979  / # /lava-3874354/bin/lava-test-runner /lav=
a-3874354/1
    2023-12-11T00:56:25.279149  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform              | arch | lab          | compiler | defconfig         =
 | regressions
----------------------+------+--------------+----------+-------------------=
-+------------
sun7i-a20-cubieboard2 | arm  | lab-clabbe   | gcc-10   | multi_v7_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/65765d8870b9ed20ebe134a6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc4-60=
4-g5336570f87c90/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a2=
0-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc4-60=
4-g5336570f87c90/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a2=
0-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65765d8870b9ed20ebe134ab
        failing since 26 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2023-12-11T00:53:10.631626  + set +x[   19.247031] <LAVA_SIGNAL_ENDRUN =
0_dmesg 447516_1.5.2.4.1>
    2023-12-11T00:53:10.631982  =

    2023-12-11T00:53:10.740106  / # #
    2023-12-11T00:53:10.841738  export SHELL=3D/bin/sh
    2023-12-11T00:53:10.842340  #
    2023-12-11T00:53:10.943484  / # export SHELL=3D/bin/sh. /lava-447516/en=
vironment
    2023-12-11T00:53:10.944050  =

    2023-12-11T00:53:11.045056  / # . /lava-447516/environment/lava-447516/=
bin/lava-test-runner /lava-447516/1
    2023-12-11T00:53:11.045934  =

    2023-12-11T00:53:11.052407  / # /lava-447516/bin/lava-test-runner /lava=
-447516/1 =

    ... (12 line(s) more)  =

 =20

