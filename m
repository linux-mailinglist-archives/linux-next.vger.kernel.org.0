Return-Path: <linux-next+bounces-1521-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B47874826
	for <lists+linux-next@lfdr.de>; Thu,  7 Mar 2024 07:26:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F8422812BE
	for <lists+linux-next@lfdr.de>; Thu,  7 Mar 2024 06:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89DB71BDE6;
	Thu,  7 Mar 2024 06:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Y9PObbaE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE0C171A4
	for <linux-next@vger.kernel.org>; Thu,  7 Mar 2024 06:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709792757; cv=none; b=DWYrp50MVFWnvKJ8X4y1geKHTuC2MJBjWL4S2Ka8WXf9KMTuMnxO0ZHuvZ2hZvjaGTUSRlNUylLAN0jbfH8+Ks0iogg8xw8D4XpuEXa/eqKLbuQi5QTudvCjbQUOmeyfJIX1DXqFKsb5DJAKtQLCYmyIGgkWV9oSUEYtzYQAWXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709792757; c=relaxed/simple;
	bh=rk5tW72kCnaVC8e5WmqJGycMOpp5VVcz3hhMXS9483s=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=nJ7IzDtuD41by/OO9L7AmK1sXsQP/TeO4s6y/6Ufrs8D0LC4C+a0IfzuhBUnbvLmpMuWr6SYOP9Uj/dYJU0mEH8e45dzopU8Wa44guYanpZbM+3eN2jq1+eR1oOWYkf+4DHAwPw4YnUYqZ5ii0E/MecbL1+j/aISIHFJ31nb9r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Y9PObbaE; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2211ae43f31so186348fac.0
        for <linux-next@vger.kernel.org>; Wed, 06 Mar 2024 22:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1709792754; x=1710397554; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VqwY/8sDsRecRA0pLqIxNVsPkkW9TwMvJqZzx/qlH0Q=;
        b=Y9PObbaEfxUZh3bZsRWOtRfzZe+8HLMdDYl5y02dB3fI0GdT7Koc0zuDadPh4F/4xg
         VoHDtWXgwnzfsYa3RVDTqeBRpo8k9WLX/W3wK+OwCyKpjnzsw8bWktGUASIhh6fjDVbZ
         lJ9Lq7BT5qPLkxo35jNjqC5uIpLRFg+shDcIup4ajn9lTGhA0Zco8MWRaaeCnfawZe31
         8gPd66CpjkUR+fbeQd9KKn6+x/xCAW7vPYUq3leX0yCcn2VT8/D8o5ylJHpEhkUAwYBB
         iTl9rKgHovmBNnjpmyEBbmz1L9QW7JjZ5cCG2jwfGVUemJQMl/hVygmJJlRJVdpYXLh7
         /zew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709792754; x=1710397554;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VqwY/8sDsRecRA0pLqIxNVsPkkW9TwMvJqZzx/qlH0Q=;
        b=VXffiB9nPUuDDQm+1rckA6b/vuWWLXq+WdS3EHjP2dWUbhRMndfRG4d04oYkkkS54g
         fMAqgNaifeblPfS6nD0FA6Jtv1wcU9Ix/YgADyuLNFCRAZhynfgfX0csKsHgIAL4B6rn
         1UwXd7j6F/I4kYaANWu+dQrON5OOwEeJ2WW2yL9f7oJjSIkmCiuNCjXlxUVcjEg7Le+A
         a/WUeh+EkH4+SqQ08VZTn9F7rOI9OR3jSKlrp+0lUqPWAPywX7wNZwuTbhny//vrz0PS
         LFR3x4zBGNlgw0a3XMvfeYLZEmCWJpUUu+vfK/zjRZTrNu6K1PSeOEBBbJKudORw0qoL
         PJPw==
X-Gm-Message-State: AOJu0Yw84Rc9mPT8ZAehhtIPEOAhLCYJppUQjHc5+T5EUCQE3BjppxmP
	/yMiDljg2l+hZ8vU4GqYrEYaV5fUfdN6n69gv1+H5JzYu9inhi3YcP1gzLFGkXZbK/OpDUdSqn0
	GZZU=
X-Google-Smtp-Source: AGHT+IEu+6Qh4PzcUKsFCDMLSXKiqifJ1D8aHLorkfaBfW1VyfkqOkdCjCMPO5bjr6khHfO9ykTh9g==
X-Received: by 2002:a05:6870:c186:b0:21e:623b:176 with SMTP id h6-20020a056870c18600b0021e623b0176mr7427704oad.33.1709792754065;
        Wed, 06 Mar 2024 22:25:54 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id y16-20020aa79e10000000b006e659d57d21sm579421pfq.189.2024.03.06.22.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 22:25:53 -0800 (PST)
Message-ID: <65e95df1.a70a0220.21ef9.20cc@mx.google.com>
Date: Wed, 06 Mar 2024 22:25:53 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc7-220-ga5971604f9bd1
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 79 runs,
 8 regressions (v6.8-rc7-220-ga5971604f9bd1)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 79 runs, 8 regressions (v6.8-rc7-220-ga5971604=
f9bd1)

Regressions Summary
-------------------

platform               | arch  | lab         | compiler | defconfig        =
  | regressions
