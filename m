Return-Path: <linux-next+bounces-945-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B50688452CA
	for <lists+linux-next@lfdr.de>; Thu,  1 Feb 2024 09:34:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69515290E00
	for <lists+linux-next@lfdr.de>; Thu,  1 Feb 2024 08:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C03423BC;
	Thu,  1 Feb 2024 08:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="MZSCWCMY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B06917554
	for <linux-next@vger.kernel.org>; Thu,  1 Feb 2024 08:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706776444; cv=none; b=EsZzyWnm6gwU0Bzf7P7/0Bqtr144dwMh2CA5ykqFn8SFNx36zcwmKavhZakq2PLH65w3lfHFE+TjCUr7DjB75POSBpNtOkrnhyWxoHOOnGH5I6fzYirKrGnsBBoPO+5JXgf//NBu2Ef3DiEatc6YGF9umlORdGDbY7+2fMVf4eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706776444; c=relaxed/simple;
	bh=P2oExr0Mr3qzU0qRmUsyWEctqpKcX1pMBn9tBH/ayV8=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=DMrO6O+f2ezHfDSwuIOcvwQEBsPGBQEl5DKNeup4S6ygtY2jMhquiNDbSF/KAqwwn+oEbvouXTKVpDCA3+Kt4VcyZN/RKac6MjxaDsXZp8zJFn/Nj1ANAJmA6QU3dVkM/dVqdi8ZN069M2B7LBTziWVeFZ8dxs0OWWycScdPKS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=MZSCWCMY; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d93b525959so8949235ad.0
        for <linux-next@vger.kernel.org>; Thu, 01 Feb 2024 00:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1706776441; x=1707381241; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DT79q8Lq3slAgZzNROpVp01kbXMFx5bbxf1tjqnQidg=;
        b=MZSCWCMYdNPxOX71uZVd8omBJrWQyTcOPhROeNeek8VQJNZZN6YoQPtxYdoILFJfVg
         tj6T9UlXGTOIgsY432kzs3ZMeQWDruFFblhIjpAspv61qrvGObzhIo1lgOVirw6j0FeO
         yzSIRV6wmm9g/fOCshCrC3Agax/3vS9rjBtTOYfs+2Ji3Ybx97baURvKVnCqjuWtzpSn
         ONyXcDuFFWVkFIvxuU1QfMg/HP9tj9C9E9YLhy38yZlYknxSYhlFboFxtyUxG8dABaXK
         VVELIDBC5+V0wICNdyHGnF8zfQCm2EqGs3pSfGE/tlEHftbIz2YsShY7qdHiAxCRwJP3
         DfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706776441; x=1707381241;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DT79q8Lq3slAgZzNROpVp01kbXMFx5bbxf1tjqnQidg=;
        b=RYFVpyz64b1+3vZH9h2qrj+bJHMu9jPk2rxegpbHpZUq25+nN/lsoWu8B0fWdrgtXU
         0h8a1poavFuujheFY8iHSVt9l/by0KFN8ktX62slYktKJATN2q6baM+YKeE7YZ92wUjU
         +dijOk+K4w038uYUR6mofsCG/hrn5aJM2K4NWDrWogNLYMBTYYS3+FulyZvM8F5QKTb2
         w69nH2SzQU58jsmXrUqB/2iysknRMyu0/abIpiQvhfSUnbnn2d9ePslvSAZ698aFvXLD
         ejwHB9sfE1+gbWnWNxY2KgMGreNLc2/imvX3KXx6bcCd3N7W+phVxcK7aaxPQVrfNyeY
         krtQ==
X-Gm-Message-State: AOJu0Yz3mJSRFLVUX5PhHGA0e4AYn5PaDTq5hqagHkL0954bO4jnRUvW
	ESyMgM3dY1nLvUhzezxxtAPlHzz4B0BOsRCOrZXQ/oTXThPILWSjn6FcedYsoqWxIy+ZgwnJf97
	C
