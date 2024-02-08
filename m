Return-Path: <linux-next+bounces-1084-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E0584E168
	for <lists+linux-next@lfdr.de>; Thu,  8 Feb 2024 14:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 551CCB28B16
	for <lists+linux-next@lfdr.de>; Thu,  8 Feb 2024 13:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E478762FE;
	Thu,  8 Feb 2024 13:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="vbc0yXrp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A15B763EE
	for <linux-next@vger.kernel.org>; Thu,  8 Feb 2024 13:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707397569; cv=none; b=SmhW+6CiHor/6sxw5oDn3JrR5Wvb31iiLq2A85dUCKS3qXSS44HZUPWFyDt3HXQBJV5dodPRZ1c1JpBhKC3n4WhG/1MR/GwwdBZ4BLnQ/kjAtVpGNbQXFNz3fiFEo20gJ51W9wYRmHF7RpK8OoThSGCI0N0TRbFVyo0BuhQncgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707397569; c=relaxed/simple;
	bh=LM0OkGNsQ1ZJ5JbPiq0oDLQFPN8hPbZ5e+TunSEGtYU=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=S4/s3+NG4+2mMn0oQZkdE7qBFheWtd8J3tDuEwTh9PBsIQtTUZ3Ba61tiDTBiF2jGomZ+tMJJo//9BJDnwMrWcPQOp1T8PhnKvWcU0+AJB3Lp2ZeMk4noK/74U9jO9sXLu5FXsczfF6lEh9DCaxk2pJEHuvZCG+hdw3mLpvbXDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=vbc0yXrp; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5d8b519e438so1539819a12.1
        for <linux-next@vger.kernel.org>; Thu, 08 Feb 2024 05:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707397564; x=1708002364; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P1vJfvOMMLIG05fWeNAmaeisxGQpJ+uULiaFNLi6de0=;
        b=vbc0yXrpEtpbiUU/MfE5HkdUbCL9uS540XnJhB1cD5p0YA8gMSTgS29VhBNxGKFyWJ
         kYf9V11EFkRLtOePYpeKiMkGS93oes87MtU3lkSBDUZiLdlvXBmquojgBQcRlqplfIDM
         HQ6pY1KUqBqcZnpIMUhHENuEd2KWRDnE6DJkK+q+8ixS1CIVDTVeouT8uDOo4fHzVBUz
         pMZ9sC+dDVSIjuNz+ySYGai/w+W8qidMmsJUCSxl0EQ/YHuuXzKtnqlR10fiBrXkeOe0
         s7gjTkbLG5P09LbaqmEyATN6L/XFahu5Me8j0vgfV5lJfN+ra4mCxiUVcStX0pMKmpGz
         NRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707397564; x=1708002364;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1vJfvOMMLIG05fWeNAmaeisxGQpJ+uULiaFNLi6de0=;
        b=oSJzgGyPw4s2povwmrRecyiOF1QqUq93Pqv45ZfcTuSEd5NYv9AAAWblpjdYdyxJG3
         Q20kdlQBY2iY3uNILDmN9nIxJs7PBOSrw8lACVRIVeXqlO5/+m0xu+VN2HdabILQub8Q
         wH2fHuYYKUZugMQh5FOD4u3VbSbfvieOtuvfmdx46a1A0ddmQwwVHEPIWFRG000YmmLK
         +9ZDjUUINaKZXQs6Abhq3IoV4St9mhjD/lomXHpUjafGSltpwJsE9KkwkVTSGETdljSv
         i0E0/oO+W6w/rKqQmvlEx0MK3Y57PpAdbhyeDOZu2f6M2NKkhbqrSoRyhrnBn8mjX0tk
         K6Sw==
X-Gm-Message-State: AOJu0YzcsArK6R2C8sf7fwaRzXDv/Mxpvt4ftx8YI8YE5q8Fo4nNUyOE
	x1WwrDh86GIe7lyTaEYounc8ZyQT9Yye1FCLX5BCO+u5d+pA0+YSWEs3jKsshVBxnBucDFjn+Cj
	Qkms=
X-Google-Smtp-Source: AGHT+IHngC8sv7zsbFsT4hNfDU5rvmP97ukN0Ila3ai4fi6aepy4pnrCyXRXYSTXT3pR6nr00e+JdA==
X-Received: by 2002:a05:6a21:3383:b0:19e:3c51:7d37 with SMTP id yy3-20020a056a21338300b0019e3c517d37mr8837433pzb.8.1707397564028;
        Thu, 08 Feb 2024 05:06:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXpw6gUZK2/bmOewC9kZ7M44f5nahp51Hmw4hRaaXDjECez4aBwohfqWzwifl2XacMiGHZc37wpPRCh0lqAdhrUryv8m2ZBfEVx0tW+35RsvMd6mYi8FFmEQgMXHVnjAVoeJVDnDrt2mP5/yoefgzf4/w==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id y9-20020aa79e09000000b006dd84763ce3sm3637275pfq.169.2024.02.08.05.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 05:06:03 -0800 (PST)
