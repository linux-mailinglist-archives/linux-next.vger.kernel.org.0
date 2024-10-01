Return-Path: <linux-next+bounces-4040-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 905B598B9B6
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 12:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA3F01C23437
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 10:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A8B19DFBF;
	Tue,  1 Oct 2024 10:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="jXlfZC5L"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5430919B3F3
	for <linux-next@vger.kernel.org>; Tue,  1 Oct 2024 10:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727778586; cv=none; b=tn6fGk8vwpXRa31whRdb/jyRTSPokQlS7D0AG4ArlvaY0jH8TpJiWO2aWWBKLaxp2JBlphpebF3PK+dRtdQKQGulBy74YCoVoVJd/RciNtS9Xo1f6LN4xmSiVqXyF1dy425/fuWps0OzBUWhA80Q3Vd0cQpVSJOptbnkbUJT8LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727778586; c=relaxed/simple;
	bh=iAkCJshlxR43nS6+20qeaUoDm8UudGje/Zst+QmIlFM=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=kB4NR/hrSn5/yRU8BcDWZgw2rXg8BfsMIiKFZ4ScP0ehlW0eVkGm2xS6fpI48wGYx4Pgg2r8XxMDjIv/ArM6Lh9VWNIMNs10889P1nr4/ynTVSQsPChC75YIh8+NLza73ppjXEFaNp+zfmAA3JxcWDAzM6Izh2kU/e07MVJFMH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=jXlfZC5L; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e06f5d4bc7so4546414a91.2
        for <linux-next@vger.kernel.org>; Tue, 01 Oct 2024 03:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1727778583; x=1728383383; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Odz8O7AQC00olfoItBDx/kVF9+NM5KRPCEkBWabw7/o=;
        b=jXlfZC5LmmF0qibhJVg1ElpciRFE5eTUw+2zpIzQJgpdDknQK6PVM7Rg9k/cdIL5lp
         XT94bbRNpBit1Ng8EOoLsa4+goU8c0BG+UDo8rHSA9AD2SYS6SciYaApl2kUjr6c4fOY
         xFicng12Ng4wu/a0alHV4Bt/LQMhaHMpuWFEqeyTcIs6n4qu0fLJ0PgxH3eCeaQekz/X
         IQTHvl3GDgzbxCsQ4jLuVeNiDl2BcfYZcjjPXcoaMBPSrLmk0X2BbQFeoBDTTic3un/C
         I6Ko4J5bduRF9DIDpJ1xWoKisNZTfDOUtanJaulNiGerHa80CPjJulSVxffZv8UZRARO
         fLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727778583; x=1728383383;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Odz8O7AQC00olfoItBDx/kVF9+NM5KRPCEkBWabw7/o=;
        b=k/eIBwJUYEFL1x+O2EgYuq0HAwE5DVqbWRS2y/ko87jFnOyIbjZlNVD9UTvDNpTFk4
         YnVq+bImpVA+/Iuih1VvlFABGNZz2yRKI0GqruOBSkkNLOy8jzgVZV1pz+zVZp0hoeYC
         zrMX4upV0NfsAqQ/dFk7kWLdzl+4RVnF9+g3GhuYCFu+1GNH0Mey5WQ9yMfCbqv/jxXT
         h8JhWDWPo78Qg8jakXN0HCcwOdOuQhb9KDR6JZM9l9JA/Nm5lbBcsafCQlQetC/r4E4P
         pv/qQzinjkac/KimQ22SNzOdN9zWXN/H108sPo2x84FvwNyRPz/qUmKYs8Fws/3Rxz9+
         1NbQ==
X-Gm-Message-State: AOJu0Yzk8KxnjqGZvfD6jaxR0JS6ljOuesiiyMmU3Vyiq31tDzgUFfU+
	2YzeeWaB9xF0vaIdIafqIZz8+j+tgLlxo13MqUHR0vlmtSmFYW626QB4Uxqh3dau87DeJrVxpHh
	S
X-Google-Smtp-Source: AGHT+IFx/ihCnZ1/5SmO2m3nONdR2s/G0HmQOV4o+WGCkELaib+z0ojC+dY1U3BOb5aSZQY9b4TP9A==
X-Received: by 2002:a17:90b:d98:b0:2d3:d063:bdb6 with SMTP id 98e67ed59e1d1-2e0b89a2d65mr17277870a91.4.1727778583077;
        Tue, 01 Oct 2024 03:29:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0b6c7942csm9887847a91.16.2024.10.01.03.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 03:29:42 -0700 (PDT)
Message-ID: <66fbcf16.170a0220.2ce8d4.56c1@mx.google.com>
Date: Tue, 01 Oct 2024 03:29:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20241001
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 178 runs, 10 regressions (next-20241001)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 178 runs, 10 regressions (next-20241001)

Regressions Summary
-------------------

platform               | arch  | lab          | compiler | defconfig       =
             | regressions
