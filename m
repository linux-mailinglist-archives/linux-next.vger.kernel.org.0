Return-Path: <linux-next+bounces-1057-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9503A84CBC6
	for <lists+linux-next@lfdr.de>; Wed,  7 Feb 2024 14:41:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D4372843DC
	for <lists+linux-next@lfdr.de>; Wed,  7 Feb 2024 13:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C61217BBD;
	Wed,  7 Feb 2024 13:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="tHltt6Uq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECE45BADD
	for <linux-next@vger.kernel.org>; Wed,  7 Feb 2024 13:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707313273; cv=none; b=imWzQ0aA5buFFwU561A+zC/QlbPkWA1joY+6kfGR4bQ+RnBwQADK0wmQ5vEJGT8o1NGTiWSYWmLC8fAl0Q6++VrAx9nK37fGzeaDVz1yPQGSiVGLudBGzyl7u/iH4qg7oVrgnPBSbVrQQceeTh4DiUDeASHLSdURARSmvRQZNbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707313273; c=relaxed/simple;
	bh=x8VGQzMc4gXZ0jogTAANaYikUs0EDcKgdO98hKHG5L4=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=otJBEmZr3s9yM/Kr418mG+h+pzeBaYmQj9yNbwcgFo3k8+KF/r7b4ZRBelp0epyfxXWekJLzirurFTb53wU/I80pFJy7GQGk10DME9VO+d4MvwEUkY00JvRVRoGpYPW3l4NulLAYnhu+QEqFb3ZDsRt5rSNM54btixW2ZxoACp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=tHltt6Uq; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6e118b528aeso213965a34.1
        for <linux-next@vger.kernel.org>; Wed, 07 Feb 2024 05:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707313270; x=1707918070; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=I85Uvf5yfwJTFvzZlZw4rUC18yaCM5mA2zaIxBzTxzY=;
        b=tHltt6Uqqne1XXKPgmmYa1MrsaZ/PE+e32w6XmEYSDzySYiB8K9VxGoAzVN3YPbd5w
         zQhxfC3mIEi3ZOag9/G2g5JbaXS+nEhGJxFQECvEvAm1BVqghdQUycKIL7sY6/FytK29
         JOy7didugdeBP0HQot69m7fpJ2WMyP3Kgh+xYUwE8jwg8cy8FxXh+Ri9RGOxvGywVNbF
         FIc98+h+FVD7ekbas/eEhF9WvuSePDGs93ozZ2IdZ/2IzNAYpQ7N27SeJA8RYTaBhrqU
         +XKvPnluEulIGeqTKV/MHACMMlD3gH3ZBjIcEUaztryY0kBppofvUOvplPVJhXSgCzr4
         56nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707313270; x=1707918070;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I85Uvf5yfwJTFvzZlZw4rUC18yaCM5mA2zaIxBzTxzY=;
        b=VOx5kJUTfUNz1HDVe7K/uFy+xq+Z8ZVnvi2dND98s3qMiDIK/YDiJssSsDqupFmmjp
         NldpetA0bKeWbtzY/dxgJsBNSIM/Ab++urEZmZDct2uuuO6G1HImkOdCFDZisihgFAu7
         Rrz55sNXYh+NXokOz2mAODkpHZjDrtB/xRfoBC5/qKoJeV+CZuzV7EABtB2ZEmtCTPEn
         Ei0QKVA9fexo+oHuneKVZgT3qTgViqE5sQzc4nBSMHBVN1yjgWvyvg4uadK3luHSg62v
         hCUDYepgiec1H2OjXlKcGD971mP47l+YrUtSQ92xX3o2yDD/ZNOavgirDBKE8CPDpa5K
         xdlw==
X-Gm-Message-State: AOJu0Yw/PkPmIjST2jfCswzlB6lFJiE9x8gpTjhg6wesI5m/Fvf/3y3x
	l7ORQjWoDvJmSmt1Vidt8sDK9/7wh4eSaAbYtGgOFoFOzufOzInc5yqQ1VQzbON8c5fRHlNE0PG
	U
