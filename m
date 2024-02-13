Return-Path: <linux-next+bounces-1147-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F571853C40
	for <lists+linux-next@lfdr.de>; Tue, 13 Feb 2024 21:33:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93695B2378E
	for <lists+linux-next@lfdr.de>; Tue, 13 Feb 2024 20:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ECBB8480;
	Tue, 13 Feb 2024 20:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="fGAiqZ5I"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065631EEE8
	for <linux-next@vger.kernel.org>; Tue, 13 Feb 2024 20:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707856409; cv=none; b=LMLnswSQoMbT+dmDQUo7wsdSi08nExkhIdqxlorzMNc+oPO/gMDH7ji/3rJ9q6enakbgAtONvbjHVrP6FZIlZqCMK+IH47XX0yi+se0pZUobmD6Nt9jRMeNHNdQ9aH2JSef7tKf514tllM030VX/sVp3rRrz9mc+IqBAqQoq8XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707856409; c=relaxed/simple;
	bh=NrMG7is60fbd5RpCLg6y+x6rVUAksL8YhujEr0JBC5E=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=e+iXCHYD3LCl4fuZA3OaY7zjI8htPmkqjh9MC5RF5hfZjpydk+BClxFr60+p6oq7ne4sVxWexpT/O067x3BEY3APijaAYh939xn4x5n+GNWeFzwTr4IH0r85VD8kWr9mmSZlRg4cpD+vtQTqPUsRwTSwf/i1pG2mFMB+4y8yYCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=fGAiqZ5I; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d70b0e521eso36501615ad.1
        for <linux-next@vger.kernel.org>; Tue, 13 Feb 2024 12:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707856407; x=1708461207; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E7Ged+CEqhigwbDtXBGk/TPoIG8Rsq9yHuVGCiFUpNQ=;
        b=fGAiqZ5I8UgcLqjVMyEs7umU4cMwVRfqOFPXfp6LHEEjmzIvpDp/2cW04WmXSH41Im
         SBsxndFdCE554/670Y6YKfDWbYeDyxuO4xMsAagoToA/cYcyD+fSovuQTKzbfwakHPan
         nPOgaImJ3TXTB1bY6EVVlrX5Ko5LAnKrqLNYfo5UwiFR+RZdLr6PcBuLrCOIJdc4Mwj/
         TRqEmw1KpRDiOvWKbFgjDHXVoDKHnW0H95X/rbAbr97Vd8+q05sPl8RJLWKSOzf9Vy6m
         8m4Em0fFb8EsN15kAgkBu4WpqyS18SH5moKLCK9XSsl/2dPFXyr03XQDjJJRY4UaOiy+
         or0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707856407; x=1708461207;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7Ged+CEqhigwbDtXBGk/TPoIG8Rsq9yHuVGCiFUpNQ=;
        b=r2Ot89XtuED154KBozNMBSL1MLZyFGfoA3e5OyxQoPSKChhQ0eOOPh5uKHLtledr3M
         5YH9emk8CBMVYyXdVd3yJEWIfqx78tB9/NAHzMG/MhH91xHei32dKjVk0UQi4FCRV4i5
         z9WBYQB3Q1l6QzsIQLYOnqyTnz7rLYX08R9U1EeHCfN1IHEmV5d+JvxMOpJs6RaKx1mL
         PMKRfj5dzL8R4NPldHRsOvuexd5J17uDosEJPmDCzhYf8GMJWvk1In1SytKTg8ddQNTc
         xYa93gdiJXINycUbc8qwi54vNxGZeTWrIWTx5wmYQxVDKDn74KKR4uSIIP+sGiMwx+yk
         3oLQ==
X-Gm-Message-State: AOJu0YzrdvmBbKjKBSCOJyEgaWKz2b/923sEqkZQTe0Ij05xJDibf8Wy
	kVVAaRR2V6hzzSc/BR11G9F4lXnYf0K9sQBsF01ZcIyQYvm+7QSFA4EUlCXSmxJKaxNo88F6zh3
	xyYg=
X-Google-Smtp-Source: AGHT+IFMrm8AeUsnLaiUDx/j7J3l9rd3s/9hUKG5pz5wCqD42xfe22wnQ++svKp0YXW2lttb9VAj4Q==
X-Received: by 2002:a17:902:eac4:b0:1d9:ec0e:2db2 with SMTP id p4-20020a170902eac400b001d9ec0e2db2mr776108pld.3.1707856406717;
        Tue, 13 Feb 2024 12:33:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUfPMXk7Mwyr3M6vFVHp3wb2spkJDVZGvyejc4GfhntwHkEobLRyFuL0An58DkleIzlnvP1aTyYY/Ya2nJ591qqjbMZUEZpr1ZQVx2SVgIr61/7zwFLXiRD0PSfCWmXISkYBqQB8wiTtFRS8SJNk6dDJA==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id s15-20020a170903320f00b001d9537cf238sm2460532plh.295.2024.02.13.12.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 12:33:26 -0800 (PST)
