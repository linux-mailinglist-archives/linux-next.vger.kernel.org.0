Return-Path: <linux-next+bounces-3200-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C6A944957
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 12:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69D7C1F23474
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 10:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C8D4503A;
	Thu,  1 Aug 2024 10:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="ux8gIpRT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D0476034
	for <linux-next@vger.kernel.org>; Thu,  1 Aug 2024 10:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722508345; cv=none; b=FVVUg9rA9FMR0d/czlUvHzQD/vEPL6qV9FeveoBIzmqfj8ESihwHlHx3rrDZeq883pC/7y/Apg7w7GeJqBkSDNNpWzFHkFmSzFFFbgjSxcaExohgQQOmunODesKDkM/FOGXEC1+ag5U/tKHqlWrI68MGcvo1n60Qy4rW7Fu3reQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722508345; c=relaxed/simple;
	bh=tOopnplrETkoYF74dUHlSXtHbw3Wsjt41fWl93Xcp1g=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Al6YcBBLR4C67fcaYYcv4+XwiowkZdQ6x1KiCS0ZzdyY2lomdt84u4PlOP5Mho0Jb27jtwl1D0DE0LxGeneOJhnVH66EIkN3F05xLG/tHwBEqn/j7vgGyEP4oXTR7p+hwcct5f9/bV4031zUsmIb9yqpK5qdFMgwBnWUcBHPc3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=ux8gIpRT; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7a1be7b5d70so1487318a12.0
        for <linux-next@vger.kernel.org>; Thu, 01 Aug 2024 03:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1722508343; x=1723113143; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iNavXP9Pv3O2vRGwAmgnzq79speK17yhRNKERPn+sSQ=;
        b=ux8gIpRTjl5JRnz0/9FsPbNaVNZn4diAbg71FSJDp/MUnVwXRCrvikoMJUUaPgFbo7
         4H95pVZvWwx2nJiSihVtkqrTb6ycoZH3cbl8ThffXKXu15AeOJAmD0wlQjhse/cXHD1a
         sfnDIFd3/TlBAnU8A6GWD/njUgvcJQrW7MDveDlI6cTyx1GvhKx/IqRc87bwEhtwoyuX
         FPEGsvyKcx1Gcf4LKE0JTI20t47MivPQAm/TMCxo3QhHdfcVEK+iVvjZ9fE4c8IQ8zOg
         ZoX6mPkYloVuFtY1i+hXLBo6MiKTOFLpYJOVjL4AS8x1j1hgGB/r7ddAlDgzQBkX5UOL
         XXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722508343; x=1723113143;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iNavXP9Pv3O2vRGwAmgnzq79speK17yhRNKERPn+sSQ=;
        b=V6ltclW9+P46OThMZFWyl/kVUngyUwB3vmDtTN638IHvCvDFHFoUfD7JqKyXU4Zr2O
         z9GqJ8m0kPVZVTfNMhMYIE3OpR7LbosxYEdLilsxE0gqgxfG/g+velcGi9JKoFvhcv4p
         q3gAKs2lbiB5ONJSmFdzkfL2b4YtCkLK07j3y1SnoO5tuM6KOy7wboCImIQnt94hswtk
         fEc2uyopHMR6EGqqBQZgWD+D5ufyY0IEk3iYIjEn5pk/8oUm+oxiG4dIXX7EA5sN8YjN
         qHPpUnfEwenguv5iTAVFAumUaCJWgWiciIs6ESk0wZh7dPB6WQiIwlUDyGgmJVA2VwvN
         zoCQ==
X-Gm-Message-State: AOJu0YywXJpHCGvTdZGYzZpJwRGYcX8L9ROkw/dJeib1AMabiZwpnfsT
	DOz6JZkWpNQJIg+ynUbgumaNI4TvWGs8Q6qdOy1y8Qca5/EejTAOC0WionnjRYLLGZUY+aMTKf6
	D
X-Google-Smtp-Source: AGHT+IH8E6w/GGz+mcosEI1OFoRT56lUQCx2np+Dige4mzhOqzdoe96/nV02PPX4jrdtuPsK36UPlg==
X-Received: by 2002:a17:90a:6d96:b0:2c8:5055:e24f with SMTP id 98e67ed59e1d1-2cff090cae4mr1378470a91.2.1722508342642;
        Thu, 01 Aug 2024 03:32:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc493d3csm2901334a91.36.2024.08.01.03.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 03:32:22 -0700 (PDT)
Message-ID: <66ab6436.170a0220.2606e3.813d@mx.google.com>
Date: Thu, 01 Aug 2024 03:32:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20240801
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 203 runs, 3 regressions (next-20240801)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 203 runs, 3 regressions (next-20240801)

Regressions Summary
-------------------

platform          | arch  | lab         | compiler | defconfig          | r=
egressions
------------------+-------+-------------+----------+--------------------+--=
----------
qemu_riscv64      | riscv | lab-broonie | gcc-12   | defconfig+debug    | 1=
          =

qemu_smp8_riscv64 | riscv | lab-broonie | gcc-12   | defconfig+debug    | 1=
          =

r8a7743-iwg20d-q7 | arm   | lab-cip     | gcc-12   | shmobile_defconfig | 1=
          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240801/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240801
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      048d8cb65cde9fe7534eb4440bcfddcf406bb49c =



Test Regressions
---------------- =



platform          | arch  | lab         | compiler | defconfig          | r=
egressions
------------------+-------+-------------+----------+--------------------+--=
----------
qemu_riscv64      | riscv | lab-broonie | gcc-12   | defconfig+debug    | 1=
          =


  Details:     https://kernelci.org/test/plan/id/66ab2b14de9c2995c77e7091

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240801/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240801/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ab2b14de9c2995c77e7=
092
        failing since 15 days (last pass: next-20240712, first fail: next-2=
0240716) =

 =



platform          | arch  | lab         | compiler | defconfig          | r=
egressions
------------------+-------+-------------+----------+--------------------+--=
----------
qemu_smp8_riscv64 | riscv | lab-broonie | gcc-12   | defconfig+debug    | 1=
          =


  Details:     https://kernelci.org/test/plan/id/66ab2a99c4c0a56b317e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240801/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240801/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ab2a99c4c0a56b317e7=
06e
        failing since 15 days (last pass: next-20240712, first fail: next-2=
0240716) =

 =



platform          | arch  | lab         | compiler | defconfig          | r=
egressions
------------------+-------+-------------+----------+--------------------+--=
----------
r8a7743-iwg20d-q7 | arm   | lab-cip     | gcc-12   | shmobile_defconfig | 1=
          =


  Details:     https://kernelci.org/test/plan/id/66ab2764cd0d37483f7e7081

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240801/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240801/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ab2764cd0d37483f7e7=
082
        new failure (last pass: next-20240730) =

 =20

