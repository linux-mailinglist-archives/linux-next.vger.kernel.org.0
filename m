Return-Path: <linux-next+bounces-855-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F82483B984
	for <lists+linux-next@lfdr.de>; Thu, 25 Jan 2024 07:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B568B23315
	for <lists+linux-next@lfdr.de>; Thu, 25 Jan 2024 06:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6383810A10;
	Thu, 25 Jan 2024 06:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="1V3MrYyi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A08163AE
	for <linux-next@vger.kernel.org>; Thu, 25 Jan 2024 06:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706163795; cv=none; b=qhXCucfZen5HILFvoZ9QNe9oBM18996VTE4JELDPK57PqUurWHf4T+/IXJkysuDFGClufSS8DJtPkaKv4+WChg0regJq7u1I0YZJnJl7e8sXD7C56EQlma8FFGSRSEkyXFTXNmi7i9YGIDD6q6jyTaNq/arOUcuQjQhmx/JDAs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706163795; c=relaxed/simple;
	bh=99nUK1+3W7z7li6EqhVFPn0w7gaKNK4hvhnck2aDK30=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=fc51uKOI0NhpabLFqnhTMCY0MmAqfqYYL8t7hyQbW1JkuDPGv3VZxCEQE73BwaOj+m/G6ZHCcxjvlt76lUX7tSFWhKX5mZ13v/f3IemRGC9gx8SDu633Ffrv0DU9YGVGH0jpoj3mZP8E3X6xUSK8/19WkKhzlbRmDG2bg6MAKew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=1V3MrYyi; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d711d7a940so55911315ad.1
        for <linux-next@vger.kernel.org>; Wed, 24 Jan 2024 22:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1706163792; x=1706768592; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rFft6HgHeqvaWJIbIqmXPSUmd1hfspJN5UK6qlEcv8U=;
        b=1V3MrYyiIuQHikHUG/EBVn3YQuGX0VMfgLTlVdOkKB0VsaocA7H0IoJbjwZ+3abb0u
         +/HV/4iqepq/jDQHS3iQo6bQhboCMT0ajDfoWciMSa4xLMe+l1WkoPYh9Xme10mn+ExH
         OA0bEOJRSSL3YJE9vhTrfoMIzXtq0vJ/wKNB5ofLODB9uyh7XSkJelWYa8BwSdAiAYKI
         SPb3W+56Yw7plwhmae+x4G3d+ijs724Sn0GdrE4gkMeWDrFUHEe53YcdIsK9KtlRc4E5
         Z9o6V2wMCQgfYpu8s8yw6c+JBltMEc5VespLYzbJpecPWmMlKlI0lAErPtn24gt/uwIm
         EHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706163792; x=1706768592;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFft6HgHeqvaWJIbIqmXPSUmd1hfspJN5UK6qlEcv8U=;
        b=JJ7ap+kNjbRhd47NvmJVOQnih4Gyup5IqinzRz/RSkqIoClPdegTatCtBF97fwmJT9
         d1xeIFpzqmzsqB+N33vQySCaibeYlAXUQUF4Oe0Hh1B4qNX/j5pmdAwdwN3qe6ItoZlz
         y2iIjvTHIZXl/3SinuWihE7kgLLTBqr8b1Rk3Bv0MBPDvaT599SDfFnSbeTEBe9luBg9
         +g/Mn+vgRdrXEnj8H9TdGhUOwDnhIweTT4aJiaY61RAKFLtrtKv9lvdfi4tNpf39vVGR
         u0/ieZsuxQ7+wpE/564oW+hrN3KcA19zYYTcY3ny4K0PzcE+CdW9Tg205df3WnZJMXcq
         Xdpg==
X-Gm-Message-State: AOJu0YztOG3DvcKpl41pBtQPphaXqjpRQedxXEa5jRWE+Ul2Zln+/A+a
	n6SRIaOqaV3SyqcTVNt7Pl6BQYvV5vANP2/MnZha8myfcBKKBEPQrz6ihpOVoD5aAcWJz4meqzV
	nwSc=
X-Google-Smtp-Source: AGHT+IFZzpDTPh4MyNiXLuiMcnGkXfwac119zZDV4NH2eo0kKtr9nINNk6m5HaXJZjE7QaNYtv5Opw==
X-Received: by 2002:a17:902:d4ce:b0:1d5:231b:6ea3 with SMTP id o14-20020a170902d4ce00b001d5231b6ea3mr798526plg.16.1706163792079;
        Wed, 24 Jan 2024 22:23:12 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id h4-20020a170902f7c400b001d70953f166sm11005446plw.155.2024.01.24.22.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 22:23:11 -0800 (PST)
