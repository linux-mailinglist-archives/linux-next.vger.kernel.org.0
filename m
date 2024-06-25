Return-Path: <linux-next+bounces-2674-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C133C9173C3
	for <lists+linux-next@lfdr.de>; Tue, 25 Jun 2024 23:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FE85B23B72
	for <lists+linux-next@lfdr.de>; Tue, 25 Jun 2024 21:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8D517E475;
	Tue, 25 Jun 2024 21:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="TZbJSDFo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2762143C49
	for <linux-next@vger.kernel.org>; Tue, 25 Jun 2024 21:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719352460; cv=none; b=phhQzgFWX+4+3Nndfql2hdY08AnJFDVnuWOnYmPiBkg5inNLWOeIxVdj+SQ3x6h3xxkFX0Py/TfTJkP7S1S0cx4DjyJ/vZP66R9H0SsEkAdKn0wJAYZNuUtJ5sdK3oeK7Y62lk/Sw+sC/4I0/dtrbtvbqBH1vKiimFwqcTuPKk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719352460; c=relaxed/simple;
	bh=nodJkdiGQMqCeM44nWuQRUnuSxSiVojV+vxTuOXfnn0=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=cP6BP4aCx07RUXhBs4sAWh3kaYFR6Lbt4QLoBZ8+Sy4x6RUeNntl/mO8rwsYeROdGlKBcF7Y9EE0zNbhMvH+FAyPDwYIj8qeTo4akyOEQdAv2LhtphrSJTjVxnbESv3e4uILq4EZXMQhbluBXZZXpcvYRiPrljRkG0K4dJCgNdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=TZbJSDFo; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7182a634815so3061450a12.3
        for <linux-next@vger.kernel.org>; Tue, 25 Jun 2024 14:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719352456; x=1719957256; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l8ChKh1bcmdxx3icPKJCjqQCiu6oqwriWheji1WjnC8=;
        b=TZbJSDFo9x/N505/0q+49PmxW740XwsV/BjFKspe1YZ6Fy+6shLrcadcGFNVZSsIzg
         HCzReQphiFYamNGU9CCht0XrPzI9YCdZXAeGo0ViEr/oaB7/DhEvY/BN8RT9RrTUP+8F
         RQBPY4o6euW9JzTQqGgPGfn9+E1wEf4hh47ucvz6ZXXZAMFhXDjk/DPHGasm0zVFB06p
         TZKIE1F4poqu2WxiKlc0grcodiluYyi5IFaHDpYvFRbn8KUvHZZXDwB+zh6/1izAYpcV
         Ue7pxOBtVX50FJu026MNAiVVobhFXpSc0/4Sj4em11/Vnq3/Z16O8kgkreNN08jMD+6Z
         cXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719352456; x=1719957256;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8ChKh1bcmdxx3icPKJCjqQCiu6oqwriWheji1WjnC8=;
        b=JRfZHSVgYzvXIR1gT/KvIr7vRLEuw/etrEQvcF95Uts+qx/i0EuQfhUOu3CoTobjDp
         PmOX0kqeeMGodPhjQKYbFClx2M4PepH5GJRUHdFwYcG9oohXU7z+xN5Agn5fzqjO/Enm
         uWoWa0kJ8DMyO+ZJ4QvmVdbQ9OMTFRZtDa32W3scovH0irjzbgndTuP0Vlh447hPcFtV
         NBzYQqbCr88ZfN6IeAf72I0D3A0pNPDmMdkFb4uETw5Dyvn+5Nu27kP0Y85yPf540U04
         12hmDi7dOp7H1xhYfLeB/0idMA7O/ZIAjUqPmgyu8yjYxjSHMYeBm8n4kfujHTdm+43n
         MVSQ==
X-Gm-Message-State: AOJu0YwnSzWs9UvVy/0ZE5OqdMjTetjGWSc4ycPOJEZ6ZPVEqlAlT3kn
	hvuEC+3tys6HdupDDd2qvOA4aUrKNWXj3mTOOiqw0E3D2Ah12qN2BZ2mNNNUHuDXbmGrWaPDSL5
	n
X-Google-Smtp-Source: AGHT+IE/tVC9hp7F3v0Ogn2KbucgBPFx0PGd5MRPV3QOz1K5oIK3KoatYCHG1KdMp9tOKzu9GEGV+w==
X-Received: by 2002:a05:6a20:6ab0:b0:1bd:212d:ac63 with SMTP id adf61e73a8af0-1bd212db009mr2537063637.22.1719352456103;
        Tue, 25 Jun 2024 14:54:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70651085a5bsm8618003b3a.44.2024.06.25.14.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 14:54:15 -0700 (PDT)
