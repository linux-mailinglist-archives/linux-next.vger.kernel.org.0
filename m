Return-Path: <linux-next+bounces-2515-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9C1904228
	for <lists+linux-next@lfdr.de>; Tue, 11 Jun 2024 19:09:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46CDF1C24C1E
	for <lists+linux-next@lfdr.de>; Tue, 11 Jun 2024 17:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783BE4205D;
	Tue, 11 Jun 2024 17:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="UHk+i/85"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8651D556
	for <linux-next@vger.kernel.org>; Tue, 11 Jun 2024 17:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718125792; cv=none; b=hlwvY40DqAXI/8X3WGgndYD6K5w+0vhjYzt7Jbr+Zfs9/P/U7eLaUC0B1wkS2XYST1rgD0lhQHgugYLTNSUwocVWDfm9tgBBk+oLeO1UwVGqkYMNsEZuPrgofI1swEgla3030TV3iJwXTGda49kX7+y5O7jWTPuzktseGGhH1iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718125792; c=relaxed/simple;
	bh=uFupMJRExpPd0ciY/boQBu/OsMfjJNOQG43Gaj+moEw=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=fjcmtjJR5ma1pB09xwLDHlHYstM2tQ5XAmiDZHHFlcJi1w9q+ov9VoXLfXLvrnB01F6zGuv5YPGLJqfnMkZaY9sT9c104vNK6saUaZ8XDf/20H4qMqnu2ft0yFxaJe8wBVz6HSOtLrMcPpMxykRvk6Y2csdm4+qWd+BY6yAlo9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=UHk+i/85; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2c2ecbc109fso2563348a91.1
        for <linux-next@vger.kernel.org>; Tue, 11 Jun 2024 10:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718125789; x=1718730589; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vbfPPjD+Yn+WVyrthA5mF3aTx7EMB4ciuzJOBcl1q+Y=;
        b=UHk+i/85oOR5juBXd8AWd9ZBegBCPTJWOaNZSOo1nERxfVuq1Pz4fWJTKxLNpNJYUG
         fe6VcuqzDgjnhTCxPXRGW6qep9gc4C/NW1tB2qDgObAHnBMdWX7EjF+2weAwlN2plzfk
         5hFM9VnBsKKYUx7UpOGAduin5LaaDZOceE3bYQ/Ly/XiQQcLyMURSWXWYRDZgrCqBldC
         5z7dMyjmUiLMUSeTMhdB4FJ8JUCRyGaMAc+LauBB5q8a8f3W7pBSfVtiNXKXbu3AGzPZ
         brUYG10N15BbvjthvoSqvfr5Edyd0DIDmXHwMOtASAXx3Qag+phqm46+bEnuUzgudJl4
         c88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718125789; x=1718730589;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbfPPjD+Yn+WVyrthA5mF3aTx7EMB4ciuzJOBcl1q+Y=;
        b=maQ+nO7vJ8ICWTvOG3/DEz3NZ3kEQEI7ZugQTdNei6M96R2LhZjr5tayOh09xM6pIl
         oM9r+zv/EedryggCT5NCd+S7Kyan6/Xkz7U8cBMVtwzJxndut7FWiiMPSuBDY2PaxrlW
         q9ky1jg+HYeiNJG8xVu22rqEdwB/DBcOJL6ShZ9i4GDekaNmf6h2psX9GsrGt0NUwtGP
         Oatt4OlJWiMMY4QE7D9Fqq3ivlmCOdGxpuLE+ajEFIS3PeOKLgVXPQ8f3+sd+fuY8/e4
         zC+c0yq6g24558e+fnbAeM1+2P43I5K9EbDIBBpb8khk5I+s+eRRJg4Sjr/kl54j0cWF
         ncRg==
X-Gm-Message-State: AOJu0YygcgbJCkHdOHeZtWRMwVXsv+w4pQjBaME4vi8aJA4+LueNqz/v
	g9/tJ6HZQ8S4G2JmcvxC9nZNo7D9hQe9Z0eESIqdTcnKNIbNAh06ewzWjgDHIuiJXcLyZ34l9Nj
	kFZk=
X-Google-Smtp-Source: AGHT+IEA1/WVBoQ2cQ8awNAz8jBY34eOV1CJkZCAxIDBSxDHNRRj6vPPENU/Vzt2xrHzr1b75OAwrw==
X-Received: by 2002:a17:902:684b:b0:1f7:21fd:aba3 with SMTP id d9443c01a7336-1f721fdad5cmr27687935ad.34.1718125788552;
        Tue, 11 Jun 2024 10:09:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6e11e6608sm82315435ad.136.2024.06.11.10.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 10:09:48 -0700 (PDT)
Message-ID: <666884dc.170a0220.296a6.78dd@mx.google.com>
Date: Tue, 11 Jun 2024 10:09:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20240611
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 260 runs, 21 regressions (next-20240611)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 260 runs, 21 regressions (next-20240611)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defconfig           | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron   | gcc-10   | multi_v7_=
defconfig+kselftest | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron   | gcc-10   | multi_v7_=
defconfig+kselftest | 1          =

