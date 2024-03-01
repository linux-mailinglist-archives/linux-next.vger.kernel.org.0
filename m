Return-Path: <linux-next+bounces-1431-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A446386DC13
	for <lists+linux-next@lfdr.de>; Fri,  1 Mar 2024 08:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 447441F25323
	for <lists+linux-next@lfdr.de>; Fri,  1 Mar 2024 07:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 539F569940;
	Fri,  1 Mar 2024 07:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="zXZwhf0p"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5148169943
	for <linux-next@vger.kernel.org>; Fri,  1 Mar 2024 07:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709278129; cv=none; b=FCsAsP11pAJEkW9RSZd09iYfz88Ciq/PCoZ9j974JDESZb3olmMXTPGzsKt0z+pyxcjv+VHbdOahWbhz7e+gKdVg7+uosnoAvO1T2rJhPIvOzkL3vcwjs/Dgjq62HtxG4td4tfHl0ZSj7srgZ+Sepz3uysR3xFVz+7xnvKpc/CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709278129; c=relaxed/simple;
	bh=3oLEHQc167rYbchzSjKGm5j4X0pyK+I2OcvHfOuXVzM=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=ceECBU71FyXQv6lTmWgDScOeg4jsNRmTE//x1T/BSjRy0fbSom5SoU8ufHS/o+p+Q5cXIRvF4oufV1R/e1krGJwWpnqCMgGQQPDhkcKuYbgyDPMe+GxwzrQ9z4Ztys8hlw+lJ29TBmnRoJdfy8is6JO/5A4GIeEuQfhvL+X07zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=zXZwhf0p; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1dcd0431f00so13436325ad.3
        for <linux-next@vger.kernel.org>; Thu, 29 Feb 2024 23:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1709278126; x=1709882926; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FNr5fWS1Ihc9qd3sEq5MTJQAQiK+S+BR6gq9WUPBUhw=;
        b=zXZwhf0pm4lmWExIQbyodxu9qC1JnYL0J1LCJKZ1CO8LZigBrwgdCAu7GZaG3dbGHX
         Xp4D8VeNADM5ZBI4FrAZiiL23o6jI7+4C4pW2g1nDS6/9FibJAI1aKotyrRTYv9A1FFp
         xVpLuBQrwJ40BzrEArkbr2ULwK4bWmEooEdctnH1FKzNjPZL6yKix5hBsVZ1Ymy9Xb90
         PWfcsxbwOlElG1H3a3082zapQkqvvTUiBaXemR9iuBA16uFMtgeG6CuyDcgkQNWKcoK3
         0yeSOpqBjyI/UDTuSMF2eDDtLF9mVwjUZt778HXjpLJ++6LkzrJxUy2MCLYex4TmvfWA
         ZkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709278126; x=1709882926;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNr5fWS1Ihc9qd3sEq5MTJQAQiK+S+BR6gq9WUPBUhw=;
        b=f6A47uixi2hO7RXHD4jGtKKV/r+3Lnh3qcW8hMPlxJKdcPozoHGnif78gAnF31HxbG
         HElh5rUqHmIFZypdXi7vn5Pfyv1KHuSlxxuArVwndV9Jhc3qpRRaHgXNXl4Y3SKBeiJ4
         Q2okEZePbxqg4ZsmByghCn2ojZqLhAp+BvN/x7d9bJ4BQjkJUR7kZMnFKf/kiZyE7gYQ
         DZXmW94WIljZo/+2HLx5NafjZ8AA/nZU/HXIlZiTOEGUs+Xrw1h9kHjM9NTD9l8aaj1n
         nfsO9I18uK9598FH3vIb1T9bwHeNkPE3Ci+VZ8QsCy8q/MXrlmd96wSISkuP5K6uXC/Q
         0nVQ==
X-Gm-Message-State: AOJu0YwIvXv6CTDuN3Hc+pzTKm1NtfA9hdwV6oUiXrqvl4yh21sO0ft9
	gFU+4LboPpoKDt/Od8j7MrPnVsiZzvtQQwVQc8krlNchcjMFVK1JyIzpnTlAh3CHNMWn7swDnF5
	/Tvk=
X-Google-Smtp-Source: AGHT+IGw+wP/xUADKPGQykm9h3NbwiCXyILb8ykT2ytUGTz7B4wdNZxqeYfhX39/1NhJnWaj+DjoMQ==
X-Received: by 2002:a17:90a:1289:b0:29a:7497:6186 with SMTP id g9-20020a17090a128900b0029a74976186mr810228pja.13.1709278126101;
        Thu, 29 Feb 2024 23:28:46 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id s1-20020a17090ae68100b0029954a48c38sm2583814pjy.38.2024.02.29.23.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 23:28:45 -0800 (PST)
