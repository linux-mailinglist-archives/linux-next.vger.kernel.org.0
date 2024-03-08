Return-Path: <linux-next+bounces-1555-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ED7875D6C
	for <lists+linux-next@lfdr.de>; Fri,  8 Mar 2024 06:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12D491F212F5
	for <lists+linux-next@lfdr.de>; Fri,  8 Mar 2024 05:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8AF2CCB3;
	Fri,  8 Mar 2024 05:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="h/LQU2Md"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8912C6AD
	for <linux-next@vger.kernel.org>; Fri,  8 Mar 2024 05:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709874267; cv=none; b=oc+43AGeDZ1LRUG7I0ZoPbQXNES/1KI6SJ+VImdme91M/PuhUaKLJNyCfiNVnp0p2rux06fl/Z746Mc8Qm3Ih4C6b+ian8mGGL+TOumhsH/A2+94FvaBlqbj6cW00oi47vzpu1qd4hFrb67KPbrfAgJZqMij7gvVSqqNZCKLaXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709874267; c=relaxed/simple;
	bh=irlQFpJe81IH34jSd9n+NFrSGbBKuMsNl910RUeReAo=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=ojvo7GuPiy2AjhgxHfaZiDDF0qrHzQPzDh4oB4mjXk+b3UpJGQhYvN6zsYSONXPRA5Sp/cHqp7/gvPKNKRzu+kybIm82LCaOujfVhl/hgy/M505XMI8MoNlG7Tt4P5KjWCvbBJ5BpZ0/qSqqYG5a8vvm2ehTIUC2jOwRWi5dAVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=h/LQU2Md; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6e64647af39so1630463b3a.1
        for <linux-next@vger.kernel.org>; Thu, 07 Mar 2024 21:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1709874264; x=1710479064; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d3IvEvL55zn6WuO459xw+SuuQeaEe04s1qvIrzMoOBU=;
        b=h/LQU2Mdf8oU4Y/5UCBbMI9BDgf2PMynbJKwmgZGb0hDaDLcyWw2ilxqmgOWEXQVzK
         MkoNWzy2f4qdz2IxcWxK7ogUR+Zuuk2R8NqCSC3cRNgwodUfZQk0chVNFQXybyNfDQNc
         6+2b0kvj2v6z92unpzDVYJE3bm14Sv6QyqlODA2eIEKtzDB/VoEOm90hmYscz+v4uenr
         r/WaajwKCfEYi4j6/IY4jodRRaWOcx6wrNt1pCGEvJD9/m0i65zNXYHKZCrR5kHM3LQv
         WkWIDiIjK5KF9Eb/VItgyG630B9Ql2W8nFo0FTPNnJN8FVCgqrKttjZdBEyCpgNlK6VB
         zGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709874264; x=1710479064;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d3IvEvL55zn6WuO459xw+SuuQeaEe04s1qvIrzMoOBU=;
        b=fNE3MQneUFGoqptoTD5hbpeiIaJ/NAbbTa3BSXVxTNQYk4Kfxvr9i7E+4uoiVJdr9f
         KqR2apsU+AtH21JJee/2gGfqAfwbrhxj9ubIt5jH2GidFGo77ZcXJjifUBgZ+AurLEFP
         YQzeb69dncfPpmljJ9Vd325szz+KpA3o6RxVj+zjUb55WB95qH1FXGaUKX0JZhvtGZ9C
         xKywG+vdzZpt/nvOx23/mcOIkCo1RzAr1/euB+lI0g4VmTW6xS9SvaDByZLpM1Gswkwk
         00yHwfAuJrhKBdwlKhp7rP3iwLHVhdeNmI1t5Wia6RJmbqjnfCLek48Mw7OhOAcFcI21
         K5uA==
X-Gm-Message-State: AOJu0Yz/Oe6hDPHJzTJijakYftuUJQJjpiwjYI67F6tY/IiqBzSbopwj
	EGOQE1+b8O4dmUhip0kwBKaWx11C0GOSz3zEJMPL7l7MnPkeN3EXZbflXgCrDmuABFAQL9uPeyR
	IS58=
X-Google-Smtp-Source: AGHT+IFK2/Z3pI98G5GzWm33IIrMx+EcGQNeYZDy6Oa6av9gyD+MfZnp0vR+ndYR2TZRaqEfQa+bpw==
X-Received: by 2002:a05:6a00:124e:b0:6e5:6383:c189 with SMTP id u14-20020a056a00124e00b006e56383c189mr25566019pfi.25.1709874262969;
        Thu, 07 Mar 2024 21:04:22 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id du2-20020a056a002b4200b006e664031f10sm1287433pfb.51.2024.03.07.21.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 21:04:22 -0800 (PST)
