Return-Path: <linux-next+bounces-2606-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FC790F99F
	for <lists+linux-next@lfdr.de>; Thu, 20 Jun 2024 01:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 943701C2150C
	for <lists+linux-next@lfdr.de>; Wed, 19 Jun 2024 23:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01FC315B558;
	Wed, 19 Jun 2024 23:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="cxLqJqgu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C5D14D2AC
	for <linux-next@vger.kernel.org>; Wed, 19 Jun 2024 23:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718838300; cv=none; b=mVGXCQhHyXc3NZ7+kGF/E/+tz01wX5OU2FNCr1iVczItryZjockYWJqt5lz5SmZlC5OrU/TsOGLobMoNQqP66lzpuVvLbtAGeTHqhXJ7Dq95222Ti/nc5PpYjTTjDU4JZ9xJSACDddKEZVsFpyfq3Sl39FA6NBTESIjx3ISnKDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718838300; c=relaxed/simple;
	bh=gXul2HeHfz0gNkd9+y+qgL5uSVbpdWmMaeRnk5tw2pI=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=CO8Dt1bZ9bhzWrDKP8AcTXW+e9Z6XwBE6UQYoXkWbW3F0o6I2p7XW740q3GiLFujkg7nXCSnZrlAy/I+9TQ2HJ9krSmERSAuy+exW3TYmv1dkTE0oyt93LHSO+Bv7CD3x8HP3Tmgb0VFFCxjCOo0+6iSQODx9w9YzRq9kGC/UT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=cxLqJqgu; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f64ecb1766so2185675ad.1
        for <linux-next@vger.kernel.org>; Wed, 19 Jun 2024 16:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718838297; x=1719443097; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eegZJ4lWVaR9PtnUUanrqcXce0vS2mt8nhRS3nrMz6c=;
        b=cxLqJqgu1GqYGiE/aN/lfK8dyag2Y0BS7Dig6QqzH1VF9njP7pgWAWE4UaC9G1MnwG
         5Yz9qVSf6OqecqO+t86BpfhS1PKkts9EDEiK35bWgerUKYWUzRk2IE4K+w5H7REfry/t
         gdjsobdWaniegAQezfiJHIxm1Ur2WMItIRNpbtmnQjFMcJbTN5c3aBwrpo9Ey7SrnWKk
         XFgulgtBuB221+thudBoaJPKW7vjjvbevbXbjjSZQ3Kq4kj79lN4X1J+7lJflKW6icaa
         +8EK5BIZBf4RZT34mR7GPVedz4WQJpJEy2h7vZ9vF41WW9k4aRpqgHVr6Ai9PXZs4DXC
         U0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718838297; x=1719443097;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eegZJ4lWVaR9PtnUUanrqcXce0vS2mt8nhRS3nrMz6c=;
        b=unvy3XD/Tv/nv7AEKw00L0lsC7M4HLFBz+iN5JrASgnqmdqkyJBFyZaMR3RU99n0Pt
         yhATCg03KZGsnzo+zbj5tMtpugflnepf2kWLIJBKIKmz4xzAux9Ur2xb8DiwxoyXmp9q
         LNOg4y/RRjTpdW9/k/ciAfXh9WEwWVBHB/Z7uC3O0yWxsoIYcVYnuIW+Vo+p9e1iZs3I
         8thxMsaGvOUCkSxV2WITnJl8BLaXqzIpvZqVeb8KZzgVOuNR5bxO1VDOmT6N2rD1s0Ay
         1AO5TpMwfNs1riW59KIFT7eBwmHl0trd7u76L7NJipLAu8SMd9sww5c8YyCiA+bQFmyx
         ZqrQ==
X-Gm-Message-State: AOJu0Yzm0TcVBv809L6vMwZe5Vgm04BhjlOFGpImNWC2QWXU5QvQ3O/T
	uV51BeSygCg9T5tfPYI0z6zwIncc+W2RjzuFUSRMHpzELll9ynPF/hOrXDFjjRbbBDeXRfPJwKr
	Wmew=