-----------------------+-------+-------------+----------+------------------=
--+------------
beaglebone-black       | arm   | lab-cip     | gcc-10   | multi_v7_defconfi=
g | 1          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig        =
  | 5          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig        =
  | 2          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.8-rc7-220-ga5971604f9bd1/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-rc7-220-ga5971604f9bd1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a5971604f9bd13c9515578313f1eb14807eb1e08 =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig        =
  | regressions
-----------------------+-------+-------------+----------+------------------=
--+------------
beaglebone-black       | arm   | lab-cip     | gcc-10   | multi_v7_defconfi=
g | 1          =


  Details:     https://kernelci.org/test/plan/id/65e93720c3f6d8a7104c4356

  Results:     40 PASS, 9 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc7-22=
0-ga5971604f9bd1/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc7-22=
0-ga5971604f9bd1/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/65e93720c3f6d8a7=
104c435b
        new failure (last pass: v6.8-rc7-177-g6894e1c0fb7d)
        1 lines

    2024-03-07T03:39:41.814295  / # =

    2024-03-07T03:39:41.820396  =

    2024-03-07T03:39:41.923764  / # #
    2024-03-07T03:39:41.929712  #
    2024-03-07T03:39:42.030947  / # export SHELL=3D/bin/sh
    2024-03-07T03:39:42.037144  export SHELL=3D/bin/sh
    2024-03-07T03:39:42.138088  / # . /lava-1104289/environment
    2024-03-07T03:39:42.144255  . /lava-1104289/environment
    2024-03-07T03:39:42.245275  / # /lava-1104289/bin/lava-test-runner /lav=
a-1104289/0
    2024-03-07T03:39:42.250210  /lava-1104289/bin/lava-test-runner /lava-11=
04289/0 =

    ... (9 line(s) more)  =

 =



platform               | arch  | lab         | compiler | defconfig        =
  | regressions
-----------------------+-------+-------------+----------+------------------=
--+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig        =
  | 5          =


  Details:     https://kernelci.org/test/plan/id/65e92d0961bb5e01974c43a3

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc7-22=
0-ga5971604f9bd1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc7-22=
0-ga5971604f9bd1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e92d0961bb5e01974c43aa
        failing since 48 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-07T02:56:50.832766  <8>[   20.134419] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 439797_1.5.2.4.1>
    2024-03-07T02:56:50.938120  / # #
    2024-03-07T02:56:51.040298  export SHELL=3D/bin/sh
    2024-03-07T02:56:51.041004  #
    2024-03-07T02:56:51.142390  / # export SHELL=3D/bin/sh. /lava-439797/en=
vironment
    2024-03-07T02:56:51.143099  =

    2024-03-07T02:56:51.244496  / # . /lava-439797/environment/lava-439797/=
bin/lava-test-runner /lava-439797/1
    2024-03-07T02:56:51.245645  =

    2024-03-07T02:56:51.265351  / # /lava-439797/bin/lava-test-runner /lava=
-439797/1
    2024-03-07T02:56:51.308220  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65e92d0961bb5e01974c43ae
        failing since 48 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-07T02:56:53.415030  /lava-439797/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
e92d0961bb5e01974c43b0
        failing since 48 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-07T02:56:54.473080  /lava-439797/1/../bin/lava-test-case
    2024-03-07T02:56:54.473474  <8>[   23.736629] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-03-07T02:56:54.473715  /lava-439797/1/../bin/lava-test-case
    2024-03-07T02:56:54.473960  <8>[   23.754151] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65e92d0961bb5e01974c43b5
        failing since 48 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-07T02:56:55.551634  /lava-439797/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65e92d0961bb5e01974c43b6
        failing since 48 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-07T02:56:55.554777  <8>[   24.851985] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-07T02:56:56.608461  /lava-439797/1/../bin/lava-test-case
    2024-03-07T02:56:56.608689  <8>[   25.873600] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-03-07T02:56:56.608853  /lava-439797/1/../bin/lava-test-case   =

 =



platform               | arch  | lab         | compiler | defconfig        =
  | regressions
-----------------------+-------+-------------+----------+------------------=
--+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig        =
  | 2          =


  Details:     https://kernelci.org/test/plan/id/65e92d0761bb5e01974c433a

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc7-22=
0-ga5971604f9bd1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc7-22=
0-ga5971604f9bd1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e92d0761bb5e01974c4341
        failing since 48 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-07T02:56:51.053949  / # #
    2024-03-07T02:56:51.155950  export SHELL=3D/bin/sh
    2024-03-07T02:56:51.156656  #
    2024-03-07T02:56:51.258089  / # export SHELL=3D/bin/sh. /lava-439795/en=
vironment
    2024-03-07T02:56:51.258804  =

    2024-03-07T02:56:51.360072  / # . /lava-439795/environment/lava-439795/=
bin/lava-test-runner /lava-439795/1
    2024-03-07T02:56:51.361252  =

    2024-03-07T02:56:51.365869  / # /lava-439795/bin/lava-test-runner /lava=
-439795/1
    2024-03-07T02:56:51.433807  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-07T02:56:51.434278  + <8>[   20.962932] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 439795_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65e92d0761bb5e01974c4354
        failing since 48 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-07T02:56:53.871711  /lava-439795/1/../bin/lava-test-case
    2024-03-07T02:56:53.872122  <8>[   23.388335] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-07T02:56:53.872429  /lava-439795/1/../bin/lava-test-case   =

 =20

