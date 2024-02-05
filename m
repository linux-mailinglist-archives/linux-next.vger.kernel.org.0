Return-Path: <linux-next+bounces-982-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3D884926A
	for <lists+linux-next@lfdr.de>; Mon,  5 Feb 2024 03:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 836F91F216D8
	for <lists+linux-next@lfdr.de>; Mon,  5 Feb 2024 02:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133478F40;
	Mon,  5 Feb 2024 02:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Rtga0tkV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C048BE7
	for <linux-next@vger.kernel.org>; Mon,  5 Feb 2024 02:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707100514; cv=none; b=RtbScpj1pOawDYNJ6QKw5qq31JyLYtisXEi/GKsrGlR8aSpTvAIC3PNE4jeNtDVvlIQv/ZYEf8prVioD9am7l/etHvHnWDEyej6gxmvuckQ3Qc5g3Cy3dWgOYU8dLScHk+QTktBAzQElPR03K/273G1tW+Lwr19+CUFKs+I4704=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707100514; c=relaxed/simple;
	bh=cNJGdG7L6Ay/7Xn1GXyqRKd2MaT8LrrdRFNWGATRvQ0=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=fsJGMAYXT9l9ED2tqH3N3JWAn1B/llRKTl1aoKr8ibKiIwWWrMYcEIrEwavJiYskqWQtBYAOh+hnBtUCfCv7tbKiSvtnXAzwkIPb7lm9piAbcztt83okA4P60nMGh9otsYWyR7x0hhwpJpja8w2ybNxDDgB/vfqD0wOTrYg9dBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Rtga0tkV; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d93edfa76dso33559065ad.1
        for <linux-next@vger.kernel.org>; Sun, 04 Feb 2024 18:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707100511; x=1707705311; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oKmjeMxDGlz8AI0I8rhU5Nf6YvcsKjVynXUbC6SWPak=;
        b=Rtga0tkVzIewimUgsjERG/lHWgyqASHN1MEAeNVaF6oxE20wvT2mzBd65e3dBWynOM
         nGmQeLCSTns2YMyYA7IVCBBkeqgRpdLlnDo5/OucksY7FtiZ55t4/mcVOyRIo21pcStX
         qEaoeKlFBGpc51j/LXFT2fGA2ou7OuKh4huZmDxxdTNdKyj+2KVz2X777GOQHf/wUxcY
         J4xQwCNQ+dr/UTHrCpBD54/0W4D5KTaYy1A/dsHUZS9zkIiMZW9YSuU7MTThBkOQfNCy
         jDfEx4cSitK8hFJGq1u0X7mKkMLudEmerAnXjPNo5Vt0/w2+88jJIY9r9qpjJyoHSxHl
         6M8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707100511; x=1707705311;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKmjeMxDGlz8AI0I8rhU5Nf6YvcsKjVynXUbC6SWPak=;
        b=o3idQZFsn9K1Rs+CWStKZ6V5mu5hFQPBKcSlTAasX7PzrAG5KnGQieQGEHrl7ZElya
         uq0G55ylhWdz1/8yV3f0kECyK0PUD2P0sOEq1QPUTT/w6MCyqKBb1NGjOHUPCAjV3pQn
         fE3vr9EESh/x/IL+RsLlin3EXVvaFsdKUuxLq4DM6KL0ld06yM4/TdTNI0gQ4DNiQavQ
         3qH+iQw4VjI/sw2NvCKXG1puBefXP/BrdDWlh8td3lQvWOihyqpNwieOo3diW42hOuil
         4dLNTRmZJkEdoF7SggpxduWU/zPeDawKdkn8uxdF/ap/lvdXeZedyZOT0SopiYYP2c6B
         dsjA==
X-Gm-Message-State: AOJu0Yw7TRC3BK2kkUU7xU7yPihlLx2PYUnawNpmFl9LgDxpi0IdEFxL
	Nx9gK7yKT5KnrXQUGEfZOWMzD3t3qUbacMqenIC5YNWSK/AvV5UD8NkuyhCUPkedqq8bmba2sA9
	x
X-Google-Smtp-Source: AGHT+IHGtq1zQgWoFC+xry/2HzJAjBrYvOJ8FYdleNR3gV+aDUntWHsSAZp/RI28GRFfKvRtFLGywQ==
X-Received: by 2002:a17:902:ce8d:b0:1d9:addd:ce21 with SMTP id f13-20020a170902ce8d00b001d9adddce21mr3413937plg.39.1707100510759;
        Sun, 04 Feb 2024 18:35:10 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW0gvTf7eRxZE6zNGgLrZaeEOE6xeTYR/Gs04Xg8w607/pCJxSKgJuFuuElKDybW1d9Ijdy4wH+Gs5znEsz738hw0k8q6ZCI+QrMddAKzZNR5U3okYzyEldLMABmh3EtEkC8KFCahHCp0lWVKZuqgcgSg==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id j6-20020a170902c3c600b001d932f1b92bsm5101609plj.289.2024.02.04.18.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 18:35:10 -0800 (PST)
Message-ID: <65c0495e.170a0220.c0cbf.1007@mx.google.com>
Date: Sun, 04 Feb 2024 18:35:10 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc3-184-g749067d43da7a
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 85 runs,
 8 regressions (v6.8-rc3-184-g749067d43da7a)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 85 runs, 8 regressions (v6.8-rc3-184-g749067d4=
3da7a)

