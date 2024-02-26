Return-Path: <linux-next+bounces-1359-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED85E867526
	for <lists+linux-next@lfdr.de>; Mon, 26 Feb 2024 13:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E29C3B2871F
	for <lists+linux-next@lfdr.de>; Mon, 26 Feb 2024 12:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50AD67EEE6;
	Mon, 26 Feb 2024 12:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="D6cfEPg2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4238973162
	for <linux-next@vger.kernel.org>; Mon, 26 Feb 2024 12:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708950907; cv=none; b=LnzuVmGgciinoI3M6VgobF2ud0KorESjjDbgzhHVyf5p1/01+d5cUnPk61NHG5/cyRysq9HxMN3egrE6xib98b6w207s73RzblvpD6t49Xp02mlowhfccqkon/qCoz1LJ0wSKhytEXue1EFbgvXQaE8rjwE418oLEUA04c0PkxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708950907; c=relaxed/simple;
	bh=Mx3KJyXMHMpXjrlzIWnFuILBF3DPXgRmsaU1y+yskDU=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=oSdQz0oK5f/Z2m2xdk9F6+IWNZSQsN/IoprlYzCBPprLQQrAyWDKMtnrhgI6uRelw8RYjhsZsHsdeigwqsSeUT/OnJYAMDfroOHG/sy4FUKuJPro8w1/BtxXRHDbytcbDgF8YRhN1gW51GceidT0wQ6y69fKLMJq5fOS9FSPTrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=D6cfEPg2; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5ce2aada130so2749924a12.1
        for <linux-next@vger.kernel.org>; Mon, 26 Feb 2024 04:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708950904; x=1709555704; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0bsmnmYR6GDDFCJ2ieFDxOBLUZYHtYhcJhVQcnA3K9o=;
        b=D6cfEPg22I+boAM0JdFkFiZEjT5z3t8WcKHwOGy7+IVj1Hd+ESdPUb7txnkET1r2n5
         nP3bi8VAttqGa1tH4oT4uYJdhBidJi8PEmQkxrmJYz2FCWdxx4usJY1264yci9Gufb8Q
         KJlCHvadRzkcnC1bMilCqtuYQpj5vKCJVvLhg3sg5rJHX0x5Xxkoh7z0BCFNmUFelpWw
         K7kjCExtI4TjSDgSFNh/xXMFWqfdDSVOa8GTVzYmhSN+qgwnCzXSaiwlGMSCHizBm734
         8s/iYJttMX+hyFXewrDHoQnGe1lBJOJca2j3ugcpQ4+APWkQ0ohGchkppEw2LnDOyRI8
         BR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708950904; x=1709555704;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0bsmnmYR6GDDFCJ2ieFDxOBLUZYHtYhcJhVQcnA3K9o=;
        b=Nj25jrjAlFd0YDeMr7ZTGsgij/n0dUwOc1IL6ro8AJsvEIzrnDbPmgHJrr1DC8oNPD
         BWSIceu03gn7TPvabtFsAype7GGBYGtD24BfmoxWpu9kmgyRw+MpJ12K1FCD87zET5nE
         UXhFhKs1HRku89qoqzvfPK4c52mC4TWYZhQ/bblcn6iMbPe1MJZrucsnI4ZW9XfZD6un
         S3Gt7ejwFPO3C57mjV2OgTr88rt6TuYlAmjLgoI9ArLvjftI1GC6e8OA9oklbJS7KOsh
         K1wnRugZQm7GkTjCSRLaSmH2TPmiN8re/02qgrFhORGgp4tqRo3O5i1q1gr7ZbYtvRZZ
         oVWw==
X-Gm-Message-State: AOJu0Yw52KNSJMSRAh4Ju0w5hTRA0q3vOX79ngJRh/ShteuC1ps8mzoI
	HLQXG1APPLtzh5ku1ND5pPCW9WbtPTDRCawQ/JTnR+NIXWDxy68e+vXnmR047Wnk8kHKtWTl4B+
	Y
