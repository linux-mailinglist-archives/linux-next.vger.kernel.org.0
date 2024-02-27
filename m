Return-Path: <linux-next+bounces-1385-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 275ED869C92
	for <lists+linux-next@lfdr.de>; Tue, 27 Feb 2024 17:43:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A88931F24A9F
	for <lists+linux-next@lfdr.de>; Tue, 27 Feb 2024 16:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8362621A0D;
	Tue, 27 Feb 2024 16:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="W9gnaOkf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE8148CCD
	for <linux-next@vger.kernel.org>; Tue, 27 Feb 2024 16:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709052124; cv=none; b=OkMmBozDaohsz8pHIuPb4bQ0BQRwS7saItClqtuS1ulX9WsdJWTaWkCacvOToxwCexwzZG8qsAy7iENPS6ou/2CngSnXyutZ2AlVVcxMq/c2UF4Dc1hQvgi5S//1iN3AbNipbJZrsaCGBt+RPbdLmIrO4eoynMbsVP3dpBV2Ts0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709052124; c=relaxed/simple;
	bh=fUDAMJw47TCr6o5GpWfFPzlxmNHI3KBPcotUbrEWs5Y=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Mm+Himk5NTdKoIW71J92Pu8fFe1GP6AmRPraEGu1Uk5wYxcJJXJNqTYISZmJrrb8bK/2RCmVOrKL06oz9XQroIvjy3sclQ6KPX9l5fm051qcH69Gzra7a6JaOV6578Lnia3P7OC8pyCHBfcPDPGYexXe1RhL3X4WbrD9qnJ6WnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=W9gnaOkf; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d918008b99so35811555ad.3
        for <linux-next@vger.kernel.org>; Tue, 27 Feb 2024 08:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1709052121; x=1709656921; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A4Z29lRi8sT1rp2Cy4wjy74+m8tp9l9L5eXJTwUH28A=;
        b=W9gnaOkfwIsE2lOSQMBWaUrsbSuMVq5u0SMl3ds3O88jx/EK/FIWPwGgHh1H/E/oQt
         ra8zQo5I1HDRS6DHmnfDSL2K+gIm5Bu2/+S2TMU4U0RPnXpuJdM7n5Jg/j+YFCTG66na
         EL1ON7k6hCECa/O0KwJzSH3Dhip7qAwN85NBKyY79PSWmOUMZGFMuKylelTFF224m1rb
         lXcB82BMeg5mOFi71JIy9xEdJS+Z/vn4ODYfolwoPj106gl8NKP7DMjoU/L84Bh04BmE
         HOgnn0fM53R/BjCRVLbtB6tZoTqc7/glByc+FBE9kV1423emDtGzMhHMxVC0Vkmn9QM3
         CKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709052121; x=1709656921;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A4Z29lRi8sT1rp2Cy4wjy74+m8tp9l9L5eXJTwUH28A=;
        b=lxRv9MYS8DQ2Petxw7opR29wB4b8YV/35moq/nKTgAQ83Uym1DwJ1UmMkLXvnc8O6o
         7dHO5qUWK+nb7jI4IymGus9pa+NX8q5LO0dfr4zxeUZeug5nVrLIbgVRqcZ6lKRqOJBX
         qHMqT8R+q7YO4hBRJq5JUsFStDf96RhhYp4as1kHKl3XiQ+OQZdNTAQeURm/zgpjJwv1
         eO7gkAO1x0//IwUXtYasjwVDPNjPk4uHly1hxrE96i2boePbQlLdW71QRcTDYF5hqyJg
         y4GxWuA6HtzL/L9GBntyHy+cSd25lNo/DUaAyYlplFaK3Vco91KPi6Wao7qUHtwDsguL
         STVw==
X-Gm-Message-State: AOJu0YyynRiLQNlUnPsU8ZtTgw9OM5lWw4ioht2d7jmScMPhmd1Zkgv/
	0Dxrq7C/1J5i/BFEkZ/v2+hQfJiQS2TCQTv2ZV+LauP6mwfovWyAGGy7+OpMZVJQ+p6cVOHMkra
	I
X-Google-Smtp-Source: AGHT+IEJ0Rv+MmRhIIepSNY84Rdc5WbwReTyI1lMT0eIyTaapzEoz1IqWYzlQbGIZ7ox9n5vltT30w==
X-Received: by 2002:a17:902:d487:b0:1dc:b320:60d2 with SMTP id c7-20020a170902d48700b001dcb32060d2mr4555574plg.33.1709052120848;
        Tue, 27 Feb 2024 08:42:00 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id jw21-20020a170903279500b001d949e663d5sm1737946plb.31.2024.02.27.08.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 08:42:00 -0800 (PST)
Message-ID: <65de10d8.170a0220.abb2a.74f0@mx.google.com>
Date: Tue, 27 Feb 2024 08:42:00 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc6-170-ge73e1cc53e4b
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 83 runs,
 8 regressions (v6.8-rc6-170-ge73e1cc53e4b)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 83 runs, 8 regressions (v6.8-rc6-170-ge73e1cc5=
3e4b)

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
v6.8-rc6-170-ge73e1cc53e4b/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-rc6-170-ge73e1cc53e4b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e73e1cc53e4b2a12be92d7da87a7d91b9b143496 =



