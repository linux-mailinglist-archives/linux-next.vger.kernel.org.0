Return-Path: <linux-next+bounces-1477-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D12B0871966
	for <lists+linux-next@lfdr.de>; Tue,  5 Mar 2024 10:18:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87A11281C8B
	for <lists+linux-next@lfdr.de>; Tue,  5 Mar 2024 09:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0A150A69;
	Tue,  5 Mar 2024 09:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="VjS06Iuz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44584F88C
	for <linux-next@vger.kernel.org>; Tue,  5 Mar 2024 09:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709630296; cv=none; b=ZvqAm2+J6ANx2AuW+e3f2j5zrQAHv3OcDZE8Z6dDOgT55KD/Vmit8S4iKKuSNo6BMviQInb3Yzx7uB8kvys70XH7B2dhpWP0x7mniQcKfToYR5eQUl3Sioq7uWgLW9J7HjvdGGc4Fygso+/0/0YLW9JR4UCF7tI44CG/GNKFivU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709630296; c=relaxed/simple;
	bh=Lr3kVa4QoMwi5eV1X9H9VOq+MVb2GWXRY7ec3oCJ2II=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=ggbWet0PBADdTnan8cRcbnFlY6A8uVD35d2fo12GCVgyqwsRfmgaPBytdJEbiLjCR4ExMEUTQjP1Np506RDLlHJyaLWle8V6BPYhsIp8guq7cQO8SZXqwsIYC36pEM9C9606XpEUByu6d2Su4v9/2kVNYsY5qY6eoUFyFnPXs6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=VjS06Iuz; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e5c0be115aso2507755b3a.3
        for <linux-next@vger.kernel.org>; Tue, 05 Mar 2024 01:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1709630293; x=1710235093; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4N3q3KO2L7cWBZX68ewN2z35Dp+h+e8DS24d7QthC8s=;
        b=VjS06Iuz0PGF3myoxhdjbcRV9ehiEQTlW9PUy5MUr3NrTKEc/5oJX8HdvR+dsLqQnO
         Y9q6z7pHsKJhqjb9VbFkThiSY28QoJVf7nEdK8i3BdOCMu6UqtVavC3YcVF77/JIQf5X
         lFkFa1mCGa683dnYK14M5KT/eoRBwGvbvtU/wUCWQypRrDu8yHtYBfz7TA7+PsECTRZJ
         0aApa9bIELdXkxGN/rLXwCb9xzyark5pluJYm63kBEepdGBVnidngYLZx8mpLID/N+kU
         7IzG8E5QhWP2tQdhMfAbeZr3F/jmaBdbtfed0hJPn9/3v/7u6d2rUX2Fv2V3aF5SQZRR
         543A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709630293; x=1710235093;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4N3q3KO2L7cWBZX68ewN2z35Dp+h+e8DS24d7QthC8s=;
        b=urX/8CPVMMi7dTG0ekt83SnUn10FKsGO3e/K1l0Oj/NzPt/92kZEScznJ/Uc2OGpTv
         wsLVEpefNYk2P98iNc9rGTLzQczO9zl/ybUpXJ7VSx3nb7ufwAdm2t//cAla8D2oDje3
         TatoCZubbUv+gM0gLXVdTTpNkr/P479HX2Hs31xy9j4VR6hjTkls6H7h40Msv0MF0Yfe
         bqEMPvB3BIEzrrpv8Y9LC8ZD4W++IZLqH5G1f2zslg9z8j2ln1i3zAN3crRJNef30j4u
         ryCuX5MhfKgRqc45njtp9a0LtkiizS9KoTt6agrjznZhUwQ7riG8lX8NJcft1EC23x8r
         LhwQ==
X-Gm-Message-State: AOJu0YyPrQOGmJ+GzfSskSCmCryfzo1KDDdf9oQc/dc6/JjUFi6imzRO
	/mzwiamXh+0/e7hJJfGa9QzC/vzYzS6YdV1B7Y6HyVW83t0444NF1CtZ9UsoZM8xfPf5i+8xuuf
	4vA8=
X-Google-Smtp-Source: AGHT+IGyGydekDxxlAegsKL8zHQHLIWTeUnN1TT7zFoOHoyfXBRYixkwv4+pcLndTwbSEd6DpcP4LA==
X-Received: by 2002:a05:6a00:194d:b0:6e5:d2e4:bc6f with SMTP id s13-20020a056a00194d00b006e5d2e4bc6fmr11059052pfk.5.1709630293422;
        Tue, 05 Mar 2024 01:18:13 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id u23-20020aa78497000000b006e5092fb3efsm8533320pfn.159.2024.03.05.01.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 01:18:12 -0800 (PST)