Message-ID: <667b3c87.050a0220.5ea4b.81f0@mx.google.com>
Date: Tue, 25 Jun 2024 14:54:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20240625
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 407 runs, 19 regressions (next-20240625)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 407 runs, 19 regressions (next-20240625)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cp514-3wh-r0qs-guybrush | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

am57xx-beagle-x15            | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre  | gcc-10   | sama5_de=
fconfig              | 1          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie   | gcc-10   | bcm2835_=
defconfig            | 2          =

bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | bcm2835_=
defconfig            | 1          =

beagle-xm                    | arm    | lab-baylibre  | gcc-10   | omap2plu=
s_defconfig          | 1          =

beaglebone-black             | arm    | lab-cip       | gcc-10   | multi_v7=
_defconfig           | 1          =

jetson-tk1                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

jetson-tk1                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip       | gcc-10   | shmobile=
_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | sunxi_de=
fconfig              | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240625/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240625
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      0fc4bfab2cd45f9acb86c4f04b5191e114e901ed =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cp514-3wh-r0qs-guybrush | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/667b02f57a047285fe7e7088

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240625/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cp514-3wh-=
r0qs-guybrush.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240625/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cp514-3wh-=
r0qs-guybrush.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667b02f57a047285=
fe7e708d
        failing since 0 day (last pass: next-20240621, first fail: next-202=
40624)
        4 lines

    2024-06-25T17:48:15.117994  / # =


    2024-06-25T17:48:15.123603  =


    2024-06-25T17:48:15.228290  / # #

    2024-06-25T17:48:15.234461  #

    2024-06-25T17:48:15.336409  / # export SHELL=3D/bin/sh

    2024-06-25T17:48:15.343319  export SHELL=3D/bin/sh

    2024-06-25T17:48:15.444949  / # . /lava-14580347/environment

    2024-06-25T17:48:15.450896  . /lava-14580347/environment

    2024-06-25T17:48:15.552561  / # /lava-14580347/bin/lava-test-runner /la=
va-14580347/0

    2024-06-25T17:48:15.558549  /lava-14580347/bin/lava-test-runner /lava-1=
4580347/0
 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
am57xx-beagle-x15            | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/667b03b8ef24f5da797e7087

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240625/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-am57xx-beagl=
e-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240625/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-am57xx-beagl=
e-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667b03b8ef24f5da797e7=
088
        new failure (last pass: next-20240613) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre  | gcc-10   | sama5_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/667af9edc7e89d09727e7076

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240625/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240625/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667af9edc7e89d09727e7=
077
        failing since 510 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie   | gcc-10   | bcm2835_=
defconfig            | 2          =


  Details:     https://kernelci.org/test/plan/id/667afbc3d95dd78c337e7077

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240625/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240625/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/667afbc3d95dd78=
c337e707a
        new failure (last pass: next-20240624)
        53 lines

    2024-06-25T17:17:32.619338  kern  :alert : Register r3 information: non=
-paged memory
    2024-06-25T17:17:32.630195  kern  :alert : Register r4 information: sla=
b kmalloc-2k start c4a13000 pointer offset 0 size 2048
    2024-06-25T17:17:32.635986  kern  :alert : Register r5 information: NUL=
L pointer
    2024-06-25T17:17:32.641493  kern  :alert : Register r6 information: NUL=
L pointer
    2024-06-25T17:17:32.646925  kern  :alert : Register r7 information: 2-p=
age vmalloc region starting at 0xdcbd4000 allocated at kernel_clone+0xa0/0x=
208
    2024-06-25T17:17:32.658049  kern  :alert : Register r8 information: sla=
b kmalloc-2k start c4a13000 pointer offset 1076 size 2048
    2024-06-25T17:17:32.669285  kern  :alert : Register r9 information: sla=
b task_struct start c4be4f00 pointer offset 0 size 1920
    2024-06-25T17:17:32.674791  kern  :alert : Register r10 information: sl=
ab task_struct start c4be4f00 pointer offset 0 size 1920
    2024-06-25T17:17:32.685962  kern  :alert : Register r11 information: 3-=
