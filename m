Return-Path: <linux-next+bounces-1257-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D904A85D816
	for <lists+linux-next@lfdr.de>; Wed, 21 Feb 2024 13:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40CE1B22DEC
	for <lists+linux-next@lfdr.de>; Wed, 21 Feb 2024 12:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027E669318;
	Wed, 21 Feb 2024 12:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="p4kdO7JC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF09A67E73
	for <linux-next@vger.kernel.org>; Wed, 21 Feb 2024 12:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708519459; cv=none; b=jgLPldI8xycW7/Nx1oleZt+xG3RKl6L+DL0PEjaq2S6HQuppRBDWgwfvXCtsTeMK0jUuRyI9xBnwRMBL/CELDIRcfcrxa1QCTsWRsLeSpmsWOrBUGBqI4TtouPOw2iKIgvw6tWIn9SQrphqtuFkQVIeasWoNem9FmREZUs/Hc7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708519459; c=relaxed/simple;
	bh=YRd3F0rJhF2gCUca+BJ/m2LenTCBOyizvSl4h6GHkbU=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=scAr1l8bCxnY295gnKieBXlLO0SMSrUU9mTNM3BVJvf0UrzNmhf76PaYyr+U9EVtOKojFLlIQ13IobgzBjqKb2/fi57trutpLWZ3jdmwjJj45Tk7Tr/zfXTfjEMFh1vSjwdWEhL0O2NpzVeiSM4gSeX/ootKbJs6sMFOkp/tlNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=p4kdO7JC; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-204f50f305cso4932578fac.3
        for <linux-next@vger.kernel.org>; Wed, 21 Feb 2024 04:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708519456; x=1709124256; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p8N41ZMnJhq/IXDzzGRFgZPaEeJ4bOcsq3qED21Njos=;
        b=p4kdO7JCIlphdON52WOXtB/pbtHBQ7Cm7adChjvOTWal9YVkyXQXRdGxbfi6h8ONxe
         kXxWt+FfHIt5aL3MRNsoQCf6CoqBd5FVGrY1SnL363OKAIkOyqrvweHXrkFz0jJjB0GR
         2SnoNlCvO7RwzNfVF9kI/a6qAMzeKKp7bEUyewlgPHxF/XkaAU6zD1BPFldXCNmG3+mA
         b2o7PMlqqG8eUTI0NDaEF1K1yDPqsL6k/iP6ke3dBNDREdf3gqqYlDBRWm4gdU/24wQ2
         OJZbvobVBW+sEG23OodCYpPsqhrT1cPjdItKKBsacRQTR0EFhLM6TDrHFCd8jTK6bTBb
         JfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708519456; x=1709124256;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8N41ZMnJhq/IXDzzGRFgZPaEeJ4bOcsq3qED21Njos=;
        b=UWanKw9BXPRASgRX2bAxdOm3vYw8NUViPzdHWyclBqRyhsEC8oeGMPUzAy3/z675KD
         qje5SXXmdkzvwev7lprd5xIF0B5x0FiYd15uJHp4/Vzpz1Vajg/RGN9E6D5ZM4DS+Uv4
         ICmNxKQG13eWEhO4IO50qRWHeahPY3dnaaz86WW1U6tZJbEoQIyG/HiXskL3unBpYZOo
         eg8S4WVWGzLmDP+N/qba9+fDuHFM5cpeX1/eFH40U4TVt6+4pZm/bSLqCm547kLxlVpj
         G3w+87kg83xOR8jitQ/ixrgwifH9clN1wTn5ICL5RrYx2NbJ7L7ZHPtMrvUh87SOCxk7
         u6YQ==
X-Gm-Message-State: AOJu0YyekSg4EwDnI0EjJxxUbqQ1VVTLKlU4Oz6U+vKq2UpOnpjhUCkP
	SWpU6I33g1tTYcrCCR14oCKRIILgOpwn4f46fm5H9xfXXxqevqwp5h0l7NBtLBS6R8VOueKN+cm
	IphU=
X-Google-Smtp-Source: AGHT+IH7EG/i53aMeQW4bwGe+UsmiROb3uFXi2jmQvvOziZA/ANfkUn1htgOHCEsYkM1D5HBO5tMqw==
X-Received: by 2002:a05:6870:50c:b0:21e:9ef7:f1df with SMTP id j12-20020a056870050c00b0021e9ef7f1dfmr12363630oao.9.1708519456269;
        Wed, 21 Feb 2024 04:44:16 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id l129-20020a632587000000b005dc4da2121fsm8480551pgl.6.2024.02.21.04.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 04:44:15 -0800 (PST)
