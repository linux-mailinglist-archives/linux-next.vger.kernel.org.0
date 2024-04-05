Return-Path: <linux-next+bounces-1822-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1405E899E4A
	for <lists+linux-next@lfdr.de>; Fri,  5 Apr 2024 15:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9007E1F22DB1
	for <lists+linux-next@lfdr.de>; Fri,  5 Apr 2024 13:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071A61E52C;
	Fri,  5 Apr 2024 13:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="vQIj+V9L"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D1A16D309
	for <linux-next@vger.kernel.org>; Fri,  5 Apr 2024 13:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712323718; cv=none; b=KUo5sUpUJLvl24elmfCrJTebBncAM9HbYLydP71DZEB4lZMazVtMl7PWn/nW+mfBxYBqgkB9CsvFASGXaovirGpz9kbYQrot/rsNE7NjCvekOdM8S+o3tY7q/sWCyK6AW6/MoBplnAoaNS4r/JQWzNmmnmB6MsnwtkbvOcH9d04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712323718; c=relaxed/simple;
	bh=hA0JsCcUxY4XM+UA3D+qj6POBdbAQJHhzDjrjQDslMw=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=cb8cIjYJlvyVxTJg1d3UQR63dTCYu+BTnHMsJmIyBre93pAy3NR4s1mfHXpytkolnz8083+H/tj3ugV45CGmfKKW+XJxMJ8AcnlldVOJjooihIm1kt2fOmuWKo1zMwOZQ1onmWAtPwqkUIAKEzD+F8JogbiRnQeXs72RHOaqhyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=vQIj+V9L; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e3c3aa8938so3709955ad.1
        for <linux-next@vger.kernel.org>; Fri, 05 Apr 2024 06:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712323715; x=1712928515; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zBcB3hHIzf726pmQU9e6qGkVpN+NVgR3ed7bBWBGGNA=;
        b=vQIj+V9LPxe4GhQmqW2dXGvi4QifSHcFU68e5eWM4RcAnPsEzjlVFoGZ1tTqdPO80F
         4tq7To20gJx+jtXGwj4IKbeHFWJuQUgsjbS5KfPcKvabfaqbYbglvl2vi9AJjZ1ktXba
         TPXrH1WbOUf+phLIZ7JOzf1gJNNtHVYWyCZYtNmys9K9Dw5U8hBkXeQp7dhpFLFcpMvn
         E+3mIiiAo/fKhX8Es4tS2ZjMr4M+VatU5862Xd1lOlP9+d06deZvr7EH0A3C1IBqPMfv
         d7Yzejt0Q3VFS71JAHOID1X+9nxo9bgX8U3t6seFnoyDYOePAPb6tOgHgw6haFJCchJR
         tY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712323715; x=1712928515;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zBcB3hHIzf726pmQU9e6qGkVpN+NVgR3ed7bBWBGGNA=;
        b=Bvj9cGvPWpgF55b7YkCQ+ak7wTa/i2aSt/P56ZeFjAeGr8J47JglQ9vbCpiIjhHoWC
         Scm9DApHXEm4JIQ/gwDdr72OmQwkjVqT40hcq4rgKaQtL6+CIlrSIfXA3RFqdKtSp6Ev
         pqsFcCh4B082OR6uHi3VvEbQfzTZdc+mb3VDMLWv6PE6JZHRp2sH5UJn1BDO2JXj+7y3
         KPUKZg9ZdiLa4K+BxnZC1Auu7w6yK6i25r0+DSyd3a4HbEVIDtpj9TpM0puYw/rnDBfJ
         dCovHgY7pg/L18lSdk21MlbjnZ8JvNbzZ1ab4Zdy24nrvApQPCoiY7wSw9O7E4zI6ewa
         R0Ug==
X-Gm-Message-State: AOJu0YzXRxF/cU8Shlj4dg98cr0CnvANvDqkAG2q4u8xY8Hv8gNg9dYL
	r/q1X/e84kLlhaLPGw1DX6EJPfiFhBnHJgI7AwX1D+3gugqr5PTdnqUzlJSmdjKKNKMNJ8EU/5a
	N
X-Google-Smtp-Source: AGHT+IFaEPUggNOWqGRfuq2gItbrtmDaoLE6fdxsea/PeycAnQEVkSyF0lTX0CgXFnH9g9XJG3fqPw==
X-Received: by 2002:a17:902:f690:b0:1e2:9dea:2e26 with SMTP id l16-20020a170902f69000b001e29dea2e26mr1598792plg.1.1712323715178;
        Fri, 05 Apr 2024 06:28:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id y6-20020a170902ed4600b001e0b5eeee41sm1540241plb.38.2024.04.05.06.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 06:28:34 -0700 (PDT)
