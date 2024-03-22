Return-Path: <linux-next+bounces-1695-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B038866B7
	for <lists+linux-next@lfdr.de>; Fri, 22 Mar 2024 07:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20DF11C22B92
	for <lists+linux-next@lfdr.de>; Fri, 22 Mar 2024 06:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853CBDDB6;
	Fri, 22 Mar 2024 06:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="R542t6qx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956BFD30B
	for <linux-next@vger.kernel.org>; Fri, 22 Mar 2024 06:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711088788; cv=none; b=GPEnVNmjczbuVSi4sGUFPZG0NkMNuTo8ieScB/CVBM3RN9uw97zAcbYjHreVe832Qp+ER2F/0buoRTmhcx3AdF/Rih5cVOba7qr7qXMT9EgMQR4eXvM0jpmYT9dBTPCrPrUB0BcPYg+HlTr6XvJsiEY45OQazBhZNQ/49oLXt98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711088788; c=relaxed/simple;
	bh=MXIDuzlE7hATpcUJg48YYRX1SfqCm5g/kacMSmk3Fos=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=KUt+SXeVPjPB4A/hYrbFFqFQr97mfu+hOAgNwWJw+/Ayh0+8kyIkKsoCnr039Q8eAM/ypV//cZNu0hzJsMbNXnkDLumfzBk/2XZBJ5fl47+4msHg2zhc0tYnV1ic6r97PCCd0Ag4DjgnIyZX35/p0YTb3Wdvo+1smgjJexOUJQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=R542t6qx; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e740fff1d8so1286884b3a.1
        for <linux-next@vger.kernel.org>; Thu, 21 Mar 2024 23:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1711088785; x=1711693585; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MXRUE5RLHj35GKQ1pm8wK939uBEFGIsgfRkLzz+ygDQ=;
        b=R542t6qx1I33qikFqui6kxBhC2d4vVJM620zkVHzmilJExnesu3sC40Hicgi/N9SKe
         FZliFgRiatTNNf3vzeShNb3taPoJyFUi8llGO8InoGbDAJ6bGmXZKlOJsn1XHvII4jug
         tEjcDyj/THUcmqTPDU1ofGgWiW0uH8hjI0pYLAV3PVceE0BI4fb4M4K5ze8kpCJTGUaE
         u9NgRCSnX4mAA6s2hbWp9MQTSYtZPaype3WIG4rzh++adQGBjelzjMTNC9nXo7ssgs6n
         WKIDDnYWW+2HOUkfdk6GLsp3cpmvcnpJYSbTa6tKcZj/a1StL32uMRgenPht4j5iOGJ1
         NAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711088785; x=1711693585;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MXRUE5RLHj35GKQ1pm8wK939uBEFGIsgfRkLzz+ygDQ=;
        b=KP8OGMgb4ERhO1uPRTAUf2YPPd6GuEGOpYRX+OmvTdmPij5z31bj6A6APx8QrTZyjq
         0COaVFYteuMox8yw5/q0hykx4Vs0SW+8hG83EGJUoK8ExOgv18g5SCVv2wmv2jdNny+h
         oHSjl0eeoh11q+/vrskXAOTKGtdPb1+WlOYnq4yQ7z8gKTEzR6/Ysbj1kM5xKNEKC+LX
         9l5fCOUUX1ayVHvMcao0ZW+vCIfiNc5VVnUcNwHYY/RSmjOuwIkHH970M+I//vWhohka
         XyJCPFfTcuxZ+7kxtEjqU/+n6uFs2neOlzyhfXY+iEY3f4JAEuSuhAhoTrlNY+/MxVRa
         J4kw==
X-Gm-Message-State: AOJu0Yx1XcNRzNe87hKK+fmOWuf7Ndhq2onuu5+WK+tpp2or85ffTg1V
	llAS37zTFOhcEWGjicIqGTZVqCGDvZqJ8bmJwI8SiEZwil49qx2kggBSAXjuNEF0YCKnA1TbsHN
	EzEA=
X-Google-Smtp-Source: AGHT+IGsWEbrXwLMjex0opvGuQ+LsghtaN0Eof+QdH1mncku3mtOnb5i2mbB5RIPB4Vcivy7a4eMJw==
X-Received: by 2002:a17:902:ec84:b0:1dc:42da:bad with SMTP id x4-20020a170902ec8400b001dc42da0badmr2011020plg.62.1711088785255;
        Thu, 21 Mar 2024 23:26:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id s10-20020a170902988a00b001dddc0f1e0asm1020543plp.106.2024.03.21.23.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 23:26:24 -0700 (PDT)
