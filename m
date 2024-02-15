Return-Path: <linux-next+bounces-1181-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDB7855A13
	for <lists+linux-next@lfdr.de>; Thu, 15 Feb 2024 06:21:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 143761F29A30
	for <lists+linux-next@lfdr.de>; Thu, 15 Feb 2024 05:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C575B79DD;
	Thu, 15 Feb 2024 05:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="FcgZsvTC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB728F4E
	for <linux-next@vger.kernel.org>; Thu, 15 Feb 2024 05:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707974505; cv=none; b=JJKpMeMTOyYWiJZC4/Pbv7HrN7abMp9Ym4sCSwjyDy5chla9GoBFECyLRzE7aFFiKlPX5gH8xb/GNy1s2CAix9eSd6hUCrpU0H33chq5vgSP0oboS/Ml+9ysYJO8q7IUNGXLMLWa5/S5H6rqg8RjvdIUDnortYcxbvH4ucIQNDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707974505; c=relaxed/simple;
	bh=sUvbODmzWucvepJz8yw5/uE4A0fKdUtwTDL0HMuAPW8=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=jV8jiBGoOFipGa4y0xPwj+k2hmuJeSECIcqia3G7m4p0XcDdlMc0xe0mYNii2LpEGXeqDN4ySd7t0N/TzdSJN1/xuL5mc+oXsHD7M32NazA837sQjcGGKkC+D1zAELaCCqcuTKy4/MaK0tJboZmAE24Irxk9w7/5vc94uxihpxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=FcgZsvTC; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3c0490445eeso461399b6e.2
        for <linux-next@vger.kernel.org>; Wed, 14 Feb 2024 21:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707974502; x=1708579302; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4v8ap9MzIY5SglzjsEyimJnRotncyz+uqE+VuJILuBo=;
        b=FcgZsvTC3gh61JGg5gJ1Z7all0SZE5wwIw3l0EcFf+gLTC1sFdJc8uAo3h+Xm/OTdX
         RCjTHBx5RchNDg4YsN3Vi7KMn2CHEYkqfho4200iNjb7qaEFXO4cDCvvpv0hSt15S8r4
         TjlglxefscOF3A4gn4Si5HIv9feLRHkX2s0qS1QvRbMSUyl4oIN4w6qbwlJ2yk7HR8Rq
         iOt/J94olhk0BESm8C7UPnu9NS7gy5yZHZ3SmDdqb6IFC4zjzh+RsQOWKeDP+TZH7uoe
         koACshDZKDODT5n93SIPiDJ0k4b2AE/ucfG+fv0fW98VIVkC2sokEjFaDfCsdDnzYBE4
         XLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707974502; x=1708579302;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4v8ap9MzIY5SglzjsEyimJnRotncyz+uqE+VuJILuBo=;
        b=Mr8qOPSZfLiyU83bhhiWFFHeUaQyVvydjJTUXSW0fq6Xv5mp2yhJxRcOyTbzP1EeUg
         1WqVfZo11rqb2VN7gn8/qH+smdAzm/WipHyFhKQXgK5e5iAoNzIv75/uN58td6zgaPqW
         KA05+gq6qo7UDTbj0cwLAT6RQ6W7PRm7nm6AyDrE+O991qELVx6FBlKxJU5HV1B1DKSI
         494KdQF274ibWj3moXjr3nvIOdB5KU579yp4UPO0JE8Dpq2Fo3FAv96DsyuAhxMIit9B
         ntDjZi3PfrGZ7+/DUepHHU273emIbH7poySUjL2oLbMc5j9WNQGS4QahTx93S2MrKZmY
         qDcw==
X-Gm-Message-State: AOJu0YxG6C0sOeic1QfM3aPyqOcg4rxkkZA6hqRJPYj5KKaWI+SQfVOv
	ImOVAsZPgAa/amkZAI1OqTY9iXf/ZNuGOahFoDZn3nDIbuR89hrhVgu1mjRebR49FCYyLmU8+mO
	v/oE=
X-Google-Smtp-Source: AGHT+IF6Wqd2iNctcCDSv9oPwBFvozJvNXiIGJ3FPo0dm//A6RWY02wpegUDw66UoGlYVqeEWXR9Gg==
X-Received: by 2002:a05:6808:1b0e:b0:3bf:ed3e:da64 with SMTP id bx14-20020a0568081b0e00b003bfed3eda64mr928837oib.31.1707974502487;
        Wed, 14 Feb 2024 21:21:42 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p37-20020a056a0026e500b006db9604bf8csm366570pfw.131.2024.02.14.21.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 21:21:41 -0800 (PST)