qemu_i386                    | i386  | lab-collabora | clang-17 | i386_defc=
onfig               | 1          =

qemu_i386                    | i386  | lab-collabora | gcc-10   | i386_defc=
onfig               | 1          =

qemu_i386-uefi               | i386  | lab-collabora | clang-17 | i386_defc=
onfig               | 1          =

qemu_i386-uefi               | i386  | lab-collabora | gcc-10   | i386_defc=
onfig               | 1          =

qemu_riscv64                 | riscv | lab-broonie   | gcc-10   | defconfig=
+debug              | 1          =

qemu_riscv64                 | riscv | lab-collabora | gcc-10   | defconfig=
+debug              | 1          =

qemu_smp8_riscv64            | riscv | lab-broonie   | gcc-10   | defconfig=
+debug              | 1          =

qemu_smp8_riscv64            | riscv | lab-collabora | gcc-10   | defconfig=
+debug              | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =

rk3288-rock2-square          | arm   | lab-collabora | clang-17 | multi_v7_=
defconfig           | 1          =

rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | sunxi_def=
config              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240611/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240611
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a957267fa7e9159d3d2ee1421359ebf228570c68 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/66684bf3a2ed13cd127e708d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240611/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240611/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66684bf3a2ed13cd127e7=
08e
        failing since 372 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/666847bce52bb72d027e7083

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240611/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240611/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/666847bce52bb72d027e7=
084
        failing since 440 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/666849dbfbafe6caa67e7087

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240611/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240611/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/666849dbfbafe6ca=
a67e708c
        failing since 4 days (last pass: next-20240606, first fail: next-20=
240607)
        1 lines

    2024-06-11T12:57:44.877430  / # =

    2024-06-11T12:57:44.886617  =

    2024-06-11T12:57:44.993467  / # #
    2024-06-11T12:57:45.014353  #
    2024-06-11T12:57:45.116690  / # export SHELL=3D/bin/sh
    2024-06-11T12:57:45.126308  export SHELL=3D/bin/sh
    2024-06-11T12:57:45.228250  / # . /lava-1147350/environment
    2024-06-11T12:57:45.237763  . /lava-1147350/environment
    2024-06-11T12:57:45.339214  / # /lava-1147350/bin/lava-test-runner /lav=
a-1147350/0
    2024-06-11T12:57:45.350029  /lava-1147350/bin/lava-test-runner /lava-11=
47350/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron   | gcc-10   | multi_v7_=
defconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/666854b8ad117633877e7072

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240611/arm/=
multi_v7_defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240611/arm/=
multi_v7_defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/666854b8ad117633877e7=
073
        failing since 4 days (last pass: next-20240605, first fail: next-20=
240607) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron   | gcc-10   | multi_v7_=
defconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/666854b666959c55777e706e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240611/arm/=
multi_v7_defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240611/arm/=
multi_v7_defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/666854b666959c55777e7=
06f
        failing since 4 days (last pass: next-20240605, first fail: next-20=
240607) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_i386                    | i386  | lab-collabora | clang-17 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/66684f9f5ca4d415ce7e7076

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240611/i386=
/i386_defconfig/clang-17/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240611/i386=
/i386_defconfig/clang-17/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66684f9f5ca4d415ce7e7=
077
        failing since 5 days (last pass: next-20240605, first fail: next-20=
240606) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_i386                    | i386  | lab-collabora | gcc-10   | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/66684b54ced82510257e707d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240611/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240611/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66684b54ced82510257e7=
07e
        failing since 5 days (last pass: next-20240605, first fail: next-20=
240606) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_i386-uefi               | i386  | lab-collabora | clang-17 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/66684f772193f5470a7e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240611/i386=
/i386_defconfig/clang-17/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240611/i386=
/i386_defconfig/clang-17/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66684f772193f5470a7e7=
06e
        failing since 5 days (last pass: next-20240605, first fail: next-20=
240606) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_i386-uefi               | i386  | lab-collabora | gcc-10   | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/66684b56ced82510257e7083

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240611/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240611/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66684b56ced82510257e7=
084
        failing since 5 days (last pass: next-20240605, first fail: next-20=
240606) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_riscv64                 | riscv | lab-broonie   | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66684bc3db23e3b34f7e7075

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240611/risc=
v/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240611/risc=
v/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66684bc3db23e3b34f7e7=
076
        new failure (last pass: next-20240606) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_riscv64                 | riscv | lab-collabora | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66684bb8834da3c6fc7e70cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240611/risc=
