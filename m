Return-Path: <linux-next+bounces-3591-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EACF396BC5F
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 14:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 759B11F218D3
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 12:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8EAC189F29;
	Wed,  4 Sep 2024 12:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="mFRhRfvu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B0D185935
	for <linux-next@vger.kernel.org>; Wed,  4 Sep 2024 12:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725453169; cv=none; b=Lm9l+MT9KEfBdnk4knBfPrehycEb++glh/3vhn70NQkCgdZTNma56+KBQx7uyYoyHaJRTYWgywGSR4bcrmqXyCu9fowpYo8FCTuK9X5ql0CdJtNsM4WC604fUUVjfvT9xMFO/B0a+60rT7e7VB3VRKaHK5w7kDbYCY9cVIfHAeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725453169; c=relaxed/simple;
	bh=gAi1mdbjuAdFBB5ghJ1i8CPCgB7qal0N8EYMUNPXJlQ=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=a2P24r+DOqVVJKumgzIWbyqY1XfnVgkX6wik4HNFVu4i8LhQfusRTMFsL4TEwer+ttw2uT3ndnHGhT8xMwud0wTjGkv9tdm3385HHttVPfHqFQf8TaByt/XtqIuHsgqACdUuI9sA84ONFPbdLnV5F3j03uXs2w67oJ8CzEGNvcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=mFRhRfvu; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2d5f5d8cc01so532042a91.0
        for <linux-next@vger.kernel.org>; Wed, 04 Sep 2024 05:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1725453166; x=1726057966; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0le4Mr1CItzj9or4V8nj0VXY/BnUH/XuNtYZuPZRSqA=;
        b=mFRhRfvujJmnGbfuO2tm2zT1aZ8tzDUTs772QuJ/TbsyImSQFrI9OrqnljZGwuQFqv
         7Z/DkRecqXgSOw5DvyzB639cWfl0bnIEPbGUA5dO+eDBZ+etT78kgpZi1x9Tx7c8ZxO7
         b2QIifmvJ+HDhWBixLNONP8FgkBSFx9w1V2S8BInfnjxf8DFf2StYtBGcjMOND/X2oYr
         V0l4MKHl9cSrtzj6OtOE+2qK3lIeB1CS+csL0EJ5uqELw+ScXkrkbP4s4Ap1KnqptWyS
         XVgVBBvU+NyTsJKMisDvbdgZD1fo7M4LXEZHeVf0jg4S/Nwqxc12ACCnMUgPRpTYN2gG
         sMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725453166; x=1726057966;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0le4Mr1CItzj9or4V8nj0VXY/BnUH/XuNtYZuPZRSqA=;
        b=V7MCaLMwfskMLrseJvFMW6L7aZM/kI2VEA8sLec+ZCVjVNHFL+n2IIJsgbD/VvvCdI
         A0dCrc5FuBirw0Chrl7i57BonCWH0MlxVVXd8mt8SLVIa8d6PnImJjQasHKROdI/zAfS
         bEGQflQgphZWOmUghOHEhYozxbfydIFxln5kLJw0zQpX0sRAIIwHRiXj6DIt4NG8expB
         +ggYE6hB9YUL+sfwXOyRNRUzQ+Ff7/qzea46seKigb2TADPKcWN9yjzqo5i4MOYxQmHK
         +VI2dGGfUivNgTRDgmkxY0uAP49XTq0PFlTfnW9qSciMM/nZpMeuKQzubOlbpQX7M4RB
         PNDA==
X-Gm-Message-State: AOJu0YxkZExe16ogEYU3ofvwfV/CFa4ydVBOn8/q4QmQRV6vFCoehTln
	kAtaT+n4Yl2CDYuyKtuaZqZIpJFv8akhVScskB+D1XqtwRS3aAxORE6GjXDJLNKiSuNMA/2efny
	p
X-Google-Smtp-Source: AGHT+IGZjEi5yKXTDRUkvxbaYiq/2m/637COeEAbPetCoW9ZmUrHO1Pa1rIRzI3ma6o4+RFgbDvmGQ==
X-Received: by 2002:a17:90b:1e09:b0:2d8:7a2d:62e1 with SMTP id 98e67ed59e1d1-2da8e9cf8d9mr3543481a91.2.1725453165982;
        Wed, 04 Sep 2024 05:32:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8f1b74a26sm5530852a91.52.2024.09.04.05.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 05:32:45 -0700 (PDT)
Message-ID: <66d8536d.170a0220.1a36b.15ee@mx.google.com>
Date: Wed, 04 Sep 2024 05:32:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20240904
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 215 runs, 7 regressions (next-20240904)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 215 runs, 7 regressions (next-20240904)

Regressions Summary
-------------------

platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
beaglebone-black             | arm   | lab-cip     | gcc-12   | omap2plus_d=
efconfig          | 1          =

imx8mp-evk                   | arm64 | lab-broonie | gcc-12   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =

meson-sm1-s90...libretech-cc | arm64 | lab-broonie | gcc-12   | defconfig+k=
selftest          | 2          =

r8a7743-iwg20d-q7            | arm   | lab-cip     | gcc-12   | shmobile_de=
fconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240904/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240904
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      fdadd93817f124fd0ea6ef251d4a1068b7feceba =



Test Regressions
---------------- =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
beaglebone-black             | arm   | lab-cip     | gcc-12   | omap2plus_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/66d822eee2ed1e9a95c86870

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240904/arm/=
omap2plus_defconfig/gcc-12/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240904/arm/=
omap2plus_defconfig/gcc-12/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/66d822eee2ed1e9a=
95c86875
        new failure (last pass: next-20240902)
        1 lines

    2024-09-04T09:05:43.086035  / # =

    2024-09-04T09:05:43.097640  =

    2024-09-04T09:05:43.199768  / # #
    2024-09-04T09:05:43.209582  #
    2024-09-04T09:05:43.310470  / # export SHELL=3D/bin/sh
    2024-09-04T09:05:43.321455  export SHELL=3D/bin/sh
    2024-09-04T09:05:43.422178  / # . /lava-1188485/environment
    2024-09-04T09:05:43.433410  . /lava-1188485/environment
    2024-09-04T09:05:43.534160  / # /lava-1188485/bin/lava-test-runner /lav=
a-1188485/0
    2024-09-04T09:05:43.545348  /lava-1188485/bin/lava-test-runner /lava-11=
88485/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
imx8mp-evk                   | arm64 | lab-broonie | gcc-12   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66d81a2c47516eb3e3c86858

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240904/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-imx8mp-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240904/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-imx8mp-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d81a2c47516eb3e3c86=
859
        new failure (last pass: next-20240902) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66d81f3106348ed268c8685e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240904/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240904/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d81f3106348ed268c86=
85f
        failing since 7 days (last pass: next-20240725, first fail: next-20=
240827) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66d81f1c164a5fc0e7c86869

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240904/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240904/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d81f1c164a5fc0e7c86=
86a
        failing since 7 days (last pass: next-20240725, first fail: next-20=
240827) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
meson-sm1-s90...libretech-cc | arm64 | lab-broonie | gcc-12   | defconfig+k=
selftest          | 2          =


  Details:     https://kernelci.org/test/plan/id/66d81f19ba9b584e18c86894

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240904/arm6=
4/defconfig+kselftest/gcc-12/lab-broonie/baseline-meson-sm1-s905d3-libretec=
h-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240904/arm6=
4/defconfig+kselftest/gcc-12/lab-broonie/baseline-meson-sm1-s905d3-libretec=
h-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/66d81f19ba9b584=
e18c86897
        failing since 1 day (last pass: next-20240830, first fail: next-202=
40902)
        2 lines

    2024-09-04T08:49:18.842104  DABT (current EL), IL =3D 32 bits
    2024-09-04T08:49:18.842622  kern  :alert :   SET =3D 0, FnV =3D 0
    2024-09-04T08:49:18.847702  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2024-09-04T08:49:18.853229  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2024-09-04T08:49:18.853768  kern  :alert : Data abort info:
    2024-09-04T08:49:18.858794  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004, ISS2 =3D 0x00000000
    2024-09-04T08:49:18.864276  kern  :alert :   CM =3D 0, WnR =3D 0, TnD =
=3D 0, TagAccess =3D 0
    2024-09-04T08:49:18.869835  kern  :alert :   GCS =3D 0, Overlay =3D 0, =
DirtyBit =3D 0, Xs =3D 0
    2024-09-04T08:49:18.880888  kern  :alert<8>[   19.641349] <LAVA_SIGNAL_=
TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2> =
  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/66d81f19ba9b584=
e18c86898
        failing since 1 day (last pass: next-20240830, first fail: next-202=
40902)
        12 lines

    2024-09-04T08:49:18.819865  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address cccccccccccccccc
    2024-09-04T08:49:18.820445  kern  :alert : Mem abort info:
    2024-09-04T08:49:18.825433  kern  :alert :   ESR =3D 0x0000000096000004
    2024-09-04T08:49:18.836497  kern  :alert :   EC =3D 0x25: <8>[   19.598=
808] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D12>   =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip     | gcc-12   | shmobile_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66d81a29840ab518e4c8685b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240904/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240904/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66d81a29840ab518e4c86=
85c
        failing since 13 days (last pass: next-20240820, first fail: next-2=
0240821) =

 =20