Message-ID: <660ffc82.170a0220.4e54.4412@mx.google.com>
Date: Fri, 05 Apr 2024 06:28:34 -0700 (PDT)
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
X-Kernelci-Kernel: next-20240405
X-Kernelci-Report-Type: test
Subject: next/master baseline: 190 runs, 11 regressions (next-20240405)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 190 runs, 11 regressions (next-20240405)

Regressions Summary
-------------------

platform              | arch   | lab           | compiler | defconfig      =
              | regressions
----------------------+--------+---------------+----------+----------------=
--------------+------------
acer-R721T-grunt      | x86_64 | lab-collabora | gcc-10   | x86_64_defconfi=
g+x86-board   | 1          =

at91-sama5d4_xplained | arm    | lab-baylibre  | gcc-10   | sama5_defconfig=
              | 1          =

bcm2835-rpi-b-rev2    | arm    | lab-broonie   | gcc-10   | bcm2835_defconf=
ig            | 2          =

bcm2836-rpi-2-b       | arm    | lab-collabora | gcc-10   | bcm2835_defconf=
ig            | 1          =

bcm2836-rpi-2-b       | arm    | lab-collabora | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =

beagle-xm             | arm    | lab-baylibre  | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =

beaglebone-black      | arm    | lab-cip       | gcc-10   | multi_v7_defcon=
fig           | 1          =

hp-11A-G6-EE-grunt    | x86_64 | lab-collabora | gcc-10   | x86_64_defconfi=
g+x86-board   | 1          =

hp-14-db0003na-grunt  | x86_64 | lab-collabora | gcc-10   | x86_64_defconfi=
g+x86-board   | 1          =

r8a7743-iwg20d-q7     | arm    | lab-cip       | gcc-10   | shmobile_defcon=
fig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240405/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240405
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      8568bb2ccc278f344e6ac44af6ed010a90aa88dc =



Test Regressions
---------------- =



platform              | arch   | lab           | compiler | defconfig      =
              | regressions
----------------------+--------+---------------+----------+----------------=
--------------+------------
acer-R721T-grunt      | x86_64 | lab-collabora | gcc-10   | x86_64_defconfi=
g+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/660fbc6546e23365864c42f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240405/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240405/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660fbc6546e23365864c4=
2f2
        failing since 36 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform              | arch   | lab           | compiler | defconfig      =
              | regressions
----------------------+--------+---------------+----------+----------------=
--------------+------------
at91-sama5d4_xplained | arm    | lab-baylibre  | gcc-10   | sama5_defconfig=
              | 1          =


  Details:     https://kernelci.org/test/plan/id/660fbcfa8b54dac4c24c42ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240405/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240405/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660fbcfa8b54dac4c24c4=
300
        failing since 429 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform              | arch   | lab           | compiler | defconfig      =
              | regressions
----------------------+--------+---------------+----------+----------------=
--------------+------------
bcm2835-rpi-b-rev2    | arm    | lab-broonie   | gcc-10   | bcm2835_defconf=
ig            | 2          =


  Details:     https://kernelci.org/test/plan/id/660fbad07e925a0f2a4c42da

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240405/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240405/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/660fbad07e925a0=
f2a4c42dd
        failing since 1 day (last pass: next-20240325, first fail: next-202=
40403)
        24 lines

    2024-04-05T08:47:59.625132  slab task_struct start c3099e00 pointer off=
set 0 size 1920
    2024-04-05T08:47:59.631040  kern  :alert : Register r5 information: NUL=
L pointer
    2024-04-05T08:47:59.641914  kern  :alert : Register r6 information: sla=
b kmalloc-4k start c3218000 pointer offset 0 size 4096
    2024-04-05T08:47:59.647426  kern  :alert : Register r7 information: sla=
b task_struct start c309ad00 pointer offset 0 size 1920
    2024-04-05T08:47:59.658675  kern  :alert : Register r8 information: sla=
b task_struct start c309ad00 pointer offset 0 size 1920
    2024-04-05T08:47:59.664047  kern  :alert : Register r9 information: non=
-paged memory
    2024-04-05T08:47:59.675261  kern  :alert : Register r10 information: 4-=
page vmalloc region starting at 0xbf02f000 allocated at load_module+0x730/0=
x16d8
    2024-04-05T08:47:59.675661  kern  :alert : Register r11 information: NU=
LL pointer
    2024-04-05T08:47:59.684986  kern  :alert : Register r12 information: no=
