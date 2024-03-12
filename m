Return-Path: <linux-next+bounces-1596-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBB3879D0B
	for <lists+linux-next@lfdr.de>; Tue, 12 Mar 2024 21:43:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62CBB2826BB
	for <lists+linux-next@lfdr.de>; Tue, 12 Mar 2024 20:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D95382;
	Tue, 12 Mar 2024 20:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="vts07Pe5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6EB13B2BF
	for <linux-next@vger.kernel.org>; Tue, 12 Mar 2024 20:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710276200; cv=none; b=a0NpJf3ppdyL4v9jKrzgiS5QhQttlrMwUZwxT4Jks1HZPxbjgQbPyicabQ+8G2gTdKHmJupKgGkPrQwEdTb6BGFZDt5rSOiJKdE07toCMS6P+jW3bQrE5yuQL+3JmcIA4aWyNR2V/nKEyHu8yVU32WeWqJZdZsr59HA/ljCCAXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710276200; c=relaxed/simple;
	bh=MIHGejQcWtD+muyFUQTtwG9ll52liUkVo8RmuQ5LK/g=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=MJF0P4Ekz6LJtM3jGr7Sj7/9LX2piERSPPU3xRvl69Nz6ju2uY7gx4V7jK8zuuA1QVLBWJbfEl8gad1HiBKoyM+khRROkW5obcmm9uXC79OeCQWP5T566cdH2fsRuJexcj5kKOabRTyY204fcZKwhlWc1ANDoqjg1Tt5XcM2Tx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=vts07Pe5; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1dd84ecfc47so22063035ad.1
        for <linux-next@vger.kernel.org>; Tue, 12 Mar 2024 13:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1710276197; x=1710880997; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y3rsSZ2hHCxXFLdcNozTENYqFKWmBvb4sU+6BrUfaAM=;
        b=vts07Pe5IiY4idaY2LdYFB/yK0sLt0xKfW2nNjEs160mdy5cbrQPbZlZm/EV2yPL1K
         Nc9tem+GBbZwIbJ+8ji5fZSg0UvyA1nW8c58uuYsOHQ97v2lyx/p4EnmZDOa3Z9vhVuQ
         Xbb9F8GzAfwVMxnCqIQYHTQtAYlXQagdbVCONGsvgnv1IDVWIucPAkIOBdG90az3xfMV
         8ET4vgk5MkcYEhCt6w9rozOVk2t3mpC+5r0GvzSaUtZaZ/RBqWkvKRgMu2Zf1JnqP7E4
         +K4boawne/1WCZjzQ5uSVQhoBmzmsR1riMFruEStZYlIIlsFOHbZBPUrIMmi70OwLB5G
         UkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710276197; x=1710880997;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y3rsSZ2hHCxXFLdcNozTENYqFKWmBvb4sU+6BrUfaAM=;
        b=pAc1TvlVe8C0303IAWwWfsXzAfV7ICmgepS5oYc6NMudoqCV5gCgOj2ZioYLc1LoUX
         W5CBmK/B6WyH08WQWQYshrXrRHAlGdUu1Zcz7ia7JfKI+F7hx/oRfrc1yRuc204ZbN2Z
         Zy8bjrbR4KnE7cpOHxsKcW9G9zmry9Uy691v9o7XbKMhZzUy1Jrk+Uoow4TpHUDf8k9u
         8anp1g83uNvaUx2eZeapQJt3oAe3DqFzR0qzVxsBncbK51vRNpmil27MJXnfyjQz1FjW
         bn6nGQk9fXh5vBc6AvdyUcgVbzATY7vPQ44VilOIogeLpbF2ftTF3TYw2RCiwGDgMaNG
         Id/Q==
X-Gm-Message-State: AOJu0YyLt8V81F1bDRQ+pJ/agIwTUo/ZTLAu54ACsahtqOadKTFT18b/
	C46AqE6JC97uDVFCry46mGA1ZDRikif0/oL6m6UIhFQGKFUp2IRVUYvcHHwr56q5g2unbf+UEGt
	HsP4=
X-Google-Smtp-Source: AGHT+IElmYAJdSrRQ0GfLMxLsIoWh8iDTn911NFqyX0+78zX2E4B9coeezSGzgDOjvcEEbwwrW65ww==
X-Received: by 2002:a17:903:985:b0:1dc:20f2:77bb with SMTP id mb5-20020a170903098500b001dc20f277bbmr3251775plb.29.1710276197278;
        Tue, 12 Mar 2024 13:43:17 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 18-20020a170902c21200b001dd6290283fsm7131861pll.248.2024.03.12.13.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 13:43:16 -0700 (PDT)
