Return-Path: <linux-next+bounces-1310-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F06A68609F1
	for <lists+linux-next@lfdr.de>; Fri, 23 Feb 2024 05:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 390D028380B
	for <lists+linux-next@lfdr.de>; Fri, 23 Feb 2024 04:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F48611188;
	Fri, 23 Feb 2024 04:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="knODE79y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3416411198
	for <linux-next@vger.kernel.org>; Fri, 23 Feb 2024 04:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708663110; cv=none; b=rGAmlw0k62mlVMTVIkr9zIxE0in/GeiU3MW2Y4UCoX2QQN//V3YZazwzI5u3cr+bN4izEXyrUJcc3VIRkY/9kYfunNbeAeQIqZvIjGKvWmMuodWVG4oMTeXIelNTec8CHWdBLTqGKPiXNB9xW5YRdq3E1BbzfIHmNwIV1LvlSIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708663110; c=relaxed/simple;
	bh=kX/v6ALTAUOE0WTEz63JRcHyI2FRZP/bBLqIQcCdDbw=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=O3Uj1NsnT/LDztjFtBXz3bnQmOjRZs7Vd9VpvCKHJXATIQVN9dsWK2xxFOJYdnZw7NFiZF0NA/BLJxbJezwzxRnxR9RLoptaEoiSaqenCd7FsxMWieEclgXM8N7aovbZect1jkkTBuYZIiHy8M+TjDbPBiCl88wDVa0SVAjz1hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=knODE79y; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6de3141f041so247943b3a.0
        for <linux-next@vger.kernel.org>; Thu, 22 Feb 2024 20:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708663107; x=1709267907; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CcF6IuZHKnagPg4cUwKpJV4e1p7+jCpACj3bl/hLNas=;
        b=knODE79ynh7A589ZRjaqtfJCtAw8ie26nnGKgBZZm40KNiokW2GItLL4e6Y7d5vbuh
         y2Zz4O1Yo5o2bO0rdyh2tTH2I97gommywQV2t8A7HZVfunwY9rnsOHldSg1O09TxZQAo
         LH4CfYkshbkTySHdKEH+fRnMItZ8X7RHK5HDIiHZrq6PYckjWcHIXbC1eYZS6/c5UWQc
         rDnYNbEcuAmxn2HLsHIVqPPBSCbsmb/Y3TXoFxISrdxmN3Taui9fLokSMycttPk496Qt
         uPk9NOQQ589V1lcjP9RY72xZqjzVKmCLqsm2ytRSv+ao4v7gVI8VP4Bys0ImJoOwCfKH
         nglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708663107; x=1709267907;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CcF6IuZHKnagPg4cUwKpJV4e1p7+jCpACj3bl/hLNas=;
        b=G7hbairT2YhjbTBL8OpnIrkpsiqMucbbmYZ/dMrQMGhXyybedrSLTsRmOWiK+i4bBo
         zmudKMEBxdMimCsJIEwfMMe6uSerBjm8ynOHgwAhkWcnVLbQDjB3YcfFLQmNb+xAyVxC
         JOs1pSCXJkof2Y6uI0EL3+UyE2lUJXCWBfECIiwm38asSWWL8aAvD7F/FALbL5xx/HrD
         PKB23hhNQd5zqF6vh9lzYf5t3a3TmsYa7hZvssjg5SguwZ2VgD2RGmfombs3ORUXrWRa
         Mg832KTC2JrgRCJqn1dSSYd558VbiK+8bGglCOjnsOqeO53mSJVtm53j0eY/YdPrYvuN
         mn8Q==
X-Gm-Message-State: AOJu0YwyWVHaTWelg6ytDfTB0wZCkvR039zKL3phK1UzZC4xLOh0Ftjp
	ZqRZRssXy/6efFQqsr1jfy+3b+wkbZsKPm9lxdLZBhrPp3hiFKHNj9We+djqEG1FVu9PeK2Y9k5
	cSj8=
X-Google-Smtp-Source: AGHT+IGDFbsdRBiyDRlkqkv+OHndbg8yBw+sHdrK1ghNOCv7VzQoStPorgj13jL76Ui4+goWUHK21w==
X-Received: by 2002:a05:6a20:2d9f:b0:1a0:b8a4:256a with SMTP id bf31-20020a056a202d9f00b001a0b8a4256amr819262pzb.36.1708663106941;
        Thu, 22 Feb 2024 20:38:26 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id i11-20020a17090320cb00b001d7252fef6bsm10774708plb.299.2024.02.22.20.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 20:38:26 -0800 (PST)
