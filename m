Return-Path: <linux-next+bounces-967-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11027846EBA
	for <lists+linux-next@lfdr.de>; Fri,  2 Feb 2024 12:12:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 901621F23DDD
	for <lists+linux-next@lfdr.de>; Fri,  2 Feb 2024 11:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93217CF1C;
	Fri,  2 Feb 2024 11:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="kUBsH7N6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074A177634
	for <linux-next@vger.kernel.org>; Fri,  2 Feb 2024 11:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706872366; cv=none; b=usGZg3y+Ca8H02Ui4uJaK8S0tKsi/7/PORIxtOLU34p+bndUYmlTWwrH8JwaLxJsAzjGsZbIOJUgf0XU49yFGVSnKiCaFGE7Oo1iivmFZB0oje5Dq6oPgFqk8oOoEPFz2+CJt49FaZZJvgzq22wW6vP8gPl55jtH4FreajQl8JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706872366; c=relaxed/simple;
	bh=MQVMyu1mqmaDj4kG6Uw5I7gVJz9ZCWMH4DxX/qA8EGc=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=rhWNLVHBEFDwGeX+yprdabgrKFfAX0nlR74QSAMq4OpV0o6oDuAFUrA0eqyQhS07gRIx00ezWUXhHb2KqgRm8YXqnzsGmbK/3HxH+1rcbvH+rHWBpJxfvZZKtVSYwLfa2rGrL/YbkZxSGE2KdEGxeSp5XFdmKI3dbCPwaIWFduE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=kUBsH7N6; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6ddc0c02665so1256248b3a.0
        for <linux-next@vger.kernel.org>; Fri, 02 Feb 2024 03:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1706872364; x=1707477164; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VQqj5iZRt9Au2fossX91pTlKtLS7EbyqN3I4NRE9h8g=;
        b=kUBsH7N6tuLjUNXpF+2MCp76m+fFhIQqj82X4Gs/Q+wWBVHGQVMghDwhDBWDjvOyV3
         PrD89YsaHdlXss2Swyf5LiS+lqzJDHAmaIH7vXqaKDECEFGmxVnlhpfoaQrythOqqipi
         /lFq9BTUZTI91d+TcBo0vXiik3kKhkKU5Lmf0VUE1TVAhhDWBejtY0+G7mzgYz+nY/N1
         S626cCJm9VcwgbzJGknf70j9nQtbqAVoHuGJwodkzwt3UNvhfwT4ZXIi2K9m6enn9OPv
         HyKYXapsH0SQHZeRLwt1N0ubfV2CWT+EorQRzQsqlIzK9Tuz5osCV0krVdRlqhmy7VUn
         aANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706872364; x=1707477164;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VQqj5iZRt9Au2fossX91pTlKtLS7EbyqN3I4NRE9h8g=;
        b=pohyWR3cMadiw2MKCI0VWF/4QTSXR84xy4rlzMO9+ctY1IJVe95euPkD1PY84H5KV0
         ejNM1UoENpk3zUrq1tevmjkMgvhyhkVG1L9OvZ5YPF4Z/tyrKiuy8eirRHhfAhdUK2/7
         x8vlz4MN5MemjAhuBU75VsIb9BiR/s5IVHHh65kPDsl/iATW2Akzn2IzJr8+zwJASEUz
         sBCC35zhrADojIGtg3NBY3VAPmMWQcMyb9bbYjKH5u3K8c9XI9BFCxrnqGxvn7akcOZb
         XePDlJYBWbH4ou43v9xg04SV6Ci0AV6HomLMk8yGPrXjfYcQ79rU/mWHHIzPYfAA2cPa
         uVgw==
X-Gm-Message-State: AOJu0YxoowOAw0Fby6/dFbOi4YF0mPl9zS4kWRK5UnmkfBy6Z/v+DZcw
	sJWXEJtPbj5d9760Qv/VZmR8fF1jPgYncV8he7d7/1eLOiHcgZuo+3FOhuvWoIt5MKrwVgas0BX
	GcYM=