Message-ID: <65f0be64.170a0220.74319.563b@mx.google.com>
Date: Tue, 12 Mar 2024 13:43:16 -0700 (PDT)
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
X-Kernelci-Kernel: v6.8-1078-g60fac05b309d
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 80 runs,
 7 regressions (v6.8-1078-g60fac05b309d)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 80 runs, 7 regressions (v6.8-1078-g60fac05b309=
d)

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
v6.8-1078-g60fac05b309d/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-1078-g60fac05b309d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      60fac05b309de9d90a76c1658b2aa2edba68f5d4 =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =


  Details:     https://kernelci.org/test/plan/id/65f08da20478f695684c4334

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-1078-g=
60fac05b309d/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230=
-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-1078-g=
60fac05b309d/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230=
-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f08da20478f695684c433b
        failing since 53 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-12T17:14:46.874984  / #
    2024-03-12T17:14:46.977469  # #export SHELL=3D/bin/sh
    2024-03-12T17:14:46.978257  =

    2024-03-12T17:14:47.079782  / # export SHELL=3D/bin/sh. /lava-441952/en=
vironment
    2024-03-12T17:14:47.080533  =

    2024-03-12T17:14:47.181981  / # . /lava-441952/environment/lava-441952/=
bin/lava-test-runner /lava-441952/1
    2024-03-12T17:14:47.183202  =

    2024-03-12T17:14:47.201823  / # /lava-441952/bin/lava-test-runner /lava=
-441952/1
    2024-03-12T17:14:47.245818  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-12T17:14:47.246292  + <8>[   20.445495] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 441952_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65f08da20478f695684c433f
        failing since 53 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-12T17:14:49.352438  /lava-441952/1/../bin/lava-test-case
    2024-03-12T17:14:49.352871  <8>[   22.553188] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-03-12T17:14:49.353302  /lava-441952/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
f08da20478f695684c4341
        failing since 53 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-12T17:14:50.411521  /lava-441952/1/../bin/lava-test-case
    2024-03-12T17:14:50.411972  <8>[   23.591364] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-03-12T17:14:50.412273  /lava-441952/1/../bin/lava-test-case
    2024-03-12T17:14:50.412499  <8>[   23.608517] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2024-03-12T17:14:50.412718  /lava-441952/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65f08da20478f695684c4346
        failing since 53 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-12T17:14:51.491201  /lava-441952/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65f08da20478f695684c4347
        failing since 53 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-12T17:14:51.494447  <8>[   24.708633] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-12T17:14:52.548024  /lava-441952/1/../bin/lava-test-case
    2024-03-12T17:14:52.548415  <8>[   25.730100] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-03-12T17:14:52.548659  /lava-441952/1/../bin/lava-test-case   =

 =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:     https://kernelci.org/test/plan/id/65f08df29b414e2e904c42f8

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-1078-g=
60fac05b309d/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-=
ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-1078-g=
60fac05b309d/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-=
ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f08df29b414e2e904c42ff
        failing since 53 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-12T17:16:13.482280  / # #
    2024-03-12T17:16:13.584313  export SHELL=3D/bin/sh
    2024-03-12T17:16:13.585000  #
    2024-03-12T17:16:13.686204  / # export SHELL=3D/bin/sh. /lava-441953/en=
vironment
    2024-03-12T17:16:13.686939  =

    2024-03-12T17:16:13.788232  / # . /lava-441953/environment/lava-441953/=
bin/lava-test-runner /lava-441953/1
    2024-03-12T17:16:13.789357  =

    2024-03-12T17:16:13.793240  / # /lava-441953/bin/lava-test-runner /lava=
-441953/1
    2024-03-12T17:16:13.861426  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-12T17:16:13.861897  + <8>[   20.977952] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 441953_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65f08df29b414e2e904c4312
        failing since 53 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-12T17:16:16.290222  /lava-441953/1/../bin/lava-test-case
    2024-03-12T17:16:16.290622  <8>[   23.394158] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-12T17:16:16.290869  /lava-441953/1/../bin/lava-test-case
    2024-03-12T17:16:16.291092  <8>[   23.411828] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-03-12T17:16:16.291308  /lava-441953/1/../bin/lava-test-case
    2024-03-12T17:16:16.291514  <8>[   23.431279] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-probed RESULT=3Dpass>
    2024-03-12T17:16:16.291717  /lava-441953/1/../bin/lava-test-case   =

 =20