X-Google-Smtp-Source: AGHT+IHiUG6rB67MsIO6lVYTefLmgrPtdCExKwtXE4trBOsJBKZuTGzAMRLqdiYVwFI8SA5di2KbPw==
X-Received: by 2002:a05:6830:110d:b0:6e2:b6d5:d0d8 with SMTP id w13-20020a056830110d00b006e2b6d5d0d8mr2394111otq.37.1707313269796;
        Wed, 07 Feb 2024 05:41:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVPJF+paArrwUxL3kg/CdC/kaiOl0bKeU6usszySjDnAGJjLtQpZSCweUPfqqh8AImoKelLarFSfpslmMz9HaIYNcs8jJW98Dc7GlDq8KSJeD5T0KXVNa15R4vIuQOoYlmB5ZNxCRFPPqSIDygouf7TfQ==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id b16-20020a656690000000b005d880b41598sm1345783pgw.94.2024.02.07.05.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 05:41:09 -0800 (PST)
Message-ID: <65c38875.650a0220.7de7.2f34@mx.google.com>
Date: Wed, 07 Feb 2024 05:41:09 -0800 (PST)
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
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.8-rc3-284-g567dd3d8c2ec
Subject: next/pending-fixes baseline: 90 runs,
 10 regressions (v6.8-rc3-284-g567dd3d8c2ec)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 90 runs, 10 regressions (v6.8-rc3-284-g567dd3d=
8c2ec)

Regressions Summary
-------------------

platform                    | arch  | lab          | compiler | defconfig |=
 regressions
----------------------------+-------+--------------+----------+-----------+=
------------
kontron-kbox-a-230-ls       | arm64 | lab-kontron  | gcc-10   | defconfig |=
 5          =

kontron-sl28-var3-ads2      | arm64 | lab-kontron  | gcc-10   | defconfig |=
 2          =

meson-gxm-khadas-vim2       | arm64 | lab-baylibre | gcc-10   | defconfig |=
 1          =

rk3399-roc-pc               | arm64 | lab-broonie  | gcc-10   | defconfig |=
 1          =

sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe   | gcc-10   | defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.8-rc3-284-g567dd3d8c2ec/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-rc3-284-g567dd3d8c2ec
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      567dd3d8c2ec07d5223e99abcdea99ed1cda0b06 =



Test Regressions
---------------- =



platform                    | arch  | lab          | compiler | defconfig |=
 regressions
----------------------------+-------+--------------+----------+-----------+=
------------
kontron-kbox-a-230-ls       | arm64 | lab-kontron  | gcc-10   | defconfig |=
 5          =


  Details:     https://kernelci.org/test/plan/id/65c357bd77646d316b8e1e79

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc3-28=
4-g567dd3d8c2ec/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc3-28=
4-g567dd3d8c2ec/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c357bd77646d316b8e1e7c
        failing since 19 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-07T10:12:46.966343  <8>[   20.134419] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 426836_1.5.2.4.1>
    2024-02-07T10:12:47.071919  / # #
    2024-02-07T10:12:47.173989  export SHELL=3D/bin/sh
    2024-02-07T10:12:47.174723  #
    2024-02-07T10:12:47.276011  / # export SHELL=3D/bin/sh. /lava-426836/en=
vironment
    2024-02-07T10:12:47.276735  =

    2024-02-07T10:12:47.378081  / # . /lava-426836/environment/lava-426836/=
bin/lava-test-runner /lava-426836/1
    2024-02-07T10:12:47.379267  =

    2024-02-07T10:12:47.397996  / # /lava-426836/bin/lava-test-runner /lava=
-426836/1
    2024-02-07T10:12:47.441991  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65c357bd77646d316b8e1e80
        failing since 19 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-07T10:12:49.548567  /lava-426836/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
