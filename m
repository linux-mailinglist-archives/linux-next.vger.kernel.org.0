Return-Path: <linux-next+bounces-3372-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDE39590E5
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2024 01:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC4FF283E4B
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 23:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A23241C6880;
	Tue, 20 Aug 2024 23:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="SiNYDFS2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84508107A0
	for <linux-next@vger.kernel.org>; Tue, 20 Aug 2024 23:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724195293; cv=none; b=nQhCOr2lQPzUEYRJrLTt7Oazu7YbVPg78u4sntpJRDm0XeGGpEOxgkjBVKvvOpieTGmC6JjL1VG/5zxAee1bk/S7ysFMPzK8Igj8N08PLQ1PezLhO5bRykkr8RaFonhNK8bmVlljopi5MrHYVJ95uXJff9Kn8N2DLLFok1x/448=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724195293; c=relaxed/simple;
	bh=2F2k0fUGDLos7se01y4zuctwL6C9ayd6t2TjZ8dqHKU=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=YxP+EwvPZXt5zFGud6GjEvG986H7SW3J6Iz4m7a7MV2xA+oQNRM95oIlaHiMJvXlweuNmIKdgiwgy5FbfR1nGa9wjrWHGedMPv6GR2/pXi/+7QIw6QEieF1EpR4jMeCJpFyVLPqcJwhlpUOGezb4qJKkdRsaWhg0RMqLHTAfSLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=SiNYDFS2; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-201fae21398so37220105ad.1
        for <linux-next@vger.kernel.org>; Tue, 20 Aug 2024 16:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1724195289; x=1724800089; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DQ/MQ4PoEE19ZkuMDQ1+hQTC65eeS9u2hgJgH0s5tYw=;
        b=SiNYDFS2yuUfNhBeWADqw3pKAvGD0m/PKjBzDsjTrPfmoUe0RBrHoA4LkUdwrww9Vr
         rKPB9B9q9QIFanlE+wmDbf6fdxetwCF/gho09zTzcY70OKHtvQJ+FCENsz/8mL6x8r/1
         sAdqcIX0trs7dswqWtujbnGVxVaGKRxZ0jwOt3SOH2OznKiCQe658y0IEJkdnr4Ss5CF
         MqZPi8NP1mgHsdjdBbHhuKLK2oZ8bsfM1G/HQg66cjiLfoQpryBOxc81pulNw/YXFH54
         huL3MnKFusDGi9El4qR35dJxkZv2Z02hdsJ7VqEwj0t6gBCXejq5Neq8maPkpsdtYd1d
         3HCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724195289; x=1724800089;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQ/MQ4PoEE19ZkuMDQ1+hQTC65eeS9u2hgJgH0s5tYw=;
        b=JPoQMzN2BxpJDcHM5Stc4QC79Q7BbN8KEF99nnmvXnhxuhvugZqFqCOkg4R23t2nbG
         fzxbSIMrmmrOinyVnmkJcncwe/jQjKpCbHHL9+rrBZ0LhGWDm4IQpoXKTLqnvnCCrVvS
         9lRh+4cfOpwukXzeHRAFNvUxMZDTasp/xuCiDpgzq7agGJ0VnCYcdcXYf5OO1sREc0rk
         LySOjvrkqurljHpkSF80T4gxeQ42SNypPyNbWtZs63TOW4bntDqBRuAAPsHJH438lwbj
         qheOTw0nhADiwusX4UGO1KqxR7v3mjX91NSF8YtAULZwudwLq7GJV5i4dS1orw8k2i8W
         9EEg==
X-Gm-Message-State: AOJu0Ywk16clZjLCED+al1BZKNDrdTO0QQ16+ojY0Q8Dac7hG7du6xyy
	1UQ2gqaHyELLG49CS+Gd3AxUsFBqL35y5JmfAtlN2SkIN1PxZvXnrBNLsdwdTWWvzTOZ1PkZlwP
	0