Message-ID: <65cbd216.170a0220.2f53b.8d8c@mx.google.com>
Date: Tue, 13 Feb 2024 12:33:26 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc4-268-g7b17b1384cd64
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 81 runs,
 9 regressions (v6.8-rc4-268-g7b17b1384cd64)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 81 runs, 9 regressions (v6.8-rc4-268-g7b17b138=
4cd64)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig | 5          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig | 2          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.8-rc4-268-g7b17b1384cd64/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-rc4-268-g7b17b1384cd64
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7b17b1384cd6454c4ea2744c8e8a06de0d27b5b3 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/65cba15670a050da9b63705a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-26=
8-g7b17b1384cd64/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inn=
ocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-26=
8-g7b17b1384cd64/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inn=
ocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cba15670a050da9b637=
05b
        new failure (last pass: v6.8-rc4-226-g965c587a265e7) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig | 5          =


  Details:     https://kernelci.org/test/plan/id/65cba11497e82719d963704e

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-26=
8-g7b17b1384cd64/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-26=
8-g7b17b1384cd64/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cba11497e82719d9637055
        failing since 25 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-13T17:04:03.044639  + <8>[   20.141790] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 429041_1.5.2.4.1>
    2024-02-13T17:04:03.044755  set +x
    2024-02-13T17:04:03.146807  / # #
    2024-02-13T17:04:03.247535  export SHELL=3D/bin/sh
    2024-02-13T17:04:03.247809  #
    2024-02-13T17:04:03.348353  / # export SHELL=3D/bin/sh. /lava-429041/en=
vironment
    2024-02-13T17:04:03.348670  =

    2024-02-13T17:04:03.449237  / # . /lava-429041/environment/lava-429041/=
bin/lava-test-runner /lava-429041/1
    2024-02-13T17:04:03.449576  =

    2024-02-13T17:04:03.460436  / # /lava-429041/bin/lava-test-runner /lava=
-429041/1 =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65cba11497e82719d9637059
        failing since 25 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-13T17:04:05.618585  /lava-429041/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
cba11497e82719d963705b
        failing since 25 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-13T17:04:06.677645  /lava-429041/1/../bin/lava-test-case
    2024-02-13T17:04:06.677788  <8>[   23.742624] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-13T17:04:06.677894  /lava-429041/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65cba11497e82719d9637060
        failing since 25 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-13T17:04:07.753698  /lava-429041/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65cba11497e82719d9637061
        failing since 25 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-13T17:04:07.756791  <8>[   24.856269] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-13T17:04:08.810501  /lava-429041/1/../bin/lava-test-case
    2024-02-13T17:04:08.810880  <8>[   25.877621] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-13T17:04:08.811189  /lava-429041/1/../bin/lava-test-case
    2024-02-13T17:04:08.811468  <8>[   25.895230] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-02-13T17:04:08.811731  /lava-429041/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig | 2          =


  Details:     https://kernelci.org/test/plan/id/65cba12825295c4680637031

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-26=
8-g7b17b1384cd64/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-26=
8-g7b17b1384cd64/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65cba12825295c4680637038
        failing since 25 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-13T17:04:28.473193  / # #
    2024-02-13T17:04:28.575347  export SHELL=3D/bin/sh
    2024-02-13T17:04:28.575987  #
    2024-02-13T17:04:28.677241  / # export SHELL=3D/bin/sh. /lava-429044/en=
vironment
    2024-02-13T17:04:28.678080  =

    2024-02-13T17:04:28.779212  / # . /lava-429044/environment/lava-429044/=
bin/lava-test-runner /lava-429044/1
    2024-02-13T17:04:28.779573  =

    2024-02-13T17:04:28.784641  / # /lava-429044/bin/lava-test-runner /lava=
-429044/1
    2024-02-13T17:04:28.852329  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-13T17:04:28.852708  + <8>[   21.121727] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 429044_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65cba12825295c468063704b
        failing since 25 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-13T17:04:31.284728  /lava-429044/1/../bin/lava-test-case
    2024-02-13T17:04:31.285121  <8>[   23.541269] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-13T17:04:31.285361  /lava-429044/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig | regressions
-----------------------------+-------+-----------------+----------+--------=
---+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/65cba26de7f9e080c9637020

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-26=
8-g7b17b1384cd64/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12b-a3=
11d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc4-26=
8-g7b17b1384cd64/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12b-a3=
11d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65cba26de7f9e080c9637=
021
        new failure (last pass: v6.8-rc3-335-gcdf641895851) =

 =20

