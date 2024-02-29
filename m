Return-Path: <linux-next+bounces-1415-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D0186C5FB
	for <lists+linux-next@lfdr.de>; Thu, 29 Feb 2024 10:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5E7D1F23A32
	for <lists+linux-next@lfdr.de>; Thu, 29 Feb 2024 09:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6B042A86;
	Thu, 29 Feb 2024 09:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="ZJIR7o/2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DDF60DF2
	for <linux-next@vger.kernel.org>; Thu, 29 Feb 2024 09:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709200075; cv=none; b=Kk9INIqLTA+q73wyTxMaSEL7dvf2gVomppMLiIxvKj2d2AkqT0O6JGBA7B412KeoBWq8icehSre+PVhUKJM+WcWmDoQmyyratlJzKpotj96s8SxSOO10Q1w55HJjNTxEiditze9PoFrTqPOi2P57pJU48uk0SvF6tmQkBj6nKhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709200075; c=relaxed/simple;
	bh=GT8QdJkRR4IGCEo0WZGrx6o4k9A3snDlZ/VOez6kU3w=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Bf7H2LiD2LUbyTZraap6CTrYZPv02RwkOQB8O0ZNDYEuLGlIMqDTuYU12WM7+KVpGSCN/0apAcQ6wRzDtOWE0+JszsGcWXCLtQKo/5UCE7ChDzuNPy+LCW5GYO42tt2BQNXQOroSsF436LPqI5dJmb2nSpWOaF+eH3/umMd0F6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=ZJIR7o/2; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3c1a172e46bso477978b6e.3
        for <linux-next@vger.kernel.org>; Thu, 29 Feb 2024 01:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1709200072; x=1709804872; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2QzsfsRjLfz4BI5Nfo6amoE5ykxZI5zygR7AiHmFMvg=;
        b=ZJIR7o/23Bm7p1hITzywzEphnb4cSmVNxysQifnr9cvlXz2TJbk9PrvEfeAbobbjt7
         uVAf+eDkg7zsrkobyUWKHLbZRfIysNdoreTSxmrmXKtaGuY6rJnNoPVTK1UsCqI6VQxn
         zMV4e1441mbRXQEtMwvgcvxUwStoN6vdXqgHwFzXhmD8q9unBroRfPhpbEhD4jSbs8hN
         4SrnXQLo/Ql9GrEri/XBH5bQRci0Hb66b4ba945Q5QhLQxQCaxOpmmSrwGY43MV0D6tp
         Lv4pf4+k05WrzXZ2UjtZzc/RErVMxjxeM361QGnTXfXNX7+Vx2BuctptGfFFHKaTyC8W
         S2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709200072; x=1709804872;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2QzsfsRjLfz4BI5Nfo6amoE5ykxZI5zygR7AiHmFMvg=;
        b=NxbOLLd2Z/+yC0otn0XH2wdGDuyAMsSYT4n68wify+7oDQQYvWw1/3zq1e6bGDvYNC
         tuqjqcHSMSKgqJ6dek1ndP9mAjl01+sM/YPWhvF8ArglD/qaMrL64/D3tflsC/gSWRK5
         QM6vcHO3d9yEdOIzjXJwR+iH+77oc0Iszf4FH6TaPkXmADrBpSyD0yJnJwGfZIqw0pyH
         9Iz9Gt+n5W2IzpRyn1N46Eaxo4Zn/Y2piDCEu0d9Z1FSONRSalFqry9KFWNLomZpf85d
         TLsq/EhoR2WKRB+EXZxPZt/iUmkR2fqhxOHCCUBCv3oUx0lhIoWPsH2u2Pe+bATyZO+1
         1tCQ==
X-Gm-Message-State: AOJu0YwOMT+Ygw7PqT+Xd3sYJDzjr70fugilhpmrr+pwHJ/ciHNO16Ep
	L/X/th//Isd7prr3pRWGyxmIP54SeE0JR8UoYRC0hto2QXMkg+EemuhpInBec26ab4zaL8CBHYP
	/q2k=
X-Google-Smtp-Source: AGHT+IGfKWmOhI2kebfudwsTRkKI0FckyR1Kt2z+Mg3lmvD4yQTcbspAkhupHzU3SnbHP39BVdGqOQ==
X-Received: by 2002:a05:6808:f01:b0:3c1:c90f:1c6a with SMTP id m1-20020a0568080f0100b003c1c90f1c6amr340038oiw.1.1709200072126;
        Thu, 29 Feb 2024 01:47:52 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x16-20020aa784d0000000b006e55d5215dbsm873865pfn.87.2024.02.29.01.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 01:47:51 -0800 (PST)
Message-ID: <65e052c7.a70a0220.999eb.2576@mx.google.com>
Date: Thu, 29 Feb 2024 01:47:51 -0800 (PST)
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
X-Kernelci-Kernel: v6.8-rc6-226-gcbd0dd66742e1
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 81 runs,
 8 regressions (v6.8-rc6-226-gcbd0dd66742e1)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 81 runs, 8 regressions (v6.8-rc6-226-gcbd0dd66=
742e1)

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
v6.8-rc6-226-gcbd0dd66742e1/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.8-rc6-226-gcbd0dd66742e1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      cbd0dd66742e17fb39be25ed9c4c45c2d8451c4d =



