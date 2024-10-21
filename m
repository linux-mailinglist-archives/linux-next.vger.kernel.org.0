Return-Path: <linux-next+bounces-4351-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 170339A6692
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2024 13:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C70F0280D39
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2024 11:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29491E0087;
	Mon, 21 Oct 2024 11:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="LH5iUrH1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BCC198E6F
	for <linux-next@vger.kernel.org>; Mon, 21 Oct 2024 11:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729510137; cv=none; b=eTgSRUY1S8XskUuvbey7qYpeN+n1Dshl4r0jgE2gInA0VtcPcJlxMnwRGYeIGL++5hM8xoHofABVzvKuA29bw1wXelgi57475dWo6RtFyFAUmnaiAv2HShNbD1SfmVLPWwhRoj2+AVWKeojEsoNaOTKEUKrnYh2R9JlWd23lwC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729510137; c=relaxed/simple;
	bh=y/KaL2Ksios6jP/hAKtDiTuDvCUwTc+U6xZYczUeVsM=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=LCXd4P/5gSBVLAOaqKhHP4a12Q81GPbke6gnrGfkzlHvCZmQ+nzsERG0eBv++auZ8H0zUW17rH2RfXvGpJFtkQOSC/Gl+JgCLTDKQxkZ4XjDlMTk9zlVtr35K4tvMBjTk+Dlz4MEyt7urdzZmdIOAO/EEmrx/J8bdYKQxkGJqoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=LH5iUrH1; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2e2cc47f1d7so2878115a91.0
        for <linux-next@vger.kernel.org>; Mon, 21 Oct 2024 04:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1729510134; x=1730114934; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SGDjrbZ0vhqUaYXuZrjip0y9bCrLbK7nXn8/MLNn7BU=;
        b=LH5iUrH1UhFhfVTBkqGyyuoT1dQ8PY3Fc/mmQ53AziUkQ56LvBeA3pK6B8WP9nSdjX
         l1r9nOxz9t9Yd03TVv6Tsyl46x7dXjmULhRHoT82qf5k+4Hwu/1jm0z8/royARl9h4e3
         +vKSXmCcBpE5qqo2VzrCCASxZHX1U4tMRmk1OoA9eclUiXZhbJqJQA87NTRSlRHr672W
         qbKfVT/jfdsMU0SeLEcSgUYkS1Jecdnb2KRKHsXhiaAxUnl5nyubJ4ytYGqIltd24faT
         0dd2oDsPHw7UpgD/lROggImt33xHEUmVDS7aAE986wVOySzSU5kyI5BxJEXNYdBoCbf8
         VemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729510134; x=1730114934;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SGDjrbZ0vhqUaYXuZrjip0y9bCrLbK7nXn8/MLNn7BU=;
        b=oZNg2ZIzMpo680XUBGLaIlJvXKZ608ycUsFTbHWWOg8m9iBtpHNM+IVpSCoY1ZuMba
         BFPZ0RqO3x1HjrbxK1+z8pMpcoK/4h4tqmTpmam0t0P5BQDe/4PCCy2BCsy3izU30YrM
         S/BOjkwDRiD4YM1r9bHvWv7wj4E+/fHHFuSG9z3bl0W7V4Ry5Ben+UauPLugzv3T4M9d
         SxtzJbt7Vvm+STGmRIFfAr1YFKIuVoMii1kOpa1gUoLcQICFw0ywvzY2pob5VWRiwm3r
         geFuIMUS9zDFXR4M1iOYmxh9M3RGC8xuWVG4JPpeBywPsa98Ukj0vFYrnVSQQ1nJ61KT
         hIaw==
X-Gm-Message-State: AOJu0YwEs6lxP0h8qPLgqFduWgr5jt9QiDlKDoBj3diPZNNCN2QvB+0h
	v+i3I0yYvauht/+y4KssuqyVUGXKT/MFaeeIjEhhbTKl6mXSfleiZNj1rVGn5LyLAW0rTk/IrCS
	2
X-Google-Smtp-Source: AGHT+IG6I6St+L+K1TNOvq35YqXHNKemiSWbV7ZNY69wdoNKwx+O3EA4iwg1k+Pmng/TFHeCYLbRvw==
X-Received: by 2002:a17:90b:1c0d:b0:2d8:85fc:464c with SMTP id 98e67ed59e1d1-2e3dc25d0fcmr22467699a91.11.1729510134109;
        Mon, 21 Oct 2024 04:28:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad38543asm3440824a91.25.2024.10.21.04.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 04:28:53 -0700 (PDT)
Message-ID: <67163af5.170a0220.1d9084.7cfc@mx.google.com>
Date: Mon, 21 Oct 2024 04:28:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20241021
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 132 runs, 17 regressions (next-20241021)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 132 runs, 17 regressions (next-20241021)

