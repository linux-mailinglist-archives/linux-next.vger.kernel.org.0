Return-Path: <linux-next+bounces-1165-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B24968548BD
	for <lists+linux-next@lfdr.de>; Wed, 14 Feb 2024 12:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D71801C225C2
	for <lists+linux-next@lfdr.de>; Wed, 14 Feb 2024 11:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21BE71B958;
	Wed, 14 Feb 2024 11:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="X4J5K4oM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA141B943
	for <linux-next@vger.kernel.org>; Wed, 14 Feb 2024 11:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707911378; cv=none; b=mMgDB4R319lHNszbjkGNUKrycRzTtzhb4jFffx2e1sbacpJCb7EBhyoGlC1UQJoic9Oy91YPtllOh+8naQZ2WrUrSeYg2kVsoVyv3RVUq+jVAS6AZqFEA7dwzFFuB5ymnmGIQa2c61lMMeZTItlZZkOB0RbI5W+1f3Tzjnt/yow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707911378; c=relaxed/simple;
	bh=6umT9yxsGF0/Q99TC8gzdyNGE/OE3dp5cvO4DItLK9k=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=OGIgd8aHUCr5k8fcz0bw/ONbyOJyjZNNWk0HxpLjH6sIGCVt0DqamKLzgxU/AfdBb4jrN5Ce6gVZQKiIkEwL9szhxW/tVacXiTypQc7wKLY2dR3RmoinBa3YPnoE3Y8otF0LZMepXAJUj9WO6mH1UsmUOXu6XJJkccmIqT5/xG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=X4J5K4oM; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6dc36e501e1so3594608a34.1
        for <linux-next@vger.kernel.org>; Wed, 14 Feb 2024 03:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707911374; x=1708516174; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dDkBTPirfMhJuQobrFTlwGpx1VhOaDtzc7wagrQDmfQ=;
        b=X4J5K4oMYI8aYvqGnHmdbsLtpYnkDzau/Nu2RUQ6liKG8S2qIG2xgaDPxIenY58KwI
         GQ/oY9t6h17LIy92PMWVMUjFn0BBr6qgCTQHjDlDBUpMEhYsJH/Sne7QXKytQ6sPhK5u
         Rh+uLGrssoHDCW1xRP2RniGYHSABZlWNnGI9VBVjBnLoUbg/YX+kylpgmquZaR7xm1im
         H3d9YYmmSu0iIjiNXX9NElxSI54mdLRD4OTWDRoZ2wFJ6LcHXh/TR6etOmSiKw0zsjxN
         tNm2XH9gUW7SZ0zBJQlzoHxqQtuHK+Q2xhh4nNQyVN/J5HY7K2VuOAPwBYrEh0QVjY7Z
         IuKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707911374; x=1708516174;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dDkBTPirfMhJuQobrFTlwGpx1VhOaDtzc7wagrQDmfQ=;
        b=FvTFnmRg3JsofUU36klDkXjAz5fXh83RE0WXK+v+wbSaronTbxtxyv2ibjbCdCM1QS
         ToWHcZEzOgjEu8Gnnti/RldJYiRt/ZXzhhhsoax3bAmPhN6LIl0IMYK1BNxq+mXQe944
         CZ5rCcHE23GdJ2rOI16WyDO2VoHPSKu85nVqUBAPp1Vxeqbth917GBsgg7TW3nH9gbtd
         25UW9YoeuT3nIvSnWbKh63OmZh6AWiLAhtn5rp45TFmt3vigocRxx76g8tFFvXai0gZO
         SJYqWYRUT6cqTZBKFFmhGrEK8gNG2IWGCbyZ8etETB56FNPKAre7RdmaCbPhiJh1yS4J
         jZzA==
X-Gm-Message-State: AOJu0YxUmuOtbwwlu48YVwNbjlJ6G7HU7l2akYT/g+dNFUEqRCUWwybz
	Rm77m6wfvx6eoLg3rvNGNu/bbAfu7wsQN46kGK+MqrtE3hpkcercXaYUY9H5Qs04TYn1S4lGszw
	GyJA=
X-Google-Smtp-Source: AGHT+IE67elINxhID4wdsAveYXncQlRpPbed9oA2vW2H2CYf1C6pxLnGTRwDPC9f3maC2YtG6WyRCA==
X-Received: by 2002:a05:6830:14d4:b0:6e2:f4a8:799 with SMTP id t20-20020a05683014d400b006e2f4a80799mr3199964otq.16.1707911374396;
        Wed, 14 Feb 2024 03:49:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVlsS7jaf+WXVEmCZDEO7QRTNqN1bU0PeFrNaIyLsrti5t35tFfMqJ9Da5sK2wTu8pHduyca0ZiJ9lNIH08pxf2K63fx5fkYK0e1M+xkZp/yVDR81PTg2BbazO5KwNeSk51zrFkLCFuRAvDbnBEoINjbw==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p21-20020a637f55000000b005dc4806ad7dsm4003678pgn.40.2024.02.14.03.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 03:49:33 -0800 (PST)
Message-ID: <65cca8cd.630a0220.ff3e7.cc3b@mx.google.com>
Date: Wed, 14 Feb 2024 03:49:33 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc4-334-g904accd85136
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 89 runs,
 9 regressions (v6.8-rc4-334-g904accd85136)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 89 runs, 9 regressions (v6.8-rc4-334-g904accd8=
5136)

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

