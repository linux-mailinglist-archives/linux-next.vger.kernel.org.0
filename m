Return-Path: <linux-next+bounces-2347-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9B38C8037
	for <lists+linux-next@lfdr.de>; Fri, 17 May 2024 05:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FB171C2107D
	for <lists+linux-next@lfdr.de>; Fri, 17 May 2024 03:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438B3947A;
	Fri, 17 May 2024 03:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="hfLbrt7h"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6112E9476
	for <linux-next@vger.kernel.org>; Fri, 17 May 2024 03:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715916869; cv=none; b=nD+c9lx70/b+PrW2zk09A/XG6yyZOxWYfs+YSsPkKJ2YOKvCTiibN5HMfd8x+CcsKTaj7LVf/m9EaZY1oLkErXGTugT8Qje/dX/Dvr5jq0cJ0+V4QwCfFkzhRf6RagwP+quYtr8NIlzSCJU8K6WEOJQihKKklpYR5PSe43BJs+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715916869; c=relaxed/simple;
	bh=LXHTHqlNYOrcFObtgl0NUNUa/MBt6rMwvs66bRSGcLI=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=hgiA0EILTSOm+wDFMkexNjzwknXSjk67RWayYewt43yTsiMHbzhAGMxJm8SeZFbn0KfER8pGGy7p8om98p8WN+TysVKMqDHbUQFCF517//XirSUXNTIYNgDAbaBFBRGZyWCbfC+sc93fvCPnfKEKS1OaX0JNp5z6mjTGA7FIXRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=hfLbrt7h; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1ee0132a6f3so1891485ad.0
        for <linux-next@vger.kernel.org>; Thu, 16 May 2024 20:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1715916866; x=1716521666; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BaYGA3epUjuZ0kYJXUm3Un8Y8hYKm8ITx7oHgUL54sA=;
        b=hfLbrt7htJ3nPGj82jKM87Jr+di7ayKBdu03GD8SGXSVu9FMGUP6t8F0Uty6yjTmpc
         ci6DjEAntcApIKXj7Wj6nZ8x43gVonSEZh+pHSVU8YuUpvIW1bz/PUK6iNEOk2XKWWMn
         HWUpcyqyfuyRHS06IDqSpS2MkXGYFBOp0T+MKR9GSHmR0+HJEnytLHwp+C3GUKdxDEtW
         XUFMk324TJtE/t0f9QWUPjU42tX3ObArStszZAwSgSmhCFaXdC2JoyXoK6zf3j5l6Op3
         CkxT7kqD2w8GWknqsUCY9s8sgZzjl4clg6XW/gypHGxMYANgDkHAD434D703K6BcILFu
         0aPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715916866; x=1716521666;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BaYGA3epUjuZ0kYJXUm3Un8Y8hYKm8ITx7oHgUL54sA=;
        b=u2LpoSEN/8vqgzlA6wgLOkXnipg1VHr79EbzGrlnZu6KJfXm8JeoTo4Zma+NSFkj5Y
         JFtZvK2wfYDz/iJGKwuwi5kjxAM8x4pkOThI3QSZGX4g7vOTgopxque8eOgzF8DBPn5M
         8AHf0IPyj+esVl3JVMQwU+WV5nvIgqVHyoZbaD7R2rhDwRlIY1CQxCg8so6GzZ41pC5N
         1XIAW1+sli/N8Q+wAmEENpnHwjsENixHOydnfVVLVaHGJO+i6ty6sfA13Ld0i6wJCNST
         r4qfnF9bzSHTEGZhehxfYHB6nM+k40k0UKjUxTd5qL1HpaDhKBeIr268RHGxsJqLNtOJ
         n+6w==
X-Gm-Message-State: AOJu0YxUw5wEBrYBJEkbZiw2tdco0i9HvH+aZ/470UxZgubro5g2Iovf
	QA5T8+He4Y1HtsecwVs9+3nFCXEedEH2gmInMEUi3g1LPGD776PcrR2b5SOtoIRGMZjy+3krZUC
	/6W4HRA==
X-Google-Smtp-Source: AGHT+IEDPVBx2gxAD9ZwNbZjI883ZP3d0HiZ3W4OErZ4/sEUcPQY6kDSE/Zu5lzfq4dPQelLRSvFAQ==
X-Received: by 2002:a17:903:2288:b0:1eb:dae:714f with SMTP id d9443c01a7336-1ef43c0ced6mr237340275ad.9.1715916866151;
        Thu, 16 May 2024 20:34:26 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf319e2sm149955355ad.174.2024.05.16.20.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 20:34:25 -0700 (PDT)
Message-ID: <6646d041.170a0220.b212d.731a@mx.google.com>
Date: Thu, 16 May 2024 20:34:25 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-8349-g458b2d56b05c
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 77 runs,
 3 regressions (v6.9-8349-g458b2d56b05c)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 77 runs, 3 regressions (v6.9-8349-g458b2d56b05=
c)

This legacy KernelCI providing this report will shutdown sometime
soon in favor of our new KernelCI infra. Not all tests are being
migrated.
If you are still using this report and want us to prioritize your
usecase in the new system, please let us know at
kernelci@lists.linux.dev

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
beaglebone-black         | arm   | lab-cip         | gcc-10   | multi_v7_de=
fconfig | 1          =

imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig  =
        | 1          =

jetson-tk1               | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.9-8349-g458b2d56b05c/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.9-8349-g458b2d56b05c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      458b2d56b05cf5ea311066403c07fece5e9d4584 =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
beaglebone-black         | arm   | lab-cip         | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/66469f33b1647862ce4c4304

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-8349-g=
458b2d56b05c/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-blac=
k.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-8349-g=
458b2d56b05c/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-blac=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/66469f33b1647862=
ce4c4308
        new failure (last pass: v6.9-7443-gb449e3dad2d62)
        1 lines

    2024-05-17T00:04:56.909238  / # =

    2024-05-17T00:04:56.915539  =

    2024-05-17T00:04:57.024596  / # #
    2024-05-17T00:04:57.043687  #
    2024-05-17T00:04:57.145594  / # export SHELL=3D/bin/sh
    2024-05-17T00:04:57.155299  export SHELL=3D/bin/sh
    2024-05-17T00:04:57.256784  / # . /lava-1133153/environment
    2024-05-17T00:04:57.267517  . /lava-1133153/environment
    2024-05-17T00:04:57.369159  / # /lava-1133153/bin/lava-test-runner /lav=
a-1133153/0
    2024-05-17T00:04:57.379124  /lava-1133153/bin/lava-test-runner /lava-11=
33153/0 =

    ... (9 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/66469f6e44d51f629c4c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-8349-g=
458b2d56b05c/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocom=
m-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-8349-g=
458b2d56b05c/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocom=
m-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66469f6e44d51f629c4c4=
2db
        new failure (last pass: v6.9-7443-gb449e3dad2d62) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
        | regressions
-------------------------+-------+-----------------+----------+------------=
--------+------------
jetson-tk1               | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/66469eba253dfda9354c42ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-8349-g=
458b2d56b05c/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-8349-g=
458b2d56b05c/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66469eba253dfda9354c4=
2f0
        failing since 52 days (last pass: v6.8-7223-gd5f8ee808c59, first fa=
il: v6.9-rc1-83-g2c54eea3a68ea) =

 =20

