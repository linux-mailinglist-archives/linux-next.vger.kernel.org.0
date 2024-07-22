Return-Path: <linux-next+bounces-3095-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C95938E17
	for <lists+linux-next@lfdr.de>; Mon, 22 Jul 2024 13:34:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAACE1F21BF4
	for <lists+linux-next@lfdr.de>; Mon, 22 Jul 2024 11:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A18E16C69D;
	Mon, 22 Jul 2024 11:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="FGzaDgxO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A4C17597
	for <linux-next@vger.kernel.org>; Mon, 22 Jul 2024 11:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721648059; cv=none; b=UzsYtebqen3X4+cUuTe0jIEyZlQIu8Crs6agLH6E6v2cv5iAucMgiOEDokdqv0yuL6qHtQKT6ssYYJM50ZJfDDLlAm/MSulxao+lDhh37fd970g66e6WfUowNlHwOAHQvpJgPpqHLbqtWN3YY8S5FrC4m7EU7PpE5g9QeRklQuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721648059; c=relaxed/simple;
	bh=A2DuHEy2nFdEFo7Z9uJtTwrVKAD8aZZ9p4BhlRAhefU=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=NDd9lOxw3mBqb7FLKQsIPgF0WFGEkN2Esd1alKL5uwj0a4cgmRtYO5nHQas4u6Na8X0L9tKzvJf+K+WYh4uJMQKK9dp2RlMmnA9NL1Dp1El95ERdnGEB6D0RkJO3KjMKq9QAItCtvIhPboC4qhhL1rGCqWeL95tbE02YnBBgDDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=FGzaDgxO; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fc4fcbb131so34591765ad.3
        for <linux-next@vger.kernel.org>; Mon, 22 Jul 2024 04:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1721648056; x=1722252856; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6wkTpwDZOcXjMTjDlFOR+0C04xUXu/ilUc2tHDwxQUA=;
        b=FGzaDgxOeDXzfUYAXqlfEnUSHPm2Y47em+E15lHQgjZ3U7pwNIysTmMK0lwwMpXMg/
         ci2SlM+jtowSaym9r7Cljokt9cXTSOCZLro7QYgJ5mExM8njQDxiPRCU3Sdm02VKta51
         gSqaYC+7+rnJoYQ6Js949D9reqDI0tyD1Qa8lDNfAgGZU+/Mkh6iyilOaz1QPaW/lrM0
         tFJ1VCL7ceZmYsG0z8R+SgAd8HM1a+Y73cu27Y2tAWr1v3uOQpPzRBgT5pQoC+VWcwd9
         uu7pJRSEdypYe5QIIT4739qIfLr4mYodMG60dezLSRmEIPVxbPnCu/yFa0vHDjVlNPGt
         RBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721648056; x=1722252856;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6wkTpwDZOcXjMTjDlFOR+0C04xUXu/ilUc2tHDwxQUA=;
        b=G1u6JzI6+oPz1uLSFqTL+AEh8wpQgofXud+S5zIFNMKSiAKW5gwCKZNjP+wKOoiWTc
         2gcLBCY3O6ELcybtlhbqIDO+PoVZw/I5re05dtFh9ld7Hp4K3WorlOQbNj6S1WlUZ7AF
         JciBF5b4pcNCIZ58nHrofIRjx7yXpnhAzuF4MM6eN1J+h7CFVIIqWz/lJKxuvTyWlhG2
         Uxy9ItU81XNftynelmASGlwjEjB+UIltjy9Cev2CKOARgbLRa1FJhIwF3A1dLh6DQki5
         UKFDGcjz2NL/5xKgOAPH9pyD3WHUsyLopMbyqlV+j5HGT4D8HDGFYyip55mUkTKfKGqN
         Q2og==
X-Gm-Message-State: AOJu0YyraYNcAiOgDe+PIwCv8EBlJTZ7enulotiwzEmWBeZ5obpHTdMp
	b0kZq3hOfY4LDLRLEX6Dz4n5uHXyUCtMw45OBsqDxNaCRdJqC9jbd5Gjf9ydaKRfql7/4Doa7OP
	t
X-Google-Smtp-Source: AGHT+IH1L/tbCA47GW8hfUK/0/VMp0WTidCzYfze3aSwE4vap0GWTUFohO93AhuxNyw6s8B4oZBBqg==
X-Received: by 2002:a17:902:d48f:b0:1f7:3a4:f66f with SMTP id d9443c01a7336-1fd7462125cmr82116945ad.43.1721648055960;
        Mon, 22 Jul 2024 04:34:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f3181bdsm52370095ad.133.2024.07.22.04.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 04:34:15 -0700 (PDT)
Message-ID: <669e43b7.170a0220.298d9.d3fa@mx.google.com>
Date: Mon, 22 Jul 2024 04:34:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20240722
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 323 runs, 7 regressions (next-20240722)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 323 runs, 7 regressions (next-20240722)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig           =
| regressions
------------------+-------+---------------+----------+---------------------=
+------------
beagle-xm         | arm   | lab-baylibre  | gcc-12   | omap2plus_defconfig =
| 1          =

beaglebone-black  | arm   | lab-cip       | gcc-12   | omap2plus_defconfig =
| 1          =

