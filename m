Return-Path: <linux-next+bounces-1195-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2F285755C
	for <lists+linux-next@lfdr.de>; Fri, 16 Feb 2024 05:41:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34E79284BDC
	for <lists+linux-next@lfdr.de>; Fri, 16 Feb 2024 04:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABBBB12E5D;
	Fri, 16 Feb 2024 04:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="A6AbzN6d"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531E912E47
	for <linux-next@vger.kernel.org>; Fri, 16 Feb 2024 04:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708058504; cv=none; b=ZkI/8qhVZoyjU/lr2+oKEZvChh5UG6Gt6O8LW63OwoPtxddQFWDjXkg5ymuKhVVVnAOXhYImETn5qUkj853AYFGWAkxkQnhS4jNHjoPBQwArH3RuZUlz8AW3UT5k8yVBZ/04prdGK1RLiD5Zxdj+dPhoGgBm4oq1YMM8ShHHaAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708058504; c=relaxed/simple;
	bh=ZQ6FJfpJPTP7Iyq9QstofcXsyintK6quYFZPTLeY19o=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Be5bzIPYNIECSVryVvWxq+L+RBbarGtlZwM3IuRL6J7P1Sn4aGa68cCsbc4x4VVeh2Oitg0RUnIOe3l0rxJN3THWRnOKHrr5ARp0ARaGGMnqelieTKMbeLO/WH5jsSbEKPbqDLl96P33sxA3nNeXGhhIZkbH5HT0diM2OFUw7yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=A6AbzN6d; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3c0496f494cso1568452b6e.1
        for <linux-next@vger.kernel.org>; Thu, 15 Feb 2024 20:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708058501; x=1708663301; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6C0hIPgNmkOVdgyZByEtC7F5cLnvtSSe14wSK/pd270=;
        b=A6AbzN6dBar6daFNbRTQoUrE3xW0+lhkPiRZFqslI2mfihksEsrxUEA22IQ8vYCS19
         aN1RxIU637usKUqWvvF46E78Z2/+GGqi0efdC7lYZIarmoWXUhjIAfkjHcKfzUp5/7fj
         2AFLQW/0rS+47jNGg97FLKNPwmh1N7YpV5IIPIKFBUelIROBe21+NkLC7nC7ZlowMLYS
         z8oRonCBeUPLsNwi8w9B4teBwGTwJ8ax24yg6Gve2917JTtxPVQf8t/RAV8Cp4B876XK
         MHlzP4KBjgos9/fyuu1isv14sQYSWz9t2Ee/OaRX0AhzFRfat9XjXXW4nqutLYpRm+BT
         7ZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708058501; x=1708663301;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6C0hIPgNmkOVdgyZByEtC7F5cLnvtSSe14wSK/pd270=;
        b=EhCMTALwpKzDKlWd/vpTthYuqnp7CeJovOKSgDLSPpVj3Hf0WH91pGzhQcOpnPMwWp
         ZQmZt7lQdg10bQFVEHnB0MYvqrxUsyqgSs3y9WEooCHfpVKI33nlKAgEW4rjRt6qrhuZ
         M/dOwAacnHS07hKsHoBbigr+Ujvb66u2vepZpmhrmHkAQFMMqi6z7bdLu5xJcdlxN7t9
         jFSXiA+xSHQQPprGxInwjGl0xonyQ4JZwilj2lQMQGL+AK9CcUZdEPN9YuT+pXFcjwUI
         Q0L95MLk/iuQqR9wLOlF4otpKuPac51RW/+XZ+lmmAjvx5CaB/NWQxr4OkcFKxMXaVna
         /V5A==
X-Gm-Message-State: AOJu0YwwJanmVq54Kc3ayTK2hH1rpBDd1bU3bgBThXBkLoY0nhrbBPX6
	324A9wcyq0Qt3tfsuz0Ddvn+65mUytdXzgJ2ghK5FCNYw7oMFy98sDGivq+lCuDhmZ+x/eiP4vK
	tkBE=
X-Google-Smtp-Source: AGHT+IE3d5gdq00HvfXWmasOcVPsmGcUQKHkfK1XU46v8xwGW+zQ5LkcHWEtttL1e9cAudUI3LMhBw==
X-Received: by 2002:a05:6808:e85:b0:3c0:45ff:9614 with SMTP id k5-20020a0568080e8500b003c045ff9614mr4918452oil.7.1708058500784;
        Thu, 15 Feb 2024 20:41:40 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id w8-20020aa79a08000000b006e04ca18c2bsm2151515pfj.196.2024.02.15.20.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 20:41:40 -0800 (PST)
Message-ID: <65cee784.a70a0220.2c23d.8604@mx.google.com>
Date: Thu, 15 Feb 2024 20:41:40 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc4-436-ga8f5f47b9dc3
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 89 runs,
 9 regressions (v6.8-rc4-436-ga8f5f47b9dc3)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 89 runs, 9 regressions (v6.8-rc4-436-ga8f5f47b=
9dc3)

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

rk3399-roc-pc          | arm64 | lab-broonie   | gcc-10   | defconfig | 1  =
        =

