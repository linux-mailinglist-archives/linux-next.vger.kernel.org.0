Return-Path: <linux-next+bounces-3040-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 497B29333AF
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 23:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C521F1F25A15
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 21:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BF4214036F;
	Tue, 16 Jul 2024 21:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="dFif1xsL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EB213F42D
	for <linux-next@vger.kernel.org>; Tue, 16 Jul 2024 21:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721165624; cv=none; b=nFiS4SnlzMiwtHj5eNKQSzjVydVDJ1tsiwZcsIYlRx0y9W8KtzlngoQ2X/7yDA6R8opsdQEqxEj7HFG+HFWXq2d3kNICKteEvHxLAIehr/SH2+htaWLZ2qFuFkUu0OeikQ4zgtAsmhf+Rvcb7j24Gkya9wdTCNzV1PFaqQg6PYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721165624; c=relaxed/simple;
	bh=LyjAyTDPBx0+cMRukO8M/NTcOwycvBHavaAO2hlj+zE=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=eYel6clH29EiMiQUlkXOcxyfJr8BnMLNkkQjv46AXlATUvsshngfUmd56LtmCuBUvaxFW5wFLlI5/vP2z+2FpFeAEMYOrViOZEj7MOi7AJ4wnyKwZJsXKP7qFycWl7P2+KBdTH4ijuBHgHZelQ5N7mV3l0nQ9tsXn5fi4IWqYPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=dFif1xsL; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1fb457b53c8so49679615ad.0
        for <linux-next@vger.kernel.org>; Tue, 16 Jul 2024 14:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1721165621; x=1721770421; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Hle4qjgqf/kRAFWSCLIrflHnYZDIexpHljwMTodI8Jw=;
        b=dFif1xsLrwoWzzkCW3Wm97/ymVv+PEGxSajZbUgbMgW/LDWzem/atIfOd2lMeagaaa
         4WiTcPJfh/XfyR0N8h9CPGd29iXWEBM0HshhX75dWpb1tdUr4WDMjxDVooX6PuCZMx6T
         J5BJzsWigAnX7LsDCRUuMZIzk1y1mp89ZjojtxJZTmd+6wHT7a0I4tIsFCz1xzL575Kk
         hvnc/J/D5d25pCCBTSLnfWu1jhkF5t3+byx6DSwxIulPDJAcvgFDlxhC5JBTHy77Augw
         9bv07v5oTM1kh7VNlyhj0Tfj+qQpijcwB0oMd9mE5KxCFedrv/PsgFR2pmDJRenrCZIh
         c/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721165621; x=1721770421;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hle4qjgqf/kRAFWSCLIrflHnYZDIexpHljwMTodI8Jw=;
        b=hikod2TMGvphfTyIC6lUbaoptMeLuWNgusXclqN2sf5yIb8pDIHUQPGBO6tqw7S8Ni
         Bl+KGxlbVssBxooVNGRSftTJunrp57EFUxUkFw4Czk4LYA+VjfSgPxd4hu+DTNNK9nv6
         KZWfULCA/pmX6rqjP7udK2PYJqpQihUGWz0aapqWk/q2dfAEYuDIVlZcO7M4dMPv3xpD
         S9QetEgRUC3CP0kiBbhiXoU4bGChTMsHUXRAgFCXn0Z2XPtNtGFQXT1MYWXWnL2NZqx4
         iWroSmEj63P68E2bKlhumo3413JII+LAgdGCgLrDw4aNHo6rDuzJeMd6O7d9dVKSr2Qq
         I2Ew==
X-Gm-Message-State: AOJu0Yz6rvQ+VOqzZtFuqgysQX6MyS92b+LVhm+hCE53r0OdEnc/q/VJ
	Uk4tenwGw9qn9q941nRtiI4kn9g2V2hFtuQbm7HUl3vGwj0TFWQtoN7NfomB8BwZluiB7itXslW
	J
X-Google-Smtp-Source: AGHT+IFpjicZyFGN8AywM86PXTKrD4qVKKgFiDsHYRMukySfcygLb2qYN7X9sFkgmQCFnC2sqXPUEA==
X-Received: by 2002:a17:903:110d:b0:1fa:221b:a7ef with SMTP id d9443c01a7336-1fc3d96190dmr28828175ad.41.1721165621190;
        Tue, 16 Jul 2024 14:33:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc274f8sm63315635ad.171.2024.07.16.14.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 14:33:40 -0700 (PDT)
