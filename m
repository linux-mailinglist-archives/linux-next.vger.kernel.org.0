Return-Path: <linux-next+bounces-1244-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3880C85C5EB
	for <lists+linux-next@lfdr.de>; Tue, 20 Feb 2024 21:35:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B6C21C20B91
	for <lists+linux-next@lfdr.de>; Tue, 20 Feb 2024 20:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D7E14F9CE;
	Tue, 20 Feb 2024 20:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="bhTj/eKk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587C576C89
	for <linux-next@vger.kernel.org>; Tue, 20 Feb 2024 20:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708461279; cv=none; b=bIgbm6C6bT6R0nNXBam+sOka3qi0ckeQ5cc9nBjvBIWlZPEzxUObrl9YG/1q/7CYwYKaxxzKVMn3eNt4r1aRdDKqUVuLIpe39kbVmKxEgIkXmOQ8f1Oqv0efIzwEGK6TcuWuAkTS3xzLE2qQJ9/GFPPCsCwSfKYIJyfyIL0La+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708461279; c=relaxed/simple;
	bh=kFRQrL5bZQrx+OQsoRj/L3qhw9Y72EB/Rr10SeBJpa4=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=IknpBzifJ1mCvIhwc8VdfCbJOLgm2XpRZr97LK6rcOBf9ruSF+2bvo8g9sSt9ydar1XlTB0YzE6lh8r1d/CVd7w9Xem7covJN815C+lsz+lEN0xw1f3BieW24P0Zyn8EdeNirDkANumJY81QSDM6tYMv5zzAiUcPGoFyhef4uMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=bhTj/eKk; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1dbae7b8ff2so23750105ad.3
        for <linux-next@vger.kernel.org>; Tue, 20 Feb 2024 12:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708461276; x=1709066076; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mZjkxaVxNKElKnhMAuxgfH1Bq4g8HJd5GIoZlrjGboM=;
        b=bhTj/eKknM/xT/X1XpeeGMNfvOhXBxSaNlc2gYe3vTZ8Em9HlCn0CXLzywKzoOIw7A
         wIrtGXRS1KJs1NAxPiX8Ay8GNnNq0wT16oS/bFvz1C/mBu2eiMUWQnyFQIpYES0A4fF8
         af+tH+APRUpjCY7nb2jaI41ceP2JspcckSrhYC0BqEVIzWBf640G1NjlxnFkkrlHANKB
         mqXgqz/8uhvGL1AePltiE3s8/YIG33EsjZpA/ckw+Ceu5dci6/lMrjoPTYdLxfix2hGv
         ntZZSNn6ocaYkvj8nomr2uZkmlVLAoXdW2KUa7haEemrNa6eRFnBKFImvnfh3NcgAD/K
         YmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708461276; x=1709066076;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mZjkxaVxNKElKnhMAuxgfH1Bq4g8HJd5GIoZlrjGboM=;
        b=LWiu68ilgEuP4leJ20e1PZT+QdRlzInEB5pi/wb8Z29o/wBkAHOnKTsRvtM2Kzg3Bb
         A9NCaMtTxurwh82X+L80XSCnckpZmtEiZgOQtznSpk6OUQFnGfZVa0DWjlCoOklGsjZ2
         xamaS6sp9KL9gXb8begR+Q0VzFC6teFwgKk/S0dGDg5U0kZ3ijpWXRUX/q85VzsV0U3A
         VGFKFfTOxEokcVf5i10sND+pcCfXSBvQh6A1dV1mgFK+kYk7JyT5xebUvXHCGcQdOqYs
         mkzkwtSJSDcyiaWuap8ubHnuui6t7UIPxJmoY0LVgy/s8orrSoa8+IjcR42qFD0vnjeJ
         27KQ==
X-Gm-Message-State: AOJu0YxLtRtl8K0pm3cTL0025Lw3pmV6FzdqS9pai0CD209oUCRDS7lY
	YG1kpgks+ayvEkcyBz9caiS63NuvVRPd/1YmpnN2DhQqI4tJCuo9yGQzTe2U8plCdrBZB/dN1jx
	a87I=
X-Google-Smtp-Source: AGHT+IGNc1QdedHJWlE2slwIA8Z3HqfNf0TcCWbnbU5HM+N9RVIRvv/G0J3xp3mMRZt4kzU29+nnfg==
X-Received: by 2002:a17:902:a70d:b0:1d9:3843:3f07 with SMTP id w13-20020a170902a70d00b001d938433f07mr14874934plq.61.1708461275918;
        Tue, 20 Feb 2024 12:34:35 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902e9c600b001db45b65e13sm6592463plk.279.2024.02.20.12.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 12:34:35 -0800 (PST)
Message-ID: <65d50cdb.170a0220.11276.4b9a@mx.google.com>
Date: Tue, 20 Feb 2024 12:34:35 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc5-216-g139b564a6aa7b
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 72 runs,
 8 regressions (v6.8-rc5-216-g139b564a6aa7b)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 72 runs, 8 regressions (v6.8-rc5-216-g139b564a=
6aa7b)

