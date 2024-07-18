Return-Path: <linux-next+bounces-3074-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B777934D46
	for <lists+linux-next@lfdr.de>; Thu, 18 Jul 2024 14:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E6751C21902
	for <lists+linux-next@lfdr.de>; Thu, 18 Jul 2024 12:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EBAC13AD12;
	Thu, 18 Jul 2024 12:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="SKIS9DMC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A497E839E4
	for <linux-next@vger.kernel.org>; Thu, 18 Jul 2024 12:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721306085; cv=none; b=CA1h3QaSYqximsS4Gnd7Nw6Y/tyRHzIzMP0drsN4trlxF77ZQD0nRHQCxavszPJJnCV+HmRf3i2Cf+aW7APKbkX4UOwRLXLnTZssg8Fx0NnYdGuU8BnqDxiLxWP7GaU8zgr6xt36zq1HwpIV9LQnbkz9bKUIHT8M85IGPsGKvPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721306085; c=relaxed/simple;
	bh=9r3tz9S9/SPg8E67WCZVh8X9apZca2v97o+6WKAmmzs=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=No1md5WJn/DSMp/CiL5P/3AtH6VPMqfwGkXRpSncc+nTbEF6BnEnHO4MdAo/zUBK7I/s9LRCI/0XgKkCi7dHXnFMq3+OvG252d1F0sK71B8lB4M5pnDg8/r848ao4RGat1ETpju5XX+EeUpoQiKZPqmP/NOtTeDrQKk4obxrCsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=SKIS9DMC; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-25e3d8d9f70so349736fac.2
        for <linux-next@vger.kernel.org>; Thu, 18 Jul 2024 05:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1721306082; x=1721910882; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aFCpQAIeKfWG/NDfxENKI0x3c9qPfaFmg48EepHQU7Y=;
        b=SKIS9DMCq+zbwjbuMzimy8m1Nywt3BwS+XvPJ3vz2Ju11Z1sz0/cKZS00BhLhtnqsf
         Y9wsuOpKyFd5SO09tkkhYdyoCagdSE+FDu3A1dD5uTPqJBGm7gRpbSHZxufjEiGxntA/
         NvkdYpJ7WJN35CliumdapK1TKOAZHzKZREG2RZLbjpnGxH80ybkps4BDJztI9yQ5gUO9
         6a09Xju+tuDqzYk3Y9izxtWkuj11OM0bSn7hC2ouA5/EQbOqjiCjNhLC1+/e6qY3ZAXN
         46IAG2bmz9vv3AyMw8ebjKzNHAKd7VvNx0mH/uDa2H/Zo/+d0qN/NmdgD5reL/qHuD3W
         NxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721306082; x=1721910882;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aFCpQAIeKfWG/NDfxENKI0x3c9qPfaFmg48EepHQU7Y=;
        b=ovCowy+JPjW9qIwQJw6V4okQ9U2Ge61i/Eh5h7ESAYHNSMD24L4BqD0nNZVo8QW2iu
         mi0IYs/cozq9GnobGGTGCyZg0DmTOqMYHzoqIxtDdh514uOC+vG50ECwoDDQVP1CQj8K
         AIWl14DoCxrBnEY5fMxxoxI8hM1Vc1QxPDao7TmWHifSHl3wNMZKOGBSAYtQBSTtwZ3e
         ROJ62jCvINFinLH9Lmt+3fiaBJr32lgfMpo6tKM3PBcsIySncbSAQLOyvTgCaTowOtvZ
         +NuYG/ty/goFMQvrU2EpCZFjXzPeldnN2lDoFpEqn3GNTAIPkMsy6hi2/EBYAaH9bYMg
         ldbQ==
X-Gm-Message-State: AOJu0YzMz1Q09eriTwPYZquaCZmDu+2Akoxu31EMX1JfMFHrOpfeTsWJ
	UiMraNWXzmTuxwHzaTCLtkG8KBvxIcIrAGuAWqvYu3EBOXVfc6mnYT0ceA3G8VJR30UR8aFktSu
	r
