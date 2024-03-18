Return-Path: <linux-next+bounces-1659-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6146287E2AA
	for <lists+linux-next@lfdr.de>; Mon, 18 Mar 2024 04:42:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80E151C211F9
	for <lists+linux-next@lfdr.de>; Mon, 18 Mar 2024 03:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3AE1EF0D;
	Mon, 18 Mar 2024 03:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="rjrU883d"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4ADB1EEE4
	for <linux-next@vger.kernel.org>; Mon, 18 Mar 2024 03:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710733358; cv=none; b=SSQ3OleJyaeFexZj7rpsG1LBQKtA8MZumMD6aprnJl2K/0smKok99Yjnr2Z/zKzQ+c1GaQfo/Z3lxtE5iYfz3zXWIj22Rai9rB+jV/NmTKvc3XrR3J4sFa6jT9Jd4X3scPdf3hOA0op/dgt78jG80ehprkxKribqB0+vhdycjKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710733358; c=relaxed/simple;
	bh=ZzxcIbq+16N7exznLxqj7ixSpXTeufpM0LnVhzGQx48=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Y70mjZ3gv6nDnnUL2MQRHlnvM8fgt2/tRg6vemLOPbgklwbp5SR1ZWI2dtwU+n/XOO0jVyUBRxht5XRBWfqoJte7qfygJZukt5P4rKATMnwYJmNQg0N6FvuNf4f7g0Hw98fttuMyo1zGUHa81wTEpGfQCSVpFjJrQChnxP009jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=rjrU883d; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3bbbc6b4ed1so3133934b6e.2
        for <linux-next@vger.kernel.org>; Sun, 17 Mar 2024 20:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1710733355; x=1711338155; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f715wm93xUxZsB/1JJB0cEdwivi2ekkegLmRdWgJthQ=;
        b=rjrU883dUMO0nFzy9oktQP6dYNJWHETv78S4GbGhPPYP/23LBKj6FteYL6fOHJZY6m
         CZrOUtU/e76E6DaW1jpGb2gGd1a3LWIPYAUYJFSjMYaQu8Qw738ga8WAlSW6QFLiS3Ae
         VLgvrYwcSyTW5oN8OIs8oXmahu2MU0qcjDIzBa4spUoeokHCpf/kZmUJbDPcyZIKLK+o
         GWuELi+Jb43hhLFgrlvh9XXIVSwh+tZE4coIrtT7kUs0RGIHgLe+NZWNV2oCfIvmRD6g
         82oKQjqjMtjhy/CHzUVNjrTF3e+gdFjbrPBQvhiwJfwWP+yTvfY6NWLaU6uV69ssq91X
         vdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710733355; x=1711338155;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f715wm93xUxZsB/1JJB0cEdwivi2ekkegLmRdWgJthQ=;
        b=tPxS632yNbo2OXT+Josq1EEgS6X8kd0R8gEF1+f9V8x6gXANzqoI8ts6Qpj0O5pwV0
         I+HAxaKR8TqeQysSmpPHhXQGBZ7XHEMASirz3Zne9whIlwrlVSzSPEhaihmEek0hi53p
         epH3yGweXGlKlhxtoRdXF0ImQLdQdhLcHof6d7yfKIfbjObwAD1TvQ3ABrbjBFkIPR9B
         MoKSmrZcK6TJaYhF6Dwf8M4hdifQUtpxI3A3xLfYkNDIs2VKJPuYHjW7n19QhXLoihMv
         n0PegiycaOtnqPcVh2j4RdnYwD+rj7Ae1UJEWBcwqRZkKPQ3LU16vt+RXllIJUOh+VqI
         hp+g==
X-Gm-Message-State: AOJu0YxGLkY5TIb6LCFJWV1O7UwCVvJQCOFOGF4N7SJjmJA5NG2EGTQk
	BUUK20tjjCJIVRaW0QwWU49XdPOE4sf7vGOP3LVd++T2nX6Qs1rh8XBV4KdEN9cgIrPPKM3zFlf
	Q
X-Google-Smtp-Source: AGHT+IEkGuUv/Wc2IJP0vSyIrQpEqpERFt7sEhDcg8I2VvcI7RyYacMPukE2izdXBDT6cobEyGoXnA==
X-Received: by 2002:a05:6808:318a:b0:3c1:e68b:3aa5 with SMTP id cd10-20020a056808318a00b003c1e68b3aa5mr17039113oib.49.1710733355123;
        Sun, 17 Mar 2024 20:42:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id b3-20020a631b03000000b005c6617b52e6sm6043221pgb.5.2024.03.17.20.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 20:42:34 -0700 (PDT)
