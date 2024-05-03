Return-Path: <linux-next+bounces-2165-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFADD8BADC2
	for <lists+linux-next@lfdr.de>; Fri,  3 May 2024 15:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 738282838D2
	for <lists+linux-next@lfdr.de>; Fri,  3 May 2024 13:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF4F15383F;
	Fri,  3 May 2024 13:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="aQ1EUe9z"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6B2153BC9
	for <linux-next@vger.kernel.org>; Fri,  3 May 2024 13:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714743254; cv=none; b=fKuvYaYAmlZRSYWasGpWOv0wktVXNt79NR4YkPdto/reIooKJEyNJ1whDO37mZH1Tm3NV678Lp+5fTzjsC2pfrVejyOmDfYlCV/vkp12DihCf+7RmOqqCI7wW1D8zy8i4vAezGPTXPL2s0kVap/aRAgu6Vj+RwSjkCm0xzLxLi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714743254; c=relaxed/simple;
	bh=T1dazSgxCO1+QB10ZuSSFehleS2kM3XQ/LJr2xddnYg=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=LPVs3PLJcKktJbgZUlNobinpk0cYBRi4EV83RY/FKmiQJTMgoazRHmv9oBjwN6M2W+Lt6L3TOQ4bcrlFXjOw+xhjw3ZhBWhXcnBjbbUE7k+jp9vvGTuXfDKkgL4+3mMZ2k+99h9J04QskWfHJFx9nE/ZhUA/cmXqJkmvpBv/Pp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=aQ1EUe9z; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6f28bb6d747so7671556b3a.3
        for <linux-next@vger.kernel.org>; Fri, 03 May 2024 06:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1714743251; x=1715348051; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CMBcRh4tqnIsTjslyj5FZMlQROACAy92jJNc9ZDV6HI=;
        b=aQ1EUe9zmH5X5p86FMiBqOFawU132AsZjtr5hVzbSNornFL0WiaKCHTclcAuKilxw4
         bsIVasWqd1A9xRhuQZe+9arPahq+29MIZzxtZ4+Y9AQlE20KLvUoMg0J1fKjz2TJt61a
         klf1tT6ui4jLyYPPue6uNYF81hUO7Gw8ek1L3ccmQ2YHrwJe7zCPRalvoGRqXbooMYFV
         K9zNlw+FNvx1kOfPkgMquMU6GXsNsiZ6W9zcOP84XfNoUA94Ad7DioTFfkd0jzjUyT1n
         VPjXqyzLQiwHLaEEVwGkSjemV5HiAYoJlyijBLAcABEEK6mamtWIFb/SDSUjfQheHofk
         Wemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714743251; x=1715348051;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CMBcRh4tqnIsTjslyj5FZMlQROACAy92jJNc9ZDV6HI=;
        b=eT9GrONHXvhnK4AU01d4Xl6G6GOY9kV05GjWp2cFPyUEl2soxcT0uVSFlP0K7a3tBU
         XdFEWc73TuBSzoU0TxEyMeUG6suEYZUGnABfpUbGNiyBQOnBrZS7+1U++Fp/1ixxbNS5
         j163MyRwUUdGIKZMhhjz+IFA4/iWsyHcvzYkCbjNbXpMWBLzSdd0wtSbsRXnDaacSQqL
         1xOZSAqQ8g1DvA32rlIbi7EavhUic70DXaUSSszWbyf8eQpeNEM/Sq/CsneZuOIpd2ix
         yUlhhxyWPDIK8DRAdXOkkOntL3l+6bJOXn71BPKzXFXN+NRR0BNkrrWe0keZwtcLqnY4
         GWRA==
X-Gm-Message-State: AOJu0Yx45Xldp5ARzdOrQr/qDbW4PYSV8vvn2l+9A1WMfVQSfyM8Q9JU
	JCxxlYoqfsCOxtxRHNVzn5iEkcS9beG4iqTyjUiFi4kx3AQWhnVlBdsSiWZfaWKFtLgI57O5xSw
	UiaQ=