n-paged memory
    2024-04-05T08:47:59.706851  kern  :emerg : Internal error: Oops: 17 [#1=
] ARM =

    ... (6 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/660fbad07e925a0=
f2a4c42de
        failing since 1 day (last pass: next-20240325, first fail: next-202=
40403)
        16 lines

    2024-04-05T08:47:59.570515  kern  :alert : 8<--- cut here ---
    2024-04-05T08:47:59.581532  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000 when read
    2024-04-05T08:47:59.581941  kern  :alert : [00000000] *pgd=3D00000000
    2024-04-05T08:47:59.586826  kern  :alert : Register r0 information: non=
-paged memory
    2024-04-05T08:47:59.592545  kern  :alert : Register r1 information: NUL=
L pointer
    2024-04-05T08:47:59.598005  kern  :alert : Register r2 information: NUL=
L pointer
    2024-04-05T08:47:59.603630  kern  :alert : Register r3 information: non=
-paged memory
    2024-04-05T08:47:59.618627  kern  :alert : Register r4 information: <8>=
[   20.347442] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNI=
TS=3Dlines MEASUREMENT=3D16>   =

 =



platform              | arch   | lab           | compiler | defconfig      =
              | regressions
----------------------+--------+---------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b       | arm    | lab-collabora | gcc-10   | bcm2835_defconf=
ig            | 1          =


  Details:     https://kernelci.org/test/plan/id/660fc14adbe29a63584c42f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240405/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240405/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660fc14adbe29a63584c4=
2f6
        failing since 305 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform              | arch   | lab           | compiler | defconfig      =
              | regressions
----------------------+--------+---------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b       | arm    | lab-collabora | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/660fc51e7fa70e061a4c42e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240405/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240405/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660fc51e7fa70e061a4c4=
2e2
        failing since 373 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform              | arch   | lab           | compiler | defconfig      =
              | regressions
----------------------+--------+---------------+----------+----------------=
--------------+------------
beagle-xm             | arm    | lab-baylibre  | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/660fc5ccae0929f7c94c42f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240405/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240405/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660fc5ccae0929f7c94c4=
2f2
        failing since 371 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform              | arch   | lab           | compiler | defconfig      =
              | regressions
----------------------+--------+---------------+----------+----------------=
--------------+------------
beaglebone-black      | arm    | lab-cip       | gcc-10   | multi_v7_defcon=
fig           | 1          =


  Details:     https://kernelci.org/test/plan/id/660fd0ab77d43acbf74c42da

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240405/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240405/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/660fd0ab77d43acb=
f74c42df
        failing since 1 day (last pass: next-20240325, first fail: next-202=
40403)
        1 lines

    2024-04-05T10:21:27.671099  / # =

    2024-04-05T10:21:27.679932  =

    2024-04-05T10:21:27.785057  / # #
    2024-04-05T10:21:27.791861  #
    2024-04-05T10:21:27.908583  / # export SHELL=3D/bin/sh
    2024-04-05T10:21:27.919812  export SHELL=3D/bin/sh
    2024-04-05T10:21:28.021461  / # . /lava-1116502/environment
    2024-04-05T10:21:28.031546  . /lava-1116502/environment
    2024-04-05T10:21:28.133015  / # /lava-1116502/bin/lava-test-runner /lav=
a-1116502/0
    2024-04-05T10:21:28.143591  /lava-1116502/bin/lava-test-runner /lava-11=
16502/0 =

    ... (9 line(s) more)  =

 =



platform              | arch   | lab           | compiler | defconfig      =
              | regressions
----------------------+--------+---------------+----------+----------------=
--------------+------------
hp-11A-G6-EE-grunt    | x86_64 | lab-collabora | gcc-10   | x86_64_defconfi=
g+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/660fbc587278fc2c054c42e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240405/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240405/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660fbc587278fc2c054c4=
2e6
        failing since 36 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform              | arch   | lab           | compiler | defconfig      =
              | regressions
----------------------+--------+---------------+----------+----------------=
--------------+------------
hp-14-db0003na-grunt  | x86_64 | lab-collabora | gcc-10   | x86_64_defconfi=
g+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/660fbc83c18e8921344c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240405/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240405/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660fbc83c18e8921344c4=
2db
        failing since 36 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform              | arch   | lab           | compiler | defconfig      =
              | regressions
----------------------+--------+---------------+----------+----------------=
--------------+------------
r8a7743-iwg20d-q7     | arm    | lab-cip       | gcc-10   | shmobile_defcon=
fig           | 1          =


  Details:     https://kernelci.org/test/plan/id/660fc2d168267002b64c42f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240405/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240405/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660fc2d168267002b64c4=
2f7
        failing since 11 days (last pass: next-20240322, first fail: next-2=
0240325) =

 =20

