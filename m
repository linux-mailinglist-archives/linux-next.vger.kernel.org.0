Return-Path: <linux-next+bounces-1501-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD5C87345B
	for <lists+linux-next@lfdr.de>; Wed,  6 Mar 2024 11:35:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E27C228A068
	for <lists+linux-next@lfdr.de>; Wed,  6 Mar 2024 10:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66E543AB8;
	Wed,  6 Mar 2024 10:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="cuxohUnS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E324C604D7
	for <linux-next@vger.kernel.org>; Wed,  6 Mar 2024 10:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709721307; cv=none; b=rK4K+Jn6ltPaYABpMTDnFZ0GCUIXvGXeVBhfkdjPE19B1eDuG4S8ye2tDHYLQMyJyEfJOAdxn8AHEzBsHtyLFwjGLwjH77w//U8fgPrkzfjYIGs1ZV53tWkRLF1258uWKtcD4N5WcD6GtHFNphfpqTVbQTVbEfzxuQ5Equ+QJso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709721307; c=relaxed/simple;
	bh=ZfaKBKJ915M9m/LOr0W7eSXRyePyOkk/6Yo/ZebE630=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=JEEAw4HccKRIs3ikVjtnjM3laKL6qo/+13LoItRuzuBhOgJvpf7JHwxZhiuopq+GcOIbCKtQDsHFeeu8TaGysZHCRoEkpSM2UC/t/O0nHqJCsNQr0ZcWr/d3u17DlBnfRTcfsNovmSTHvg02g8dFQud8bYvNIlngx8oMyMcDEFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=cuxohUnS; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1dcab44747bso54805565ad.1
        for <linux-next@vger.kernel.org>; Wed, 06 Mar 2024 02:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1709721305; x=1710326105; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RL2UaKVvrlrhxjKtCxi3BUZB8+lUH1cOcfYdPZYIa4Y=;
        b=cuxohUnS4YtbJQQ54gCDz2dasKiOI3XcDsqlRawIeK/oghXtXfWa/zsL1YoLvbspUY
         vkBdNBrSePvOJv5lTZDhX1rah+016fXr5/MK5aWkBDrhqFsXTGboeQs97cmMnXbhmDSA
         gIGYG8ox9pFJ7RcqLUc7PTW9rEcUUb+66cQn+2FNhGEWXxVFlyj0JDIp/hC02l0lVor/
         v7hmZzqRToakbo3ediASBi5c8uBtu4n54Kf9ceagagJmhke5Gg1yTvFB7YsPdgxpZogM
         nFbaakPlnWXAZE82B5/0Ol8QEHZ+VPYlk6SKPItvPyG6Ou4dPgFeP5f3YH6U3hXcXlXd
         4ERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709721305; x=1710326105;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RL2UaKVvrlrhxjKtCxi3BUZB8+lUH1cOcfYdPZYIa4Y=;
        b=tPR1mXbC6wnUv3KkZQhblVW1MJvC9Zrr4wkMitMcRHaYd0yYoAVSh5jyEXRSsbdEHL
         g3G4W22o2E3vj5KFvCNNkVl0yUNMvbriCO6DAjTAX8n6mqZmb8XK2arVNF6gpSduFhZE
         P5/odi7VxLL9KJmbxz0SCa+JgKVzu+C+Bs3GKh11RQ4+hD8qnapll1LcMBt+v3zJkTlY
         5obrHxLo5gpNeo7rvAqdak+21L3UpHWltPtJaCrSlxAmtrDI9QshZ/ONGSJ49txkaGF5
         zi3GoNgBU7seA4bntdshQDKlrH31HRiy5oj99CdMP04iKzirLrPaYKKypkmWbzNKZqvC
         KvWQ==
X-Gm-Message-State: AOJu0YxqNaqpfr9rWxtw0TVf/JprZYKOiPnD4lqc5PJTRB1DLaRZSvt0
	XpG2ojHMiVzOP8+ve0XmzstAxIJJiwbnkx+h+6yAY3ZYwZKraUC/gCexVJ5K5s/IR+6+8qDGSoV
	/8qg=