Message-ID: <65cd9f65.050a0220.92009.1053@mx.google.com>
Date: Wed, 14 Feb 2024 21:21:41 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc4-371-g9d5dae6199a2
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 87 runs,
 8 regressions (v6.8-rc4-371-g9d5dae6199a2)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 87 runs, 8 regressions (v6.8-rc4-371-g9d5dae61=
99a2)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig |=
 1          =

kontron-kbox-a-230-ls    | arm64 | lab-kontron     | gcc-10   | defconfig |=
 5          =

kontron-sl28-var3-ads2   | arm64 | lab-kontron     | gcc-10   | defconfig |=
 2          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.8-rc4-371-g9d5dae6199a2/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-rc4-371-g9d5dae6199a2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9d5dae6199a2bcac7564a1c42fa3fe78c0c77c01 =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/65cd6e8a4416ba32f263702f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-37=
1-g9d5dae6199a2/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inno=
comm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-37=
1-g9d5dae6199a2/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inno=
comm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cd6e8a4416ba32f2637=
030
        new failure (last pass: v6.8-rc4-334-g904accd85136) =

 =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
kontron-kbox-a-230-ls    | arm64 | lab-kontron     | gcc-10   | defconfig |=
 5          =


  Details:     https://kernelci.org/test/plan/id/65cd6e68ce848899306370ad

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-37=
1-g9d5dae6199a2/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-37=
1-g9d5dae6199a2/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cd6e68ce848899306370b4
        failing since 27 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-15T01:52:21.709663  / # #
    2024-02-15T01:52:21.811761  export SHELL=3D/bin/sh
    2024-02-15T01:52:21.812464  #
    2024-02-15T01:52:21.913759  / # export SHELL=3D/bin/sh. /lava-430004/en=
vironment
    2024-02-15T01:52:21.914615  =

    2024-02-15T01:52:22.015809  / # . /lava-430004/environment/lava-430004/=
bin/lava-test-runner /lava-430004/1
    2024-02-15T01:52:22.016745  =

    2024-02-15T01:52:22.024089  / # /lava-430004/bin/lava-test-runner /lava=
-430004/1
    2024-02-15T01:52:22.080221  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-15T01:52:22.080440  + <8>[   20.686734] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 430004_1.5.2.4.5> =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65cd6e68ce848899306370b8
        failing since 27 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-15T01:52:24.188266  /lava-430004/1/../bin/lava-test-case
    2024-02-15T01:52:24.188712  <8>[   22.796189] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-15T01:52:24.189155  /lava-430004/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
cd6e68ce848899306370ba
        failing since 27 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-15T01:52:25.247079  /lava-430004/1/../bin/lava-test-case
    2024-02-15T01:52:25.247567  <8>[   23.836254] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65cd6e68ce848899306370bf
        failing since 27 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-15T01:52:26.322903  /lava-430004/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65cd6e68ce848899306370c0
        failing since 27 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-15T01:52:26.326012  <8>[   24.948796] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-15T01:52:27.384702  /lava-430004/1/../bin/lava-test-case
    2024-02-15T01:52:27.385178  <8>[   25.969300] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-15T01:52:27.385559  /lava-430004/1/../bin/lava-test-case   =

 =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
kontron-sl28-var3-ads2   | arm64 | lab-kontron     | gcc-10   | defconfig |=
 2          =


  Details:     https://kernelci.org/test/plan/id/65cd6e655a57a4e6bb637028

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-37=
1-g9d5dae6199a2/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-37=
1-g9d5dae6199a2/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cd6e665a57a4e6bb63702f
        failing since 27 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-15T01:52:17.831091  / # #
    2024-02-15T01:52:17.933279  export SHELL=3D/bin/sh
    2024-02-15T01:52:17.933719  #
    2024-02-15T01:52:18.034845  / # export SHELL=3D/bin/sh. /lava-430001/en=
vironment
    2024-02-15T01:52:18.035614  =

    2024-02-15T01:52:18.136922  / # . /lava-430001/environment/lava-430001/=
bin/lava-test-runner /lava-430001/1
    2024-02-15T01:52:18.138254  =

    2024-02-15T01:52:18.145555  / # /lava-430001/bin/lava-test-runner /lava=
-430001/1
    2024-02-15T01:52:18.206303  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-15T01:52:18.206527  + <8>[   20.851448] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 430001_1.5.2.4.5> =

    ... (12 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65cd6e665a57a4e6bb637042
        failing since 27 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-15T01:52:20.647563  /lava-430001/1/../bin/lava-test-case   =

 =20