page vmalloc region starting at 0xbf083000 allocated at load_module+0x734/0=
x16e0
    2024-06-25T17:17:32.693618  kern  :alert : Register r12 information: NU=
LL pointer =

    ... (52 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/667afbc3d95dd78=
c337e707b
        new failure (last pass: next-20240624)
        16 lines

    2024-06-25T17:17:32.561835  kern  :alert : 8<--- cut here ---
    2024-06-25T17:17:32.572650  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000024 when read
    2024-06-25T17:17:32.578521  kern  :alert : [00000024] *pgd=3D04a3d831, =
*pte=3D00000000, *ppte=3D00000000
    2024-06-25T17:17:32.583896  kern  :alert : Register r0 information: non=
-paged memory
    2024-06-25T17:17:32.595064  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xdcbd4000 allocated at kernel_clone+0xa0/0x=
208
    2024-06-25T17:17:32.609046  kern  :alert : Register r2 information: NUL=
L <8>[   46.550448] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfai=
l UNITS=3Dlines MEASUREMENT=3D16>
    2024-06-25T17:17:32.609582  pointer   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | bcm2835_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/667afa0b442f5c18707e70a0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240625/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240625/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667afa0b442f5c18707e7=
0a1
        failing since 386 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beagle-xm                    | arm    | lab-baylibre  | gcc-10   | omap2plu=
s_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/667b017f7484b5bc3b7e7075

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240625/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240625/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667b017f7484b5bc3b7e7=
076
        new failure (last pass: next-20240624) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beaglebone-black             | arm    | lab-cip       | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/667b0a8f25e0dc26787e71cc

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240625/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240625/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667b0a8f25e0dc26=
787e71d1
        failing since 0 day (last pass: next-20240621, first fail: next-202=
40624)
        1 lines

    2024-06-25T18:20:55.994770  / # =

    2024-06-25T18:20:56.000834  =

    2024-06-25T18:20:56.104144  / # #
    2024-06-25T18:20:56.110140  #
    2024-06-25T18:20:56.211342  / # export SHELL=3D/bin/sh
    2024-06-25T18:20:56.217360  export SHELL=3D/bin/sh
    2024-06-25T18:20:56.318316  / # . /lava-1156918/environment
    2024-06-25T18:20:56.324483  . /lava-1156918/environment
    2024-06-25T18:20:56.425481  / # /lava-1156918/bin/lava-test-runner /lav=
a-1156918/0
    2024-06-25T18:20:56.430371  /lava-1156918/bin/lava-test-runner /lava-11=
56918/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
jetson-tk1                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/667afe2a08e23ae2a77e7081

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240625/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240625/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667afe2a08e23ae2a77e7=
082
        failing since 805 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
jetson-tk1                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/667b0408145a81b18b7e706f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240625/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240625/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667b0408145a81b18b7e7=
070
        failing since 97 days (last pass: next-20240315, first fail: next-2=
0240320) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip       | gcc-10   | shmobile=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/667b03768eb10e744c7e709e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240625/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240625/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667b03768eb10e744c7e7=
09f
        failing since 0 day (last pass: next-20240621, first fail: next-202=
40624) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/667aff1f766af46aa57e7078

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240625/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240625/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667aff1f766af46aa57e7=
079
        failing since 581 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/667afe1b552f5b72307e70d9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240625/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240625/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667afe1b552f5b72307e7=
0da
        failing since 581 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/667b01bbf8f94a1c497e7074

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240625/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240625/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667b01bbf8f94a1c=
497e7079
        failing since 18 days (last pass: next-20240605, first fail: next-2=
0240607)
        26 lines

    2024-06-25T17:42:59.449602  / # =

    2024-06-25T17:42:59.576702  / # #
    2024-06-25T17:42:59.688976  / # export SHELL=3D/bin/sh
    2024-06-25T17:42:59.801361  / # . /lava-3865140/environment
    2024-06-25T17:42:59.913070  / # /lava-3865140/bin/lava-test-runner /lav=
a-3865140/0
    2024-06-25T17:43:00.021617  + export 'TESTRUN_ID=3D0_dmesg'
    2024-06-25T17:43:00.022297  + cd /lava-3865140/0/tests/0_dmesg
    2024-06-25T17:43:00.023131  + cat uuid
    2024-06-25T17:43:00.023489  <8>[  177.866852] <LAVA_SIGNAL_STARTRUN 0_d=
mesg 3865140_1.5.2.4.1>
    2024-06-25T17:43:00.023799  + UUID=3D3865140_1.5.2.4.1 =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/667b0529aeead1f7b87e7096

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240625/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240625/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667b0529aeead1f7=
b87e709b
        failing since 18 days (last pass: next-20240606, first fail: next-2=
0240607)
        28 lines

    2024-06-25T17:57:18.656715  / # =

    2024-06-25T17:57:18.832615  / # #
    2024-06-25T17:57:18.944683  / # export SHELL=3D/bin/sh
    2024-06-25T17:57:19.056511  / # . /lava-3865189/environment
    2024-06-25T17:57:19.168679  / # /lava-3865189/bin/lava-test-runner /lav=
a-3865189/0
    2024-06-25T17:57:19.302928  + export 'TESTRUN_ID=3D0_dmesg'
    2024-06-25T17:57:19.303556  + cd /lava-3865189/0/tests/0_dmesg
    2024-06-25T17:57:19.303775  + cat uuid
    2024-06-25T17:57:19.304003  + UUID=3D3865189_1.5.2.4.1
    2024-06-25T17:57:19.304236  <8>[  179.820912] <LAVA_SIGNAL_STARTRUN 0_d=
mesg 3865189_1.5.2.4.1> =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/667b01fb2e96a4879c7e70ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240625/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240625/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667b01fb2e96a4879c7e7=
0ad
        new failure (last pass: next-20240624) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/667b04c99a061dff797e7070

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240625/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240625/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667b04c99a061dff=
797e7075
        failing since 18 days (last pass: next-20240606, first fail: next-2=
0240607)
        28 lines

    2024-06-25T17:56:11.596190  / # =

    2024-06-25T17:56:11.600472  =

    2024-06-25T17:56:11.705732  / # #
    2024-06-25T17:56:11.709319  #
    2024-06-25T17:56:11.812185  / # export SHELL=3D/bin/sh
    2024-06-25T17:56:11.815980  export SHELL=3D/bin/sh
    2024-06-25T17:56:11.918558  / # . /lava-470833/environment
    2024-06-25T17:56:11.922391  . /lava-470833/environment
    2024-06-25T17:56:12.025544  / # /lava-470833/bin/lava-test-runner /lava=
-470833/0
    2024-06-25T17:56:12.030567  /lava-470833/bin/lava-test-runner /lava-470=
833/0 =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/667af9615691fc59147e7157

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240625/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240625/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667af9615691fc59=
147e715c
        failing since 18 days (last pass: next-20240606, first fail: next-2=
0240607)
        10 lines

    2024-06-25T17:07:23.662086  / # =

    2024-06-25T17:07:23.806187  / # #
    2024-06-25T17:07:23.918023  / # export SHELL=3D/bin/sh
    2024-06-25T17:07:24.030083  / # . /lava-3865030/environment
    2024-06-25T17:07:24.142023  / # /lava-3865030/bin/lava-test-runner /lav=
a-3865030/0
    2024-06-25T17:07:24.251183  + export 'TESTRUN_ID=3D0_dmesg'
    2024-06-25T17:07:24.252237  + cd /lava-3865030/0/tests/0_dmesg
    2024-06-25T17:07:24.252706  + cat uuid
    2024-06-25T17:07:24.253067  + UUID=3D3865030_1.5.2.4.1
    2024-06-25T17:07:24.253404  <8>[  179.612529] <LAVA_SIGNAL_STARTRUN 0_d=
mesg 3865030_1.5.2.4.1> =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/667af94c5691fc59147e714a

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240625/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240625/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667af94c5691fc59=
147e714f
        failing since 18 days (last pass: next-20240606, first fail: next-2=
0240607)
        10 lines

    2024-06-25T17:07:05.691156  / # =

    2024-06-25T17:07:05.695669  =

    2024-06-25T17:07:05.799214  / # #
    2024-06-25T17:07:05.802810  #
    2024-06-25T17:07:05.905512  / # export SHELL=3D/bin/sh
    2024-06-25T17:07:05.909214  export SHELL=3D/bin/sh
    2024-06-25T17:07:06.011506  / # . /lava-470827/environment
    2024-06-25T17:07:06.015377  . /lava-470827/environment
    2024-06-25T17:07:06.118272  / # /lava-470827/bin/lava-test-runner /lava=
-470827/0
    2024-06-25T17:07:06.122118  /lava-470827/bin/lava-test-runner /lava-470=
827/0 =

    ... (9 line(s) more)  =

 =20