X-Google-Smtp-Source: AGHT+IFH7QC8kxdlJ84BIBZkab4zoE9SSpU6CV3j2mKdcJrA/SZioit2TVMcK/MiHITxU47qwrgxTw==
X-Received: by 2002:a17:903:2a84:b0:1fb:90e1:c8c0 with SMTP id d9443c01a7336-203681d69eemr4859075ad.63.1724195289024;
        Tue, 20 Aug 2024 16:08:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f031bc27sm82467045ad.71.2024.08.20.16.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 16:08:08 -0700 (PDT)
Message-ID: <66c521d8.170a0220.ead83.d697@mx.google.com>
Date: Tue, 20 Aug 2024 16:08:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20240820
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 192 runs, 30 regressions (next-20240820)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 192 runs, 30 regressions (next-20240820)

Regressions Summary
-------------------

platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
at91-sama5d4_xplained  | arm    | lab-baylibre | clang-17   | multi_v7_defc=
onfig           | 1          =

beagle-xm              | arm    | lab-baylibre | gcc-12     | omap2plus_def=
config          | 1          =

qemu_i386              | i386   | lab-broonie  | clang-17   | i386_defconfi=
g               | 1          =

qemu_i386              | i386   | lab-broonie  | gcc-12     | i386_defconfi=
g+debug         | 1          =

qemu_i386              | i386   | lab-broonie  | gcc-12     | i386_defconfi=
g               | 1          =

qemu_i386-uefi         | i386   | lab-broonie  | clang-17   | i386_defconfi=
g               | 1          =

qemu_i386-uefi         | i386   | lab-broonie  | gcc-12     | i386_defconfi=
g+debug         | 1          =

qemu_i386-uefi         | i386   | lab-broonie  | gcc-12     | i386_defconfi=
g               | 1          =

qemu_mips-malta        | mips   | lab-broonie  | gcc-12     | malta_defconf=
ig              | 1          =

qemu_x86_64            | x86_64 | lab-broonie  | clang-17   | x86_64_defcon=
fig             | 1          =

qemu_x86_64            | x86_64 | lab-broonie  | gcc-12     | x86_64_defcon=
fig+x86-board   | 1          =

qemu_x86_64            | x86_64 | lab-broonie  | gcc-12     | x86_64_defcon=
fig+debug       | 1          =

qemu_x86_64            | x86_64 | lab-broonie  | gcc-12     | x86_64_defcon=
fig             | 1          =

qemu_x86_64            | x86_64 | lab-broonie  | rustc-1.75 | x86_64_defcon=
fig+rust        | 1          =

qemu_x86_64            | x86_64 | lab-broonie  | rustc-1.75 | x86_64_defcon=
...rust-samples | 1          =

qemu_x86_64            | x86_64 | lab-broonie  | rustc-1.75 | x86_64_defcon=
fig             | 1          =

qemu_x86_64-uefi       | x86_64 | lab-broonie  | clang-17   | x86_64_defcon=
fig             | 1          =

qemu_x86_64-uefi       | x86_64 | lab-broonie  | gcc-12     | x86_64_defcon=
fig+x86-board   | 1          =

qemu_x86_64-uefi       | x86_64 | lab-broonie  | gcc-12     | x86_64_defcon=
fig+debug       | 1          =

qemu_x86_64-uefi       | x86_64 | lab-broonie  | gcc-12     | x86_64_defcon=
fig             | 1          =

qemu_x86_64-uefi       | x86_64 | lab-broonie  | rustc-1.75 | x86_64_defcon=
fig+rust        | 1          =

qemu_x86_64-uefi       | x86_64 | lab-broonie  | rustc-1.75 | x86_64_defcon=
...rust-samples | 1          =

qemu_x86_64-uefi       | x86_64 | lab-broonie  | rustc-1.75 | x86_64_defcon=
fig             | 1          =

qemu_x86_64-uefi-mixed | x86_64 | lab-broonie  | clang-17   | x86_64_defcon=
fig             | 1          =

qemu_x86_64-uefi-mixed | x86_64 | lab-broonie  | gcc-12     | x86_64_defcon=
fig+x86-board   | 1          =

qemu_x86_64-uefi-mixed | x86_64 | lab-broonie  | gcc-12     | x86_64_defcon=
fig+debug       | 1          =