X-Google-Smtp-Source: AGHT+IFmIC6T1FA1G6RPYIqifQDIf7kQvoSqJdkfTSgSSoi2c1MMWkzEDuAALhSyFxaD74O4vD5lTQ==
X-Received: by 2002:a17:902:cec9:b0:1f8:393e:8b8c with SMTP id d9443c01a7336-1f9aa464599mr42683305ad.60.1718838296313;
        Wed, 19 Jun 2024 16:04:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b85bsm123231405ad.32.2024.06.19.16.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 16:04:55 -0700 (PDT)
Message-ID: <66736417.170a0220.62fc7.2795@mx.google.com>
Date: Wed, 19 Jun 2024 16:04:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20240619
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 489 runs, 29 regressions (next-20240619)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 489 runs, 29 regressions (next-20240619)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre    | gcc-10   | sama5_defco=
nfig              | 1          =

bcm2836-rpi-2-b          | arm   | lab-collabora   | gcc-10   | bcm2835_def=
config            | 1          =

bcm2836-rpi-2-b          | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

beagle-xm                | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =

imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig+k=
selftest          | 1          =

jetson-tk1               | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

jetson-tk1               | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig           | 1          =

meson-g12a-u200          | arm64 | lab-baylibre    | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm-virt-gicv2      | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =

qemu_arm-virt-gicv2      | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =

qemu_arm-virt-gicv3      | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =

qemu_arm-virt-gicv3      | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =

qemu_arm64-virt-gicv3    | arm64 | lab-collabora   | gcc-10   | defconfig+d=
ebug              | 1          =

r8a7743-iwg20d-q7        | arm   | lab-cip         | gcc-10   | shmobile_de=
fconfig           | 1          =

rk3288-rock2-square      | arm   | lab-collabora   | clang-17 | multi_v7_de=
fconfig           | 1          =

rk3288-rock2-square      | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq        | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

sun7i-a20-cubieboard2    | arm   | lab-baylibre    | clang-17 | multi_v7_de=
fconfig           | 1          =

sun7i-a20-cubieboard2    | arm   | lab-clabbe      | clang-17 | multi_v7_de=
fconfig           | 1          =

sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig           | 1          =

sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fconfig           | 1          =

sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | sunxi_defco=
nfig              | 1          =

sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | sunxi_defco=
nfig              | 1          =

zynqmp-zcu102            | arm64 | lab-cip         | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240619/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240619
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2102cb0d050d34d50b9642a3a50861787527e922 =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre    | gcc-10   | sama5_defco=
nfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/667328e6429173bcfe7e7081

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667328e6429173bcfe7e7=
082
        failing since 504 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b          | arm   | lab-collabora   | gcc-10   | bcm2835_def=
config            | 1          =


  Details:     https://kernelci.org/test/plan/id/667324bd953f53a6327e7070

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667324bd953f53a6327e7=
071
        failing since 380 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b          | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66732f4afa4ecdf5cc7e708c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66732f4afa4ecdf5cc7e7=
08d
        failing since 449 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
beagle-xm                | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66732fe794266f60977e7084

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66732fe794266f60977e7=
085
        failing since 446 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/66732fa76966721adf7e707c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66732fa76966721adf7e7=
07d
        failing since 679 days (last pass: next-20220808, first fail: next-=
20220810) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig+k=
selftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6673288daa8dcfa3797e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm6=
4/defconfig+kselftest/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-=
evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm6=
4/defconfig+kselftest/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6673288daa8dcfa3797e7=
06e
        new failure (last pass: next-20240605) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
jetson-tk1               | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/667326a3750c6e34bf7e71ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667326a3750c6e34bf7e7=
1ee
        failing since 799 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