X-Google-Smtp-Source: AGHT+IEFHaZdVI149HeH4fNpQLBaPcrp6izlrLO3l7ZB7tOpZoT+wJvZfZfrUVBT0JQ3FGOxuRgFzA==
X-Received: by 2002:a05:6a21:9988:b0:19c:9eea:e731 with SMTP id ve8-20020a056a21998800b0019c9eeae731mr6121822pzb.40.1708950903933;
        Mon, 26 Feb 2024 04:35:03 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id q17-20020a639811000000b005dc4f9cecdcsm3738961pgd.86.2024.02.26.04.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 04:35:03 -0800 (PST)
Message-ID: <65dc8577.630a0220.abe90.90cc@mx.google.com>
Date: Mon, 26 Feb 2024 04:35:03 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc5-540-g06497c30d7ac5
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 81 runs,
 10 regressions (v6.8-rc5-540-g06497c30d7ac5)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 81 runs, 10 regressions (v6.8-rc5-540-g06497c3=
0d7ac5)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
imx53-qsrb               | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig | 1          =

imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig | 1          =

imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig  =
        | 1          =

kontron-kbox-a-230-ls    | arm64 | lab-kontron     | gcc-10   | defconfig  =
        | 5          =

kontron-sl28-var3-ads2   | arm64 | lab-kontron     | gcc-10   | defconfig  =
        | 2          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.8-rc5-540-g06497c30d7ac5/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-rc5-540-g06497c30d7ac5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      06497c30d7ac5a726d6beea51c4f441b917b420c =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
imx53-qsrb               | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc547d11ca410f5c637018

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-54=
0-g06497c30d7ac5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-54=
0-g06497c30d7ac5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65dc547d11ca410f5c63701d
        failing since 392 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2024-02-26T09:05:40.972380  + set +x
    2024-02-26T09:05:40.972525  [   13.509685] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1029069_1.5.2.3.1>
    2024-02-26T09:05:41.080018  / # #
    2024-02-26T09:05:41.180962  export SHELL=3D/bin/sh
    2024-02-26T09:05:41.181370  #
    2024-02-26T09:05:41.282062  / # export SHELL=3D/bin/sh. /lava-1029069/e=
nvironment
    2024-02-26T09:05:41.282429  =

    2024-02-26T09:05:41.383117  / # . /lava-1029069/environment/lava-102906=
9/bin/lava-test-runner /lava-1029069/1
    2024-02-26T09:05:41.383595  =

    2024-02-26T09:05:41.386939  / # /lava-1029069/bin/lava-test-runner /lav=
