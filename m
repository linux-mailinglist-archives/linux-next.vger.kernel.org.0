Return-Path: <linux-next+bounces-4495-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D65119B36B9
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 17:38:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 959F2286055
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 16:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACAF81DEFF1;
	Mon, 28 Oct 2024 16:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="StsYSJRF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A29D1DEFD9
	for <linux-next@vger.kernel.org>; Mon, 28 Oct 2024 16:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730133501; cv=none; b=Zf9g+AkaNEuiuBYmZwGNgr+y5vgLKvrQ6Gz8NJvtzFsXNH38yCzFCfF4UYO4wmWEqBO9eVDmXzOsuP+MK+zqSWSVvp1L0/SMN7ORdgp3nHNW7iizAYpueX2OvesJm4XWTjuGvo2M0Cna7rptonKy7mH+UnhjAFO3mr03IQKQk24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730133501; c=relaxed/simple;
	bh=WCkjn1M9QZtBobOeZk2B6ILTADwTNN0rJ5sgCrqZY38=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=uV2BxsGX0V2RxJcgB8GUViBtEi9Z77+UQaZQ2Okix8JBFgUKUyiPsNE2bjBKqzsQaRKM2j+5aIKcW/CHHnWKgcoIhOMLT8C1Qasqt9cjG77ssOwjMzPCDXtH7KyUMvSUKeQKL8LgCTrrv7kILvlusE1LYKSaCo8VL8ASkSHqhZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=StsYSJRF; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-290c69be014so484639fac.3
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2024 09:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1730133496; x=1730738296; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=acuYgxZ7iDQGN0judQfOmGpkoSzOfcFFO+dO9iRTs5M=;
        b=StsYSJRFu/q5VIf6mP1yIEVNNVoskFLB3TYEMrMFKUf163Tj6T6uT4HjivCd7yI7AL
         r+kGjAQ6c17ApViJXDgRffbYXJFN2qh79LHPRL9bTRe/bcQHda7hIBSL8EhBOME0m9YV
         wRbwOTvYmZn89YwvhoGq4uNwrx+awrHZ5gC3VYkMHFV+5EHpsalQ6KfzA8KP/0E4/OfR
         yTXw9parUOSCoOZhaLccqO3f/1tMkDpduqXAQ2A6lueuWR9WbGhNq2tLVWrUeETMF28u
         R5003oHvqlDKUOrv6Utqi2xhFngX0GTXZFS72Lb5YF0RBwwB/Nmbrv/7fgp1YlsQXxBg
         Acxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730133496; x=1730738296;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=acuYgxZ7iDQGN0judQfOmGpkoSzOfcFFO+dO9iRTs5M=;
        b=dVadj1kPKcuUGqiv3FDmEsMraH/9OQ0ugFSgZ0MSgucyVnqeo2XWwqGqkcI3+wNIHU
         HaVRDW0eIngtAcyfOHGMurjb9SdSrmWBn1XWELZ3X/otL1oUZqkEIvFMTX4Flr5xjDf8
         H8mbPMUMPYPUXafaT8mOzxQIZpey4Pdq6LehLsCboCbJSz5+c1REkBZauOirBaqSKcWu
         XLCL0oSrQmrZ9UBEzJW5tgC7Qzf8Zf+y8pG5yV9TsmCdOW6wY+bzVmXP17UWMdFEA9Lv
         +c7Ae8dtwEM3UvO6DV8CB4ahP5b/eQHULi4FV8J7aCl2Pb6FslbAy1sweyFHrMB/tlfc
         vpgQ==
X-Gm-Message-State: AOJu0YxoRAwtnOMBhifb0ll5b/4JC4NcIqtekvt38vco8mHMYoh26lDf
	3Uq5OUqnqlD68tHmE3OZDT+vXgfxZUZ0bJ/yWVf2p4/bdPrOyG795E6FLx71Y90xCQlpREWAnRh
	X
X-Google-Smtp-Source: AGHT+IEP5bIn3oIk2Pigk3A8n+8eN5/G6tY0fDbW8eh4RhDpYPdiiG+lU5pSRgqr5LSTdywQD6CIyg==
X-Received: by 2002:a05:6870:1603:b0:288:d4e0:cf47 with SMTP id 586e51a60fabf-29051ae9e42mr7754447fac.10.1730133495623;
        Mon, 28 Oct 2024 09:38:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc89f442bsm5990843a12.74.2024.10.28.09.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 09:38:15 -0700 (PDT)
Message-ID: <671fbdf7.630a0220.55fd6.623c@mx.google.com>
Date: Mon, 28 Oct 2024 09:38:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20241028
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 171 runs, 25 regressions (next-20241028)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 171 runs, 25 regressions (next-20241028)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre | clang-17 | multi_v7_d=
efconfig           | 1          =