X-Google-Smtp-Source: AGHT+IFR/rNlS78mTeVBzTuo+ZqnkOC7tQzGKpj0REUX4+IO404go67G+4+Q7OAqT0synIlhlT87sQ==
X-Received: by 2002:a05:6a00:ac5:b0:6ea:bdbc:614 with SMTP id c5-20020a056a000ac500b006eabdbc0614mr2737564pfl.13.1714743250854;
        Fri, 03 May 2024 06:34:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id fa40-20020a056a002d2800b006ecff9f9edbsm3031904pfb.77.2024.05.03.06.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 06:34:10 -0700 (PDT)
Message-ID: <6634e7d2.050a0220.8c77c.bebc@mx.google.com>
Date: Fri, 03 May 2024 06:34:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20240503
X-Kernelci-Report-Type: test
Subject: next/master baseline: 175 runs, 11 regressions (next-20240503)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 175 runs, 11 regressions (next-20240503)

Regressions Summary
-------------------

platform              | arch | lab           | compiler | defconfig        =
            | regressions
----------------------+------+---------------+----------+------------------=
------------+------------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-10   | sama5_defconfig  =
            | 1          =

bcm2836-rpi-2-b       | arm  | lab-collabora | gcc-10   | bcm2835_defconfig=
            | 1          =

bcm2836-rpi-2-b       | arm  | lab-collabora | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =

beagle-xm             | arm  | lab-baylibre  | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =

beagle-xm             | arm  | lab-baylibre  | gcc-10   | omap2plus_defconf=
ig          | 1          =

beaglebone-black      | arm  | lab-cip       | clang-17 | multi_v7_defconfi=
g           | 1          =

jetson-tk1            | arm  | lab-baylibre  | gcc-10   | multi_v7_defc...G=
_ARM_LPAE=3Dy | 1          =

r8a7743-iwg20d-q7     | arm  | lab-cip       | gcc-10   | shmobile_defconfi=
g           | 1          =

rk3288-rock2-square   | arm  | lab-collabora | clang-17 | multi_v7_defconfi=
g           | 1          =

rk3288-rock2-square   | arm  | lab-collabora | gcc-10   | multi_v7_defc...G=
_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq     | arm  | lab-collabora | gcc-10   | multi_v7_defc...G=
_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240503/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240503
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9221b2819b8a4196eecf5476d66201be60fbcf29 =



Test Regressions
---------------- =



platform              | arch | lab           | compiler | defconfig        =
            | regressions
----------------------+------+---------------+----------+------------------=
------------+------------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-10   | sama5_defconfig  =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/6634b03b3885ee1b354c434a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240503/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240503/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6634b03b3885ee1b354c4=
34b
        failing since 457 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform              | arch | lab           | compiler | defconfig        =
            | regressions
----------------------+------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b       | arm  | lab-collabora | gcc-10   | bcm2835_defconfig=
            | 1          =


  Details:     https://kernelci.org/test/plan/id/6634a479c839558dcd4c42f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240503/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240503/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6634a479c839558dcd4c4=
2f3
        failing since 333 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform              | arch | lab           | compiler | defconfig        =
            | regressions
----------------------+------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b       | arm  | lab-collabora | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6634b1cc1f8e5d04334c42e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240503/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240503/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6634b1cc1f8e5d04334c4=
2e5
        failing since 401 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform              | arch | lab           | compiler | defconfig        =
            | regressions
----------------------+------+---------------+----------+------------------=
------------+------------
beagle-xm             | arm  | lab-baylibre  | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6634b280c67894883c4c42e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240503/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240503/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6634b280c67894883c4c4=
2e5
        failing since 399 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform              | arch | lab           | compiler | defconfig        =
            | regressions