Test Regressions
---------------- =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
imx53-qsrb             | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65e0201e7325d9c70663701c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc6-22=
6-gcbd0dd66742e1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc6-22=
6-gcbd0dd66742e1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e0201e7325d9c706637021
        failing since 395 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2024-02-29T06:11:19.544620  + set +x
    2024-02-29T06:11:19.544784  [   13.458801] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1030504_1.5.2.3.1>
    2024-02-29T06:11:19.651810  / # #
    2024-02-29T06:11:19.753081  export SHELL=3D/bin/sh
    2024-02-29T06:11:19.753685  #
    2024-02-29T06:11:19.854701  / # export SHELL=3D/bin/sh. /lava-1030504/e=
nvironment
    2024-02-29T06:11:19.855193  =

    2024-02-29T06:11:19.956305  / # . /lava-1030504/environment/lava-103050=
4/bin/lava-test-runner /lava-1030504/1
    2024-02-29T06:11:19.956865  =

    2024-02-29T06:11:19.960181  / # /lava-1030504/bin/lava-test-runner /lav=
a-1030504/1 =

    ... (13 line(s) more)  =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 5          =


  Details:     https://kernelci.org/test/plan/id/65e021e65ad64d192d637021

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc6-22=
6-gcbd0dd66742e1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc6-22=
6-gcbd0dd66742e1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e021e65ad64d192d637028
        failing since 41 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-29T06:18:59.779565  <8>[   20.061955] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 436612_1.5.2.4.1>
    2024-02-29T06:18:59.884506  / # #
    2024-02-29T06:18:59.986648  export SHELL=3D/bin/sh
    2024-02-29T06:18:59.987375  #
    2024-02-29T06:19:00.088853  / # export SHELL=3D/bin/sh. /lava-436612/en=
vironment
    2024-02-29T06:19:00.089590  =

    2024-02-29T06:19:00.190941  / # . /lava-436612/environment/lava-436612/=
bin/lava-test-runner /lava-436612/1
    2024-02-29T06:19:00.192145  =

    2024-02-29T06:19:00.211225  / # /lava-436612/bin/lava-test-runner /lava=
-436612/1
    2024-02-29T06:19:00.254635  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65e021e65ad64d192d63702c
        failing since 41 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-29T06:19:02.366855  /lava-436612/1/../bin/lava-test-case
    2024-02-29T06:19:02.367281  <8>[   22.631817] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-29T06:19:02.367598  /lava-436612/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
e021e65ad64d192d63702e
        failing since 41 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-29T06:19:03.425382  /lava-436612/1/../bin/lava-test-case
    2024-02-29T06:19:03.425879  <8>[   23.670507] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-29T06:19:03.426194  /lava-436612/1/../bin/lava-test-case
    2024-02-29T06:19:03.426418  <8>[   23.687604] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65e021e65ad64d192d637033
        failing since 41 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-29T06:19:04.499635  /lava-436612/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65e021e65ad64d192d637034
        failing since 41 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-29T06:19:04.502851  <8>[   24.782069] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-29T06:19:05.562354  /lava-436612/1/../bin/lava-test-case
    2024-02-29T06:19:05.562806  <8>[   25.803748] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-29T06:19:05.563112  /lava-436612/1/../bin/lava-test-case   =

 =



platform               | arch  | lab             | compiler | defconfig    =
      | regressions
-----------------------+-------+-----------------+----------+--------------=
------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-10   | defconfig    =
      | 2          =


  Details:     https://kernelci.org/test/plan/id/65e021e91fff4d280b637017

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.8-rc6-22=
6-gcbd0dd66742e1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.8-rc6-22=
6-gcbd0dd66742e1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e021e91fff4d280b63701e
        failing since 41 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-29T06:19:07.040715  / # #
    2024-02-29T06:19:07.141911  export SHELL=3D/bin/sh
    2024-02-29T06:19:07.142612  #
    2024-02-29T06:19:07.244023  / # export SHELL=3D/bin/sh. /lava-436614/en=
vironment
    2024-02-29T06:19:07.244803  =

    2024-02-29T06:19:07.346196  / # . /lava-436614/environment/lava-436614/=
bin/lava-test-runner /lava-436614/1
    2024-02-29T06:19:07.347357  =

    2024-02-29T06:19:07.352671  / # /lava-436614/bin/lava-test-runner /lava=
-436614/1
    2024-02-29T06:19:07.419569  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-29T06:19:07.420005  + <8>[   20.868529] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 436614_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65e021e91fff4d280b637031
        failing since 41 days (last pass: v6.7-10708-g52db520a0959c, first =
fail: v6.7-12142-g865a3df089bf)

    2024-02-29T06:19:09.858118  /lava-436614/1/../bin/lava-test-case
    2024-02-29T06:19:09.858936  <8>[   23.293087] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-29T06:19:09.859232  /lava-436614/1/../bin/lava-test-case
    2024-02-29T06:19:09.859481  <8>[   23.310788] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-02-29T06:19:09.859713  /lava-436614/1/../bin/lava-test-case
    2024-02-29T06:19:09.859937  <8>[   23.331175] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-probed RESULT=3Dpass>
    2024-02-29T06:19:09.860138  /lava-436614/1/../bin/lava-test-case   =

 =20

