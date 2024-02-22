Return-Path: <linux-next+bounces-1280-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9A185F1E7
	for <lists+linux-next@lfdr.de>; Thu, 22 Feb 2024 08:29:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5F7BB246A7
	for <lists+linux-next@lfdr.de>; Thu, 22 Feb 2024 07:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D5317995;
	Thu, 22 Feb 2024 07:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="T/6idw+M"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A5A1775B
	for <linux-next@vger.kernel.org>; Thu, 22 Feb 2024 07:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708586954; cv=none; b=PMP3wdKQHahmagt4yHvixsmZ2XFB9IcFQhNXHeEXCxb4ZOUW7YWbsDdnb1IGld38vPq1xbfW1tXVAopkNM+GhPMzfV6m8jnDz9FFzAbKzbvH6yt/nXpte8WpoMwOCFW93XPsg5JJKHIs6Cqv57zO+VRbWQMCvDs5lyttCZ7qTAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708586954; c=relaxed/simple;
	bh=bJWiglZHz4lHxt9kWGYDPmhmJkzddRH7hvOyY8dfE7I=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=jkbHKPfAc6h0w+K7glrbxTyU1b6vwVFhey7WINc3ipO3TwVgvPQtMmulaatVu4DLmq054bLhFkfPwNZ2vZ1q9Rb9w8fllEC7XavS1k5Ew6vty3BRsNi4XCLRBoLeh7MeMRRtpyZUqIRFnsqW1umoRz4PDuhXlO9xLa828cMZAfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=T/6idw+M; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d95d67ff45so12880945ad.2
        for <linux-next@vger.kernel.org>; Wed, 21 Feb 2024 23:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708586951; x=1709191751; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ir7ktUa0o6tV3cAkWzvb0+Z/bDPGWVghiIdoV4y9dFE=;
        b=T/6idw+MgzNJWrCudS7kz3C0p9W7+v4CXKGt2VajUw0+TcZaGHZon9hUcsNy872n+j
         5W/AvhGSkT2CUuNl/yvZC0g/sGkgmb6N3jatySNhfxgr3aK158uDbpn/y40qaWnToE0c
         jzfDNSl2/uNWcNk0fZAT1PQqsWvzRxPR9JYGgQK5WNxmxp0Lx0wtJWclCa9nTBcZWcAc
         GbT2aGLfgoZJtK1w3H5DW3uecypAyC0XRmA0utA9YLHLOrGgCJ9U1WmCxt6+g7pRtNes
         DyqQtz+Hicrt1hcMBDP6mgfc+Olh767N+V2nOuNy7wXCon7r5C/JYm55j4rYjd8Im3Il
         tDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708586951; x=1709191751;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ir7ktUa0o6tV3cAkWzvb0+Z/bDPGWVghiIdoV4y9dFE=;
        b=d8I3/R1035kwLvXqF5V6RuZyRN43tbtgtrlG69lnMPU15FRFlbKdLEPNLuu/MeLRYL
         xf864ZyhXv7aNmoHluXyPo5ZmxSs1jb1ute3vhRncuxQ87xmtX7ASzfMz8fsig8yAx7l
         Vab9LhQm8y7081wvg08E0SR23//fFj3GzvMULG482lO28MAsYJAb0iGPVulJYl5FMM+X
         iJCui7umxIxdIsmKqPKv6Bv1ZjNlEPnl/0DmHwhNT63U8amh1Rd/5gklMi3j87mGPKzx
         42Aiqb3A/dx5WSwgG391YMG5weg1vaaGsmzCWw8zXNnIHZsyKAtyRD1SpDtRGfpucKtN
         FG1A==
X-Gm-Message-State: AOJu0YxBiqJKweWsTxCxhaJkqJzctuBGLsvofu6TlHIPRrsFPdR2ktjk
	e56HHxXWQwhuDtFF/CwFdoDdCHhhegtQeZxrAdUSssHBoyMDMyyhhzd+NIclUSScyDaXMYvnp3D
	yHUk=
X-Google-Smtp-Source: AGHT+IFhx8jpGqd9Iq30pNKvrFqwXRCjzVLRWZgiqtg1P5NmXLZ3ZVU/lXCxS55bgH/bmN18tU5xkQ==
X-Received: by 2002:a17:903:230e:b0:1dc:248:28e6 with SMTP id d14-20020a170903230e00b001dc024828e6mr13642756plh.67.1708586951508;
        Wed, 21 Feb 2024 23:29:11 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id jc4-20020a17090325c400b001db3361bc1dsm9311551plb.102.2024.02.21.23.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 23:29:10 -0800 (PST)
Message-ID: <65d6f7c6.170a0220.2b559.e64d@mx.google.com>
Date: Wed, 21 Feb 2024 23:29:10 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc5-302-g6847b0e2fcc7
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 41 runs,
 8 regressions (v6.8-rc5-302-g6847b0e2fcc7)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 41 runs, 8 regressions (v6.8-rc5-302-g6847b0e2=
fcc7)