Regressions Summary
-------------------

platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
imx53-qsrb             | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig | 1          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 5          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 2          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.8-rc5-216-g139b564a6aa7b/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-rc5-216-g139b564a6aa7b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      139b564a6aa7bdb227c3378775ca6f39d5ad7614 =



Test Regressions
---------------- =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
imx53-qsrb             | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65d4dbd9cf6341886363702f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-21=
6-g139b564a6aa7b/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-21=
6-g139b564a6aa7b/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d4dbd9cf63418863637038
        failing since 386 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2024-02-20T17:05:06.348292  + set +x
    2024-02-20T17:05:06.348533  [   13.466092] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1026141_1.5.2.3.1>
    2024-02-20T17:05:06.455575  / # #
    2024-02-20T17:05:06.556749  export SHELL=3D/bin/sh
    2024-02-20T17:05:06.557370  #
    2024-02-20T17:05:06.658519  / # export SHELL=3D/bin/sh. /lava-1026141/e=
nvironment
    2024-02-20T17:05:06.659047  =

    2024-02-20T17:05:06.759901  / # . /lava-1026141/environment/lava-102614=
1/bin/lava-test-runner /lava-1026141/1
    2024-02-20T17:05:06.760566  =

    2024-02-20T17:05:06.764019  / # /lava-1026141/bin/lava-test-runner /lav=
a-1026141/1 =

    ... (13 line(s) more)  =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 5          =


  Details:     https://kernelci.org/test/plan/id/65d4d98b429c2792b2637089

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-21=
6-g139b564a6aa7b/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-21=
6-g139b564a6aa7b/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d4d98b429c2792b2637090
        failing since 32 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-20T16:55:19.676475  <8>[   20.162627] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 432735_1.5.2.4.1>
    2024-02-20T16:55:19.781804  / # #
    2024-02-20T16:55:19.884142  export SHELL=3D/bin/sh
    2024-02-20T16:55:19.884476  #
    2024-02-20T16:55:19.985127  / # export SHELL=3D/bin/sh. /lava-432735/en=
vironment
    2024-02-20T16:55:19.985764  =

    2024-02-20T16:55:20.087018  / # . /lava-432735/environment/lava-432735/=
bin/lava-test-runner /lava-432735/1
    2024-02-20T16:55:20.088031  =

    2024-02-20T16:55:20.130091  / # /lava-432735/bin/lava-test-runner /lava=
-432735/1
    2024-02-20T16:55:20.150664  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (19 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65d4d98b429c2792b2637094
        failing since 32 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-20T16:55:22.256952  /lava-432735/1/../bin/lava-test-case
    2024-02-20T16:55:22.257391  <8>[   22.733006] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-20T16:55:22.257707  /lava-432735/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
d4d98b429c2792b2637096
        failing since 32 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-20T16:55:23.316028  /lava-432735/1/../bin/lava-test-case
    2024-02-20T16:55:23.316487  <8>[   23.770646] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-20T16:55:23.316797  /lava-432735/1/../bin/lava-test-case
    2024-02-20T16:55:23.317021  <8>[   23.787851] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d4d98b429c2792b263709b
        failing since 32 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-20T16:55:24.392872  /lava-432735/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65d4d98b429c2792b263709c
        failing since 32 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-20T16:55:24.396093  <8>[   24.884418] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-20T16:55:25.454718  /lava-432735/1/../bin/lava-test-case
    2024-02-20T16:55:25.455179  <8>[   25.905782] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-20T16:55:25.455487  /lava-432735/1/../bin/lava-test-case   =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 2          =


  Details:     https://kernelci.org/test/plan/id/65d4d977e42760b5f463702c

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-21=
6-g139b564a6aa7b/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-21=
6-g139b564a6aa7b/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d4d977e42760b5f4637033
        failing since 32 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-20T16:55:05.602272  / # #
    2024-02-20T16:55:05.704355  export SHELL=3D/bin/sh
    2024-02-20T16:55:05.705085  #
    2024-02-20T16:55:05.806648  / # export SHELL=3D/bin/sh. /lava-432739/en=
vironment
    2024-02-20T16:55:05.807373  =

    2024-02-20T16:55:05.908712  / # . /lava-432739/environment/lava-432739/=
bin/lava-test-runner /lava-432739/1
    2024-02-20T16:55:05.909872  =

    2024-02-20T16:55:05.950129  / # /lava-432739/bin/lava-test-runner /lava=
-432739/1
    2024-02-20T16:55:05.982172  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-20T16:55:05.982629  + <8>[   21.062887] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 432739_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d4d977e42760b5f4637046
        failing since 32 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-20T16:55:08.421892  /lava-432739/1/../bin/lava-test-case   =

 =20

