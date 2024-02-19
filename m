Return-Path: <linux-next+bounces-1219-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F2985A1CD
	for <lists+linux-next@lfdr.de>; Mon, 19 Feb 2024 12:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E28DB2100B
	for <lists+linux-next@lfdr.de>; Mon, 19 Feb 2024 11:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37BB72C191;
	Mon, 19 Feb 2024 11:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="JONHTwJk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0C52577C
	for <linux-next@vger.kernel.org>; Mon, 19 Feb 2024 11:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708341641; cv=none; b=ABlAa/NHYT3CiHxtj/mM59x7UJGagyvWMChvpDqaX+GKq/iiPbNH/a+vcxK/W2g4mAwgX7M+f+wDh317s8sGSmcMVFqa37TOqc7Lv1kmlK4LIRIQl4rBeOMHAGLlU81zJlf3xgbGy16oCG8nTFl/6d6a+eS1arCuv8YfhqHI0N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708341641; c=relaxed/simple;
	bh=FsIHNXJDhQGCxlz1iehPGVD2ZEyd4vjGDl4JglbbuEg=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=N34T/3KDHQ+h6cmeLYt0uonf7DyH/9Hi3aGDZRGPeUIyJCzWwp58hz4w52QUFK5nCWC9HrEP9IRfA5jfxQaMeL/na0KT4EXNwBPzpU9Z3nBkkW9xSELVUBBaRpDI4cNMpzCRNXtR+iQaoL735nVYmBclLqbMsjZDGsMLqHsijIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=JONHTwJk; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-59fdcf8ebbcso503023eaf.3
        for <linux-next@vger.kernel.org>; Mon, 19 Feb 2024 03:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708341638; x=1708946438; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XrwmYuwl9JXhLmVUTCJUZqaLnkcbPKWDfDHAxiVU8lw=;
        b=JONHTwJkskDp4rNjtkQ+Ra4t1mTTv8Tb12rLBonXiKJWALnNeoMMguCRZxQ2iuL7lW
         NM8pWprDEINqIMQ4UQKEMBDpBJluAX1DzhElkNanb1ArZNa+d4FAoeTyYWwofukjJI4X
         9AnDJ8BF3wkinV2p7u5U6/ZOsg4WdfzntGSE1pGjwX82/HAPcBLdNwXKwixEK4vzattx
         ZedIyQVifSOYx+HjkMiSxAgFKQC1X9StiLcCpuW3DYXOIjlfqjknFM3odlOd0QcmOQvi
         ehXtec9EHGHhLgRkvqYyu5S91yzdZoYFUshdDpoZTIdq8YZDfS4O88aawc4DAOy+iAmu
         qPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708341638; x=1708946438;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XrwmYuwl9JXhLmVUTCJUZqaLnkcbPKWDfDHAxiVU8lw=;
        b=Dj/QO/3et8ADx3xtzzsk4km2H5dbv18rPSVYz64M6MtC7nevsLO9COZbOvaXU3QU6M
         mtAld4JSjpQmC3SxUOTnGBfInmn5Api82NdhXmLfWJ5+sGTAKf1u0ZmdRy9XhkEk3e22
         ABrCc/5OnnD4+tMNHMv9hcc4nTchhvryQoKlCUeDhl7TfcBkFMJvYrZS2oAk4fXoLXWt
         xUIWYZx/OqquJXarDLIUGvKysNY4BVIaCI0VumCxJKyWsoXRp9Oi7pRWaFWvMc/XMKBx
         uNaGweqxZFfnlSX+BHzclviL2h8nSL825z83fEoFiI9dWs7fASBZC7MBsMTryzHj+mcr
         WMaQ==
X-Gm-Message-State: AOJu0YwhH6Il1s87lslIzcHtBfnsWdtLQhV+VWyNYxlDsdRNiFpraxxm
	oBTktkDZ3d1JG9Fsg9x+koX32V9I5tUbXswcz8ZM2d42Td+qh7i7xt7Ky8wY4TRk0DDSTc2ONkO
	4
X-Google-Smtp-Source: AGHT+IF2T+yhlmOTha4IVGcAx1ZzWu8IVTZ750Z1mpx2FykLR+Aj6jilGDGBTT1WKsFTkHPZfcmd0w==
X-Received: by 2002:a05:6358:d04c:b0:178:7568:3b57 with SMTP id jb12-20020a056358d04c00b0017875683b57mr12790716rwb.30.1708341637637;
        Mon, 19 Feb 2024 03:20:37 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id s5-20020aa78d45000000b006e1706f8b00sm4426167pfe.78.2024.02.19.03.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 03:20:37 -0800 (PST)
Message-ID: <65d33985.a70a0220.23012.c51e@mx.google.com>
Date: Mon, 19 Feb 2024 03:20:37 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc5-176-g8afe378c646a8
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 73 runs,
 11 regressions (v6.8-rc5-176-g8afe378c646a8)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 73 runs, 11 regressions (v6.8-rc5-176-g8afe378=
c646a8)

Regressions Summary
-------------------

platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
imx6dl-riotboard       | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig | 1          =

imx6dl-udoo            | arm   | lab-broonie     | gcc-10   | multi_v7_defc=
onfig | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 5          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 2          =

rk3399-roc-pc          | arm64 | lab-broonie     | gcc-10   | defconfig    =
      | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.8-rc5-176-g8afe378c646a8/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-rc5-176-g8afe378c646a8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      8afe378c646a868b8d0f22902e74338ddfa9f716 =