beaglebone-black             | arm   | lab-cip      | clang-17 | multi_v7_d=
efconfig           | 1          =

beaglebone-black             | arm   | lab-cip      | gcc-12   | multi_v7_d=
efconfig           | 1          =

beaglebone-black             | arm   | lab-cip      | gcc-12   | omap2plus_=
defconfig          | 1          =

jetson-tk1                   | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | clang-17 | multi_v7_d=
efconfig           | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig           | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | clang-17 | multi_v7_d=
efconfig           | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig           | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-broonie  | clang-17 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-broonie  | gcc-12   | defconfig =
                   | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie  | clang-17 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie  | gcc-12   | defconfig =
                   | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-broonie  | clang-17 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-broonie  | gcc-12   | defconfig =
                   | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie  | clang-17 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie  | gcc-12   | defconfig =
                   | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip      | gcc-12   | shmobile_d=
efconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe   | clang-17 | multi_v7_d=
efconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
241028/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20241028
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      dec9255a128e19c5fcc3bdb18175d78094cc624d =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre | clang-17 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/671f8a7c2abaf9eef1c86856

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671f8a7c2abaf9eef1c86=
857
        failing since 68 days (last pass: next-20240716, first fail: next-2=
0240820) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
beaglebone-black             | arm   | lab-cip      | clang-17 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/671f932cd882dc5a22c86865

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig/clang-17/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig/clang-17/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/671f932cd882dc5a=
22c8686a
        new failure (last pass: next-20241022)
        1 lines

    2024-10-28T13:35:27.292037  / # =

    2024-10-28T13:35:27.300669  =

    2024-10-28T13:35:27.404635  / # #
    2024-10-28T13:35:27.412664  #
    2024-10-28T13:35:27.514783  / # export SHELL=3D/bin/sh
    2024-10-28T13:35:27.524696  export SHELL=3D/bin/sh
    2024-10-28T13:35:27.626414  / # . /lava-1212792/environment
    2024-10-28T13:35:27.636522  . /lava-1212792/environment
    2024-10-28T13:35:27.738440  / # /lava-1212792/bin/lava-test-runner /lav=
a-1212792/0
    2024-10-28T13:35:27.748210  /lava-1212792/bin/lava-test-runner /lava-12=
12792/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
beaglebone-black             | arm   | lab-cip      | gcc-12   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/671f85577fa506f270c86864

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig/gcc-12/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig/gcc-12/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/671f85577fa506f2=
70c86869
        new failure (last pass: next-20241025)
        1 lines

    2024-10-28T12:36:26.712862  / # =

    2024-10-28T12:36:26.721763  =

    2024-10-28T12:36:26.826886  / # #
    2024-10-28T12:36:26.833677  #
    2024-10-28T12:36:26.951443  / # export SHELL=3D/bin/sh
    2024-10-28T12:36:26.961671  export SHELL=3D/bin/sh
    2024-10-28T12:36:27.063567  / # . /lava-1212736/environment
    2024-10-28T12:36:27.072936  . /lava-1212736/environment
    2024-10-28T12:36:27.174756  / # /lava-1212736/bin/lava-test-runner /lav=
a-1212736/0
    2024-10-28T12:36:27.185292  /lava-1212736/bin/lava-test-runner /lava-12=
12736/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
beaglebone-black             | arm   | lab-cip      | gcc-12   | omap2plus_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/671f8119ada1107816c8686b

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241028/arm/=
omap2plus_defconfig/gcc-12/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241028/arm/=
omap2plus_defconfig/gcc-12/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/671f8119ada11078=
16c86870
        new failure (last pass: next-20241022)
        1 lines

    2024-10-28T12:18:19.291764  / # =

    2024-10-28T12:18:19.300437  =

    2024-10-28T12:18:19.405600  / # #
    2024-10-28T12:18:19.411969  #
    2024-10-28T12:18:19.530219  / # export SHELL=3D/bin/sh
    2024-10-28T12:18:19.540390  export SHELL=3D/bin/sh
    2024-10-28T12:18:19.642304  / # . /lava-1212707/environment
    2024-10-28T12:18:19.652341  . /lava-1212707/environment
    2024-10-28T12:18:19.754393  / # /lava-1212707/bin/lava-test-runner /lav=
a-1212707/0
    2024-10-28T12:18:19.764269  /lava-1212707/bin/lava-test-runner /lava-12=