Message-ID: <65d82142.170a0220.2b517.5aef@mx.google.com>
Date: Thu, 22 Feb 2024 20:38:26 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc5-389-gbf23699d860e0
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 74 runs,
 8 regressions (v6.8-rc5-389-gbf23699d860e0)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 74 runs, 8 regressions (v6.8-rc5-389-gbf23699d=
860e0)

Regressions Summary
-------------------

platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
imx53-qsrb             | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig | 1          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 5          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 2          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.8-rc5-389-gbf23699d860e0/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-rc5-389-gbf23699d860e0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      bf23699d860e0906878a926021e11f371527c51e =



Test Regressions
---------------- =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
imx53-qsrb             | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65d7edb0a23b17881b63708e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-38=
9-gbf23699d860e0/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-38=
9-gbf23699d860e0/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d7edb0a23b17881b637093
        failing since 389 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2024-02-23T00:58:02.886989  + set +x
    2024-02-23T00:58:02.887154  [   13.522055] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1027661_1.5.2.3.1>
    2024-02-23T00:58:02.994821  / # #
    2024-02-23T00:58:03.096231  export SHELL=3D/bin/sh
    2024-02-23T00:58:03.096756  #
    2024-02-23T00:58:03.197667  / # export SHELL=3D/bin/sh. /lava-1027661/e=
nvironment
    2024-02-23T00:58:03.198076  =

    2024-02-23T00:58:03.298923  / # . /lava-1027661/environment/lava-102766=
1/bin/lava-test-runner /lava-1027661/1
    2024-02-23T00:58:03.299564  =

    2024-02-23T00:58:03.302599  / # /lava-1027661/bin/lava-test-runner /lav=
a-1027661/1 =

    ... (13 line(s) more)  =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 5          =


  Details:     https://kernelci.org/test/plan/id/65d7f055dbb70248a363705a

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-38=
9-gbf23699d860e0/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-38=
9-gbf23699d860e0/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d7f055dbb70248a3637061
        failing since 35 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-23T01:09:17.402957  + <8>[   20.166483] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 434009_1.5.2.4.1>
    2024-02-23T01:09:17.403268  set +x
    2024-02-23T01:09:17.508359  / # #
    2024-02-23T01:09:17.610529  export SHELL=3D/bin/sh
    2024-02-23T01:09:17.611241  #
    2024-02-23T01:09:17.712614  / # export SHELL=3D/bin/sh. /lava-434009/en=
vironment
    2024-02-23T01:09:17.713326  =

    2024-02-23T01:09:17.814807  / # . /lava-434009/environment/lava-434009/=
bin/lava-test-runner /lava-434009/1
    2024-02-23T01:09:17.815982  =

    2024-02-23T01:09:17.834473  / # /lava-434009/bin/lava-test-runner /lava=
-434009/1 =

    ... (18 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65d7f055dbb70248a3637065
        failing since 35 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-23T01:09:19.986036  /lava-434009/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
d7f055dbb70248a3637067
        failing since 35 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-23T01:09:21.044018  /lava-434009/1/../bin/lava-test-case
    2024-02-23T01:09:21.044482  <8>[   23.770879] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-23T01:09:21.044772  /lava-434009/1/../bin/lava-test-case
    2024-02-23T01:09:21.044994  <8>[   23.788016] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d7f055dbb70248a363706c
        failing since 35 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-23T01:09:22.118864  /lava-434009/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65d7f055dbb70248a363706d
        failing since 35 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-23T01:09:22.121119  <8>[   24.882524] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-23T01:09:23.180097  /lava-434009/1/../bin/lava-test-case
    2024-02-23T01:09:23.180591  <8>[   25.904191] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-23T01:09:23.180889  /lava-434009/1/../bin/lava-test-case   =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 2          =


  Details:     https://kernelci.org/test/plan/id/65d7f05344731a53bc637024

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-38=
9-gbf23699d860e0/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-38=
9-gbf23699d860e0/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d7f05344731a53bc63702b
        failing since 35 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-23T01:09:20.708726  / # #
    2024-02-23T01:09:20.810847  export SHELL=3D/bin/sh
    2024-02-23T01:09:20.811553  #
    2024-02-23T01:09:20.912881  / # export SHELL=3D/bin/sh. /lava-434007/en=
vironment
    2024-02-23T01:09:20.913597  =

    2024-02-23T01:09:21.015015  / # . /lava-434007/environment/lava-434007/=
bin/lava-test-runner /lava-434007/1
    2024-02-23T01:09:21.016162  =

    2024-02-23T01:09:21.020737  / # /lava-434007/bin/lava-test-runner /lava=
-434007/1
    2024-02-23T01:09:21.088738  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-23T01:09:21.089159  + <8>[   20.930424] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 434007_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d7f05344731a53bc63703e
        failing since 35 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-23T01:09:23.514870  /lava-434007/1/../bin/lava-test-case   =

 =20