Test Regressions
---------------- =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
imx53-qsrb             | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65dddf49d1b89198ab63702b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc6-17=
0-ge73e1cc53e4b/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc6-17=
0-ge73e1cc53e4b/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65dddf49d1b89198ab637030
        failing since 393 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2024-02-27T13:10:11.414751  + set +x
    2024-02-27T13:10:11.414893  [   13.558714] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1029392_1.5.2.3.1>
    2024-02-27T13:10:11.522307  / # #
    2024-02-27T13:10:11.624050  export SHELL=3D/bin/sh
    2024-02-27T13:10:11.624467  #
    2024-02-27T13:10:11.725289  / # export SHELL=3D/bin/sh. /lava-1029392/e=
nvironment
    2024-02-27T13:10:11.725650  =

    2024-02-27T13:10:11.826365  / # . /lava-1029392/environment/lava-102939=
2/bin/lava-test-runner /lava-1029392/1
    2024-02-27T13:10:11.826869  =

    2024-02-27T13:10:11.830299  / # /lava-1029392/bin/lava-test-runner /lav=
a-1029392/1 =

    ... (13 line(s) more)  =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 5          =


  Details:     https://kernelci.org/test/plan/id/65dddfdf20d7ba4fe7637052

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc6-17=
0-ge73e1cc53e4b/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc6-17=
0-ge73e1cc53e4b/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65dddfdf20d7ba4fe7637059
        failing since 39 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-27T13:12:47.614372  / # #
    2024-02-27T13:12:47.716550  export SHELL=3D/bin/sh
    2024-02-27T13:12:47.717302  #
    2024-02-27T13:12:47.818607  / # export SHELL=3D/bin/sh. /lava-435667/en=
vironment
    2024-02-27T13:12:47.819370  =

    2024-02-27T13:12:47.920726  / # . /lava-435667/environment/lava-435667/=
bin/lava-test-runner /lava-435667/1
    2024-02-27T13:12:47.921812  =

    2024-02-27T13:12:47.941825  / # /lava-435667/bin/lava-test-runner /lava=
-435667/1
    2024-02-27T13:12:47.984708  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-27T13:12:47.985165  + <8>[   20.629735] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 435667_1.5.2.4.5> =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65dddfdf20d7ba4fe763705d
        failing since 39 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-27T13:12:50.092961  /lava-435667/1/../bin/lava-test-case
    2024-02-27T13:12:50.093404  <8>[   22.739237] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-27T13:12:50.093819  /lava-435667/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
dddfdf20d7ba4fe763705f
        failing since 39 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-27T13:12:51.153574  /lava-435667/1/../bin/lava-test-case
    2024-02-27T13:12:51.154051  <8>[   23.778329] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-27T13:12:51.154342  /lava-435667/1/../bin/lava-test-case
    2024-02-27T13:12:51.154566  <8>[   23.795523] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2024-02-27T13:12:51.154787  /lava-435667/1/../bin/lava-test-case
    2024-02-27T13:12:51.154998  <8>[   23.815160] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2024-02-27T13:12:51.155209  /lava-435667/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65dddfdf20d7ba4fe7637064
        failing since 39 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-27T13:12:52.229668  /lava-435667/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65dddfdf20d7ba4fe7637065
        failing since 39 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-27T13:12:52.232984  <8>[   24.892638] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-27T13:12:53.286228  /lava-435667/1/../bin/lava-test-case
    2024-02-27T13:12:53.286622  <8>[   25.913285] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-27T13:12:53.286867  /lava-435667/1/../bin/lava-test-case   =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 2          =


  Details:     https://kernelci.org/test/plan/id/65dddfde1b8d8b685e63702b

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc6-17=
0-ge73e1cc53e4b/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc6-17=
0-ge73e1cc53e4b/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65dddfde1b8d8b685e637032
        failing since 39 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-27T13:12:42.822425  / # #
    2024-02-27T13:12:42.924187  export SHELL=3D/bin/sh
    2024-02-27T13:12:42.924932  #
    2024-02-27T13:12:43.026211  / # export SHELL=3D/bin/sh. /lava-435666/en=
vironment
    2024-02-27T13:12:43.026969  =

    2024-02-27T13:12:43.128283  / # . /lava-435666/environment/lava-435666/=
bin/lava-test-runner /lava-435666/1
    2024-02-27T13:12:43.129501  =

    2024-02-27T13:12:43.133920  / # /lava-435666/bin/lava-test-runner /lava=
-435666/1
    2024-02-27T13:12:43.202793  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-27T13:12:43.203230  + <8>[   21.002079] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 435666_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65dddfde1b8d8b685e637045
        failing since 39 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-27T13:12:45.624444  /lava-435666/1/../bin/lava-test-case
    2024-02-27T13:12:45.624596  <8>[   23.416732] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-27T13:12:45.624692  /lava-435666/1/../bin/lava-test-case
    2024-02-27T13:12:45.624765  <8>[   23.434355] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-02-27T13:12:45.624836  /lava-435666/1/../bin/lava-test-case   =

 =20