X-Google-Smtp-Source: AGHT+IGkgFUb2xJSXxyeuDZompECAiF8GQQQlgxMmhuq/A2rYyWmyt/H0JVokAmIaEnErgU2FfSdyw==
X-Received: by 2002:a17:903:120e:b0:1dc:ca74:7018 with SMTP id l14-20020a170903120e00b001dcca747018mr5085092plh.36.1709721304503;
        Wed, 06 Mar 2024 02:35:04 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id mm12-20020a1709030a0c00b001dc96d1a662sm12224750plb.197.2024.03.06.02.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 02:35:04 -0800 (PST)
Message-ID: <65e846d8.170a0220.27d92.e56f@mx.google.com>
Date: Wed, 06 Mar 2024 02:35:04 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20240306
X-Kernelci-Report-Type: test
Subject: next/master baseline: 137 runs, 10 regressions (next-20240306)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 137 runs, 10 regressions (next-20240306)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | clang-17 | defcon=
fig                    | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-17 | defcon=
fig                    | 1          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron     | clang-17 | defcon=
fig                    | 2          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240306/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240306
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      61996c073c9b070922ad3a36c981ca6ddbea19a5 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65e80ecbb9e67697744c4438

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240306/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240306/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e80ecbb9e67697744c4=
439
        failing since 6 days (last pass: next-20240226, first fail: next-20=
240228) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65e80be290cdd4b9da4c4384

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240306/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240306/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e80be290cdd4b9da4c4=
385
        failing since 275 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65e80ed4b9afe8313f4c42dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240306/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240306/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e80ed4b9afe8313f4c4=
2dd
        failing since 6 days (last pass: next-20240226, first fail: next-20=
240228) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65e80ed297973ab0074c42e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240306/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240306/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e80ed297973ab0074c4=
2e4
        failing since 6 days (last pass: next-20240226, first fail: next-20=
240228) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65e80b38d0a7a0da7a4c42ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240306/arm6=
4/defconfig/clang-17/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240306/arm6=
4/defconfig/clang-17/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e80b38d0a7a0da7a4c4=
2f0
        new failure (last pass: next-20240219) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65e80c15c31a3cdc004c42ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240306/arm6=
4/defconfig/clang-17/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240306/arm6=
4/defconfig/clang-17/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e80c15c31a3cdc004c4=
2ee
        new failure (last pass: next-20240219) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron     | clang-17 | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/65e80b25c01468be174c42ed

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240306/arm6=
4/defconfig/clang-17/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240306/arm6=
4/defconfig/clang-17/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65e80b25c01468be174c42f4
        failing since 85 days (last pass: next-20231208, first fail: next-2=
0231211)

    2024-03-06T06:20:01.323724  / # #
    2024-03-06T06:20:01.425904  export SHELL=3D/bin/sh
    2024-03-06T06:20:01.426625  #
    2024-03-06T06:20:01.527900  / # export SHELL=3D/bin/sh. /lava-439327/en=
vironment
    2024-03-06T06:20:01.528634  =

    2024-03-06T06:20:01.630020  / # . /lava-439327/environment/lava-439327/=
bin/lava-test-runner /lava-439327/1
    2024-03-06T06:20:01.631199  =

    2024-03-06T06:20:01.635876  / # /lava-439327/bin/lava-test-runner /lava=
-439327/1
    2024-03-06T06:20:01.704703  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-06T06:20:01.705127  + <8>[   21.061069] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 439327_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65e80b25c01468be174c4307
        failing since 85 days (last pass: next-20231208, first fail: next-2=
0231211)

    2024-03-06T06:20:04.150814  /lava-439327/1/../bin/lava-test-case
    2024-03-06T06:20:04.151259  <8>[   23.493371] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-06T06:20:04.151627  /lava-439327/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65e809e2d5a9d8ef704c4339

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240306/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/baseline-meson-gxl=
-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240306/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/baseline-meson-gxl=
-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e809e2d5a9d8ef704c4=
33a
        new failure (last pass: next-20240304) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65e806e05ed5388fe84c42df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240306/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240306/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65e806e05ed5388fe84c4=
2e0
        failing since 1 day (last pass: next-20240301, first fail: next-202=
40304) =

 =20