qemu_x86_64-uefi-mixed | x86_64 | lab-broonie  | gcc-12     | x86_64_defcon=
fig             | 1          =

qemu_x86_64-uefi-mixed | x86_64 | lab-broonie  | rustc-1.75 | x86_64_defcon=
fig+rust        | 1          =

qemu_x86_64-uefi-mixed | x86_64 | lab-broonie  | rustc-1.75 | x86_64_defcon=
...rust-samples | 1          =

qemu_x86_64-uefi-mixed | x86_64 | lab-broonie  | rustc-1.75 | x86_64_defcon=
fig             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240820/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240820
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      bb1b0acdcd66e0d8eedee3570d249e076b89ab32 =



Test Regressions
---------------- =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
at91-sama5d4_xplained  | arm    | lab-baylibre | clang-17   | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4eb0101e05d29bfc86874

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4eb0101e05d29bfc86=
875
        new failure (last pass: next-20240716) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
beagle-xm              | arm    | lab-baylibre | gcc-12     | omap2plus_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4e64a8a6ac8aca5c8688d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/arm/=
omap2plus_defconfig/gcc-12/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/arm/=
omap2plus_defconfig/gcc-12/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4e64a8a6ac8aca5c86=
88e
        failing since 29 days (last pass: next-20240719, first fail: next-2=
0240722) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
qemu_i386              | i386   | lab-broonie  | clang-17   | i386_defconfi=
g               | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4eb98a5661aca00c86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/i386=
/i386_defconfig/clang-17/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/i386=
/i386_defconfig/clang-17/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4eb98a5661aca00c86=
856
        new failure (last pass: next-20240730) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