12707/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
jetson-tk1                   | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/671f8734f41b325090c868fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-baylibre/baseline-jetson-tk1.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-baylibre/baseline-jetson-tk1.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671f8734f41b325090c86=
8fc
        failing since 17 days (last pass: next-20241008, first fail: next-2=
0241011) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | clang-17 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/671f8a186fa69cd425c86867

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig/clang-17/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g=
-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig/clang-17/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g=
-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671f8a186fa69cd425c86=
868
        new failure (last pass: next-20241022) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/671f81bb1829df7502c86895

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671f81bb1829df7502c86=
896
        failing since 61 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/671f8323d8776d88ebc86887

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-kontron/baseline-kon=
tron-kswitch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-kontron/baseline-kon=
tron-kswitch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671f8323d8776d88ebc86=
888
        new failure (last pass: next-20241021) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/671f84774f50a2da14c8685e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig/gcc-12/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g-2=
gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig/gcc-12/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g-2=
gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671f84774f50a2da14c86=
85f
        failing since 2 days (last pass: next-20241022, first fail: next-20=
241025) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/671f88b091eec99ff4c868cc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-kontron/baseline-kontron-kswit=
ch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-kontron/baseline-kontron-kswit=
ch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671f88b091eec99ff4c86=
8cd
        new failure (last pass: next-20241022) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | clang-17 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/671f8a401c115e2030c86860

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig/clang-17/lab-kontron/baseline-kontron-kswitch-d10-mmt-8g=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig/clang-17/lab-kontron/baseline-kontron-kswitch-d10-mmt-8g=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671f8a401c115e2030c86=
861
        new failure (last pass: next-20241022) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/671f81cf9f6f126250c86858

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671f81cf9f6f126250c86=
859
        failing since 61 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/671f8337f8186dee75c86864

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-kontron/baseline-kon=
tron-kswitch-d10-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-kontron/baseline-kon=
tron-kswitch-d10-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671f8337f8186dee75c86=
865
        new failure (last pass: next-20241021) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/671f849fac01801ac6c8685d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig/gcc-12/lab-kontron/baseline-kontron-kswitch-d10-mmt-8g.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig/gcc-12/lab-kontron/baseline-kontron-kswitch-d10-mmt-8g.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671f849fac01801ac6c86=
85e
        failing since 2 days (last pass: next-20241022, first fail: next-20=
241025) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/671f88d822d91a0cadc86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-kontron/baseline-kontron-kswit=
ch-d10-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-kontron/baseline-kontron-kswit=
ch-d10-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671f88d822d91a0cadc86=
856
        new failure (last pass: next-20241022) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-broonie  | clang-17 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/671f81bc1829df7502c8689b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241028/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241028/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671f81bc1829df7502c86=
89c
        failing since 2 days (last pass: next-20241015, first fail: next-20=
241025) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-broonie  | gcc-12   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/671f8bfa0121f074f0c86864

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241028/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241028/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671f8bfa0121f074f0c86=
865
        failing since 6 days (last pass: next-20241016, first fail: next-20=
241022) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie  | clang-17 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/671f819490acdef40dc86856

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241028/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241028/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671f819490acdef40dc86=
857
        failing since 2 days (last pass: next-20241015, first fail: next-20=
241025) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie  | gcc-12   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/671f8c5eee4fddf117c86856

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241028/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241028/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671f8c5eee4fddf117c86=
857
        failing since 6 days (last pass: next-20241016, first fail: next-20=
241022) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-broonie  | clang-17 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/671f81a81829df7502c8688a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241028/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241028/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671f81a81829df7502c86=
88b
        failing since 2 days (last pass: next-20241015, first fail: next-20=
241025) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-broonie  | gcc-12   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/671f8c72fe17414a22c86866

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241028/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241028/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671f8c72fe17414a22c86=
867
        failing since 6 days (last pass: next-20241016, first fail: next-20=
241022) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie  | clang-17 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/671f81ad90acdef40dc86866

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241028/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241028/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671f81ad90acdef40dc86=
867
        failing since 2 days (last pass: next-20241015, first fail: next-20=
241025) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie  | gcc-12   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/671f8c23954cb56fd2c8687b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241028/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241028/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671f8c23954cb56fd2c86=
87c
        failing since 6 days (last pass: next-20241016, first fail: next-20=
241022) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip      | gcc-12   | shmobile_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/671f7c00c2d89cfecdc8685f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241028/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241028/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671f7c00c2d89cfecdc86=
860
        failing since 11 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe   | clang-17 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/671f89cc0d78df0f00c8685f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241028/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/671f89cc0d78df0f00c86=
860
        failing since 20 days (last pass: next-20240726, first fail: next-2=
0241008) =

 =20

