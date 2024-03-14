Return-Path: <linux-next+bounces-1633-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A187C87B7DA
	for <lists+linux-next@lfdr.de>; Thu, 14 Mar 2024 07:19:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E17FBB21C5A
	for <lists+linux-next@lfdr.de>; Thu, 14 Mar 2024 06:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D126CC8F3;
	Thu, 14 Mar 2024 06:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="NnaFOv76"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A293C8F7A
	for <linux-next@vger.kernel.org>; Thu, 14 Mar 2024 06:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710397183; cv=none; b=ZDcUnhCoFzbKiadAdZT87y/RLJDoQTd5mWQQBjqbx0HmrCBqfdXn9lcUE8Qmu/8CpzCha5n/cUhB6hMSqg8JXd3IWPi3bfdgM8KIpAfi4wBwz7Om37yYXLBZxZQLxWqVoFatTZg1VfxsuUp8lY2/Ma7WIH5Nd1D/2hPZNO1Y1go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710397183; c=relaxed/simple;
	bh=OZZASWAMUEJo+m2Zt1FUckHaRq4/DTFMmFd7D0YzKms=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=PB03ZTUT4LxPBa8CWmou1VWkIbibETU9EO0wcN0Hfo7+pRMwO/M3akFJwBacHjHyuJLlZHJv52yHY9SVwFfmizZAfEcszJ0/COoQ9NpwVSVzNSssJ52Lhzo3qONxugsqmyG47YokhUz47S6s7Ylh+Bz+2TMjPeOhYCMNKew2Uhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=NnaFOv76; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e6aaa2f02cso533713b3a.2
        for <linux-next@vger.kernel.org>; Wed, 13 Mar 2024 23:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1710397180; x=1711001980; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vasSQevnhyGbBHlXOYKvU/gaOxeziZoRjwI48wqJhho=;
        b=NnaFOv766q0JYfmG9tCik4Hxrr2f7Xh7B+jtE7yZhGdDx9vd/w8Ks/mErAxNCNGybn
         GlpAh9td3ocFZ9qaN9m5jOoafMI+94jkVllSNH1LDrgc7MYvfPVHvqJq7UDvTfLBmxvW
         Z4+y2RHH+pNiMbsQTDntQUk+ZPvfL5n3JLcFkB/ETPN+Rz31E69Iea4C1GwWPSufT5R2
         CUgt8B25/jh3rKTGYdEssT5D9GfaCwU1GFlBi8ly63pebNH9LCmqIuuVTkAQw/2EEgvP
         c0kbYr5Y/PXqN5nUzcc3xb8jK0CIUoJiHi5kPb5+NFYoIRMjRgX8ipVZWK9MbEBhY/oq
         mQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710397180; x=1711001980;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vasSQevnhyGbBHlXOYKvU/gaOxeziZoRjwI48wqJhho=;
        b=RqGtWSsFPoCDWFlOiE7bBNcuuzNXwKdx73/zNuoxN9+HXJm3lSiIpYJKBIbmgP+jfT
         MT2MipRIzVErdHDGr/jw2H1RztSIgh71Fy3B93rrOTof4HvCWHhzIkynKXClrpRlbLsi
         kwsMOqScwhNa2aViS1U7je0xnbqpMYm/KU2u2SbLazgNP/lK3uTbmi+/oIhGWOEk0TOc
         Fk3nZljTnolLK8zwruOV+AxuiykUUZD3AtxcuVJhitWOyw2HRxDfEZIZ5GeYbLcSw+Fr
         W7KK+65bMshlmNH0mPUpoKTx+KCTs1hD2vVeRTOkKTfVxmNSeKwPl+MbJLuq3ni2x7qe
         bhhQ==
X-Gm-Message-State: AOJu0Yzk2SaWk5YnXyiFS79dscPkteIFg9sfZOFQvo69cqWaFb1fUGsv
	jSvQaZWV9LZsrh1lOM2Dn8frexCl1khqBbgm6QU9QEBdrnXbO78rW5PuyiTWTOmyB8vhpq+U9t+
	J
X-Google-Smtp-Source: AGHT+IEtlN8WSp+X8X+6yav9XHMe8dgWwdPXvzKTet5iA5qqJhxnWcfokBao5da06k9yHaQ4f8GE6A==
X-Received: by 2002:a05:6a20:2585:b0:1a3:3e17:600e with SMTP id k5-20020a056a20258500b001a33e17600emr994790pzd.52.1710397180384;
        Wed, 13 Mar 2024 23:19:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d12-20020a170902cecc00b001d91d515dffsm717645plg.156.2024.03.13.23.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 23:19:39 -0700 (PDT)
Message-ID: <65f296fb.170a0220.8bf95.227c@mx.google.com>
Date: Wed, 13 Mar 2024 23:19:39 -0700 (PDT)
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
X-Kernelci-Kernel: v6.8-7223-gd5f8ee808c59
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 74 runs,
 10 regressions (v6.8-7223-gd5f8ee808c59)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 74 runs, 10 regressions (v6.8-7223-gd5f8ee808c=
59)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig |=
 1          =

juno-uboot               | arm64 | lab-broonie     | gcc-10   | defconfig |=
 1          =