a-1029069/1 =

    ... (13 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc547e80ff2809f963702c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-54=
0-g06497c30d7ac5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-54=
0-g06497c30d7ac5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65dc547e80ff2809f9637031
        new failure (last pass: v6.8-rc5-389-gbf23699d860e0)

    2024-02-26T09:05:42.977649  + set[   15.065579] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 1029070_1.5.2.3.1>
    2024-02-26T09:05:42.977951   +x
    2024-02-26T09:05:43.084179  / # #
    2024-02-26T09:05:43.185248  export SHELL=3D/bin/sh
    2024-02-26T09:05:43.185650  #
    2024-02-26T09:05:43.286399  / # export SHELL=3D/bin/sh. /lava-1029070/e=
nvironment
    2024-02-26T09:05:43.286803  =

    2024-02-26T09:05:43.387701  / # . /lava-1029070/environment/lava-102907=
0/bin/lava-test-runner /lava-1029070/1
    2024-02-26T09:05:43.388222  =

    2024-02-26T09:05:43.391404  / # /lava-1029070/bin/lava-test-runner /lav=
a-1029070/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/65dc53dbabaa7b9c6e637012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-54=
0-g06497c30d7ac5/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inn=
ocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-54=
0-g06497c30d7ac5/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inn=
ocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65dc53dbabaa7b9c6e637=
013
        new failure (last pass: v6.8-rc5-389-gbf23699d860e0) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
kontron-kbox-a-230-ls    | arm64 | lab-kontron     | gcc-10   | defconfig  =
        | 5          =


  Details:     https://kernelci.org/test/plan/id/65dc54204eb2b823da63709e

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-54=
0-g06497c30d7ac5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-54=
0-g06497c30d7ac5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65dc54204eb2b823da6370a5
        failing since 38 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-26T09:04:01.377438  + <8>[   20.221468] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 435266_1.5.2.4.1>
    2024-02-26T09:04:01.377702  set +x
    2024-02-26T09:04:01.482500  / # #
    2024-02-26T09:04:01.584445  export SHELL=3D/bin/sh
    2024-02-26T09:04:01.585160  #
    2024-02-26T09:04:01.686433  / # export SHELL=3D/bin/sh. /lava-435266/en=
vironment
    2024-02-26T09:04:01.687076  =

    2024-02-26T09:04:01.788506  / # . /lava-435266/environment/lava-435266/=
bin/lava-test-runner /lava-435266/1
    2024-02-26T09:04:01.789681  =

    2024-02-26T09:04:01.808534  / # /lava-435266/bin/lava-test-runner /lava=
-435266/1 =

    ... (19 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65dc54204eb2b823da6370a9
        failing since 38 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-26T09:04:03.957177  /lava-435266/1/../bin/lava-test-case
    2024-02-26T09:04:03.957602  <8>[   22.785066] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-26T09:04:03.958070  /lava-435266/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
dc54204eb2b823da6370ab
        failing since 38 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-26T09:04:05.015357  /lava-435266/1/../bin/lava-test-case
    2024-02-26T09:04:05.015766  <8>[   23.822766] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65dc54204eb2b823da6370b0
        failing since 38 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-26T09:04:06.096078  /lava-435266/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65dc54204eb2b823da6370b1
        failing since 38 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-26T09:04:06.099390  <8>[   24.939658] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-26T09:04:07.158287  /lava-435266/1/../bin/lava-test-case
    2024-02-26T09:04:07.158745  <8>[   25.961313] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-26T09:04:07.159049  /lava-435266/1/../bin/lava-test-case   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
kontron-sl28-var3-ads2   | arm64 | lab-kontron     | gcc-10   | defconfig  =
        | 2          =


  Details:     https://kernelci.org/test/plan/id/65dc53a8ff8c08e01363707f

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-54=
0-g06497c30d7ac5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-54=
0-g06497c30d7ac5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65dc53a8ff8c08e013637086
        failing since 38 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-26T09:02:21.702095  / # #
    2024-02-26T09:02:21.804218  export SHELL=3D/bin/sh
    2024-02-26T09:02:21.804920  #
    2024-02-26T09:02:21.906447  / # export SHELL=3D/bin/sh. /lava-435267/en=
vironment
    2024-02-26T09:02:21.907145  =

    2024-02-26T09:02:22.008576  / # . /lava-435267/environment/lava-435267/=
bin/lava-test-runner /lava-435267/1
    2024-02-26T09:02:22.009781  =

    2024-02-26T09:02:22.029429  / # /lava-435267/bin/lava-test-runner /lava=
-435267/1
    2024-02-26T09:02:22.082273  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-26T09:02:22.082697  + <8>[   20.923932] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 435267_1.5.2.4.5> =

    ... (12 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65dc53a8ff8c08e013637099
        failing since 38 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-26T09:02:23.459771  <8>[   22.326737] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-driver-present RESULT=3Dpass>
    2024-02-26T09:02:24.520572  /lava-435267/1/../bin/lava-test-case
    2024-02-26T09:02:24.521032  <8>[   23.348178] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-26T09:02:24.521319  /lava-435267/1/../bin/lava-test-case   =

 =20