jetson-tk1               | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66732aa0ac29646b267e7083

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66732aa0ac29646b267e7=
084
        failing since 91 days (last pass: next-20240315, first fail: next-2=
0240320) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
meson-g12a-u200          | arm64 | lab-baylibre    | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/667330d853808fa1e67e70ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667330d853808fa1e67e7=
0ac
        failing since 182 days (last pass: next-20231115, first fail: next-=
20231220) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-virt-gicv2      | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/66732f607cb26668bd7e7082

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66732f607cb26668bd7e7=
083
        failing since 112 days (last pass: next-20240122, first fail: next-=
20240228) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-virt-gicv2      | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/66732e6363e8ef9d547e708c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66732e6363e8ef9d547e7=
08d
        failing since 112 days (last pass: next-20240122, first fail: next-=
20240228) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-virt-gicv3      | arm   | lab-broonie     | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/66732f617cb26668bd7e7085

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66732f617cb26668bd7e7=
086
        failing since 112 days (last pass: next-20240122, first fail: next-=
20240228) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-virt-gicv3      | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/66732e773fa92859eb7e706e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66732e773fa92859eb7e7=
06f
        failing since 112 days (last pass: next-20240122, first fail: next-=
20240228) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3    | arm64 | lab-collabora   | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66732e15674ef5e1bd7e7086

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66732e15674ef5e1bd7e7=
087
        new failure (last pass: next-20240613) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
r8a7743-iwg20d-q7        | arm   | lab-cip         | gcc-10   | shmobile_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66732797877a9a6ada7e707f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66732797877a9a6ada7e7=
080
        new failure (last pass: next-20240618) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
rk3288-rock2-square      | arm   | lab-collabora   | clang-17 | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66732b9e805149b9727e7099

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66732b9e805149b9727e7=
09a
        failing since 90 days (last pass: next-20240315, first fail: next-2=
0240321) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
rk3288-rock2-square      | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66732792c1c780b41f7e709b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66732792c1c780b41f7e7=
09c
        failing since 575 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
rk3288-veyron-jaq        | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6673268fe49a9ee0eb7e706f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6673268fe49a9ee0eb7e7=
070
        failing since 575 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-baylibre    | clang-17 | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66732bd05bad747efc7e7081

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/66732bd05bad747e=
fc7e7086
        failing since 12 days (last pass: next-20240606, first fail: next-2=
0240607)
        28 lines

    2024-06-19T19:04:26.084779  / # =

    2024-06-19T19:04:26.244493  / # #
    2024-06-19T19:04:26.356055  / # export SHELL=3D/bin/sh
    2024-06-19T19:04:26.468102  / # . /lava-3860552/environment
    2024-06-19T19:04:26.580453  / # /lava-3860552/bin/lava-test-runner /lav=
a-3860552/0
    2024-06-19T19:04:26.705068  + export 'TESTRUN_ID=3D0_dmesg'
    2024-06-19T19:04:26.705750  + cd /lava-3860552/0/tests/0_dmesg
    2024-06-19T19:04:26.706259  + cat uuid
    2024-06-19T19:04:26.707094  + UUID=3D3860552_1.5.2.4.1
    2024-06-19T19:04:26.707569  <8>[  177.837578] <LAVA_SIGNAL_STARTRUN 0_d=