Message-ID: <65e6e354.a70a0220.d7265.1c3c@mx.google.com>
Date: Tue, 05 Mar 2024 01:18:12 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc7-125-g2d356cb93900
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 83 runs,
 7 regressions (v6.8-rc7-125-g2d356cb93900)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 83 runs, 7 regressions (v6.8-rc7-125-g2d356cb9=
3900)

Regressions Summary
-------------------

platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =

kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.8-rc7-125-g2d356cb93900/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-rc7-125-g2d356cb93900
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2d356cb93900de489becafa98984038d971de93b =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =


  Details:     https://kernelci.org/test/plan/id/65e6b28bcb06206f444c436f

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc7-12=
5-g2d356cb93900/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc7-12=
5-g2d356cb93900/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e6b28bcb06206f444c4376
        failing since 46 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-05T05:49:46.576872  <8>[   20.097176] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 438746_1.5.2.4.1>
    2024-03-05T05:49:46.682050  / # #
    2024-03-05T05:49:46.784075  export SHELL=3D/bin/sh
    2024-03-05T05:49:46.784789  #
    2024-03-05T05:49:46.886219  / # export SHELL=3D/bin/sh. /lava-438746/en=
vironment
    2024-03-05T05:49:46.886934  =

    2024-03-05T05:49:46.988361  / # . /lava-438746/environment/lava-438746/=
bin/lava-test-runner /lava-438746/1
    2024-03-05T05:49:46.989643  =

    2024-03-05T05:49:47.009113  / # /lava-438746/bin/lava-test-runner /lava=
-438746/1
    2024-03-05T05:49:47.052329  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65e6b28bcb06206f444c437a
        failing since 46 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-05T05:49:49.158867  /lava-438746/1/../bin/lava-test-case
    2024-03-05T05:49:49.159299  <8>[   22.661140] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-03-05T05:49:49.159605  /lava-438746/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
e6b28bcb06206f444c437c
        failing since 46 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-05T05:49:50.216914  /lava-438746/1/../bin/lava-test-case
    2024-03-05T05:49:50.217428  <8>[   23.699892] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-03-05T05:49:50.217723  /lava-438746/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65e6b28bcb06206f444c4381
        failing since 46 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-05T05:49:51.292413  /lava-438746/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65e6b28bcb06206f444c4382
        failing since 46 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-05T05:49:51.295739  <8>[   24.812106] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-05T05:49:52.354297  /lava-438746/1/../bin/lava-test-case
    2024-03-05T05:49:52.354789  <8>[   25.833658] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-03-05T05:49:52.355107  /lava-438746/1/../bin/lava-test-case   =

 =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:     https://kernelci.org/test/plan/id/65e6b29f75fb81ed044c431f

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc7-12=
5-g2d356cb93900/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc7-12=
5-g2d356cb93900/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e6b29f75fb81ed044c4326
        failing since 46 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-05T05:50:03.127579  / # #
    2024-03-05T05:50:03.229346  export SHELL=3D/bin/sh
    2024-03-05T05:50:03.230047  #
    2024-03-05T05:50:03.331102  / # export SHELL=3D/bin/sh. /lava-438749/en=
vironment
    2024-03-05T05:50:03.331750  =

    2024-03-05T05:50:03.432942  / # . /lava-438749/environment/lava-438749/=
bin/lava-test-runner /lava-438749/1
    2024-03-05T05:50:03.434047  =

    2024-03-05T05:50:03.474123  / # /lava-438749/bin/lava-test-runner /lava=
-438749/1
    2024-03-05T05:50:03.506136  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-05T05:50:03.506534  + <8>[   20.924891] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 438749_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65e6b29f75fb81ed044c4339
        failing since 46 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-05T05:50:05.931234  /lava-438749/1/../bin/lava-test-case
    2024-03-05T05:50:05.931664  <8>[   23.341944] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-05T05:50:05.932031  /lava-438749/1/../bin/lava-test-case
    2024-03-05T05:50:05.932318  <8>[   23.359717] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-03-05T05:50:05.932664  /lava-438749/1/../bin/lava-test-case   =

 =20