Regressions Summary
-------------------

platform               | arch  | lab          | compiler | defconfig | regr=
essions
-----------------------+-------+--------------+----------+-----------+-----=
-------
kontron-kbox-a-230-ls  | arm64 | lab-kontron  | gcc-10   | defconfig | 5   =
       =

kontron-sl28-var3-ads2 | arm64 | lab-kontron  | gcc-10   | defconfig | 2   =
       =

meson-gxm-khadas-vim2  | arm64 | lab-baylibre | gcc-10   | defconfig | 1   =
       =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.8-rc3-184-g749067d43da7a/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-rc3-184-g749067d43da7a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      749067d43da7a80462a871a33ee51173e553b31a =



Test Regressions
---------------- =



platform               | arch  | lab          | compiler | defconfig | regr=
essions
-----------------------+-------+--------------+----------+-----------+-----=
-------
kontron-kbox-a-230-ls  | arm64 | lab-kontron  | gcc-10   | defconfig | 5   =
       =


  Details:     https://kernelci.org/test/plan/id/65c0188e4a05f5500600a0c1

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc3-18=
4-g749067d43da7a/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc3-18=
4-g749067d43da7a/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c0188e4a05f5500600a0c8
        failing since 16 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-04T23:06:29.690432  / # #
    2024-02-04T23:06:29.791554  export SHELL=3D/bin/sh
    2024-02-04T23:06:29.791997  #
    2024-02-04T23:06:29.892975  / # export SHELL=3D/bin/sh. /lava-426085/en=
vironment
    2024-02-04T23:06:29.893305  =

    2024-02-04T23:06:29.994037  / # . /lava-426085/environment/lava-426085/=
bin/lava-test-runner /lava-426085/1
    2024-02-04T23:06:29.994690  =

    2024-02-04T23:06:30.004374  / # /lava-426085/bin/lava-test-runner /lava=
-426085/1
    2024-02-04T23:06:30.046009  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-04T23:06:30.060928  + <8>[   20.655840] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 426085_1.5.2.4.5> =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65c0188e4a05f5500600a0cc
        failing since 16 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-04T23:06:31.128162  <8>[   21.742384] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-driver-present RESULT=3Dpass>
    2024-02-04T23:06:32.163823  /lava-426085/1/../bin/lava-test-case
    2024-02-04T23:06:32.164390  <8>[   22.763545] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-04T23:06:32.164606  /lava-426085/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
c0188e4a05f5500600a0ce
        failing since 16 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-04T23:06:33.224806  /lava-426085/1/../bin/lava-test-case
    2024-02-04T23:06:33.225031  <8>[   23.803885] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-04T23:06:33.225195  /lava-426085/1/../bin/lava-test-case
    2024-02-04T23:06:33.225333  <8>[   23.821226] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65c0188e4a05f5500600a0d3
        failing since 16 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-04T23:06:34.303923  /lava-426085/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65c0188e4a05f5500600a0d4
        failing since 16 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-04T23:06:34.307082  <8>[   24.920655] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-04T23:06:35.365351  /lava-426085/1/../bin/lava-test-case
    2024-02-04T23:06:35.365770  <8>[   25.942058] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-04T23:06:35.366105  /lava-426085/1/../bin/lava-test-case   =

 =



platform               | arch  | lab          | compiler | defconfig | regr=
essions
-----------------------+-------+--------------+----------+-----------+-----=
-------
kontron-sl28-var3-ads2 | arm64 | lab-kontron  | gcc-10   | defconfig | 2   =
       =


  Details:     https://kernelci.org/test/plan/id/65c0185050a30d798e00a064

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc3-18=
4-g749067d43da7a/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc3-18=
4-g749067d43da7a/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c0185050a30d798e00a06b
        failing since 16 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-04T23:05:38.683437  / # #
    2024-02-04T23:05:38.785434  export SHELL=3D/bin/sh
    2024-02-04T23:05:38.786058  #
    2024-02-04T23:05:38.887291  / # export SHELL=3D/bin/sh. /lava-426087/en=
vironment
    2024-02-04T23:05:38.887999  =

    2024-02-04T23:05:38.989393  / # . /lava-426087/environment/lava-426087/=
bin/lava-test-runner /lava-426087/1
    2024-02-04T23:05:38.990360  =

    2024-02-04T23:05:39.034404  / # /lava-426087/bin/lava-test-runner /lava=
-426087/1
    2024-02-04T23:05:39.063076  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-04T23:05:39.063496  + <8>[   20.936110] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 426087_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65c0185050a30d798e00a07e
        failing since 16 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-04T23:05:41.436399  /lava-426087/1/../bin/lava-test-case
    2024-02-04T23:05:41.471201  <8>[   23.355476] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-04T23:05:41.471746  /lava-426087/1/../bin/lava-test-case   =

 =



platform               | arch  | lab          | compiler | defconfig | regr=
essions
-----------------------+-------+--------------+----------+-----------+-----=
-------
meson-gxm-khadas-vim2  | arm64 | lab-baylibre | gcc-10   | defconfig | 1   =
       =


  Details:     https://kernelci.org/test/plan/id/65c0196e57bd29afa800a03a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc3-18=
4-g749067d43da7a/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxm-kha=
das-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc3-18=
4-g749067d43da7a/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxm-kha=
das-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c0196e57bd29afa800a=
03b
        new failure (last pass: v6.8-rc2-492-g7c7ad41674f58) =

 =20