mesg 3860552_1.5.2.4.1> =

    ... (6 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-clabbe      | clang-17 | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66732b7ea1eac573ae7e7095

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/66732b7ea1eac573=
ae7e709a
        failing since 12 days (last pass: next-20240606, first fail: next-2=
0240607)
        26 lines

    2024-06-19T19:03:03.527425  / # =

    2024-06-19T19:03:03.531374  =

    2024-06-19T19:03:03.636118  / # #
    2024-06-19T19:03:03.639887  #
    2024-06-19T19:03:03.742476  / # export SHELL=3D/bin/sh
    2024-06-19T19:03:03.746113  export SHELL=3D/bin/sh
    2024-06-19T19:03:03.848626  / # . /lava-470550/environment
    2024-06-19T19:03:03.852344  . /lava-470550/environment
    2024-06-19T19:03:03.955597  / # /lava-470550/bin/lava-test-runner /lava=
-470550/0
    2024-06-19T19:03:03.959407  /lava-470550/bin/lava-test-runner /lava-470=
550/0 =

    ... (9 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/667328f7429173bcfe7e70a5

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667328f7429173bc=
fe7e70aa
        failing since 12 days (last pass: next-20240605, first fail: next-2=
0240607)
        27 lines

    2024-06-19T18:52:12.088318  / # =

    2024-06-19T18:52:12.232262  / # #
    2024-06-19T18:52:12.343986  / # export SHELL=3D/bin/sh
    2024-06-19T18:52:12.455441  / # . /lava-3860461/environment
    2024-06-19T18:52:12.567279  / # /lava-3860461/bin/lava-test-runner /lav=
a-3860461/0
    2024-06-19T18:52:12.647223  + export 'TESTRUN_ID=3D0_dmesg'
    2024-06-19T18:52:12.676663  + cd /lava-3860461/0/tests/0_dmesg
    2024-06-19T18:52:12.677354  + cat uuid
    2024-06-19T18:52:12.677872  + UUID=3D3860461_1.5.2.4.1
    2024-06-19T18:52:12.678668  + set +x =

    ... (6 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66732a8e5e60be65b27e706d

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/66732a8e5e60be65=
b27e7072
        failing since 12 days (last pass: next-20240606, first fail: next-2=
0240607)
        26 lines

    2024-06-19T18:59:05.524961  / # =

    2024-06-19T18:59:05.636991  / # #
    2024-06-19T18:59:05.748730  / # export SHELL=3D/bin/sh
    2024-06-19T18:59:05.860558  / # . /lava-3860537/environment
    2024-06-19T18:59:05.972452  / # /lava-3860537/bin/lava-test-runner /lav=
a-3860537/0
    2024-06-19T18:59:06.098519  + export 'TESTRUN_ID=3D0_dmesg'
    2024-06-19T18:59:06.098748  + cd /lava-3860537/0/tests/0_dmesg
    2024-06-19T18:59:06.098899  + cat uuid
    2024-06-19T18:59:06.099249  + UUID=3D3860537_1.5.2.4.1<8>[  171.025269]=
 <LAVA_SIGNAL_STARTRUN 0_dmesg 3860537_1.5.2.4.1>
    2024-06-19T18:59:06.099411   =

    ... (6 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66732f5d7cb26668bd7e707b

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/66732f5d7cb26668=
bd7e7080
        failing since 12 days (last pass: next-20240606, first fail: next-2=
0240607)
        28 lines

    2024-06-19T19:19:35.037685  / # =

    2024-06-19T19:19:35.182064  / # #
    2024-06-19T19:19:35.293766  / # export SHELL=3D/bin/sh
    2024-06-19T19:19:35.405541  / # . /lava-3860683/environment
    2024-06-19T19:19:35.517431  / # /lava-3860683/bin/lava-test-runner /lav=
a-3860683/0
    2024-06-19T19:19:35.629399  + export 'TESTRUN_ID=3D0_dmesg'
    2024-06-19T19:19:35.630252  + cd /lava-3860683/0/tests/0_dmesg
    2024-06-19T19:19:35.630655  + cat uuid
    2024-06-19T19:19:35.630973  + UUID=3D3860683_1.5.2.4.1
    2024-06-19T19:19:35.631266  <8>[  180.286851] <LAVA_SIGNAL_STARTRUN 0_d=
mesg 3860683_1.5.2.4.1> =

    ... (6 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/667328eadea99bb2027e70a8

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667328eadea99bb2=
027e70ad
        failing since 12 days (last pass: next-20240605, first fail: next-2=
0240607)
        27 lines

    2024-06-19T18:51:56.984951  / # =

    2024-06-19T18:51:56.989101  =

    2024-06-19T18:51:57.092594  / # #
    2024-06-19T18:51:57.096299  #
    2024-06-19T18:51:57.198731  / # export SHELL=3D/bin/sh
    2024-06-19T18:51:57.202565  export SHELL=3D/bin/sh
    2024-06-19T18:51:57.305177  / # . /lava-470546/environment
    2024-06-19T18:51:57.305731  [  190.622026] usb 4-1: new full-speed USB =
device number 2 using ohci-platform
    2024-06-19T18:51:57.309702  . /lava-470546/environment
    2024-06-19T18:51:57.410793  / # /lava-470546/bin/lava-test-runner /lava=
-470546/0 =

    ... (10 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66732a7ad67a3580d27e70f6

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/66732a7ad67a3580=
d27e70fb
        failing since 12 days (last pass: next-20240606, first fail: next-2=
0240607)
        25 lines

    2024-06-19T18:58:48.305226  / # =

    2024-06-19T18:58:48.309197  =

    2024-06-19T18:58:48.413848  / # #
    2024-06-19T18:58:48.417488  #
    2024-06-19T18:58:48.520195  / # export SHELL=3D/bin/sh
    2024-06-19T18:58:48.524008  export SHELL=3D/bin/sh
    2024-06-19T18:58:48.626529  / # . /lava-470549/environment
    2024-06-19T18:58:48.630367  . /lava-470549/environment
    2024-06-19T18:58:48.733288  / # /lava-470549/bin/lava-test-runner /lava=
-470549/0
    2024-06-19T18:58:48.736993  /lava-470549/bin/lava-test-runner /lava-470=
549/0 =

    ... (9 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66732edc97d94f56927e706d

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/66732edc97d94f56=
927e7072
        failing since 12 days (last pass: next-20240606, first fail: next-2=
0240607)
        25 lines

    2024-06-19T19:17:22.681930  / # =

    2024-06-19T19:17:22.686035  =

    2024-06-19T19:17:22.790610  / # #
    2024-06-19T19:17:22.794459  #
    2024-06-19T19:17:22.897153  / # export SHELL=3D/bin/sh
    2024-06-19T19:17:22.900868  export SHELL=3D/bin/sh
    2024-06-19T19:17:23.003161  / # . /lava-470557/environment
    2024-06-19T19:17:23.007083  . /lava-470557/environment
    2024-06-19T19:17:23.109786  / # /lava-470557/bin/lava-test-runner /lava=
-470557/0
    2024-06-19T19:17:23.113418  /lava-470557/bin/lava-test-runner /lava-470=
557/0 =

    ... (9 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | sunxi_defco=
nfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/66732380f7cbe4d3107e708f

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/66732380f7cbe4d3=
107e7094
        failing since 12 days (last pass: next-20240606, first fail: next-2=
0240607)
        10 lines

    2024-06-19T18:28:56.247725  / # =

    2024-06-19T18:28:56.375389  / # #
    2024-06-19T18:28:56.487515  / # export SHELL=3D/bin/sh
    2024-06-19T18:28:56.599453  / # . /lava-3860412/environment
    2024-06-19T18:28:56.711303  / # /lava-3860412/bin/lava-test-runner /lav=
a-3860412/0
    2024-06-19T18:28:56.825648  + export 'TESTRUN_ID=3D0_dmesg'
    2024-06-19T18:28:56.826955  + cd /lava-3860412/0/tests/0_dmesg
    2024-06-19T18:28:56.827483  + cat uuid
    2024-06-19T18:28:56.828022  + UUID=3D3860412_1.5.2.4.1
    2024-06-19T18:28:56.828539  + <8>[  176.079093] <LAVA_SIGNAL_STARTRUN 0=
_dmesg 3860412_1.5.2.4.1> =

    ... (6 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | sunxi_defco=
nfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6673235df7cbe4d3107e7074

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6673235df7cbe4d3=
107e7079
        failing since 12 days (last pass: next-20240606, first fail: next-2=
0240607)
        10 lines

    2024-06-19T18:28:21.240157  / # =

    2024-06-19T18:28:21.244769  =

    2024-06-19T18:28:21.348211  / # #
    2024-06-19T18:28:21.352173  #
    2024-06-19T18:28:21.454633  / # export SHELL=3D/bin/sh
    2024-06-19T18:28:21.458301  export SHELL=3D/bin/sh
    2024-06-19T18:28:21.560806  / # . /lava-470545/environment
    2024-06-19T18:28:21.564439  . /lava-470545/environment
    2024-06-19T18:28:21.667302  / # /lava-470545/bin/lava-test-runner /lava=
-470545/0
    2024-06-19T18:28:21.670665  /lava-470545/bin/lava-test-runner /lava-470=
545/0 =

    ... (9 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
zynqmp-zcu102            | arm64 | lab-cip         | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66732e51129d5f8bad7e708a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240619/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240619/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66732e51129d5f8bad7e7=
08b
        new failure (last pass: next-20240613) =

 =20