sun50i-h6-pine-h64     | arm64 | lab-collabora | gcc-10   | defconfig | 1  =
        =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.8-rc4-436-ga8f5f47b9dc3/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-rc4-436-ga8f5f47b9dc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a8f5f47b9dc3b207e4d0f7bfcc893907a5047d59 =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig | reg=
ressions
-----------------------+-------+---------------+----------+-----------+----=
--------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig | 5  =
        =


  Details:     https://kernelci.org/test/plan/id/65ceb696fcdc27b56b637038

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-43=
6-ga8f5f47b9dc3/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-43=
6-ga8f5f47b9dc3/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ceb696fcdc27b56b63703b
        failing since 28 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-16T01:12:31.324019  /#
    2024-02-16T01:12:31.426439   # #export SHELL=3D/bin/sh
    2024-02-16T01:12:31.427198  =

    2024-02-16T01:12:31.528633  / # export SHELL=3D/bin/sh. /lava-430716/en=
vironment
    2024-02-16T01:12:31.529441  =

    2024-02-16T01:12:31.630774  / # . /lava-430716/environment/lava-430716/=
bin/lava-test-runner /lava-430716/1
    2024-02-16T01:12:31.632051  =

    2024-02-16T01:12:31.651403  / # /lava-430716/bin/lava-test-runner /lava=
-430716/1
    2024-02-16T01:12:31.694650  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-16T01:12:31.695093  + <8>[   20.406441] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 430716_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65ceb696fcdc27b56b63703f
        failing since 28 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-16T01:12:33.797826  /lava-430716/1/../bin/lava-test-case
    2024-02-16T01:12:33.798293  <8>[   22.511568] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-16T01:12:33.798546  /lava-430716/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
ceb696fcdc27b56b637041
        failing since 28 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-16T01:12:34.858664  /lava-430716/1/../bin/lava-test-case
    2024-02-16T01:12:34.859148  <8>[   23.549219] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-16T01:12:34.859449  /lava-430716/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65ceb696fcdc27b56b637046
        failing since 28 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-16T01:12:35.937485  /lava-430716/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65ceb696fcdc27b56b637047
        failing since 28 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-16T01:12:35.940757  <8>[   24.667617] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-16T01:12:36.995237  /lava-430716/1/../bin/lava-test-case
    2024-02-16T01:12:36.995708  <8>[   25.689220] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-16T01:12:36.996002  /lava-430716/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig | reg=
ressions
-----------------------+-------+---------------+----------+-----------+----=
--------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig | 2  =
        =


  Details:     https://kernelci.org/test/plan/id/65ceb69358e4ae375163702c

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-43=
6-ga8f5f47b9dc3/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-43=
6-ga8f5f47b9dc3/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ceb69358e4ae375163702f
        failing since 28 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-16T01:12:34.571769  / # #
    2024-02-16T01:12:34.673746  export SHELL=3D/bin/sh
    2024-02-16T01:12:34.674511  #
    2024-02-16T01:12:34.775900  / # export SHELL=3D/bin/sh. /lava-430715/en=
vironment
    2024-02-16T01:12:34.776623  =

    2024-02-16T01:12:34.878226  / # . /lava-430715/environment/lava-430715/=
bin/lava-test-runner /lava-430715/1
    2024-02-16T01:12:34.879372  =

    2024-02-16T01:12:34.883596  / # /lava-430715/bin/lava-test-runner /lava=
-430715/1
    2024-02-16T01:12:34.951764  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-16T01:12:34.952205  + <8>[   21.174859] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 430715_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65ceb69458e4ae3751637042
        failing since 28 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-16T01:12:37.388355  /lava-430715/1/../bin/lava-test-case
    2024-02-16T01:12:37.388848  <8>[   23.599247] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-16T01:12:37.389151  /lava-430715/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig | reg=
ressions
-----------------------+-------+---------------+----------+-----------+----=
--------
rk3399-roc-pc          | arm64 | lab-broonie   | gcc-10   | defconfig | 1  =
        =


  Details:     https://kernelci.org/test/plan/id/65ceb9400b71653db063701f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-43=
6-ga8f5f47b9dc3/arm64/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-pc.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-43=
6-ga8f5f47b9dc3/arm64/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-pc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65ceb9400b71653db0637=
020
        failing since 16 days (last pass: v6.7-12142-g865a3df089bf, first f=
ail: v6.8-rc2-275-g21abc01c4bcb5) =

 =



platform               | arch  | lab           | compiler | defconfig | reg=
ressions
-----------------------+-------+---------------+----------+-----------+----=
--------
sun50i-h6-pine-h64     | arm64 | lab-collabora | gcc-10   | defconfig | 1  =
        =


  Details:     https://kernelci.org/test/plan/id/65ceb7cf9bc6fa3194637014

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-43=
6-ga8f5f47b9dc3/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pin=
e-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-43=
6-ga8f5f47b9dc3/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pin=
e-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65ceb7cf9bc6fa3194637=
015
        new failure (last pass: v6.8-rc4-371-g9d5dae6199a2) =

 =20

