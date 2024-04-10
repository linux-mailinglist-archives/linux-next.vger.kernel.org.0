Return-Path: <linux-next+bounces-1857-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7559D89FAF5
	for <lists+linux-next@lfdr.de>; Wed, 10 Apr 2024 17:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0AE01F2B22C
	for <lists+linux-next@lfdr.de>; Wed, 10 Apr 2024 15:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D0F15D5C0;
	Wed, 10 Apr 2024 15:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="em7KZs5g"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C9C15958E
	for <linux-next@vger.kernel.org>; Wed, 10 Apr 2024 15:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712761395; cv=none; b=dYZ9Ntdqn+UxUV8+BaocZh0CkCR9Gc2nK0Y0cvW6XoutRiR+2dCBEGEC3LsgiGymXOykDJR9D1DKuesOunsrV76i3KuC+vGBkgiXJdfSb3bE95Y84XRlLqBVoH/h3z/FL8Ge1Pe+AosPjnYAzX4+pYycCBisjbCYN+vcaL6rzw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712761395; c=relaxed/simple;
	bh=G2XpqzjP4+7rKgmTCPHg4qZRhjwNikZmjH1sJStDUo8=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=WIu3Viz7ErhiekJPMrMz5zUxlRi/BGUScnKbzbsj6Id2d12zFCRtur6XOro19FWGqdF2GYd1JB+fWyh7mdHABp79oCRdkZZRa4jxm8VlpDREFQidN4bWj5k9O1P2gBGP4nOFLYdnGwc8pABeOHKlAaCO6PbTgwsFGIqY5UkZbfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=em7KZs5g; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1e4f341330fso5850705ad.0
        for <linux-next@vger.kernel.org>; Wed, 10 Apr 2024 08:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712761391; x=1713366191; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iXU63bUKTMHl4YjUHLXKBYtU+cBOndz3FBtbf4oGKm0=;
        b=em7KZs5gfHlowsntnA0+mFDLn1S+BCCNpu0oZtZfxq8hi1kyOSftpFjvMZKEzKNo3b
         AiGPShZAXiyWhpUOtiBjQqMn0r4kNwI7MzG/TgaowP7C4DQBfQi0s8JL/cXmXp4PYTcQ
         hpvZzyw92dIDYg6HVMtSQxWGRgXrZJU4Ieq8FIvbuD7zTEf6Ee7EV9/lqajGHoyuI9ef
         HMBHohA3bqvZZRTA2mMRM+gLgQUQNmgjTD/vT/DfiSl1Qn1IY6Oq6A53Z9tFUfhhaB9S
         Eq4X0qXRJ/ulMWieWfV7KIdo1rrm/PKMQVVg0hD159hA1MU6CulD8wq2etwdEAz/4nn6
         71yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712761391; x=1713366191;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iXU63bUKTMHl4YjUHLXKBYtU+cBOndz3FBtbf4oGKm0=;
        b=E5DhHgqYGylK4HomY/jf2o6Wn0sZXXXQBLO2No4Z/0ZaHnjhonDgoo1gEdgi4mSXEv
         msHqQF4uWLz7QgKEQZXQ5SsGpxZmyDHcXi/K2vp9VudZ/4cU1iVOe3BgQhUxGKctRNIZ
         3WCGjccyMkTgc4ZYoHyy3oOUTgFVFltoS+SVsRAqI3Fi0ViGbE+ZROca+PJvZ4nsIw/y
         +9VSlxKQwBqHDZtm010NZ3xhMY2uCcK/S1arDNYZZbkcHdpWoEqlEEIYsZYqoWr/cFSr
         hONXBXbBCJ0XTMZzBGgTyI3Lc/VWz9619vWjjPVdstSZ5rUu+ez9cu+whYCphyCAQW6K
         8dNQ==
X-Gm-Message-State: AOJu0YyzZgKNEIMsUPuWmdKDdpl4JDMKnG1jqMXY76izKQULzk8uOdZt
	W5YIXd9D55TV4ysege/7G9AhSY9mfRKz2zVF0xB7qWHvSpajiR/76JbBujawt6Lg+X8JaetxzwQ
	eDJI=
X-Google-Smtp-Source: AGHT+IGhnsGXB3+05WwgKdsxiXkJwc6HBAXnIye6xOU7fpw1bsKe1G/rT4zmMjFqRYL61MbaZoxkKw==
X-Received: by 2002:a17:903:2444:b0:1e2:b192:6975 with SMTP id l4-20020a170903244400b001e2b1926975mr3561711pls.16.1712761390731;
        Wed, 10 Apr 2024 08:03:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id k17-20020a635a51000000b005dbd0facb4dsm8789612pgm.61.2024.04.10.08.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 08:03:10 -0700 (PDT)