-----------------------+-------+--------------+----------+-----------------=
-------------+------------
beagle-xm              | arm   | lab-baylibre | gcc-12   | multi_v7_defc...=
MB2_KERNEL=3Dy | 1          =

beagle-xm              | arm   | lab-baylibre | gcc-12   | omap2plus_defcon=
fig          | 1          =

imx8mp-evk             | arm64 | lab-broonie  | gcc-12   | defconfig+CON...=
_64K_PAGES=3Dy | 1          =

meson-g12a-u200        | arm64 | lab-baylibre | gcc-12   | defconfig+kselft=
est          | 2          =

meson-g12b-odroid-n2   | arm64 | lab-baylibre | gcc-12   | defconfig+kselft=
est          | 2          =

r8a7743-iwg20d-q7      | arm   | lab-cip      | gcc-12   | shmobile_defconf=
ig           | 1          =

sun50i-a64-pine64-plus | arm64 | lab-broonie  | gcc-12   | defconfig+CON...=
BIG_ENDIAN=3Dy | 1          =

zynqmp-zcu102          | arm64 | lab-cip      | gcc-12   | defconfig+kselft=
est          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
241001/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20241001
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      77df9e4bb2224d8ffbddec04c333a9d7965dad6c =



Test Regressions
---------------- =



platform               | arch  | lab          | compiler | defconfig       =
             | regressions
-----------------------+-------+--------------+----------+-----------------=
-------------+------------
beagle-xm              | arm   | lab-baylibre | gcc-12   | multi_v7_defc...=
MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66fb9260c6d790bbd5c86888

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241001/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241001/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fb9260c6d790bbd5c86=
889
        failing since 31 days (last pass: next-20240829, first fail: next-2=
0240830) =

 =



platform               | arch  | lab          | compiler | defconfig       =
             | regressions
-----------------------+-------+--------------+----------+-----------------=
-------------+------------
beagle-xm              | arm   | lab-baylibre | gcc-12   | omap2plus_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/66fb9100b5fc3eda3ec86870

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241001/arm/=
omap2plus_defconfig/gcc-12/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241001/arm/=
omap2plus_defconfig/gcc-12/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/66fb9100b5fc3ed=
a3ec86874
        new failure (last pass: next-20240830)
        2 lines

    2024-10-01T06:04:26.883622  kern  :alert : BUG: Bad rss-counter state m=
m:f0d63603 type:MM_FILEPAGES val:1
    2024-10-01T06:04:26.889430  kern  :alert : BUG: Bad rss-counter state m=
m:f0d63603 type:MM_ANONPAGES val:-2
    2024-10-01T06:04:26.901392  <8>[   23.890930] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =

 =



platform               | arch  | lab          | compiler | defconfig       =
             | regressions
-----------------------+-------+--------------+----------+-----------------=
-------------+------------
imx8mp-evk             | arm64 | lab-broonie  | gcc-12   | defconfig+CON...=
_64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66fb931622845e86c5c86869

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241001/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-imx8mp-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241001/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-imx8mp-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fb931622845e86c5c86=
86a
        new failure (last pass: next-20240930) =

 =



platform               | arch  | lab          | compiler | defconfig       =
             | regressions
-----------------------+-------+--------------+----------+-----------------=
-------------+------------
meson-g12a-u200        | arm64 | lab-baylibre | gcc-12   | defconfig+kselft=
est          | 2          =


  Details:     https://kernelci.org/test/plan/id/66fb9b46b65d145463c86863

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241001/arm6=
4/defconfig+kselftest/gcc-12/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241001/arm6=
4/defconfig+kselftest/gcc-12/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/66fb9b46b65d145=
463c86866
        new failure (last pass: next-20240830)
        2 lines

    2024-10-01T06:48:32.914994  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004, ISS2 =3D 0x00000000
    2024-10-01T06:48:32.915948  kern  :alert :   CM =3D 0, WnR =3D 0, TnD =
=3D 0, TagAccess =3D 0
    2024-10-01T06:48:32.916337  kern  :alert :   GCS =3D 0, Overlay =3D 0, =
DirtyBit =3D 0, Xs =3D 0
    2024-10-01T06:48:32.916682  kern  :alert : [cccccccccccccccc] address b=
etween user and kernel address ranges
    2024-10-01T06:48:32.936843  kern  :emerg : Internal error: Oops: 000000=