Message-ID: <65c4d1bb.a70a0220.46b60.ad40@mx.google.com>
Date: Thu, 08 Feb 2024 05:06:03 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc3-335-gcdf641895851
Subject: next/pending-fixes baseline: 86 runs,
 8 regressions (v6.8-rc3-335-gcdf641895851)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 86 runs, 8 regressions (v6.8-rc3-335-gcdf64189=
5851)

Regressions Summary
-------------------

platform                    | arch  | lab         | compiler | defconfig | =
regressions
----------------------------+-------+-------------+----------+-----------+-=
-----------
kontron-kbox-a-230-ls       | arm64 | lab-kontron | gcc-10   | defconfig | =
5          =

kontron-sl28-var3-ads2      | arm64 | lab-kontron | gcc-10   | defconfig | =
2          =

sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe  | gcc-10   | defconfig | =
1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.8-rc3-335-gcdf641895851/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-rc3-335-gcdf641895851
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      cdf641895851e4edf648a3d063e90f8f5a07e77f =



Test Regressions
---------------- =



platform                    | arch  | lab         | compiler | defconfig | =
regressions
----------------------------+-------+-------------+----------+-----------+-=
-----------
kontron-kbox-a-230-ls       | arm64 | lab-kontron | gcc-10   | defconfig | =
5          =


  Details:     https://kernelci.org/test/plan/id/65c4a07b13ca9502268e1eeb

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc3-33=
5-gcdf641895851/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc3-33=
5-gcdf641895851/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c4a07b13ca9502268e1eee
        failing since 20 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-08T09:35:33.310361  / # #
    2024-02-08T09:35:33.411314  export SHELL=3D/bin/sh
    2024-02-08T09:35:33.411919  #
    2024-02-08T09:35:33.512912  / # export SHELL=3D/bin/sh. /lava-427477/en=
vironment
    2024-02-08T09:35:33.513227  =

    2024-02-08T09:35:33.613889  / # . /lava-427477/environment/lava-427477/=
bin/lava-test-runner /lava-427477/1
    2024-02-08T09:35:33.614357  =

    2024-02-08T09:35:33.624738  / # /lava-427477/bin/lava-test-runner /lava=
-427477/1
    2024-02-08T09:35:33.665931  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-08T09:35:33.681012  + <8>[   20.635350] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 427477_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65c4a07b13ca9502268e1ef2
        failing since 20 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-08T09:35:35.785743  /lava-427477/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
c4a07b13ca9502268e1ef4
        failing since 20 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-08T09:35:36.843810  /lava-427477/1/../bin/lava-test-case
    2024-02-08T09:35:36.844035  <8>[   23.783735] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-08T09:35:36.844166  /lava-427477/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65c4a07b13ca9502268e1ef9
        failing since 20 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-08T09:35:37.920177  /lava-427477/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65c4a07b13ca9502268e1efa
        failing since 20 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-08T09:35:37.923385  <8>[   24.896126] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-08T09:35:38.982746  /lava-427477/1/../bin/lava-test-case
    2024-02-08T09:35:38.983051  <8>[   25.917651] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-08T09:35:38.983259  /lava-427477/1/../bin/lava-test-case   =

 =



platform                    | arch  | lab         | compiler | defconfig | =
regressions
----------------------------+-------+-------------+----------+-----------+-=
-----------
kontron-sl28-var3-ads2      | arm64 | lab-kontron | gcc-10   | defconfig | =
2          =


  Details:     https://kernelci.org/test/plan/id/65c4a07813ca9502268e1e85

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc3-33=
5-gcdf641895851/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc3-33=
5-gcdf641895851/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65c4a07813ca9502268e1e88
        failing since 20 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-08T09:35:34.372441  / # #
    2024-02-08T09:35:34.474533  export SHELL=3D/bin/sh
    2024-02-08T09:35:34.475282  #
    2024-02-08T09:35:34.576306  / # export SHELL=3D/bin/sh. /lava-427474/en=
vironment
    2024-02-08T09:35:34.576672  =

    2024-02-08T09:35:34.677250  / # . /lava-427474/environment/lava-427474/=
bin/lava-test-runner /lava-427474/1
    2024-02-08T09:35:34.677585  =

    2024-02-08T09:35:34.686285  / # /lava-427474/bin/lava-test-runner /lava=
-427474/1
    2024-02-08T09:35:34.747278  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-08T09:35:34.747467  + <8>[   21.023788] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 427474_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65c4a07813ca9502268e1e9b
        failing since 20 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-08T09:35:37.175789  /lava-427474/1/../bin/lava-test-case
    2024-02-08T09:35:37.176230  <8>[   23.441094] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-08T09:35:37.176534  /lava-427474/1/../bin/lava-test-case   =

 =



platform                    | arch  | lab         | compiler | defconfig | =
regressions
----------------------------+-------+-------------+----------+-----------+-=
-----------
sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe  | gcc-10   | defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/65c4a186ae9651f4c48e1f2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc3-33=
5-gcdf641895851/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orange=
pi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc3-33=
5-gcdf641895851/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orange=
pi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65c4a186ae9651f4c48e1=
f30
        failing since 0 day (last pass: v6.8-rc3-184-g749067d43da7a, first =
fail: v6.8-rc3-284-g567dd3d8c2ec) =

 =20

