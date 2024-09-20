Return-Path: <linux-next+bounces-3935-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 340DD97D45F
	for <lists+linux-next@lfdr.de>; Fri, 20 Sep 2024 12:40:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B66F1F25B05
	for <lists+linux-next@lfdr.de>; Fri, 20 Sep 2024 10:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DAD13D606;
	Fri, 20 Sep 2024 10:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="qa5s/r5i"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDEC13D260
	for <linux-next@vger.kernel.org>; Fri, 20 Sep 2024 10:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726828788; cv=none; b=DxwFa38yXNXHd6jqtgbvGzAicR8LQRcAD2CCC1eSGSsBN57pHlBL377w8/YKNjMDfudXO5TUFkd8vd5C5mMl4x00nF6OV7E4k+CRUO1BJGw/ZC20r7wfwd3E+nCGoV6gBzHylNRsY71q6N3JnIn5wEhIsx4Qh9pLbXP4LXbRt50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726828788; c=relaxed/simple;
	bh=Eyut4syW2/+LJ7UHWi8pR5TtfRFkLsb9/9xHo7OsW2s=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=XZEkGQlX2+PCXDYaz6QRvIAN4G4GTeLALlU8BB8ZkQQC2X1XJFtQ7GdjEWNgEVySy1BJka1qwUGD7h5bYyTFy+tmwpQ8tPU8pjfb8FCtWqRYdLeoUzpMc4xdBnMyz8hhNQmEYO8eYQlxdY/XNgVmBhKLe/Dkxjd0hoinnyWfs1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=qa5s/r5i; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2d88690837eso1661818a91.2
        for <linux-next@vger.kernel.org>; Fri, 20 Sep 2024 03:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1726828785; x=1727433585; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aroau4EFctTmhd0N/1gJr9CEsFzdeTgGsa9pzffXMLU=;
        b=qa5s/r5iYeQLhBeoNqzfmOHhN0vwPyshp0yGhcoKR7UIh0rBM1XVMx4IE/e6aV+o0p
         gJyfHUNfHwcfCPk4QmaFOHp/W7Y6b9UHspYH7h1wogFKranBaorJclfn2M0JvbdyjUWx
         i4dpuofPGedA9vP4Xt7uw101WYEtLgsVmNfCC/rezJzJ8M5xZ43vjpBQKe2f9BaovuvE
         exMmlbab9CsieWJKWHSIBskrauxoyqybDDIiEJLGtybUdkHVWf+0phf9nxQuNDdWglkE
         TbHQaRPFzkt5JOxGqRX5c1xDNeK5LOx33xxNl3gFssieJ2L5iiJ9g4pE22sPNcNWOXqp
         /FPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726828785; x=1727433585;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aroau4EFctTmhd0N/1gJr9CEsFzdeTgGsa9pzffXMLU=;
        b=JJahUQBPqG0YeQA2UlYnPyqQPODLjPs3JTedXGF0gldR9zLPM2tYSnCpudAYGHkhev
         t9g2QR2+ecYk41vi2nwz/wwhbOYWX+zLv5QvUk9c+CU0dwHYvVJm4GT6N5D+q6rAf3ij
         9yZ119bJ9URxaidG/piNDqByjE2SgtK10dKkEfM5EzZonm2WtoRnDOVZ5o634hFYcYBI
         4F3Pl7wXsEizFWIYmkO9IbfpY1yZcIrnkFJYo4zEKhnDefkjMy47lygH2jWbrLeEDCLI
         wrrFKNzFF4XnsJkDXWZQA77YeL446L1e6HGC0dJJUIcvl3gLQD23VL7LslnOOxzjKUPq
         Ia5A==
X-Gm-Message-State: AOJu0YyqQpliX0ii6SrHfNtIrfFNeLdF06SKBiQ6BSw+GzA5B/2XoVp0
	7mceWvKWp59PrSBUoHmrvZpbd9hBpGGrBluj3kHIemqZzc5WinedbWlRZcUvwEgyPDo9KUEZgnD
	l
X-Google-Smtp-Source: AGHT+IGe5uWFkaG46p8+UhGaRz1X6qLPR4KFlgJHFKZzC5eqo1T8gvqd/ERnyCOs5LpPSP00/Ws3Hg==
X-Received: by 2002:a17:90a:718a:b0:2dd:66a8:8ab0 with SMTP id 98e67ed59e1d1-2dd7f401647mr3248709a91.16.1726828784738;
        Fri, 20 Sep 2024 03:39:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd6eec511esm3710621a91.25.2024.09.20.03.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 03:39:44 -0700 (PDT)
Message-ID: <66ed50f0.170a0220.38989d.f66f@mx.google.com>
Date: Fri, 20 Sep 2024 03:39:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20240920
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 156 runs, 5 regressions (next-20240920)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 156 runs, 5 regressions (next-20240920)

Regressions Summary
-------------------

platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =

qemu_riscv64                 | riscv | lab-broonie | gcc-12   | defconfig+d=
ebug              | 1          =

qemu_smp8_riscv64            | riscv | lab-broonie | gcc-12   | defconfig+d=
ebug              | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip     | gcc-12   | shmobile_de=
fconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240920/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240920
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      62f92d634458a1e308bb699986b9147a6d670457 =



Test Regressions
---------------- =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66ed1844f02d4d7e0dc8686b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240920/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240920/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ed1844f02d4d7e0dc86=
86c
        failing since 23 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66ed181c345811b88ec86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240920/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240920/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ed181c345811b88ec86=
856
        failing since 23 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
qemu_riscv64                 | riscv | lab-broonie | gcc-12   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66ed16cc4aa532c098c8685c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240920/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240920/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ed16cc4aa532c098c86=
85d
        failing since 1 day (last pass: next-20240906, first fail: next-202=
40918) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
qemu_smp8_riscv64            | riscv | lab-broonie | gcc-12   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66ed16e5e118834971c868b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240920/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240920/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ed16e5e118834971c86=
8b5
        failing since 1 day (last pass: next-20240906, first fail: next-202=
40918) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip     | gcc-12   | shmobile_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66ed11eb4924d0eb39c86863

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240920/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240920/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ed11eb4924d0eb39c86=
864
        failing since 29 days (last pass: next-20240820, first fail: next-2=
0240821) =

 =20

