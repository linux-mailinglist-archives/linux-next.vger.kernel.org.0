Return-Path: <linux-next+bounces-1402-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EE986A98D
	for <lists+linux-next@lfdr.de>; Wed, 28 Feb 2024 09:09:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4A0E1C218E9
	for <lists+linux-next@lfdr.de>; Wed, 28 Feb 2024 08:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEBE725618;
	Wed, 28 Feb 2024 08:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="lBBcfIbs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B78E241E6
	for <linux-next@vger.kernel.org>; Wed, 28 Feb 2024 08:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709107752; cv=none; b=YmOPqS0q9aUbhVXkTSX7dujMpw61ay6rdTtCWL1rg8SSohQ7NIaOyDp/bjApLbM+OtiDoq5A+WogqaOrb3RCjwiSL8qghwMLA8fMjrFHt4Su4PGH6PjBOunMj2X9X9XrB2R5VnzP2cUSaNuYYQZ/MS+uZmJNU3TUllnThNTq2TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709107752; c=relaxed/simple;
	bh=thnZrlG0umPLGzhpMHM51wKjXsCYemL7AJlKPmbxwFo=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=nfVK4xxjklr+hr9+jw1ohGoVDUWeyVQwid2oNLqcSL2Vihodgrh+d2oAckzPQiNPjGwgK33ZA9LaUkF8U8y+UYYOJ90G1UpATONKL52Q1g37C2NCW3LUVnsEjzQlZapBGoWBQY3L6VVYNEayknO1m6aP0BJmOYG2IH+Muy2VwLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=lBBcfIbs; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-299e4b352cdso3836737a91.0
        for <linux-next@vger.kernel.org>; Wed, 28 Feb 2024 00:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1709107749; x=1709712549; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bXvJw+FLq2TLBaG020vavFHE1bMcxpR14vluKaNhmv8=;
        b=lBBcfIbsGiKA1dMw2D/rgd3hK6mwTIkj97XpBjSCtVeDHJwTUfTQnmM3pIKOWFIlp+
         WnOYoUyHpVNJnBnBJ5j6UOeoriGFOnJ5THKN9ZaDDWYf3x9ZkNPjz/Lc4qC3mqbkNkhg
         ZRH2V7WWEef7vxL+FFuGxACzqDFA3Md/zy2xGdzWNiXskn4PoVUJuEQFJIHCod4e1rGm
         IHWTtaAbA3u4AGjUCVx+GElMCNYb6kz1y/Jz1BQsjbL/GgJQrWr2tgRf6i2UjkMaO1yN
         t18V5rxvgqCPgkPt/yPyNyF2o811Q3GgldE4c8gV7GcDWiN9kmDangTW1Vsws4eMkukc
         Q7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709107749; x=1709712549;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bXvJw+FLq2TLBaG020vavFHE1bMcxpR14vluKaNhmv8=;
        b=crj8poBPKcuead7j5RoaLSWnRYGReyXit9buJHIVksjn6/Gl42hjDLvQ6o/WM3s3pV
         cwY7TIYs4P4FJWFQLONd7/XoMw7yOVn2BmQnHq3SjRojRnYdaCnOwoFkTNnpvX/q986Q
         epVVnOGZVD6aVZ5rRZ/P+jY0RVXQobnz85vkSrmrdag2VUFCybf/rFt+LfZUGOx1NleP
         vn30KlsBhxG1BrGPorkrI87twvjuxxBnUox3/3TEw3KhtiCPCBJVW1ArnZZl1HR0K/UN
         R6Lt7WL90dI7U3GO7Bs6IeSaau9SSMlOe0tkXKRZCS8PYUKJtWd0Zusr/8NnF0AevZVe
         6YzQ==
X-Gm-Message-State: AOJu0Yy+0czBV116RzqtYRHiMPH/tRnPNopioe7TZ6wASgawHHSf4dip
	fM17hKpi0EbiMLpDn1/tl/3jm7Xqlzhwq/kTd52Qwzw87fQ4R6uTpuiLJKr5M+6hGPIpJbfsIWG
	xrDk=