rk3399-roc-pc               | arm64 | lab-broonie | gcc-10   | defconfig | =
1          =

sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe  | gcc-10   | defconfig | =
1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.8-rc4-334-g904accd85136/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-rc4-334-g904accd85136
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      904accd85136d0635854d003865dc38145a4952b =



Test Regressions
---------------- =



platform                    | arch  | lab         | compiler | defconfig | =
regressions
----------------------------+-------+-------------+----------+-----------+-=
-----------
kontron-kbox-a-230-ls       | arm64 | lab-kontron | gcc-10   | defconfig | =
5          =


  Details:     https://kernelci.org/test/plan/id/65cc77fc742311ea6c637092

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-33=
4-g904accd85136/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-33=
4-g904accd85136/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cc77fc742311ea6c637099
        failing since 26 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-14T08:20:45.807048  / # #
    2024-02-14T08:20:45.909128  export SHELL=3D/bin/sh
    2024-02-14T08:20:45.909871  #
    2024-02-14T08:20:46.011445  / # export SHELL=3D/bin/sh. /lava-429411/en=
vironment
    2024-02-14T08:20:46.012153  =

    2024-02-14T08:20:46.113601  / # . /lava-429411/environment/lava-429411/=
bin/lava-test-runner /lava-429411/1
    2024-02-14T08:20:46.114842  =

    2024-02-14T08:20:46.134282  / # /lava-429411/bin/lava-test-runner /lava=
-429411/1
    2024-02-14T08:20:46.178209  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-14T08:20:46.178600  + <8>[   20.750936] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 429411_1.5.2.4.5> =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65cc77fc742311ea6c63709d
        failing since 26 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-14T08:20:48.284623  /lava-429411/1/../bin/lava-test-case
    2024-02-14T08:20:48.285050  <8>[   22.859270] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-14T08:20:48.285362  /lava-429411/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
cc77fc742311ea6c63709f
        failing since 26 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-14T08:20:49.345040  /lava-429411/1/../bin/lava-test-case
    2024-02-14T08:20:49.345497  <8>[   23.898004] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-14T08:20:49.345792  /lava-429411/1/../bin/lava-test-case
    2024-02-14T08:20:49.346075  <8>[   23.915162] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65cc77fc742311ea6c6370a4
        failing since 26 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-14T08:20:50.422226  /lava-429411/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65cc77fc742311ea6c6370a5
        failing since 26 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-14T08:20:50.425511  <8>[   25.013443] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-14T08:20:51.483902  /lava-429411/1/../bin/lava-test-case
    2024-02-14T08:20:51.484380  <8>[   26.035113] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-14T08:20:51.484673  /lava-429411/1/../bin/lava-test-case   =

 =



platform                    | arch  | lab         | compiler | defconfig | =
regressions
----------------------------+-------+-------------+----------+-----------+-=
-----------
kontron-sl28-var3-ads2      | arm64 | lab-kontron | gcc-10   | defconfig | =
2          =


  Details:     https://kernelci.org/test/plan/id/65cc77e9742311ea6c637014

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-33=
4-g904accd85136/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-33=
4-g904accd85136/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-va=
r3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cc77e9742311ea6c63701b
        failing since 26 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-14T08:20:32.923884  / # #
    2024-02-14T08:20:33.024542  export SHELL=3D/bin/sh
    2024-02-14T08:20:33.025148  #
    2024-02-14T08:20:33.126109  / # export SHELL=3D/bin/sh. /lava-429413/en=
vironment
    2024-02-14T08:20:33.126715  =

    2024-02-14T08:20:33.227863  / # . /lava-429413/environment/lava-429413/=
bin/lava-test-runner /lava-429413/1
    2024-02-14T08:20:33.228897  =

    2024-02-14T08:20:33.238821  / # /lava-429413/bin/lava-test-runner /lava=
-429413/1
    2024-02-14T08:20:33.282040  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-14T08:20:33.300582  + <8>[   20.971260] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 429413_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65cc77e9742311ea6c63702e
        failing since 26 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-14T08:20:35.723994  /lava-429413/1/../bin/lava-test-case   =

 =



platform                    | arch  | lab         | compiler | defconfig | =
regressions
----------------------------+-------+-------------+----------+-----------+-=
-----------
rk3399-roc-pc               | arm64 | lab-broonie | gcc-10   | defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/65cc798ca49e7ba40c63713a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-33=
4-g904accd85136/arm64/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-pc.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-33=
4-g904accd85136/arm64/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-pc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cc798ca49e7ba40c637=
13b
        failing since 14 days (last pass: v6.7-12142-g865a3df089bf, first f=
ail: v6.8-rc2-275-g21abc01c4bcb5) =

 =



platform                    | arch  | lab         | compiler | defconfig | =
regressions
----------------------------+-------+-------------+----------+-----------+-=
-----------
sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe  | gcc-10   | defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/65cc78eeb7eaaf44476370bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-33=
4-g904accd85136/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orange=
pi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-33=
4-g904accd85136/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orange=
pi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cc78eeb7eaaf4447637=
0be
        new failure (last pass: v6.8-rc4-268-g7b17b1384cd64) =

 =20