Message-ID: <65e183ad.170a0220.b9b3b.c4db@mx.google.com>
Date: Thu, 29 Feb 2024 23:28:45 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc6-274-gd1e87c1d8f90f
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 77 runs,
 7 regressions (v6.8-rc6-274-gd1e87c1d8f90f)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 77 runs, 7 regressions (v6.8-rc6-274-gd1e87c1d=
8f90f)

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
v6.8-rc6-274-gd1e87c1d8f90f/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-rc6-274-gd1e87c1d8f90f
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d1e87c1d8f90f27a1ca3c90d9de048602beabc61 =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =


  Details:     https://kernelci.org/test/plan/id/65e152b50067c1096763701b

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc6-27=
4-gd1e87c1d8f90f/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc6-27=
4-gd1e87c1d8f90f/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e152b50067c10967637022
        failing since 42 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-01T03:59:27.007178  <8>[   20.226131] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 437268_1.5.2.4.1>
    2024-03-01T03:59:27.109441  / # #
    2024-03-01T03:59:27.211559  export SHELL=3D/bin/sh
    2024-03-01T03:59:27.211924  #
    2024-03-01T03:59:27.312996  / # export SHELL=3D/bin/sh. /lava-437268/en=
vironment
    2024-03-01T03:59:27.313740  =

    2024-03-01T03:59:27.415132  / # . /lava-437268/environment/lava-437268/=
bin/lava-test-runner /lava-437268/1
    2024-03-01T03:59:27.416356  =

    2024-03-01T03:59:27.423060  / # /lava-437268/bin/lava-test-runner /lava=
-437268/1
    2024-03-01T03:59:27.479313  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65e152b50067c10967637026
        failing since 42 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-01T03:59:29.584601  /lava-437268/1/../bin/lava-test-case
    2024-03-01T03:59:29.585017  <8>[   22.786863] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-03-01T03:59:29.585332  /lava-437268/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
e152b50067c10967637028
        failing since 42 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-01T03:59:30.643512  /lava-437268/1/../bin/lava-test-case
    2024-03-01T03:59:30.643967  <8>[   23.825628] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-03-01T03:59:30.644330  /lava-437268/1/../bin/lava-test-case
    2024-03-01T03:59:30.644608  <8>[   23.842766] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65e152b50067c1096763702d
        failing since 42 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-01T03:59:31.717220  /lava-437268/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65e152b50067c1096763702e
        failing since 42 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-01T03:59:31.720554  <8>[   24.936881] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-01T03:59:32.779154  /lava-437268/1/../bin/lava-test-case
    2024-03-01T03:59:32.779590  <8>[   25.958593] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-03-01T03:59:32.779941  /lava-437268/1/../bin/lava-test-case   =

 =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:     https://kernelci.org/test/plan/id/65e152b8d6b532864a637040

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc6-27=
4-gd1e87c1d8f90f/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc6-27=
4-gd1e87c1d8f90f/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e152b8d6b532864a637047
        failing since 42 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-01T03:59:32.595483  / # #
    2024-03-01T03:59:32.697619  export SHELL=3D/bin/sh
    2024-03-01T03:59:32.698376  #
    2024-03-01T03:59:32.799851  / # export SHELL=3D/bin/sh. /lava-437269/en=
vironment
    2024-03-01T03:59:32.800672  =

    2024-03-01T03:59:32.901972  / # . /lava-437269/environment/lava-437269/=
bin/lava-test-runner /lava-437269/1
    2024-03-01T03:59:32.902650  =

    2024-03-01T03:59:32.907191  / # /lava-437269/bin/lava-test-runner /lava=
-437269/1
    2024-03-01T03:59:32.975401  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-01T03:59:32.975835  + <8>[   20.978229] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 437269_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65e152b8d6b532864a63705a
        failing since 42 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-01T03:59:35.411872  /lava-437269/1/../bin/lava-test-case
    2024-03-01T03:59:35.412051  <8>[   23.402785] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-01T03:59:35.412145  /lava-437269/1/../bin/lava-test-case
    2024-03-01T03:59:35.412229  <8>[   23.420497] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-03-01T03:59:35.412309  /lava-437269/1/../bin/lava-test-case   =

 =20