X-Google-Smtp-Source: AGHT+IEKIoeDbi3ej4GgxQg3UmfNBK/P04lm6h2YgkYlVXBa99fYEOUdAYGm8WyKiA7+n4nl9i0BAQ==
X-Received: by 2002:a17:902:ce91:b0:1d8:ffe8:125c with SMTP id f17-20020a170902ce9100b001d8ffe8125cmr5917293plg.24.1706776441124;
        Thu, 01 Feb 2024 00:34:01 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX7Ajk5C1emoviHEkLqL78BjjMqYSAeeC6uA+yDzqW2MKoK7BzzMF7aikDmoU+vn+MeFw0ozyZZYoWdddbZD+ZQSBtNbuMOrq1HHMjKZD/+w9g3WAAd5DlYMXdNVndyg7nZXHXF5koiNJuyE0vmUobmOA==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id h5-20020a170902748500b001d947e65ad8sm1015390pll.251.2024.02.01.00.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 00:34:00 -0800 (PST)
Message-ID: <65bb5778.170a0220.21651.3289@mx.google.com>
Date: Thu, 01 Feb 2024 00:34:00 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc2-362-gaa052261a92da
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 93 runs,
 11 regressions (v6.8-rc2-362-gaa052261a92da)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 93 runs, 11 regressions (v6.8-rc2-362-gaa05226=
1a92da)

Regressions Summary
-------------------

platform                    | arch  | lab           | compiler | defconfig =
         | regressions
----------------------------+-------+---------------+----------+-----------=
---------+------------
kontron-kbox-a-230-ls       | arm64 | lab-kontron   | gcc-10   | defconfig =
         | 5          =

kontron-sl28-var3-ads2      | arm64 | lab-kontron   | gcc-10   | defconfig =
         | 2          =

rk3399-roc-pc               | arm64 | lab-broonie   | gcc-10   | defconfig =
         | 1          =

rk3399-rock-pi-4b           | arm64 | lab-collabora | gcc-10   | defconfig =
         | 1          =

sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe    | gcc-10   | defconfig =
         | 1          =

sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.8-rc2-362-gaa052261a92da/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-rc2-362-gaa052261a92da
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      aa052261a92da0c8cdd1dde3466f43a05a8ab0d3 =



Test Regressions
---------------- =



platform                    | arch  | lab           | compiler | defconfig =
         | regressions
----------------------------+-------+---------------+----------+-----------=
---------+------------
kontron-kbox-a-230-ls       | arm64 | lab-kontron   | gcc-10   | defconfig =
         | 5          =


  Details:     https://kernelci.org/test/plan/id/65bb268dbb6d74fdbf00a0d0

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc2-36=
2-gaa052261a92da/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc2-36=
2-gaa052261a92da/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bb268dbb6d74fdbf00a0d7
        failing since 13 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-01T05:04:51.933525  <8>[   20.231231] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 424876_1.5.2.4.1>
    2024-02-01T05:04:52.039728  / # #
    2024-02-01T05:04:52.141882  export SHELL=3D/bin/sh
    2024-02-01T05:04:52.142669  #
    2024-02-01T05:04:52.243950  / # export SHELL=3D/bin/sh. /lava-424876/en=
vironment
    2024-02-01T05:04:52.244697  =

    2024-02-01T05:04:52.345995  / # . /lava-424876/environment/lava-424876/=
bin/lava-test-runner /lava-424876/1
    2024-02-01T05:04:52.347115  =

    2024-02-01T05:04:52.365234  / # /lava-424876/bin/lava-test-runner /lava=
-424876/1
    2024-02-01T05:04:52.410123  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65bb268dbb6d74fdbf00a0db
        failing since 13 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-01T05:04:54.516311  /lava-424876/1/../bin/lava-test-case
    2024-02-01T05:04:54.516728  <8>[   22.795678] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-01T05:04:54.517028  /lava-424876/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