X-Google-Smtp-Source: AGHT+IHKDlFR2da5N2GO/2XpLQU/MFbyz1OTEeBfFx94g3d3Q3V2oGGm+2khvCt7lT7OpHqyVhDV4g==
X-Received: by 2002:a05:6a00:2d05:b0:6db:e5d6:68c5 with SMTP id fa5-20020a056a002d0500b006dbe5d668c5mr2263131pfb.7.1706872363857;
        Fri, 02 Feb 2024 03:12:43 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUlSJorg+IdIYBbQWBVH4MRywO4JXoGoEGsdGhYwmpWFGbmhABNqKuJx19oC1AAgVy6WFhx35FJAzCWnyhUjRUJ6ro4cA5441sMGxvF85teU6gzWbyteIV8cprfqhqzqIotkgliR9OH1t2COc8JISB5NA==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id v6-20020a63f206000000b005c662e103a1sm1366508pgh.41.2024.02.02.03.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 03:12:43 -0800 (PST)
Message-ID: <65bcce2b.630a0220.389ad.4c95@mx.google.com>
Date: Fri, 02 Feb 2024 03:12:43 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc2-492-g7c7ad41674f58
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 91 runs,
 7 regressions (v6.8-rc2-492-g7c7ad41674f58)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 91 runs, 7 regressions (v6.8-rc2-492-g7c7ad416=
74f58)

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
v6.8-rc2-492-g7c7ad41674f58/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-rc2-492-g7c7ad41674f58
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7c7ad41674f58fbab8e5fb4f02fda68f690c64ad =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =


  Details:     https://kernelci.org/test/plan/id/65bc9d53e14b7b0e6900a099

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc2-49=
2-g7c7ad41674f58/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc2-49=
2-g7c7ad41674f58/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bc9d53e14b7b0e6900a0a0
        failing since 14 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-02T07:43:56.206034  <8>[   20.094326] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 425349_1.5.2.4.1>
    2024-02-02T07:43:56.311413  / # #
    2024-02-02T07:43:56.413796  export SHELL=3D/bin/sh
    2024-02-02T07:43:56.414593  #
    2024-02-02T07:43:56.516148  / # export SHELL=3D/bin/sh. /lava-425349/en=
vironment
    2024-02-02T07:43:56.516905  =

    2024-02-02T07:43:56.618348  / # . /lava-425349/environment/lava-425349/=
bin/lava-test-runner /lava-425349/1
    2024-02-02T07:43:56.619546  =

    2024-02-02T07:43:56.637274  / # /lava-425349/bin/lava-test-runner /lava=
-425349/1
    2024-02-02T07:43:56.681943  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65bc9d53e14b7b0e6900a0a4
        failing since 14 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-02T07:43:58.787925  /lava-425349/1/../bin/lava-test-case
    2024-02-02T07:43:58.788253  <8>[   22.659623] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-02T07:43:58.788556  /lava-425349/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
bc9d53e14b7b0e6900a0a6
        failing since 14 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-02T07:43:59.846771  /lava-425349/1/../bin/lava-test-case
    2024-02-02T07:43:59.847284  <8>[   23.698466] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-02T07:43:59.847566  /lava-425349/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65bc9d53e14b7b0e6900a0ab
        failing since 14 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-02T07:44:00.921767  /lava-425349/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65bc9d53e14b7b0e6900a0ac
        failing since 14 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-02T07:44:00.924937  <8>[   24.810463] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-02T07:44:01.985382  /lava-425349/1/../bin/lava-test-case   =

 =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:     https://kernelci.org/test/plan/id/65bc9d55e14b7b0e6900a140

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc2-49=
2-g7c7ad41674f58/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc2-49=
2-g7c7ad41674f58/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bc9d55e14b7b0e6900a147
        failing since 14 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-02T07:43:59.612971  / # #
    2024-02-02T07:43:59.715075  export SHELL=3D/bin/sh
    2024-02-02T07:43:59.715749  #
    2024-02-02T07:43:59.816840  / # export SHELL=3D/bin/sh. /lava-425352/en=
vironment
    2024-02-02T07:43:59.817092  =

    2024-02-02T07:43:59.917732  / # . /lava-425352/environment/lava-425352/=
bin/lava-test-runner /lava-425352/1
    2024-02-02T07:43:59.918715  =

    2024-02-02T07:43:59.924917  / # /lava-425352/bin/lava-test-runner /lava=
-425352/1
    2024-02-02T07:43:59.991955  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-02T07:43:59.992393  + <8>[   21.025940] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 425352_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65bc9d55e14b7b0e6900a15a
        failing since 14 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-02T07:44:02.426784  /lava-425352/1/../bin/lava-test-case
    2024-02-02T07:44:02.427187  <8>[   23.450103] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-02T07:44:02.427442  /lava-425352/1/../bin/lava-test-case   =

 =20