Message-ID: <65f7b82a.630a0220.2cc61.07ba@mx.google.com>
Date: Sun, 17 Mar 2024 20:42:34 -0700 (PDT)
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
X-Kernelci-Kernel: v6.8-11487-gb0754ca596e7c
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 46 runs,
 8 regressions (v6.8-11487-gb0754ca596e7c)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 46 runs, 8 regressions (v6.8-11487-gb0754ca596=
e7c)

Regressions Summary
-------------------

platform               | arch  | lab           | compiler | defconfig | reg=
ressions
-----------------------+-------+---------------+----------+-----------+----=
--------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig | 5  =
        =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig | 2  =
        =

sun50i-h6-pine-h64     | arm64 | lab-collabora | gcc-10   | defconfig | 1  =
        =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.8-11487-gb0754ca596e7c/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-11487-gb0754ca596e7c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b0754ca596e7c0fc372ef14f75674c99d7db6971 =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig | reg=
ressions
-----------------------+-------+---------------+----------+-----------+----=
--------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig | 5  =
        =


  Details:     https://kernelci.org/test/plan/id/65f78553c851db43e84c4306

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-11487-=
gb0754ca596e7c/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-2=
30-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-11487-=
gb0754ca596e7c/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-2=
30-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f78553c851db43e84c430d
        failing since 59 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-18T00:05:14.150621  / # #
    2024-03-18T00:05:14.252673  export SHELL=3D/bin/sh
    2024-03-18T00:05:14.253392  #
    2024-03-18T00:05:14.354777  / # export SHELL=3D/bin/sh. /lava-444492/en=
vironment
    2024-03-18T00:05:14.355430  =

    2024-03-18T00:05:14.456750  / # . /lava-444492/environment/lava-444492/=
bin/lava-test-runner /lava-444492/1
    2024-03-18T00:05:14.457953  =

    2024-03-18T00:05:14.498390  / # /lava-444492/bin/lava-test-runner /lava=
-444492/1
    2024-03-18T00:05:14.521054  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-18T00:05:14.521486  + <8>[   20.785786] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 444492_1.5.2.4.5> =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65f78553c851db43e84c4311
        failing since 59 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-18T00:05:16.627952  /lava-444492/1/../bin/lava-test-case
    2024-03-18T00:05:16.628380  <8>[   22.893399] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-03-18T00:05:16.628699  /lava-444492/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
f78553c851db43e84c4313
        failing since 59 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-18T00:05:17.688741  /lava-444492/1/../bin/lava-test-case
    2024-03-18T00:05:17.689199  <8>[   23.932840] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-03-18T00:05:17.689553  /lava-444492/1/../bin/lava-test-case
    2024-03-18T00:05:17.689833  <8>[   23.951694] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65f78553c851db43e84c4318
        failing since 59 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-18T00:05:18.764488  /lava-444492/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65f78553c851db43e84c4319
        failing since 59 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-18T00:05:18.767658  <8>[   25.047558] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-18T00:05:19.822106  /lava-444492/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig | reg=
ressions
-----------------------+-------+---------------+----------+-----------+----=
--------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig | 2  =
        =


  Details:     https://kernelci.org/test/plan/id/65f7853fa0fc5205034c4306

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-11487-=
gb0754ca596e7c/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var=
3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-11487-=
gb0754ca596e7c/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var=
3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f7853fa0fc5205034c430d
        failing since 59 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-18T00:05:02.869961  / # #
    2024-03-18T00:05:02.972004  export SHELL=3D/bin/sh
    2024-03-18T00:05:02.972704  #
    2024-03-18T00:05:03.074266  / # export SHELL=3D/bin/sh. /lava-444494/en=
vironment
    2024-03-18T00:05:03.074970  =

    2024-03-18T00:05:03.176260  / # . /lava-444494/environment/lava-444494/=
bin/lava-test-runner /lava-444494/1
    2024-03-18T00:05:03.177429  =

    2024-03-18T00:05:03.181999  / # /lava-444494/bin/lava-test-runner /lava=
-444494/1
    2024-03-18T00:05:03.250903  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-18T00:05:03.251323  + <8>[   21.030851] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 444494_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65f7853fa0fc5205034c4320
        failing since 59 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-18T00:05:05.685700  /lava-444494/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig | reg=
ressions
-----------------------+-------+---------------+----------+-----------+----=
--------
sun50i-h6-pine-h64     | arm64 | lab-collabora | gcc-10   | defconfig | 1  =
        =


  Details:     https://kernelci.org/test/plan/id/65f7865a6060f0ecf44c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-11487-=
gb0754ca596e7c/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine=
-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-11487-=
gb0754ca596e7c/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine=
-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f7865a6060f0ecf44c4=
2db
        new failure (last pass: v6.8-7223-gd5f8ee808c59) =

 =20