Message-ID: <6696e734.170a0220.b0675.6485@mx.google.com>
Date: Tue, 16 Jul 2024 14:33:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20240716
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 340 runs, 8 regressions (next-20240716)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 340 runs, 8 regressions (next-20240716)

Regressions Summary
-------------------

platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
beagle-xm               | arm   | lab-baylibre  | gcc-12   | omap2plus_defc=
onfig        | 1          =

mt8195-cherry-tomato-r2 | arm64 | lab-collabora | gcc-12   | defconfig+arm6=
4-chromebook | 1          =

qemu_riscv64            | riscv | lab-broonie   | gcc-12   | defconfig+debu=
g            | 1          =

qemu_riscv64            | riscv | lab-collabora | gcc-12   | defconfig+debu=
g            | 1          =

qemu_smp8_riscv64       | riscv | lab-broonie   | gcc-12   | defconfig+debu=
g            | 1          =

qemu_smp8_riscv64       | riscv | lab-collabora | gcc-12   | defconfig+debu=
g            | 1          =

r8a7743-iwg20d-q7       | arm   | lab-cip       | gcc-12   | shmobile_defco=
nfig         | 1          =

rk3288-rock2-square     | arm   | lab-collabora | clang-17 | multi_v7_defco=
nfig         | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240716/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240716
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4f40be61af99a67d5580c1448acd9b74c0376389 =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
beagle-xm               | arm   | lab-baylibre  | gcc-12   | omap2plus_defc=
onfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/6696b48d469ecd0c3e7e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240716/arm/=
omap2plus_defconfig/gcc-12/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240716/arm/=
omap2plus_defconfig/gcc-12/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6696b48d469ecd0c3e7e7=
06e
        new failure (last pass: next-20240712) =

 =



platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
mt8195-cherry-tomato-r2 | arm64 | lab-collabora | gcc-12   | defconfig+arm6=
4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6696b0b4aab90be1537e727b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240716/arm6=
4/defconfig+arm64-chromebook/gcc-12/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240716/arm6=
4/defconfig+arm64-chromebook/gcc-12/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6696b0b4aab90be1537e7=
27c
        failing since 4 days (last pass: next-20240711, first fail: next-20=
240712) =

 =



platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
qemu_riscv64            | riscv | lab-broonie   | gcc-12   | defconfig+debu=
g            | 1          =


  Details:     https://kernelci.org/test/plan/id/6696b37c4c3934762b7e706f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240716/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240716/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6696b37c4c3934762b7e7=
070
        new failure (last pass: next-20240712) =

 =



platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
qemu_riscv64            | riscv | lab-collabora | gcc-12   | defconfig+debu=
g            | 1          =


  Details:     https://kernelci.org/test/plan/id/6696b1eb1b22cbf4bb7e7077

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240716/risc=
v/defconfig+debug/gcc-12/lab-collabora/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240716/risc=
v/defconfig+debug/gcc-12/lab-collabora/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6696b1eb1b22cbf4bb7e7=
078
        new failure (last pass: next-20240712) =

 =



platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
qemu_smp8_riscv64       | riscv | lab-broonie   | gcc-12   | defconfig+debu=
g            | 1          =


  Details:     https://kernelci.org/test/plan/id/6696b37d9af2be4cb47e7080

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240716/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240716/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6696b37d9af2be4cb47e7=
081
        new failure (last pass: next-20240712) =

 =



platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
qemu_smp8_riscv64       | riscv | lab-collabora | gcc-12   | defconfig+debu=
g            | 1          =


  Details:     https://kernelci.org/test/plan/id/6696b1ec5f387fd8b77e708c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240716/risc=
v/defconfig+debug/gcc-12/lab-collabora/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240716/risc=
v/defconfig+debug/gcc-12/lab-collabora/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6696b1ec5f387fd8b77e7=
08d
        new failure (last pass: next-20240712) =

 =



platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
r8a7743-iwg20d-q7       | arm   | lab-cip       | gcc-12   | shmobile_defco=
nfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/6696a534d21fe8aeb67e7072

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240716/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240716/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6696a534d21fe8aeb67e7=
073
        new failure (last pass: next-20240712) =

 =



platform                | arch  | lab           | compiler | defconfig     =
             | regressions
------------------------+-------+---------------+----------+---------------=
-------------+------------
rk3288-rock2-square     | arm   | lab-collabora | clang-17 | multi_v7_defco=
nfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/6696b1474f2f6d67937e709a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20240716/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240716/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6696b1474f2f6d67937e7=
09b
        failing since 117 days (last pass: next-20240315, first fail: next-=
20240321) =

 =20