0096000004 [#1] PREEMPT SMP
    2024-10-01T06:48:32.938076  kern  :emerg : Code: 540004aa f9401a80 9b25=
0265 b4000445 (294014a3) =

    2024-10-01T06:48:32.938479  <8>[   20.095013] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2024-10-01T06:48:32.938883  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/66fb9b46b65d145=
463c86867
        new failure (last pass: next-20240830)
        12 lines

    2024-10-01T06:48:32.870915  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address cccccccccccccccc
    2024-10-01T06:48:32.871566  kern  :alert : Mem abort info:
    2024-10-01T06:48:32.872118  kern  :alert :   ESR =3D 0x0000000096000004
    2024-10-01T06:48:32.872492  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2024-10-01T06:48:32.892927  kern  :alert :   SET =3D 0, FnV =3D<8>[   2=
0.037018] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3D=
lines MEASUREMENT=3D12>
    2024-10-01T06:48:32.893568   0
    2024-10-01T06:48:32.893911  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2024-10-01T06:48:32.894213  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2024-10-01T06:48:32.894558  kern  :alert : Data abort info:   =

 =



platform               | arch  | lab          | compiler | defconfig       =
             | regressions
-----------------------+-------+--------------+----------+-----------------=
-------------+------------
meson-g12b-odroid-n2   | arm64 | lab-baylibre | gcc-12   | defconfig+kselft=
est          | 2          =


  Details:     https://kernelci.org/test/plan/id/66fb9bd30cddbfae05c8686b

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241001/arm6=
4/defconfig+kselftest/gcc-12/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241001/arm6=
4/defconfig+kselftest/gcc-12/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/66fb9bd30cddbfa=
e05c8686e
        new failure (last pass: next-20240830)
        2 lines

    2024-10-01T06:50:47.763399  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2024-10-01T06:50:47.763843  kern  :alert : Data abort info:
    2024-10-01T06:50:47.764196  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004, ISS2 =3D 0x00000000
    2024-10-01T06:50:47.801499  kern  :alert :   CM =3D 0, WnR =3D 0, TnD =
=3D 0, TagAccess =3D 0
    2024-10-01T06:50:47.802439  kern  :alert :   GCS =3D 0, Overlay =3D 0, =
DirtyBit =3D 0, Xs =3D 0
    2024-10-01T06:50:47.802862  kern  :alert : [cccccccccccccccc] address b=
etween user and kernel address ranges
    2024-10-01T06:50:47.803431  kern  :emerg : Internal error:<8>[   19.309=
795] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D2>
    2024-10-01T06:50:47.803927   Oops: 0000000096000004 [#1] PREEMPT SMP
    2024-10-01T06:50:47.804274  <8>[   19.320415] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3899971_1.5.2.4.1>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/66fb9bd30cddbfa=
e05c8686f
        new failure (last pass: next-20240830)
        12 lines

    2024-10-01T06:50:47.758588  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address cccccccccccccccc
    2024-10-01T06:50:47.759360  kern  :alert : Mem abort info:
    2024-10-01T06:50:47.759861  kern  :alert :   ESR =3D 0x0000000096000004
    2024-10-01T06:50:47.760221  kern  :alert :   EC =3D 0x25: <8>[   19.259=
506] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D12>
    2024-10-01T06:50:47.760558  DABT (current EL), IL =3D 32 bits
    2024-10-01T06:50:47.760884  kern  :alert :   SET =3D 0, FnV =3D 0
    2024-10-01T06:50:47.761200  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =



platform               | arch  | lab          | compiler | defconfig       =
             | regressions
-----------------------+-------+--------------+----------+-----------------=
-------------+------------
r8a7743-iwg20d-q7      | arm   | lab-cip      | gcc-12   | shmobile_defconf=
ig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66fb94979dba448091c86881

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241001/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241001/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fb94979dba448091c86=
882
        new failure (last pass: next-20240930) =

 =



platform               | arch  | lab          | compiler | defconfig       =
             | regressions
-----------------------+-------+--------------+----------+-----------------=
-------------+------------
sun50i-a64-pine64-plus | arm64 | lab-broonie  | gcc-12   | defconfig+CON...=
BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66fb9d83d172973083c86871

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241001/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-12/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241001/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-12/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/66fb9d83d172973=
083c86874
        failing since 24 days (last pass: next-20240904, first fail: next-2=
0240906)
        2 lines

    2024-10-01T06:58:03.343336  kern  :emerg : thermal thermal_zone2: gpu1-=
thermal: critical temperature reached
    2024-10-01T06:58:03.348928  kern  :emerg : reboot: HARDWARE PROTECTION =
shutdown (Temperature too high)
    2024-10-01T06:58:03.367619  <8>[   17.581892] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =

 =



platform               | arch  | lab          | compiler | defconfig       =
             | regressions
-----------------------+-------+--------------+----------+-----------------=
-------------+------------
zynqmp-zcu102          | arm64 | lab-cip      | gcc-12   | defconfig+kselft=
est          | 1          =


  Details:     https://kernelci.org/test/plan/id/66fb9bcaf83febec16c86861

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241001/arm6=
4/defconfig+kselftest/gcc-12/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241001/arm6=
4/defconfig+kselftest/gcc-12/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fb9bcaf83febec16c86=
862
        new failure (last pass: next-20240926) =

 =20