Test Regressions
---------------- =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
imx6dl-riotboard       | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65d307ec8ed838d7cb63704f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-17=
6-g8afe378c646a8/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-17=
6-g8afe378c646a8/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d307ec8ed838d7cb637058
        new failure (last pass: v6.8-rc4-436-ga8f5f47b9dc3)

    2024-02-19T07:48:45.810776  + set[   15.096159] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 1025946_1.5.2.3.1>
    2024-02-19T07:48:45.810942   +x
    2024-02-19T07:48:45.916812  / # #
    2024-02-19T07:48:46.018035  export SHELL=3D/bin/sh
    2024-02-19T07:48:46.018486  #
    2024-02-19T07:48:46.119416  / # export SHELL=3D/bin/sh. /lava-1025946/e=
nvironment
    2024-02-19T07:48:46.119851  =

    2024-02-19T07:48:46.220689  / # . /lava-1025946/environment/lava-102594=
6/bin/lava-test-runner /lava-1025946/1
    2024-02-19T07:48:46.221433  =

    2024-02-19T07:48:46.224511  / # /lava-1025946/bin/lava-test-runner /lav=
a-1025946/1 =

    ... (12 line(s) more)  =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
imx6dl-udoo            | arm   | lab-broonie     | gcc-10   | multi_v7_defc=
onfig | 2          =


  Details:     https://kernelci.org/test/plan/id/65d307ff8ed838d7cb6370e5

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-17=
6-g8afe378c646a8/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-17=
6-g8afe378c646a8/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/65=
d307ff8ed838d7cb637104
        new failure (last pass: v6.8-rc4-436-ga8f5f47b9dc3)

    2024-02-19T07:48:53.648328  /lava-601892/1/../bin/lava-test-case
    2024-02-19T07:48:53.677124  <8>[   24.173974] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =


  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/65d307ff8=
ed838d7cb637109
        new failure (last pass: v6.8-rc4-436-ga8f5f47b9dc3)

    2024-02-19T07:48:54.700919  /lava-601892/1/../bin/lava-test-case
    2024-02-19T07:48:54.728671  <8>[   25.226734] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>   =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 5          =


  Details:     https://kernelci.org/test/plan/id/65d308795d9d42541a637023

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-17=
6-g8afe378c646a8/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-17=
6-g8afe378c646a8/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d308795d9d42541a63702a
        failing since 31 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-19T07:51:02.894099  / # #
    2024-02-19T07:51:02.996033  export SHELL=3D/bin/sh
    2024-02-19T07:51:02.996653  #
    2024-02-19T07:51:03.097805  / # export SHELL=3D/bin/sh. /lava-432457/en=
vironment
    2024-02-19T07:51:03.098444  =

    2024-02-19T07:51:03.199754  / # . /lava-432457/environment/lava-432457/=
bin/lava-test-runner /lava-432457/1
    2024-02-19T07:51:03.200237  =

    2024-02-19T07:51:03.208736  / # /lava-432457/bin/lava-test-runner /lava=
-432457/1
    2024-02-19T07:51:03.264927  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-19T07:51:03.265106  + <8>[   20.703510] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 432457_1.5.2.4.5> =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65d308795d9d42541a63702e
        failing since 31 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-19T07:51:04.334930  <8>[   21.789725] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-driver-present RESULT=3Dpass>
    2024-02-19T07:51:05.370222  /lava-432457/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
d308795d9d42541a637030
        failing since 31 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-19T07:51:06.429551  /lava-432457/1/../bin/lava-test-case
    2024-02-19T07:51:06.430097  <8>[   23.851311] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d308795d9d42541a637035
        failing since 31 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-19T07:51:06.488124  <8>[   23.942723] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-driver-present RESULT=3Dpass>
    2024-02-19T07:51:07.506397  /lava-432457/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65d308795d9d42541a637036
        failing since 31 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-19T07:51:07.509553  <8>[   24.964567] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-19T07:51:08.568286  /lava-432457/1/../bin/lava-test-case
    2024-02-19T07:51:08.568826  <8>[   25.985954] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-19T07:51:08.569179  /lava-432457/1/../bin/lava-test-case   =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 2          =


  Details:     https://kernelci.org/test/plan/id/65d308779e56847e29637052

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-17=
6-g8afe378c646a8/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-17=
6-g8afe378c646a8/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d308779e56847e29637059
        failing since 31 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-19T07:51:05.362539  / # #
    2024-02-19T07:51:05.464433  export SHELL=3D/bin/sh
    2024-02-19T07:51:05.465038  #
    2024-02-19T07:51:05.566291  / # export SHELL=3D/bin/sh. /lava-432454/en=
vironment
    2024-02-19T07:51:05.566983  =

    2024-02-19T07:51:05.668182  / # . /lava-432454/environment/lava-432454/=
bin/lava-test-runner /lava-432454/1
    2024-02-19T07:51:05.669331  =

    2024-02-19T07:51:05.710205  / # /lava-432454/bin/lava-test-runner /lava=
-432454/1
    2024-02-19T07:51:05.742459  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-19T07:51:05.742890  + <8>[   21.065701] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 432454_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d308779e56847e2963706c
        failing since 31 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-19T07:51:08.171430  /lava-432454/1/../bin/lava-test-case
    2024-02-19T07:51:08.171899  <8>[   23.481461] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-19T07:51:08.172253  /lava-432454/1/../bin/lava-test-case   =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
rk3399-roc-pc          | arm64 | lab-broonie     | gcc-10   | defconfig    =
      | 1          =


  Details:     https://kernelci.org/test/plan/id/65d30986f5594b5193637012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-17=
6-g8afe378c646a8/arm64/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-pc.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-17=
6-g8afe378c646a8/arm64/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-pc.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d30986f5594b5193637=
013
        failing since 19 days (last pass: v6.7-12142-g865a3df089bf, first f=
ail: v6.8-rc2-275-g21abc01c4bcb5) =

 =20