Message-ID: <6616aa2e.630a0220.2092e7.5f20@mx.google.com>
Date: Wed, 10 Apr 2024 08:03:10 -0700 (PDT)
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
X-Kernelci-Kernel: next-20240410
X-Kernelci-Report-Type: test
Subject: next/master baseline: 260 runs, 19 regressions (next-20240410)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 260 runs, 19 regressions (next-20240410)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie   | gcc-10   | bcm2835_=
defconfig            | 2          =

bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | bcm2835_=
defconfig            | 1          =

beaglebone-black             | arm    | lab-cip       | clang-17 | multi_v7=
_defconfig           | 1          =

beaglebone-black             | arm    | lab-cip       | gcc-10   | multi_v7=
_defconfig           | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron   | gcc-10   | multi_v7=
_defconfig+kselftest | 1          =

kontron-kswitch-d10-mmt-8g   | arm    | lab-kontron   | gcc-10   | multi_v7=
_defconfig+kselftest | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora | gcc-10   | defconfi=
g+debug              | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip       | gcc-10   | shmobile=
_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora | clang-17 | multi_v7=
_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240410/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240410
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6ebf211bb11dfc004a2ff73a9de5386fa309c430 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66167204d7abd9f34a4c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240410/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240410/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66167204d7abd9f34a4c4=
2db
        failing since 35 days (last pass: next-20240226, first fail: next-2=
0240305) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/661674e860f9f6965e4c4395

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240410/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240410/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/661674e860f9f6965e4c4=
396
        failing since 41 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie   | gcc-10   | bcm2835_=
defconfig            | 2          =


  Details:     https://kernelci.org/test/plan/id/661670d30d9e7896c54c42e1

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240410/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240410/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/661670d30d9e789=
6c54c42e4
        failing since 6 days (last pass: next-20240325, first fail: next-20=
240403)
        24 lines

    2024-04-10T10:58:10.196254  _struct start c47e9e00 pointer offset 0 siz=
e 1920
    2024-04-10T10:58:10.201812  kern  :alert : Register r5 information: NUL=
L pointer
    2024-04-10T10:58:10.207266  kern  :alert : Register r6 information: sla=
b kmalloc-4k start c4769000 pointer offset 0 size 4096
    2024-04-10T10:58:10.218481  kern  :alert : Register r7 information: sla=
b task_struct start c47eb480 pointer offset 0 size 1920
    2024-04-10T10:58:10.229681  kern  :alert : Register r8 information: sla=
b task_struct start c47eb480 pointer offset 0 size 1920
    2024-04-10T10:58:10.230099  kern  :alert : Register r9 information: non=
-paged memory
    2024-04-10T10:58:10.240809  kern  :alert : Register r10 information: 4-=
page vmalloc region starting at 0xbf02f000 allocated at load_module+0x730/0=
x16d8
    2024-04-10T10:58:10.246350  kern  :alert : Register r11 information: NU=
LL pointer
    2024-04-10T10:58:10.255232  kern  :alert : Register r12 information: no=