Message-ID: <65b1fe4f.170a0220.25270.67de@mx.google.com>
Date: Wed, 24 Jan 2024 22:23:11 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc1-322-ga9b7e214d92ca
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 72 runs,
 10 regressions (v6.8-rc1-322-ga9b7e214d92ca)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 72 runs, 10 regressions (v6.8-rc1-322-ga9b7e21=
4d92ca)

Regressions Summary
-------------------

platform                    | arch  | lab          | compiler | defconfig  =
        | regressions
----------------------------+-------+--------------+----------+------------=
--------+------------
kontron-kbox-a-230-ls       | arm64 | lab-kontron  | gcc-10   | defconfig  =
        | 5          =

kontron-sl28-var3-ads2      | arm64 | lab-kontron  | gcc-10   | defconfig  =
        | 2          =

sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe   | gcc-10   | defconfig  =
        | 1          =

sun7i-a20-cubieboard2       | arm   | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =

sun7i-a20-cubieboard2       | arm   | lab-clabbe   | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.8-rc1-322-ga9b7e214d92ca/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-rc1-322-ga9b7e214d92ca
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a9b7e214d92ca21f275f6f026667194193c4ba83 =



Test Regressions
---------------- =



platform                    | arch  | lab          | compiler | defconfig  =
        | regressions
----------------------------+-------+--------------+----------+------------=
--------+------------
kontron-kbox-a-230-ls       | arm64 | lab-kontron  | gcc-10   | defconfig  =
        | 5          =


  Details:     https://kernelci.org/test/plan/id/65b1cd53793db63f6152a3f4

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc1-32=
2-ga9b7e214d92ca/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc1-32=
2-ga9b7e214d92ca/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b1cd53793db63f6152a3fb
        failing since 6 days (last pass: v6.7-10708-g52db520a0959c, first f=
ail: v6.7-12142-g865a3df089bf)

    2024-01-25T02:53:50.537733  / ##
    2024-01-25T02:53:50.639903  export SHELL=3D/bin/sh
    2024-01-25T02:53:50.640607   #
    2024-01-25T02:53:50.741940  / # export SHELL=3D/bin/sh. /lava-421768/en=
vironment
    2024-01-25T02:53:50.742732  =

    2024-01-25T02:53:50.844172  / # . /lava-421768/environment/lava-421768/=
bin/lava-test-runner /lava-421768/1
    2024-01-25T02:53:50.845309  =

    2024-01-25T02:53:50.849953  / # /lava-421768/bin/lava-test-runner /lava=
-421768/1
    2024-01-25T02:53:50.914005  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-25T02:53:50.947671  + cd /lava-421768/1/tests/1_bootrr =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65b1cd53793db63f6152a3ff
        failing since 6 days (last pass: v6.7-10708-g52db520a0959c, first f=
ail: v6.7-12142-g865a3df089bf)

    2024-01-25T02:53:53.165492  /lava-421768/1/../bin/lava-test-case
    2024-01-25T02:53:53.191705  <8>[   26.182281] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
b1cd53793db63f6152a401
        failing since 6 days (last pass: v6.7-10708-g52db520a0959c, first f=
ail: v6.7-12142-g865a3df089bf)

    2024-01-25T02:53:54.252987  /lava-421768/1/../bin/lava-test-case
    2024-01-25T02:53:54.280451  <8>[   27.270114] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65b1cd53793db63f6152a406
        failing since 6 days (last pass: v6.7-10708-g52db520a0959c, first f=
ail: v6.7-12142-g865a3df089bf)

    2024-01-25T02:53:55.511306  /lava-421768/1/../bin/lava-test-case
    2024-01-25T02:53:55.539202  <8>[   28.529067] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65b1cd53793db63f6152a407
        failing since 6 days (last pass: v6.7-10708-g52db520a0959c, first f=
ail: v6.7-12142-g865a3df089bf)

    2024-01-25T02:53:56.562473  /lava-421768/1/../bin/lava-test-case
    2024-01-25T02:53:56.589097  <8>[   29.579145] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                    | arch  | lab          | compiler | defconfig  =
        | regressions
----------------------------+-------+--------------+----------+------------=
--------+------------
kontron-sl28-var3-ads2      | arm64 | lab-kontron  | gcc-10   | defconfig  =
        | 2          =


  Details:     https://kernelci.org/test/plan/id/65b1cd55553b55398752a400

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc1-32=
2-ga9b7e214d92ca/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc1-32=
2-ga9b7e214d92ca/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b1cd55553b55398752a407
        failing since 6 days (last pass: v6.7-10708-g52db520a0959c, first f=
ail: v6.7-12142-g865a3df089bf)

    2024-01-25T02:53:51.426888  / # #
    2024-01-25T02:53:51.529008  export SHELL=3D/bin/sh
    2024-01-25T02:53:51.529757  #
    2024-01-25T02:53:51.631252  / # export SHELL=3D/bin/sh. /lava-421769/en=