kontron-kbox-a-230-ls    | arm64 | lab-kontron     | gcc-10   | defconfig |=
 5          =

kontron-sl28-var3-ads2   | arm64 | lab-kontron     | gcc-10   | defconfig |=
 2          =

zynqmp-zcu102            | arm64 | lab-cip         | gcc-10   | defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.8-7223-gd5f8ee808c59/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-7223-gd5f8ee808c59
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d5f8ee808c593453ce8e74b31159acca3cfe04a3 =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/65f2663099409c50314c4350

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-7223-g=
d5f8ee808c59/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocom=
m-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-7223-g=
d5f8ee808c59/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocom=
m-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f2663099409c50314c4=
351
        new failure (last pass: v6.8-1078-g60fac05b309d) =

 =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
juno-uboot               | arm64 | lab-broonie     | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/65f26878436bd290724c4310

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-7223-g=
d5f8ee808c59/arm64/defconfig/gcc-10/lab-broonie/baseline-juno-uboot.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-7223-g=
d5f8ee808c59/arm64/defconfig/gcc-10/lab-broonie/baseline-juno-uboot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f26878436bd290724c4=
311
        new failure (last pass: v6.8-1078-g60fac05b309d) =

 =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
kontron-kbox-a-230-ls    | arm64 | lab-kontron     | gcc-10   | defconfig |=
 5          =


  Details:     https://kernelci.org/test/plan/id/65f2661263f45363c54c4320

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-7223-g=
d5f8ee808c59/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230=
-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-7223-g=
d5f8ee808c59/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230=
-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f2661263f45363c54c4327
        failing since 55 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-14T02:50:31.517190  / # #
    2024-03-14T02:50:31.619336  export SHELL=3D/bin/sh
    2024-03-14T02:50:31.620046  #
    2024-03-14T02:50:31.721332  / # export SHELL=3D/bin/sh. /lava-442820/en=
vironment
    2024-03-14T02:50:31.721977  =

    2024-03-14T02:50:31.823371  / # . /lava-442820/environment/lava-442820/=
bin/lava-test-runner /lava-442820/1
    2024-03-14T02:50:31.824546  =

    2024-03-14T02:50:31.829022  / # /lava-442820/bin/lava-test-runner /lava=
-442820/1
    2024-03-14T02:50:31.887084  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-14T02:50:31.887516  + <8>[   20.511164] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 442820_1.5.2.4.5> =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65f2661263f45363c54c432b
        failing since 55 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-14T02:50:33.992800  /lava-442820/1/../bin/lava-test-case
    2024-03-14T02:50:33.993230  <8>[   22.617701] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-03-14T02:50:33.993535  /lava-442820/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
f2661263f45363c54c432d
        failing since 55 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-14T02:50:35.051274  /lava-442820/1/../bin/lava-test-case
    2024-03-14T02:50:35.051777  <8>[   23.656958] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65f2661263f45363c54c4332
        failing since 55 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-14T02:50:36.127366  /lava-442820/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65f2661263f45363c54c4333
        failing since 55 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-14T02:50:36.130650  <8>[   24.770147] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-14T02:50:37.189901  /lava-442820/1/../bin/lava-test-case
    2024-03-14T02:50:37.190399  <8>[   25.790646] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-03-14T02:50:37.190751  /lava-442820/1/../bin/lava-test-case   =

 =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
kontron-sl28-var3-ads2   | arm64 | lab-kontron     | gcc-10   | defconfig |=
 2          =


  Details:     https://kernelci.org/test/plan/id/65f2660f9bb1dd5f1c4c42df

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-7223-g=
d5f8ee808c59/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-=
ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-7223-g=
d5f8ee808c59/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-=
ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f2660f9bb1dd5f1c4c42e6
        failing since 55 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-14T02:50:37.034556  / # #
    2024-03-14T02:50:37.136532  export SHELL=3D/bin/sh
    2024-03-14T02:50:37.137221  #
    2024-03-14T02:50:37.238774  / # export SHELL=3D/bin/sh. /lava-442819/en=
vironment
    2024-03-14T02:50:37.239478  =

    2024-03-14T02:50:37.340901  / # . /lava-442819/environment/lava-442819/=
bin/lava-test-runner /lava-442819/1
    2024-03-14T02:50:37.342081  =

    2024-03-14T02:50:37.346396  / # /lava-442819/bin/lava-test-runner /lava=
-442819/1
    2024-03-14T02:50:37.414167  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-14T02:50:37.414549  + <8>[   20.985062] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 442819_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65f2660f9bb1dd5f1c4c42f9
        failing since 55 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-14T02:50:39.819908  /lava-442819/1/../bin/lava-test-case
    2024-03-14T02:50:39.820138  <8>[   23.401433] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-14T02:50:39.820326  /lava-442819/1/../bin/lava-test-case   =

 =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
zynqmp-zcu102            | arm64 | lab-cip         | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/65f26724beae4242e44c42db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-7223-g=
d5f8ee808c59/arm64/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-7223-g=
d5f8ee808c59/arm64/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f26724beae4242e44c4=
2dc
        new failure (last pass: v6.8-1078-g60fac05b309d) =

 =20