n-paged memory
    2024-04-10T10:58:10.277913  kern  :emerg : Internal error: Oops: 17 [#1=
] ARM =

    ... (6 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/661670d30d9e789=
6c54c42e5
        failing since 6 days (last pass: next-20240325, first fail: next-20=
240403)
        16 lines

    2024-04-10T10:58:10.140792  kern  :alert : 8<--- cut here ---
    2024-04-10T10:58:10.151747  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000 when read
    2024-04-10T10:58:10.152148  kern  :alert : [00000000] *pgd=3D00000000
    2024-04-10T10:58:10.157438  kern  :alert : Register r0 information: non=
-paged memory
    2024-04-10T10:58:10.163099  kern  :alert : Register r1 information: NUL=
L pointer
    2024-04-10T10:58:10.168420  kern  :alert : Register r2 information: NUL=
L pointer
    2024-04-10T10:58:10.174129  kern  :alert : Register r3 information: non=
-paged memory
    2024-04-10T10:58:10.189702  kern  :alert : Register r4 information: sla=
b task<8>[   19.575324] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=
=3Dfail UNITS=3Dlines MEASUREMENT=3D16>   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | bcm2835_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/661671a60e51e0646c4c42f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240410/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240410/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/661671a60e51e0646c4c4=
2f4
        failing since 310 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beaglebone-black             | arm    | lab-cip       | clang-17 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/661681062617dd83614c42e9

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240410/arm/=
multi_v7_defconfig/clang-17/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240410/arm/=
multi_v7_defconfig/clang-17/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/661681062617dd83=
614c42ee
        new failure (last pass: next-20240325)
        1 lines

    2024-04-10T12:07:11.212264  / # =

    2024-04-10T12:07:11.221135  =

    2024-04-10T12:07:11.326264  / # #
    2024-04-10T12:07:11.332954  #
    2024-04-10T12:07:11.450778  / # export SHELL=3D/bin/sh
    2024-04-10T12:07:11.460977  export SHELL=3D/bin/sh
    2024-04-10T12:07:11.562755  / # . /lava-1118523/environment
    2024-04-10T12:07:11.572779  . /lava-1118523/environment
    2024-04-10T12:07:11.674638  / # /lava-1118523/bin/lava-test-runner /lav=
a-1118523/0
    2024-04-10T12:07:11.684701  /lava-1118523/bin/lava-test-runner /lava-11=
18523/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beaglebone-black             | arm    | lab-cip       | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/661679c207363f84b34c43f1

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240410/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240410/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/661679c207363f84=
b34c43f6
        new failure (last pass: next-20240408)
        1 lines

    2024-04-10T11:36:16.132204  / # =

    2024-04-10T11:36:16.141008  =

    2024-04-10T11:36:16.246019  / # #
    2024-04-10T11:36:16.253018  #
    2024-04-10T11:36:16.355129  / #export SHELL=3D/bin/sh
    2024-04-10T11:36:16.365048   export SHELL=3D/bin/sh
    2024-04-10T11:36:16.466885  / # . /lava-1118499/environment
    2024-04-10T11:36:16.477002  . /lava-1118499/environment
    2024-04-10T11:36:16.578899  / # /lava-1118499/bin/lava-test-runner /lav=
a-1118499/0
    2024-04-10T11:36:16.588728  /lava-1118499/bin/lava-test-runner /lava-11=
18499/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6616720cd7abd9f34a4c42e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240410/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-11=
A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240410/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-11=
A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6616720cd7abd9f34a4c4=
2e1
        failing since 35 days (last pass: next-20240226, first fail: next-2=
0240305) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/6616753771e7fbd9f74c4314

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240410/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240410/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6616753771e7fbd9f74c4=
315
        failing since 41 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/661672173aedcff3d34c43c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240410/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-14=
-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240410/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-14=
-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/661672173aedcff3d34c4=
3c4
        failing since 35 days (last pass: next-20240226, first fail: next-2=
0240305) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/6616750f88f9e524854c44b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240410/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240410/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6616750f88f9e524854c4=
4b1
        failing since 41 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron   | gcc-10   | multi_v7=
_defconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6616695eeb7946ec1b4c42e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240410/arm/=
multi_v7_defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240410/arm/=
multi_v7_defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6616695eeb7946ec1b4c4=
2e1
        failing since 2 days (last pass: next-20240325, first fail: next-20=
240408) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kswitch-d10-mmt-8g   | arm    | lab-kontron   | gcc-10   | multi_v7=
_defconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6616695feb7946ec1b4c42e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240410/arm/=
multi_v7_defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240410/arm/=
multi_v7_defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6616695feb7946ec1b4c4=
2e5
        failing since 2 days (last pass: next-20240325, first fail: next-20=
240408) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66166a9a2e3234a6ce4c42e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240410/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240410/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66166a9a2e3234a6ce4c4=
2e2
        new failure (last pass: next-20240322) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip       | gcc-10   | shmobile=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66166a54f6d83b31ca4c42e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240410/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240410/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66166a54f6d83b31ca4c4=
2e3
        new failure (last pass: next-20240408) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm    | lab-collabora | clang-17 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6616758f89ab87921b4c4394

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240410/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240410/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6616758f89ab87921b4c4=
395
        failing since 20 days (last pass: next-20240315, first fail: next-2=
0240321) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66166c5567105f76bf4c42dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240410/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240410/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66166c5567105f76bf4c4=
2dd
        failing since 505 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66166b51f79f29b7f04c42f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240410/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240410/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66166b51f79f29b7f04c4=
2f4
        failing since 505 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66166ad5b520c226974c42dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240410/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240410/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66166ad5b520c226974c4=
2de
        new failure (last pass: next-20240322) =

 =20