Regressions Summary
-------------------

platform               | arch  | lab           | compiler | defconfig | reg=
ressions
-----------------------+-------+---------------+----------+-----------+----=
--------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig | 5  =
        =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig | 2  =
        =

sun50i-h6-pine-h64     | arm64 | lab-collabora | gcc-10   | defconfig | 1  =
        =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.8-rc5-302-g6847b0e2fcc7/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-rc5-302-g6847b0e2fcc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6847b0e2fcc72aa373d52b2d9f42c35b071dee2f =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig | reg=
ressions
-----------------------+-------+---------------+----------+-----------+----=
--------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig | 5  =
        =


  Details:     https://kernelci.org/test/plan/id/65d6c3d445821d8c62637015

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-30=
2-g6847b0e2fcc7/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-30=
2-g6847b0e2fcc7/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d6c3d445821d8c6263701c
        failing since 34 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-22T03:47:08.980210  / # #
    2024-02-22T03:47:09.082389  export SHELL=3D/bin/sh
    2024-02-22T03:47:09.083193  #
    2024-02-22T03:47:09.184679  / # export SHELL=3D/bin/sh. /lava-433606/en=
vironment
    2024-02-22T03:47:09.185408  =

    2024-02-22T03:47:09.286657  / # . /lava-433606/environment/lava-433606/=
bin/lava-test-runner /lava-433606/1
    2024-02-22T03:47:09.288026  =

    2024-02-22T03:47:09.307140  / # /lava-433606/bin/lava-test-runner /lava=
-433606/1
    2024-02-22T03:47:09.350260  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-22T03:47:09.350684  + <8>[   20.532087] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 433606_1.5.2.4.5> =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65d6c3d445821d8c62637020
        failing since 34 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-22T03:47:11.460870  /lava-433606/1/../bin/lava-test-case
    2024-02-22T03:47:11.461293  <8>[   22.643875] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-22T03:47:11.461601  /lava-433606/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
d6c3d445821d8c62637022
        failing since 34 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-22T03:47:12.521423  /lava-433606/1/../bin/lava-test-case
    2024-02-22T03:47:12.521904  <8>[   23.682802] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-22T03:47:12.522244  /lava-433606/1/../bin/lava-test-case
    2024-02-22T03:47:12.522468  <8>[   23.700084] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d6c3d445821d8c62637027
        failing since 34 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-22T03:47:13.596580  /lava-433606/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65d6c3d445821d8c62637028
        failing since 34 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-22T03:47:13.599874  <8>[   24.796706] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-22T03:47:14.657556  /lava-433606/1/../bin/lava-test-case
    2024-02-22T03:47:14.658040  <8>[   25.817396] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-22T03:47:14.658344  /lava-433606/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig | reg=
ressions
-----------------------+-------+---------------+----------+-----------+----=
--------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig | 2  =
        =


  Details:     https://kernelci.org/test/plan/id/65d6c3d2560b796180637012

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-30=
2-g6847b0e2fcc7/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-30=
2-g6847b0e2fcc7/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d6c3d2560b796180637019
        failing since 34 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-22T03:47:10.019213  / # #
    2024-02-22T03:47:10.121466  export SHELL=3D/bin/sh
    2024-02-22T03:47:10.122303  #
    2024-02-22T03:47:10.223721  / # export SHELL=3D/bin/sh. /lava-433602/en=
vironment
    2024-02-22T03:47:10.224484  =

    2024-02-22T03:47:10.326003  / # . /lava-433602/environment/lava-433602/=
bin/lava-test-runner /lava-433602/1
    2024-02-22T03:47:10.327304  =

    2024-02-22T03:47:10.347070  / # /lava-433602/bin/lava-test-runner /lava=
-433602/1
    2024-02-22T03:47:10.399730  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-22T03:47:10.400092  + <8>[   20.938587] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 433602_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d6c3d2560b79618063702c
        failing since 34 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-22T03:47:12.828048  /lava-433602/1/../bin/lava-test-case
    2024-02-22T03:47:12.828506  <8>[   23.354162] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-22T03:47:12.828866  /lava-433602/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig | reg=
ressions
-----------------------+-------+---------------+----------+-----------+----=
--------
sun50i-h6-pine-h64     | arm64 | lab-collabora | gcc-10   | defconfig | 1  =
        =


  Details:     https://kernelci.org/test/plan/id/65d6c4d120e2f6616a6370b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-30=
2-g6847b0e2fcc7/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pin=
e-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-30=
2-g6847b0e2fcc7/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pin=
e-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d6c4d120e2f6616a637=
0b2
        new failure (last pass: v6.8-rc5-274-g5b87d67627563) =

 =20