qemu_riscv64      | riscv | lab-broonie   | gcc-12   | defconfig+debug     =
| 1          =

qemu_riscv64      | riscv | lab-collabora | gcc-12   | defconfig+debug     =
| 1          =

qemu_smp8_riscv64 | riscv | lab-broonie   | gcc-12   | defconfig+debug     =
| 1          =

qemu_smp8_riscv64 | riscv | lab-collabora | gcc-12   | defconfig+debug     =
| 1          =

r8a7743-iwg20d-q7 | arm   | lab-cip       | gcc-12   | shmobile_defconfig  =
| 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240722/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240722
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      dee7f101b64219f512bb2f842227bd04c14efe30 =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig           =
| regressions
------------------+-------+---------------+----------+---------------------=
+------------
beagle-xm         | arm   | lab-baylibre  | gcc-12   | omap2plus_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/669e0ae854c084f44a7e7080

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240722/arm/=
omap2plus_defconfig/gcc-12/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240722/arm/=
omap2plus_defconfig/gcc-12/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/669e0ae854c084f44a7e7=
081
        new failure (last pass: next-20240719) =

 =



platform          | arch  | lab           | compiler | defconfig           =
| regressions
------------------+-------+---------------+----------+---------------------=
+------------
beaglebone-black  | arm   | lab-cip       | gcc-12   | omap2plus_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/669e28ca2715ff42d57e706d

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240722/arm/=
omap2plus_defconfig/gcc-12/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240722/arm/=
omap2plus_defconfig/gcc-12/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/669e28ca2715ff42=
d57e7072
        new failure (last pass: next-20240719)
        1 lines

    2024-07-22T09:39:10.157954  / # =

    2024-07-22T09:39:10.164385  =

    2024-07-22T09:39:10.267714  / # #
    2024-07-22T09:39:10.273355  #
    2024-07-22T09:39:10.374569  / # export SHELL=3D/bin/sh
    2024-07-22T09:39:10.380996  export SHELL=3D/bin/sh
    2024-07-22T09:39:10.481859  / # . /lava-1170917/environment
    2024-07-22T09:39:10.488277  . /lava-1170917/environment
    2024-07-22T09:39:10.589319  / # /lava-1170917/bin/lava-test-runner /lav=
a-1170917/0
    2024-07-22T09:39:10.594479  /lava-1170917/bin/lava-test-runner /lava-11=
70917/0 =

    ... (9 line(s) more)  =

 =



platform          | arch  | lab           | compiler | defconfig           =
| regressions
------------------+-------+---------------+----------+---------------------=
+------------
qemu_riscv64      | riscv | lab-broonie   | gcc-12   | defconfig+debug     =
| 1          =


  Details:     https://kernelci.org/test/plan/id/669e12bea1cf5e869c7e7091

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240722/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240722/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/669e12bea1cf5e869c7e7=
092
        failing since 5 days (last pass: next-20240712, first fail: next-20=
240716) =

 =



platform          | arch  | lab           | compiler | defconfig           =
| regressions
------------------+-------+---------------+----------+---------------------=
+------------
qemu_riscv64      | riscv | lab-collabora | gcc-12   | defconfig+debug     =
| 1          =


  Details:     https://kernelci.org/test/plan/id/669e125660cb3757037e7088

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240722/risc=
v/defconfig+debug/gcc-12/lab-collabora/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240722/risc=
v/defconfig+debug/gcc-12/lab-collabora/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/669e125660cb3757037e7=
089
        failing since 5 days (last pass: next-20240712, first fail: next-20=
240716) =

 =



platform          | arch  | lab           | compiler | defconfig           =
| regressions
------------------+-------+---------------+----------+---------------------=
+------------
qemu_smp8_riscv64 | riscv | lab-broonie   | gcc-12   | defconfig+debug     =
| 1          =


  Details:     https://kernelci.org/test/plan/id/669e12c072694384987e7082

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240722/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240722/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/669e12c072694384987e7=
083
        failing since 5 days (last pass: next-20240712, first fail: next-20=
240716) =

 =



platform          | arch  | lab           | compiler | defconfig           =
| regressions
------------------+-------+---------------+----------+---------------------=
+------------
qemu_smp8_riscv64 | riscv | lab-collabora | gcc-12   | defconfig+debug     =
| 1          =


  Details:     https://kernelci.org/test/plan/id/669e1258ce7f4ddf997e708a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240722/risc=
v/defconfig+debug/gcc-12/lab-collabora/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240722/risc=
v/defconfig+debug/gcc-12/lab-collabora/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/669e1258ce7f4ddf997e7=
08b
        failing since 5 days (last pass: next-20240712, first fail: next-20=
240716) =

 =



platform          | arch  | lab           | compiler | defconfig           =
| regressions
------------------+-------+---------------+----------+---------------------=
+------------
r8a7743-iwg20d-q7 | arm   | lab-cip       | gcc-12   | shmobile_defconfig  =
| 1          =


  Details:     https://kernelci.org/test/plan/id/669e04ae1b4542e8a77e7076

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240722/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240722/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/669e04ae1b4542e8a77e7=
077
        failing since 2 days (last pass: next-20240718, first fail: next-20=
240719) =

 =20