Message-ID: <65fd2490.170a0220.dc310.3959@mx.google.com>
Date: Thu, 21 Mar 2024 23:26:24 -0700 (PDT)
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
X-Kernelci-Kernel: v6.8-12839-g5ff244dd48da
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 54 runs,
 7 regressions (v6.8-12839-g5ff244dd48da)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 54 runs, 7 regressions (v6.8-12839-g5ff244dd48=
da)

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
v6.8-12839-g5ff244dd48da/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-12839-g5ff244dd48da
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5ff244dd48dac4a30e63d6da30c900bad1acdc63 =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =


  Details:     https://kernelci.org/test/plan/id/65fcf3a30f4a0eb1244c42f1

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-12839-=
g5ff244dd48da/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-23=
0-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-12839-=
g5ff244dd48da/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-23=
0-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fcf3a30f4a0eb1244c42f8
        failing since 63 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-22T02:57:19.222607  <8>[   20.313354] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 445979_1.5.2.4.1>
    2024-03-22T02:57:19.328944  / # #
    2024-03-22T02:57:19.430809  export SHELL=3D/bin/sh
    2024-03-22T02:57:19.431481  #
    2024-03-22T02:57:19.532593  / # export SHELL=3D/bin/sh. /lava-445979/en=
vironment
    2024-03-22T02:57:19.533208  =

    2024-03-22T02:57:19.634317  / # . /lava-445979/environment/lava-445979/=
bin/lava-test-runner /lava-445979/1
    2024-03-22T02:57:19.635441  =

    2024-03-22T02:57:19.653944  / # /lava-445979/bin/lava-test-runner /lava=
-445979/1
    2024-03-22T02:57:19.698034  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65fcf3a30f4a0eb1244c42fc
        failing since 63 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-22T02:57:21.806632  /lava-445979/1/../bin/lava-test-case
    2024-03-22T02:57:21.807031  <8>[   22.878934] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-03-22T02:57:21.807277  /lava-445979/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
fcf3a30f4a0eb1244c42fe
        failing since 63 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-22T02:57:22.865626  /lava-445979/1/../bin/lava-test-case
    2024-03-22T02:57:22.866145  <8>[   23.918187] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65fcf3a30f4a0eb1244c4303
        failing since 63 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-22T02:57:23.942611  /lava-445979/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65fcf3a30f4a0eb1244c4304
        failing since 63 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-22T02:57:23.945756  <8>[   25.032191] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-22T02:57:25.000124  /lava-445979/1/../bin/lava-test-case
    2024-03-22T02:57:25.000556  <8>[   26.053889] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-03-22T02:57:25.000939  /lava-445979/1/../bin/lava-test-case
    2024-03-22T02:57:25.001223  <8>[   26.071554] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-03-22T02:57:25.001495  /lava-445979/1/../bin/lava-test-case   =

 =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:     https://kernelci.org/test/plan/id/65fcf3ab4eb9db92d04c42e9

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-12839-=
g5ff244dd48da/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3=
-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-12839-=
g5ff244dd48da/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3=
-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fcf3ab4eb9db92d04c42f0
        failing since 63 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-22T02:57:18.899504  / # #
    2024-03-22T02:57:19.001760  export SHELL=3D/bin/sh
    2024-03-22T02:57:19.002564  #
    2024-03-22T02:57:19.103626  / # export SHELL=3D/bin/sh. /lava-445983/en=
vironment
    2024-03-22T02:57:19.104229  =

    2024-03-22T02:57:19.205378  / # . /lava-445983/environment/lava-445983/=
bin/lava-test-runner /lava-445983/1
    2024-03-22T02:57:19.206398  =

    2024-03-22T02:57:19.250164  / # /lava-445983/bin/lava-test-runner /lava=
-445983/1
    2024-03-22T02:57:19.279568  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-22T02:57:19.279902  + <8>[   21.035880] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 445983_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65fcf3ab4eb9db92d04c4303
        failing since 63 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-22T02:57:21.717263  /lava-445983/1/../bin/lava-test-case
    2024-03-22T02:57:21.717442  <8>[   23.465874] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-22T02:57:21.717535  /lava-445983/1/../bin/lava-test-case   =

 =20