v/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240611/risc=
v/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66684bb8834da3c6fc7e7=
0ce
        new failure (last pass: next-20240606) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_smp8_riscv64            | riscv | lab-broonie   | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66684bc5db23e3b34f7e7079

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240611/risc=
v/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240611/risc=
v/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66684bc5db23e3b34f7e7=
07a
        new failure (last pass: next-20240606) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_smp8_riscv64            | riscv | lab-collabora | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66684bb9db23e3b34f7e706f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240611/risc=
v/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240611/risc=
v/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66684bb9db23e3b34f7e7=
070
        new failure (last pass: next-20240606) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66684bd9a2ed13cd127e7078

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240611/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240611/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66684bd9a2ed13cd127e7=
079
        failing since 8 days (last pass: next-20240531, first fail: next-20=
240603) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-rock2-square          | arm   | lab-collabora | clang-17 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66685388dea52437a47e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240611/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240611/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66685388dea52437a47e7=
06e
        failing since 82 days (last pass: next-20240315, first fail: next-2=
0240321) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66684d831478d1d8417e71ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240611/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240611/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66684d831478d1d8417e7=
1ad
        failing since 567 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66684c97ffe608cfe17e7092

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240611/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240611/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66684c97ffe608cfe17e7=
093
        failing since 567 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/666848300f322e709e7e7079

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240611/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240611/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/666848300f322e70=
9e7e707e
        failing since 4 days (last pass: next-20240606, first fail: next-20=
240607)
        27 lines

    2024-06-11T12:50:35.044766  / # =

    2024-06-11T12:50:35.050160  =

    2024-06-11T12:50:35.153592  / # #
    2024-06-11T12:50:35.158592  #
    2024-06-11T12:50:35.259874  / # export SHELL=3D/bin/sh
    2024-06-11T12:50:35.263480  export SHELL=3D/bin/sh
    2024-06-11T12:50:35.365868  / # . /lava-470078/environment
    2024-06-11T12:50:35.369694  . /lava-470078/environment
    2024-06-11T12:50:35.472398  / # /lava-470078/bin/lava-test-runner /lava=
-470078/0
    2024-06-11T12:50:35.476201  /lava-470078/bin/lava-test-runner /lava-470=
078/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66684985a05548720d7e706d

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240611/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240611/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/66684985a0554872=
0d7e7072
        failing since 4 days (last pass: next-20240606, first fail: next-20=
240607)
        27 lines

    2024-06-11T12:56:12.484156  / # =

    2024-06-11T12:56:12.488027  =

    2024-06-11T12:56:12.593215  / # #
    2024-06-11T12:56:12.597655  #
    2024-06-11T12:56:12.698980  / # export SHELL=3D/bin/sh
    2024-06-11T12:56:12.702772  export SHELL=3D/bin/sh
    2024-06-11T12:56:12.805231  / # . /lava-470080/environment
    2024-06-11T12:56:12.809000  . /lava-470080/environment
    2024-06-11T12:56:12.911893  / # /lava-470080/bin/lava-test-runner /lava=
-470080/0
    2024-06-11T12:56:12.915593  /lava-470080/bin/lava-test-runner /lava-470=
080/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/66684aed1d093b4f537e70a6

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240611/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240611/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/66684aed1d093b4f=
537e70ab
        failing since 4 days (last pass: next-20240605, first fail: next-20=
240607)
        30 lines

    2024-06-11T13:02:14.342015  / # =

    2024-06-11T13:02:14.345895  =

    2024-06-11T13:02:14.449364  / # #
    2024-06-11T13:02:14.452974  #
    2024-06-11T13:02:14.555494  / # export SHELL=3D/bin/sh
    2024-06-11T13:02:14.559098  export SHELL=3D/bin/sh
    2024-06-11T13:02:14.661364  / # . /lava-470081/environment
    2024-06-11T13:02:14.664970  . /lava-470081/environment
    2024-06-11T13:02:14.767654  / # /lava-470081/bin/lava-test-runner /lava=
-470081/0
    2024-06-11T13:02:14.771210  /lava-470081/bin/lava-test-runner /lava-470=
081/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/66684de51478d1d8417e71d4

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240611/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240611/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/66684de51478d1d8=
417e71d9
        failing since 4 days (last pass: next-20240606, first fail: next-20=
240607)
        10 lines

    2024-06-11T13:15:00.035401  / # =

    2024-06-11T13:15:00.040163  =

    2024-06-11T13:15:00.143582  / # #
    2024-06-11T13:15:00.147978  #
    2024-06-11T13:15:00.249295  / # export SHELL=3D/bin/sh
    2024-06-11T13:15:00.253186  export SHELL=3D/bin/sh
    2024-06-11T13:15:00.355524  / # . /lava-470082/environment
    2024-06-11T13:15:00.359295  . /lava-470082/environment
    2024-06-11T13:15:00.462079  / # /lava-470082/bin/lava-test-runner /lava=
-470082/0
    2024-06-11T13:15:00.465736  /lava-470082/bin/lava-test-runner /lava-470=
082/0 =

    ... (9 line(s) more)  =

 =20