qemu_i386              | i386   | lab-broonie  | gcc-12     | i386_defconfi=
g+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4e1349d9c0e5348c86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-12 (gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/i386=
/i386_defconfig+debug/gcc-12/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/i386=
/i386_defconfig+debug/gcc-12/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4e1349d9c0e5348c86=
856
        new failure (last pass: next-20240801) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
qemu_i386              | i386   | lab-broonie  | gcc-12     | i386_defconfi=
g               | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4ec1047bbca0741c86869

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-12 (gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/i386=
/i386_defconfig/gcc-12/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/i386=
/i386_defconfig/gcc-12/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4ec1047bbca0741c86=
86a
        new failure (last pass: next-20240801) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
qemu_i386-uefi         | i386   | lab-broonie  | clang-17   | i386_defconfi=
g               | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4ebc08857a6e407c86862

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/i386=
/i386_defconfig/clang-17/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/i386=
/i386_defconfig/clang-17/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4ebc08857a6e407c86=
863
        new failure (last pass: next-20240730) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
qemu_i386-uefi         | i386   | lab-broonie  | gcc-12     | i386_defconfi=
g+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4e132924c0f5095c86890

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-12 (gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/i386=
/i386_defconfig+debug/gcc-12/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/i386=
/i386_defconfig+debug/gcc-12/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4e132924c0f5095c86=
891
        new failure (last pass: next-20240801) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
qemu_i386-uefi         | i386   | lab-broonie  | gcc-12     | i386_defconfi=
g               | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4ec3dad399ae1a9c86856

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-12 (gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/i386=
/i386_defconfig/gcc-12/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/i386=
/i386_defconfig/gcc-12/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4ec3dad399ae1a9c86=
857
        new failure (last pass: next-20240801) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
qemu_mips-malta        | mips   | lab-broonie  | gcc-12     | malta_defconf=
ig              | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4eb75e2bdfecae4c8685b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-12 (mips-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/mips=
/malta_defconfig/gcc-12/lab-broonie/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/mips=
/malta_defconfig/gcc-12/lab-broonie/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4eb75e2bdfecae4c86=
85c
        new failure (last pass: next-20240801) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
qemu_x86_64            | x86_64 | lab-broonie  | clang-17   | x86_64_defcon=
fig             | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4e38c938442458fc8687b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig/clang-17/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig/clang-17/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4e38c938442458fc86=
87c
        new failure (last pass: next-20240730) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
qemu_x86_64            | x86_64 | lab-broonie  | gcc-12     | x86_64_defcon=
fig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4e312919c42db86c86861

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-12 (gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig+x86-board/gcc-12/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig+x86-board/gcc-12/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4e312919c42db86c86=
862
        new failure (last pass: next-20240801) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
qemu_x86_64            | x86_64 | lab-broonie  | gcc-12     | x86_64_defcon=
fig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4e3efed62326b0ac86867

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-12 (gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig+debug/gcc-12/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig+debug/gcc-12/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4e3efed62326b0ac86=
868
        new failure (last pass: next-20240729) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
qemu_x86_64            | x86_64 | lab-broonie  | gcc-12     | x86_64_defcon=
fig             | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4e6ec0f39d50226c86860

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-12 (gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig/gcc-12/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig/gcc-12/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4e6ec0f39d50226c86=
861
        new failure (last pass: next-20240801) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
qemu_x86_64            | x86_64 | lab-broonie  | rustc-1.75 | x86_64_defcon=
fig+rust        | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4e5f795d248fb2dc868cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust
  Compiler:    rustc-1.75 (Debian clang version 17.0.6 (++20231208085813+60=
09708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig+rust/rustc-1.75/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig+rust/rustc-1.75/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4e5f795d248fb2dc86=
8d0
        new failure (last pass: next-20240730) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
qemu_x86_64            | x86_64 | lab-broonie  | rustc-1.75 | x86_64_defcon=
...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4ea80a0036c8992c86970

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.75 (Debian clang version 17.0.6 (++20231208085813+60=
09708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.75/lab-broonie/baseline-qemu_x86_6=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.75/lab-broonie/baseline-qemu_x86_6=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4ea80a0036c8992c86=
971
        new failure (last pass: next-20240730) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
qemu_x86_64            | x86_64 | lab-broonie  | rustc-1.75 | x86_64_defcon=
fig             | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4edf2b8ae15b959c86859

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.75 (Debian clang version 17.0.6 (++20231208085813+60=
09708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig/rustc-1.75/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig/rustc-1.75/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4edf2b8ae15b959c86=
85a
        new failure (last pass: next-20240729) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
qemu_x86_64-uefi       | x86_64 | lab-broonie  | clang-17   | x86_64_defcon=
fig             | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4e38accc09c029fc86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig/clang-17/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig/clang-17/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4e38accc09c029fc86=
856
        new failure (last pass: next-20240730) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
qemu_x86_64-uefi       | x86_64 | lab-broonie  | gcc-12     | x86_64_defcon=
fig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4e314919c42db86c86864

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-12 (gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig+x86-board/gcc-12/lab-broonie/baseline-qemu_x86_64-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig+x86-board/gcc-12/lab-broonie/baseline-qemu_x86_64-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4e314919c42db86c86=
865
        new failure (last pass: next-20240801) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
qemu_x86_64-uefi       | x86_64 | lab-broonie  | gcc-12     | x86_64_defcon=
fig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4e403861c32ca7bc86859

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-12 (gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig+debug/gcc-12/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig+debug/gcc-12/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4e403861c32ca7bc86=
85a
        new failure (last pass: next-20240729) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
qemu_x86_64-uefi       | x86_64 | lab-broonie  | gcc-12     | x86_64_defcon=
fig             | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4e6e7f5a559f945c8685d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-12 (gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig/gcc-12/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig/gcc-12/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4e6e7f5a559f945c86=
85e
        new failure (last pass: next-20240801) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
qemu_x86_64-uefi       | x86_64 | lab-broonie  | rustc-1.75 | x86_64_defcon=
fig+rust        | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4e66f6a3a5fbeccc8686d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust
  Compiler:    rustc-1.75 (Debian clang version 17.0.6 (++20231208085813+60=
09708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig+rust/rustc-1.75/lab-broonie/baseline-qemu_x86_64-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig+rust/rustc-1.75/lab-broonie/baseline-qemu_x86_64-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4e66f6a3a5fbeccc86=
86e
        new failure (last pass: next-20240730) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
qemu_x86_64-uefi       | x86_64 | lab-broonie  | rustc-1.75 | x86_64_defcon=
...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4eaf801e05d29bfc86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.75 (Debian clang version 17.0.6 (++20231208085813+60=
09708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.75/lab-broonie/baseline-qemu_x86_6=
4-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.75/lab-broonie/baseline-qemu_x86_6=
4-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4eaf801e05d29bfc86=
856
        new failure (last pass: next-20240730) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
qemu_x86_64-uefi       | x86_64 | lab-broonie  | rustc-1.75 | x86_64_defcon=
fig             | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4edf65d6b0d6613c86857

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.75 (Debian clang version 17.0.6 (++20231208085813+60=
09708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig/rustc-1.75/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig/rustc-1.75/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4edf65d6b0d6613c86=
858
        new failure (last pass: next-20240729) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
qemu_x86_64-uefi-mixed | x86_64 | lab-broonie  | clang-17   | x86_64_defcon=
fig             | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4e390938442458fc8687f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig/clang-17/lab-broonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig/clang-17/lab-broonie/baseline-qemu_x86_64-uefi-mixed.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4e390938442458fc86=
880
        new failure (last pass: next-20240730) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
qemu_x86_64-uefi-mixed | x86_64 | lab-broonie  | gcc-12     | x86_64_defcon=
fig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4e318919c42db86c86867

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-12 (gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig+x86-board/gcc-12/lab-broonie/baseline-qemu_x86_64-uefi-=
mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig+x86-board/gcc-12/lab-broonie/baseline-qemu_x86_64-uefi-=
mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4e318919c42db86c86=
868
        new failure (last pass: next-20240801) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
qemu_x86_64-uefi-mixed | x86_64 | lab-broonie  | gcc-12     | x86_64_defcon=
fig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4e408861c32ca7bc8685c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-12 (gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig+debug/gcc-12/lab-broonie/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig+debug/gcc-12/lab-broonie/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4e408861c32ca7bc86=
85d
        new failure (last pass: next-20240729) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
qemu_x86_64-uefi-mixed | x86_64 | lab-broonie  | gcc-12     | x86_64_defcon=
fig             | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4e7653272e60f8fc86872

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-12 (gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig/gcc-12/lab-broonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig/gcc-12/lab-broonie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4e7653272e60f8fc86=
873
        new failure (last pass: next-20240801) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
qemu_x86_64-uefi-mixed | x86_64 | lab-broonie  | rustc-1.75 | x86_64_defcon=
fig+rust        | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4e5fcf729549db1c86874

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust
  Compiler:    rustc-1.75 (Debian clang version 17.0.6 (++20231208085813+60=
09708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig+rust/rustc-1.75/lab-broonie/baseline-qemu_x86_64-uefi-m=
ixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig+rust/rustc-1.75/lab-broonie/baseline-qemu_x86_64-uefi-m=
ixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4e5fcf729549db1c86=
875
        new failure (last pass: next-20240730) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
qemu_x86_64-uefi-mixed | x86_64 | lab-broonie  | rustc-1.75 | x86_64_defcon=
...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4eac1079b80a879c86880

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.75 (Debian clang version 17.0.6 (++20231208085813+60=
09708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.75/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.75/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4eac1079b80a879c86=
881
        new failure (last pass: next-20240730) =

 =



platform               | arch   | lab          | compiler   | defconfig    =
                | regressions
-----------------------+--------+--------------+------------+--------------=
----------------+------------
qemu_x86_64-uefi-mixed | x86_64 | lab-broonie  | rustc-1.75 | x86_64_defcon=
fig             | 1          =


  Details:     https://kernelci.org/test/plan/id/66c4edf03e72ad641dc8685c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.75 (Debian clang version 17.0.6 (++20231208085813+60=
09708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig/rustc-1.75/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240820/x86_=
64/x86_64_defconfig/rustc-1.75/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66c4edf03e72ad641dc86=
85d
        new failure (last pass: next-20240729) =

 =20