X-Google-Smtp-Source: AGHT+IFlvmunq8Ys7Jr0UYyKIJR/DdNwqd+d3hzmLRNyBUDxt2KNWMioNxgHH25VKODmeDLvDNuz/g==
X-Received: by 2002:a05:6870:7193:b0:25e:1976:37c0 with SMTP id 586e51a60fabf-260d8feb794mr4409661fac.6.1721306082185;
        Thu, 18 Jul 2024 05:34:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7eca6bebsm9936962b3a.165.2024.07.18.05.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 05:34:41 -0700 (PDT)
Message-ID: <66990be1.050a0220.862a4.56d7@mx.google.com>
Date: Thu, 18 Jul 2024 05:34:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20240718
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 270 runs, 4 regressions (next-20240718)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 270 runs, 4 regressions (next-20240718)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig       | re=
gressions
------------------+-------+---------------+----------+-----------------+---=
---------
qemu_riscv64      | riscv | lab-broonie   | gcc-12   | defconfig+debug | 1 =
         =

qemu_riscv64      | riscv | lab-collabora | gcc-12   | defconfig+debug | 1 =
         =

qemu_smp8_riscv64 | riscv | lab-broonie   | gcc-12   | defconfig+debug | 1 =
         =

qemu_smp8_riscv64 | riscv | lab-collabora | gcc-12   | defconfig+debug | 1 =
         =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240718/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240718
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      73399b58e5e5a1b28a04baf42e321cfcfc663c2f =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig       | re=
gressions
------------------+-------+---------------+----------+-----------------+---=
---------
qemu_riscv64      | riscv | lab-broonie   | gcc-12   | defconfig+debug | 1 =
         =


  Details:     https://kernelci.org/test/plan/id/6698d6f0230fc8d39b7e708e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240718/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240718/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6698d6f0230fc8d39b7e7=
08f
        failing since 1 day (last pass: next-20240712, first fail: next-202=
40716) =

 =



platform          | arch  | lab           | compiler | defconfig       | re=
gressions
------------------+-------+---------------+----------+-----------------+---=
---------
qemu_riscv64      | riscv | lab-collabora | gcc-12   | defconfig+debug | 1 =
         =


  Details:     https://kernelci.org/test/plan/id/6698d6b6872f482a257e7079

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240718/risc=
v/defconfig+debug/gcc-12/lab-collabora/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240718/risc=
v/defconfig+debug/gcc-12/lab-collabora/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6698d6b6872f482a257e7=
07a
        failing since 1 day (last pass: next-20240712, first fail: next-202=
40716) =

 =



platform          | arch  | lab           | compiler | defconfig       | re=
gressions
------------------+-------+---------------+----------+-----------------+---=
---------
qemu_smp8_riscv64 | riscv | lab-broonie   | gcc-12   | defconfig+debug | 1 =
         =


  Details:     https://kernelci.org/test/plan/id/6698d6ee230fc8d39b7e7088

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240718/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240718/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6698d6ee230fc8d39b7e7=
089
        failing since 1 day (last pass: next-20240712, first fail: next-202=
40716) =

 =



platform          | arch  | lab           | compiler | defconfig       | re=
gressions
------------------+-------+---------------+----------+-----------------+---=
---------
qemu_smp8_riscv64 | riscv | lab-collabora | gcc-12   | defconfig+debug | 1 =
         =


  Details:     https://kernelci.org/test/plan/id/6698d6b5872f482a257e7076

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240718/risc=
v/defconfig+debug/gcc-12/lab-collabora/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240718/risc=
v/defconfig+debug/gcc-12/lab-collabora/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6698d6b5872f482a257e7=
077
        failing since 1 day (last pass: next-20240712, first fail: next-202=
40716) =

 =20