Regressions Summary
-------------------

platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
beaglebone-black           | arm   | lab-cip      | gcc-12   | omap2plus_de=
fconfig          | 1          =

jetson-tk1                 | arm   | lab-baylibre | gcc-12   | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | gcc-12   | defconfig+de=
bug              | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N..._16K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-12   | defconfig+de=
bug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N..._16K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie  | gcc-12   | defconfig+de=
bug              | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N..._16K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N..._16K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
241021/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20241021
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      63b3ff03d91ae8f875fe8747c781a521f78cde17 =



Test Regressions
---------------- =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
beaglebone-black           | arm   | lab-cip      | gcc-12   | omap2plus_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/67161a7dcfd00ab392c86856

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241021/arm/=
omap2plus_defconfig/gcc-12/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241021/arm/=
omap2plus_defconfig/gcc-12/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/67161a7dcfd00ab3=
92c8685b
        failing since 3 days (last pass: next-20241015, first fail: next-20=
241017)
        1 lines

    2024-10-21T09:09:42.152555  / # =

    2024-10-21T09:09:42.161516  =

    2024-10-21T09:09:42.266538  / # #
    2024-10-21T09:09:42.273426  #
    2024-10-21T09:09:42.417936  / # export SHELL=3D/bin/sh
    2024-10-21T09:09:42.433172  export SHELL=3D/bin/sh
    2024-10-21T09:09:42.534987  / # . /lava-1210334/environment
    2024-10-21T09:09:42.545058  . /lava-1210334/environment
    2024-10-21T09:09:42.646932  / # /lava-1210334/bin/lava-test-runner /lav=
a-1210334/0
    2024-10-21T09:09:42.656880  /lava-1210334/bin/lava-test-runner /lava-12=
10334/0 =

    ... (9 line(s) more)  =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
jetson-tk1                 | arm   | lab-baylibre | gcc-12   | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6716042c471d0b5008c8685a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241021/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-baylibre/baseline-jetson-tk1.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20241021/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-baylibre/baseline-jetson-tk1.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6716042c471d0b5008c86=
85b
        failing since 9 days (last pass: next-20241008, first fail: next-20=
241011) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | gcc-12   | defconfig+de=
bug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6715fc2c9c2f6a4f55c86865

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6715fc2c9c2f6a4f55c86=
866
        failing since 2 days (last pass: next-20241015, first fail: next-20=
241018) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/671601b945c2e0a311c8687d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671601b945c2e0a311c86=
87e
        failing since 3 days (last pass: next-20241016, first fail: next-20=
241017) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/67160505d3264ff8d4c86867

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67160505d3264ff8d4c86=
868
        failing since 3 days (last pass: next-20241016, first fail: next-20=
241017) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/67160518fccb42289fc868d7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67160518fccb42289fc86=
8d8
        failing since 2 days (last pass: next-20241016, first fail: next-20=
241018) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-12   | defconfig+de=
bug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6715fc6ab59716e991c8686d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6715fc6ab59716e991c86=
86e
        failing since 28 days (last pass: next-20240829, first fail: next-2=
0240923) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/671601d0fe36a0b05dc8685a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671601d0fe36a0b05dc86=
85b
        failing since 3 days (last pass: next-20241016, first fail: next-20=
241017) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/67160504d3264ff8d4c86864

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67160504d3264ff8d4c86=
865
        failing since 3 days (last pass: next-20241016, first fail: next-20=
241017) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/671605a426e0a67549c8685a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671605a426e0a67549c86=
85b
        failing since 2 days (last pass: next-20241016, first fail: next-20=
241018) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie  | gcc-12   | defconfig+de=
bug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6715fbcb2ac8c98199c86860

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6715fbcb2ac8c98199c86=
861
        failing since 2 days (last pass: next-20241015, first fail: next-20=
241018) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/67160259a3562edcbec8685b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67160259a3562edcbec86=
85c
        failing since 3 days (last pass: next-20241016, first fail: next-20=
241017) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/671604edd3264ff8d4c8685d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671604edd3264ff8d4c86=
85e
        failing since 3 days (last pass: next-20241016, first fail: next-20=
241017) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6716058e26e0a67549c86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6716058e26e0a67549c86=
856
        failing since 2 days (last pass: next-20241016, first fail: next-20=
241018) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/671602842700a42b56c86871

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671602842700a42b56c86=
872
        failing since 3 days (last pass: next-20241016, first fail: next-20=
241017) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/671604f07880e0c52bc86870

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671604f07880e0c52bc86=
871
        failing since 3 days (last pass: next-20241016, first fail: next-20=
241017) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | gcc-12   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/671605b834144a377cc8685e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241021/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671605b834144a377cc86=
85f
        failing since 2 days (last pass: next-20241016, first fail: next-20=
241018) =

 =20