----------------------+------+---------------+----------+------------------=
------------+------------
beagle-xm             | arm  | lab-baylibre  | gcc-10   | omap2plus_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6634b6a55382fb46114c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240503/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240503/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6634b6a55382fb46114c4=
2db
        failing since 4 days (last pass: next-20240426, first fail: next-20=
240429) =

 =



platform              | arch | lab           | compiler | defconfig        =
            | regressions
----------------------+------+---------------+----------+------------------=
------------+------------
beaglebone-black      | arm  | lab-cip       | clang-17 | multi_v7_defconfi=
g           | 1          =


  Details:     https://kernelci.org/test/plan/id/6634af7faf36f229f14c4313

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240503/arm/=
multi_v7_defconfig/clang-17/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240503/arm/=
multi_v7_defconfig/clang-17/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6634af7faf36f229=
f14c4318
        failing since 1 day (last pass: next-20240430, first fail: next-202=
40501)
        1 lines

    2024-05-03T09:33:37.660943  / # =

    2024-05-03T09:33:37.669725  =

    2024-05-03T09:33:37.774806  / # #
    2024-05-03T09:33:37.781629  #
    2024-05-03T09:33:37.899244  / # export SHELL=3D/bin/sh
    2024-05-03T09:33:37.909607  export SHELL=3D/bin/sh
    2024-05-03T09:33:38.011346  / # . /lava-1128166/environment
    2024-05-03T09:33:38.021671  . /lava-1128166/environment
    2024-05-03T09:33:38.123580  / # /lava-1128166/bin/lava-test-runner /lav=
a-1128166/0
    2024-05-03T09:33:38.133445  /lava-1128166/bin/lava-test-runner /lava-11=
28166/0 =

    ... (9 line(s) more)  =

 =



platform              | arch | lab           | compiler | defconfig        =
            | regressions
----------------------+------+---------------+----------+------------------=
------------+------------
jetson-tk1            | arm  | lab-baylibre  | gcc-10   | multi_v7_defc...G=
_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6634ac8fe6d431f0864c42dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240503/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240503/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6634ac8fe6d431f0864c4=
2dd
        failing since 752 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform              | arch | lab           | compiler | defconfig        =
            | regressions
----------------------+------+---------------+----------+------------------=
------------+------------
r8a7743-iwg20d-q7     | arm  | lab-cip       | gcc-10   | shmobile_defconfi=
g           | 1          =


  Details:     https://kernelci.org/test/plan/id/6634afe6c1d68f04024c42fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240503/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240503/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6634afe6c1d68f04024c4=
2fe
        new failure (last pass: next-20240502) =

 =



platform              | arch | lab           | compiler | defconfig        =
            | regressions
----------------------+------+---------------+----------+------------------=
------------+------------
rk3288-rock2-square   | arm  | lab-collabora | clang-17 | multi_v7_defconfi=
g           | 1          =


  Details:     https://kernelci.org/test/plan/id/6634afcb932b4357634c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240503/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240503/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6634afcb932b4357634c4=
2db
        failing since 43 days (last pass: next-20240315, first fail: next-2=
0240321) =

 =



platform              | arch | lab           | compiler | defconfig        =
            | regressions
----------------------+------+---------------+----------+------------------=
------------+------------
rk3288-rock2-square   | arm  | lab-collabora | gcc-10   | multi_v7_defc...G=
_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6634ade3d5215063644c42ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240503/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240503/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6634ade3d5215063644c4=
2ee
        failing since 528 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform              | arch | lab           | compiler | defconfig        =
            | regressions
----------------------+------+---------------+----------+------------------=
------------+------------
rk3288-veyron-jaq     | arm  | lab-collabora | gcc-10   | multi_v7_defc...G=
_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6634aca4e6d431f0864c4309

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240503/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240503/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6634aca4e6d431f0864c4=
30a
        failing since 528 days (last pass: next-20221121, first fail: next-=
20221122) =

 =20