Message-ID: <65d5f01f.630a0220.62e35.94b6@mx.google.com>
Date: Wed, 21 Feb 2024 04:44:15 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc5-274-g5b87d67627563
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 75 runs,
 8 regressions (v6.8-rc5-274-g5b87d67627563)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 75 runs, 8 regressions (v6.8-rc5-274-g5b87d676=
27563)

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
v6.8-rc5-274-g5b87d67627563/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-rc5-274-g5b87d67627563
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5b87d67627563912b340d4f2d55db973289700a3 =



Test Regressions
---------------- =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
imx53-qsrb             | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5bf3503a2871478637027

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-27=
4-g5b87d67627563/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-27=
4-g5b87d67627563/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d5bf3503a2871478637030
        failing since 387 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2024-02-21T09:15:10.164428  + set +x
    2024-02-21T09:15:10.164591  [   13.483386] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1026540_1.5.2.3.1>
    2024-02-21T09:15:10.272059  / # #
    2024-02-21T09:15:10.373174  export SHELL=3D/bin/sh
    2024-02-21T09:15:10.373764  #
    2024-02-21T09:15:10.474737  / # export SHELL=3D/bin/sh. /lava-1026540/e=
nvironment
    2024-02-21T09:15:10.475338  =

    2024-02-21T09:15:10.576591  / # . /lava-1026540/environment/lava-102654=
0/bin/lava-test-runner /lava-1026540/1
    2024-02-21T09:15:10.577134  =

    2024-02-21T09:15:10.580416  / # /lava-1026540/bin/lava-test-runner /lav=
a-1026540/1 =

    ... (13 line(s) more)  =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 5          =


  Details:     https://kernelci.org/test/plan/id/65d5bfdafdfe763e26637033

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-27=
4-g5b87d67627563/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-27=
4-g5b87d67627563/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d5bfdafdfe763e2663703a
        failing since 33 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-21T09:17:58.109778  <8>[   20.296122] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 433071_1.5.2.4.1>
    2024-02-21T09:17:58.215330  / # #
    2024-02-21T09:17:58.317154  export SHELL=3D/bin/sh
    2024-02-21T09:17:58.317995  #
    2024-02-21T09:17:58.419207  / # export SHELL=3D/bin/sh. /lava-433071/en=
vironment
    2024-02-21T09:17:58.419903  =

    2024-02-21T09:17:58.521137  / # . /lava-433071/environment/lava-433071/=
bin/lava-test-runner /lava-433071/1
    2024-02-21T09:17:58.522214  =

    2024-02-21T09:17:58.541479  / # /lava-433071/bin/lava-test-runner /lava=
-433071/1
    2024-02-21T09:17:58.584720  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65d5bfdafdfe763e2663703e
        failing since 33 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-21T09:18:00.693556  /lava-433071/1/../bin/lava-test-case
    2024-02-21T09:18:00.694275  <8>[   22.868439] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-21T09:18:00.694670  /lava-433071/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
d5bfdafdfe763e26637040
        failing since 33 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-21T09:18:01.752853  /lava-433071/1/../bin/lava-test-case
    2024-02-21T09:18:01.753276  <8>[   23.908235] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d5bfdafdfe763e26637045
        failing since 33 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-21T09:18:02.828761  /lava-433071/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65d5bfdafdfe763e26637046
        failing since 33 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-21T09:18:02.830957  <8>[   25.020217] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-21T09:18:03.891081  /lava-433071/1/../bin/lava-test-case   =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 2          =


  Details:     https://kernelci.org/test/plan/id/65d5bfee5c559edb94637016

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-27=
4-g5b87d67627563/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc5-27=
4-g5b87d67627563/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d5bfee5c559edb9463701d
        failing since 33 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-21T09:18:23.879118  / # #
    2024-02-21T09:18:23.980165  export SHELL=3D/bin/sh
    2024-02-21T09:18:23.980420  #
    2024-02-21T09:18:24.081071  / # export SHELL=3D/bin/sh. /lava-433068/en=
vironment
    2024-02-21T09:18:24.081334  =

    2024-02-21T09:18:24.182009  / # . /lava-433068/environment/lava-433068/=
bin/lava-test-runner /lava-433068/1
    2024-02-21T09:18:24.183079  =

    2024-02-21T09:18:24.193905  / # /lava-433068/bin/lava-test-runner /lava=
-433068/1
    2024-02-21T09:18:24.238167  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-21T09:18:24.254933  + <8>[   20.937774] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 433068_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d5bfee5c559edb94637030
        failing since 33 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-21T09:18:26.683524  /lava-433068/1/../bin/lava-test-case
    2024-02-21T09:18:26.683689  <8>[   23.358920] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-21T09:18:26.683778  /lava-433068/1/../bin/lava-test-case
    2024-02-21T09:18:26.683855  <8>[   23.376439] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-02-21T09:18:26.683932  /lava-433068/1/../bin/lava-test-case   =

 =20