bb268dbb6d74fdbf00a0dd
        failing since 13 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-01T05:04:55.575732  /lava-424876/1/../bin/lava-test-case
    2024-02-01T05:04:55.576197  <8>[   23.834500] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-01T05:04:55.576559  /lava-424876/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65bb268dbb6d74fdbf00a0e2
        failing since 13 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-01T05:04:56.651139  /lava-424876/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65bb268dbb6d74fdbf00a0e3
        failing since 13 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-01T05:04:56.654292  <8>[   24.948061] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-01T05:04:57.712951  /lava-424876/1/../bin/lava-test-case
    2024-02-01T05:04:57.713435  <8>[   25.969835] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-01T05:04:57.713732  /lava-424876/1/../bin/lava-test-case   =

 =



platform                    | arch  | lab           | compiler | defconfig =
         | regressions
----------------------------+-------+---------------+----------+-----------=
---------+------------
kontron-sl28-var3-ads2      | arm64 | lab-kontron   | gcc-10   | defconfig =
         | 2          =


  Details:     https://kernelci.org/test/plan/id/65bb268e32eee6949600a07e

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc2-36=
2-gaa052261a92da/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc2-36=
2-gaa052261a92da/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65bb268e32eee6949600a085
        failing since 13 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-01T05:04:56.444199  / # #
    2024-02-01T05:04:56.545900  export SHELL=3D/bin/sh
    2024-02-01T05:04:56.546587  #
    2024-02-01T05:04:56.647667  / # export SHELL=3D/bin/sh. /lava-424879/en=
vironment
    2024-02-01T05:04:56.648276  =

    2024-02-01T05:04:56.749403  / # . /lava-424879/environment/lava-424879/=
bin/lava-test-runner /lava-424879/1
    2024-02-01T05:04:56.749757  =

    2024-02-01T05:04:56.755894  / # /lava-424879/bin/lava-test-runner /lava=
-424879/1
    2024-02-01T05:04:56.823027  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-01T05:04:56.823186  + <8>[   20.897133] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 424879_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65bb268e32eee6949600a098
        failing since 13 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-01T05:04:59.249216  /lava-424879/1/../bin/lava-test-case
    2024-02-01T05:04:59.249384  <8>[   23.312905] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-01T05:04:59.249483  /lava-424879/1/../bin/lava-test-case   =

 =



platform                    | arch  | lab           | compiler | defconfig =
         | regressions
----------------------------+-------+---------------+----------+-----------=
---------+------------
rk3399-roc-pc               | arm64 | lab-broonie   | gcc-10   | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/65bb282c88f020c57800a0dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc2-36=
2-gaa052261a92da/arm64/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-pc.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc2-36=
2-gaa052261a92da/arm64/defconfig/gcc-10/lab-broonie/baseline-rk3399-roc-pc.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bb282c88f020c57800a=
0dd
        failing since 1 day (last pass: v6.7-12142-g865a3df089bf, first fai=
l: v6.8-rc2-275-g21abc01c4bcb5) =

 =



platform                    | arch  | lab           | compiler | defconfig =
         | regressions
----------------------------+-------+---------------+----------+-----------=
---------+------------
rk3399-rock-pi-4b           | arm64 | lab-collabora | gcc-10   | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/65bb277cafb3c359c900a046

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc2-36=
2-gaa052261a92da/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-=
pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc2-36=
2-gaa052261a92da/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-=
pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bb277cafb3c359c900a=
047
        new failure (last pass: v6.8-rc2-275-g21abc01c4bcb5) =

 =



platform                    | arch  | lab           | compiler | defconfig =
         | regressions
----------------------------+-------+---------------+----------+-----------=
---------+------------
sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe    | gcc-10   | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/65bb27b7f4e223babf00a04a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc2-36=
2-gaa052261a92da/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orang=
epi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc2-36=
2-gaa052261a92da/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orang=
epi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bb27b7f4e223babf00a=
04b
        new failure (last pass: v6.8-rc2-275-g21abc01c4bcb5) =

 =



platform                    | arch  | lab           | compiler | defconfig =
         | regressions
----------------------------+-------+---------------+----------+-----------=
---------+------------
sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65bb26d01b7bab39be00a066

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc2-36=
2-gaa052261a92da/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-=
a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc2-36=
2-gaa052261a92da/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-=
a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65bb26d01b7bab39be00a=
067
        new failure (last pass: v6.8-rc2-275-g21abc01c4bcb5) =

 =20