Message-ID: <65ea9c56.050a0220.78a9f.57e5@mx.google.com>
Date: Thu, 07 Mar 2024 21:04:22 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc7-247-g4b587a04fd31e
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 76 runs,
 7 regressions (v6.8-rc7-247-g4b587a04fd31e)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 76 runs, 7 regressions (v6.8-rc7-247-g4b587a04=
fd31e)

Regressions Summary
-------------------

platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =

kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.8-rc7-247-g4b587a04fd31e/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-rc7-247-g4b587a04fd31e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4b587a04fd31ed30f5578c2e1455b14ae7a5d069 =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig | 5    =
      =


  Details:     https://kernelci.org/test/plan/id/65ea6a98da7fd6bb024c42da

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc7-24=
7-g4b587a04fd31e/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc7-24=
7-g4b587a04fd31e/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ea6a98da7fd6bb024c42e1
        failing since 49 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-08T01:31:50.275672  / # #
    2024-03-08T01:31:50.377439  export SHELL=3D/bin/sh
    2024-03-08T01:31:50.378193  #
    2024-03-08T01:31:50.479544  / # export SHELL=3D/bin/sh. /lava-440217/en=
vironment
    2024-03-08T01:31:50.480248  =

    2024-03-08T01:31:50.581741  / # . /lava-440217/environment/lava-440217/=
bin/lava-test-runner /lava-440217/1
    2024-03-08T01:31:50.583003  =

    2024-03-08T01:31:50.602897  / # /lava-440217/bin/lava-test-runner /lava=
-440217/1
    2024-03-08T01:31:50.646254  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-08T01:31:50.646653  + <8>[   20.565213] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 440217_1.5.2.4.5> =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65ea6a98da7fd6bb024c42e5
        failing since 49 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-08T01:31:52.752343  /lava-440217/1/../bin/lava-test-case
    2024-03-08T01:31:52.752501  <8>[   22.672571] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-03-08T01:31:52.752796  /lava-440217/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
ea6a98da7fd6bb024c42e7
        failing since 49 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-08T01:31:53.809940  /lava-440217/1/../bin/lava-test-case
    2024-03-08T01:31:53.810430  <8>[   23.711279] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-03-08T01:31:53.810724  /lava-440217/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65ea6a98da7fd6bb024c42ec
        failing since 49 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-08T01:31:54.884572  /lava-440217/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65ea6a98da7fd6bb024c42ed
        failing since 49 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-08T01:31:54.887882  <8>[   24.822540] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-08T01:31:55.945831  /lava-440217/1/../bin/lava-test-case
    2024-03-08T01:31:55.946338  <8>[   25.844271] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-03-08T01:31:55.946636  /lava-440217/1/../bin/lava-test-case   =

 =



platform               | arch  | lab         | compiler | defconfig | regre=
ssions
-----------------------+-------+-------------+----------+-----------+------=
------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig | 2    =
      =


  Details:     https://kernelci.org/test/plan/id/65ea6a95f0f8351ded4c4314

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc7-24=
7-g4b587a04fd31e/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc7-24=
7-g4b587a04fd31e/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ea6a95f0f8351ded4c431b
        failing since 49 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-08T01:31:41.849738  / # #
    2024-03-08T01:31:41.951883  export SHELL=3D/bin/sh
    2024-03-08T01:31:41.952586  #
    2024-03-08T01:31:42.053925  / # export SHELL=3D/bin/sh. /lava-440213/en=
vironment
    2024-03-08T01:31:42.054557  =

    2024-03-08T01:31:42.155653  / # . /lava-440213/environment/lava-440213/=
bin/lava-test-runner /lava-440213/1
    2024-03-08T01:31:42.156526  =

    2024-03-08T01:31:42.161431  / # /lava-440213/bin/lava-test-runner /lava=
-440213/1
    2024-03-08T01:31:42.229621  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-08T01:31:42.230102  + <8>[   21.001958] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 440213_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65ea6a95f0f8351ded4c432e
        failing since 49 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-03-08T01:31:44.657404  /lava-440213/1/../bin/lava-test-case
    2024-03-08T01:31:44.657871  <8>[   23.421385] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-08T01:31:44.658244  /lava-440213/1/../bin/lava-test-case   =

 =20