vironment
    2024-01-25T02:53:51.632006  =

    2024-01-25T02:53:51.733433  / # . /lava-421769/environment/lava-421769/=
bin/lava-test-runner /lava-421769/1
    2024-01-25T02:53:51.733937  =

    2024-01-25T02:53:51.774202  / # /lava-421769/bin/lava-test-runner /lava=
-421769/1
    2024-01-25T02:53:51.802128  + export 'TESTRUN_ID=3D1_bootrr'
    2024-01-25T02:53:51.842016  + cd /lava-421769/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65b1cd55553b55398752a41a
        failing since 6 days (last pass: v6.7-10708-g52db520a0959c, first f=
ail: v6.7-12142-g865a3df089bf)

    2024-01-25T02:53:54.764829  /lava-421769/1/../bin/lava-test-case
    2024-01-25T02:53:54.791845  <8>[   27.169275] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =

 =



platform                    | arch  | lab          | compiler | defconfig  =
        | regressions
----------------------------+-------+--------------+----------+------------=
--------+------------
sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe   | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/65b1ce6ee3d40e5f3752a449

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc1-32=
2-ga9b7e214d92ca/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orang=
epi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc1-32=
2-ga9b7e214d92ca/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orang=
epi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65b1ce6ee3d40e5f3752a=
44a
        new failure (last pass: v6.8-rc1-263-g8184f2e5ae071) =

 =



platform                    | arch  | lab          | compiler | defconfig  =
        | regressions
----------------------------+-------+--------------+----------+------------=
--------+------------
sun7i-a20-cubieboard2       | arm   | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65b1cbd6511d0e42ec52a401

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc1-32=
2-ga9b7e214d92ca/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-=
a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc1-32=
2-ga9b7e214d92ca/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-=
a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b1cbd6511d0e42ec52a40a
        failing since 71 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2024-01-25T02:47:30.670104  + set +x
    2024-01-25T02:47:30.672470  <8>[   14.409800] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3913917_1.5.2.4.1>
    2024-01-25T02:47:30.775326  / # #
    2024-01-25T02:47:30.876289  export SHELL=3D/bin/sh
    2024-01-25T02:47:30.876662  #
    2024-01-25T02:47:30.977371  / # export SHELL=3D/bin/sh. /lava-3913917/e=
nvironment
    2024-01-25T02:47:30.977740  =

    2024-01-25T02:47:31.078559  / # . /lava-3913917/environment/lava-391391=
7/bin/lava-test-runner /lava-3913917/1
    2024-01-25T02:47:31.080075  =

    2024-01-25T02:47:31.124705  / # /lava-3913917/bin/lava-test-runner /lav=
a-3913917/1 =

    ... (12 line(s) more)  =

 =



platform                    | arch  | lab          | compiler | defconfig  =
        | regressions
----------------------------+-------+--------------+----------+------------=
--------+------------
sun7i-a20-cubieboard2       | arm   | lab-clabbe   | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65b1cbc5511d0e42ec52a3f5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc1-32=
2-ga9b7e214d92ca/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a2=
0-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc1-32=
2-ga9b7e214d92ca/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a2=
0-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65b1cbc5511d0e42ec52a3fe
        failing since 71 days (last pass: v6.4-rc7-260-g7124fb0a8216, first=
 fail: v6.7-rc1-127-gaea4a488542f)

    2024-01-25T02:47:13.616847  + set +x
    2024-01-25T02:47:13.618743  [   19.944995] <LAVA_SIGNAL_ENDRUN 0_dmesg =
454885_1.5.2.4.1>
    2024-01-25T02:47:13.727189  / # #
    2024-01-25T02:47:13.828835  export SHELL=3D/bin/sh
    2024-01-25T02:47:13.829400  #
    2024-01-25T02:47:13.930384  / # export SHELL=3D/bin/sh. /lava-454885/en=
vironment
    2024-01-25T02:47:13.930953  =

    2024-01-25T02:47:14.031939  / # . /lava-454885/environment/lava-454885/=
bin/lava-test-runner /lava-454885/1
    2024-01-25T02:47:14.032792  =

    2024-01-25T02:47:14.035421  / # /lava-454885/bin/lava-test-runner /lava=
-454885/1 =

    ... (12 line(s) more)  =

 =20