c357bd77646d316b8e1e82
        failing since 19 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-07T10:12:50.612050  /lava-426836/1/../bin/lava-test-case
    2024-02-07T10:12:50.612504  <8>[   23.739664] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-07T10:12:50.612803  /lava-426836/1/../bin/lava-test-case
    2024-02-07T10:12:50.613024  <8>[   23.756889] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65c357bd77646d316b8e1e87
        failing since 19 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-07T10:12:51.689473  /lava-426836/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65c357bd77646d316b8e1e88
        failing since 19 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-07T10:12:51.692754  <8>[   24.857188] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-07T10:12:52.747419  /lava-426836/1/../bin/lava-test-case
    2024-02-07T10:12:52.747559  <8>[   25.878791] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-07T10:12:52.747628  /lava-426836/1/../bin/lava-test-case
    2024-02-07T10:12:52.747696  <8>[   25.896417] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-02-07T10:12:52.747753  /lava-426836/1/../bin/lava-test-case   =

 =



platform                    | arch  | lab          | compiler | defconfig |=
 regressions
----------------------------+-------+--------------+----------+-----------+=
------------
kontron-sl28-var3-ads2      | arm64 | lab-kontron  | gcc-10   | defconfig |=
 2          =


  Details:     https://kernelci.org/test/plan/id/65c3578180954103d68e1e92

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc3-28=
4-g567dd3d8c2ec/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc3-28=
4-g567dd3d8c2ec/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c3578180954103d68e1e95
        failing since 19 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-07T10:12:06.136775  / # #
    2024-02-07T10:12:06.237457  export SHELL=3D/bin/sh
    2024-02-07T10:12:06.237684  #
    2024-02-07T10:12:06.338202  / # export SHELL=3D/bin/sh. /lava-426835/en=
vironment
    2024-02-07T10:12:06.338828  =

    2024-02-07T10:12:06.439821  / # . /lava-426835/environment/lava-426835/=
bin/lava-test-runner /lava-426835/1
    2024-02-07T10:12:06.440655  =

    2024-02-07T10:12:06.451537  / # /lava-426835/bin/lava-test-runner /lava=
-426835/1
    2024-02-07T10:12:06.494016  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-07T10:12:06.512578  + <8>[   20.891443] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 426835_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65c3578180954103d68e1ea8
        failing since 19 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-07T10:12:08.943930  /lava-426835/1/../bin/lava-test-case
    2024-02-07T10:12:08.944404  <8>[   23.307810] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-07T10:12:08.944685  /lava-426835/1/../bin/lava-test-case
    2024-02-07T10:12:08.944900  <8>[   23.325472] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-02-07T10:12:08.945110  /lava-426835/1/../bin/lava-test-case
    2024-02-07T10:12:08.945311  <8>[   23.346572] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-probed RESULT=3Dpass>
    2024-02-07T10:12:08.945507  /lava-426835/1/../bin/lava-test-case   =

 =



platform                    | arch  | lab          | compiler | defconfig |=
 regressions
----------------------------+-------+--------------+----------+-----------+=
------------
meson-gxm-khadas-vim2       | arm64 | lab-baylibre | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/65c3588e50af1b87a28e1ec4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc3-28=
4-g567dd3d8c2ec/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxm-khad=
as-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc3-28=
4-g567dd3d8c2ec/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxm-khad=
as-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c3588e50af1b87a28e1=
ec5
        failing since 2 days (last pass: v6.8-rc2-492-g7c7ad41674f58, first=
 fail: v6.8-rc3-184-g749067d43da7a) =

 =



platform                    | arch  | lab          | compiler | defconfig |=
 regressions
----------------------------+-------+--------------+----------+-----------+=
------------
rk3399-roc-pc               | arm64 | lab-broonie  | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/65c3589850af1b87a28e1ece

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc3-28=
4-g567dd3d8c2ec/arm64/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-pc.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc3-28=
4-g567dd3d8c2ec/arm64/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-pc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c3589850af1b87a28e1=
ecf
        failing since 7 days (last pass: v6.7-12142-g865a3df089bf, first fa=
il: v6.8-rc2-275-g21abc01c4bcb5) =

 =



platform                    | arch  | lab          | compiler | defconfig |=
 regressions
----------------------------+-------+--------------+----------+-----------+=
------------
sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe   | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/65c358b3640ae5e8328e1f47

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc3-28=
4-g567dd3d8c2ec/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orange=
pi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc3-28=
4-g567dd3d8c2ec/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orange=
pi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c358b3640ae5e8328e1=
f48
        new failure (last pass: v6.8-rc3-184-g749067d43da7a) =

 =20