X-Google-Smtp-Source: AGHT+IGIErVflWyLltZFHAz1yUeo5lBj9gyh/MgFO/pSAo01xWtFsqigL6UIK6EjMeghEiHOTifQ6Q==
X-Received: by 2002:a17:90a:c7c7:b0:29a:6ba0:df43 with SMTP id gf7-20020a17090ac7c700b0029a6ba0df43mr10771346pjb.31.1709107749301;
        Wed, 28 Feb 2024 00:09:09 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id mm18-20020a17090b359200b0029a54e43073sm932265pjb.30.2024.02.28.00.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 00:09:08 -0800 (PST)
Message-ID: <65deea24.170a0220.33f1e.2fe4@mx.google.com>
Date: Wed, 28 Feb 2024 00:09:08 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc6-194-g75d8cf735082
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 54 runs,
 7 regressions (v6.8-rc6-194-g75d8cf735082)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 54 runs, 7 regressions (v6.8-rc6-194-g75d8cf73=
5082)

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
v6.8-rc6-194-g75d8cf735082/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-rc6-194-g75d8cf735082
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      75d8cf735082728a5dfb7e46926ee184851cc519 =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =


  Details:     https://kernelci.org/test/plan/id/65deb729f98867870a637012

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc6-19=
4-g75d8cf735082/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc6-19=
4-g75d8cf735082/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65deb729f98867870a637019
        failing since 40 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-28T04:31:18.562827  <8>[   20.211149] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 435935_1.5.2.4.1>
    2024-02-28T04:31:18.667851  / # #
    2024-02-28T04:31:18.769810  export SHELL=3D/bin/sh
    2024-02-28T04:31:18.770687  #
    2024-02-28T04:31:18.871891  / # export SHELL=3D/bin/sh. /lava-435935/en=
vironment
    2024-02-28T04:31:18.872629  =

    2024-02-28T04:31:18.974005  / # . /lava-435935/environment/lava-435935/=
bin/lava-test-runner /lava-435935/1
    2024-02-28T04:31:18.975320  =

    2024-02-28T04:31:18.994605  / # /lava-435935/bin/lava-test-runner /lava=
-435935/1
    2024-02-28T04:31:19.038231  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65deb729f98867870a63701d
        failing since 40 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-28T04:31:21.145253  /lava-435935/1/../bin/lava-test-case
    2024-02-28T04:31:21.145675  <8>[   22.775757] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-28T04:31:21.146139  /lava-435935/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
deb729f98867870a63701f
        failing since 40 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-28T04:31:22.204628  /lava-435935/1/../bin/lava-test-case
    2024-02-28T04:31:22.205099  <8>[   23.816039] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-28T04:31:22.205400  /lava-435935/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65deb729f98867870a637024
        failing since 40 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-28T04:31:23.279945  /lava-435935/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65deb729f98867870a637025
        failing since 40 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-28T04:31:23.283120  <8>[   24.927637] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-28T04:31:24.337350  /lava-435935/1/../bin/lava-test-case
    2024-02-28T04:31:24.337789  <8>[   25.949210] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-28T04:31:24.338175  /lava-435935/1/../bin/lava-test-case   =

 =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:     https://kernelci.org/test/plan/id/65deb7286e47d91760637020

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc6-19=
4-g75d8cf735082/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc6-19=
4-g75d8cf735082/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65deb7286e47d91760637027
        failing since 40 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-28T04:31:19.160494  / # #
    2024-02-28T04:31:19.262671  export SHELL=3D/bin/sh
    2024-02-28T04:31:19.263457  #
    2024-02-28T04:31:19.364700  / # export SHELL=3D/bin/sh. /lava-435932/en=
vironment
    2024-02-28T04:31:19.365453  =

    2024-02-28T04:31:19.466894  / # . /lava-435932/environment/lava-435932/=
bin/lava-test-runner /lava-435932/1
    2024-02-28T04:31:19.467913  =

    2024-02-28T04:31:19.487856  / # /lava-435932/bin/lava-test-runner /lava=
-435932/1
    2024-02-28T04:31:19.540761  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-28T04:31:19.541192  + <8>[   20.738460] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 435932_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65deb7286e47d9176063703a
        failing since 40 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-28T04:31:21.972676  /lava-435932/1/../bin/lava-test-case   =

 =20

