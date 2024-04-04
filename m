Return-Path: <linux-next+bounces-1809-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56677899070
	for <lists+linux-next@lfdr.de>; Thu,  4 Apr 2024 23:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D50E21F228A6
	for <lists+linux-next@lfdr.de>; Thu,  4 Apr 2024 21:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827D013C3DC;
	Thu,  4 Apr 2024 21:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="i4v7vlFf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0C313BC3B
	for <linux-next@vger.kernel.org>; Thu,  4 Apr 2024 21:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712266390; cv=none; b=tHboOpe87thDGQDpWDnFRR0yNahUv51f1eKC/QIJD1KyzflzTjaZfvAXY+7bPJQgjLKnZxYN1j48jInu9cB83QdE/YyWRy+l1h8BRIruA508E6o5wZEMnemW+G2rNekF7nKnlh+o2zOt6UaW2QylsmpR4zWl/1079fCaDfQLBQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712266390; c=relaxed/simple;
	bh=AQ2gEq51M3FBKypn/k/7IuBC3YboDGGlCAu+X+zrLt8=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=CrDthyenCRi9Rxo6QfrvAPBP4w6jEyl+m/8EDIPQdWLKszBAoD2xpt3JSfn/9XXmT2MM7Dnbdb3EFh6Va+EZMiNsrhRRxLRN3BYjG1lvr/xw/JVY5QLWopSeY+mRzr4w+sp9xAwtuWM9L8TXZTy2k68ot9wsNT0v/+CS+5X3e8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=i4v7vlFf; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e28856ed7aso11187855ad.0
        for <linux-next@vger.kernel.org>; Thu, 04 Apr 2024 14:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712266387; x=1712871187; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mzgVAaQTF16jsxRYyMz44nDyfebids6HlwX1C2KxZp4=;
        b=i4v7vlFfEZCqG4oFQyrYzR3PMrbWcd04+1uFpsbSmhVi2VJXeQAkyQBtkZRDYM8Qb3
         Kc4YvXA0wnmq92fupc0sYThttDQKcMI5IO6zodUiHrKsEx4wmYCnbxeUeHjn7M/P3+Tr
         Bq3DfBt/gMTILIvXPKjG4FcfH01iJmeJFYGswQR3SV4uSJuO8u6oF7b8snm7qZH8zXjL
         V+rVdZWZx95OJ4hk2nCRgLRp5nBS4YCE8xgHY69HHbG2dQz8k68IIZQ6kanW0rpW6R1e
         NoGaKvEN08+kKOVM5dZ7w1VsHJg1b5iXUHzbLxZ0vfCw3n2pMKG8e+r+uhvIwtzg5Ma6
         m3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712266387; x=1712871187;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mzgVAaQTF16jsxRYyMz44nDyfebids6HlwX1C2KxZp4=;
        b=qOzcREJz9YA/nAwIuFnW9/HAQTtMdOFnA65cXS/iDCaHWDLDV8G+rV8+wEF3C90uAh
         Zj++RA6c3+7udC2DMRFU+lrQLFxY/dN9KbI9OWcZsxXN1sGg50qjkxiFLGUw4aJzASnD
         8GY4HHeqT9E43SvVwnWIy3gL8XUbuGWV+pVV5C+ogTQdSqdU4/kjpbh9NGi+/rRcnbfI
         2ORBlcHsLCABL4EBce80E0Tb1Ijv+J93E6K/iipC4YsinfaKaw0JlK+UsiLob3qMcPg3
         Y4b69CBY0k13CpLIWChwY0OiqgkTa/GRwjqJWbVCQOrRpJQEZCLHSEQy55l0leoSfi2R
         jlFQ==
X-Gm-Message-State: AOJu0Yzb0Shg3F+3Sn24GBO9JoIrX7mwEjW1yxgLp3o2raJwDX1PVHAO
	aRCdw3wyljUlTPWUJyu5KZtKjbGDJZ2qs5xX35bTaQW77VDKTlsmewoSozcCzhWwhXn8KuWT6BC
	N800=
X-Google-Smtp-Source: AGHT+IGwg2bzW5J3myaEk45pTWt4YdD6n2M5DuqNOknJIvXPGq3Zd17VBZoIx9PTFJ/W6w2pqfUe+Q==
X-Received: by 2002:a17:903:18e:b0:1e2:be29:4b7b with SMTP id z14-20020a170903018e00b001e2be294b7bmr1630646plg.66.1712266386460;
        Thu, 04 Apr 2024 14:33:06 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 17-20020a170902c21100b001e2526a5cc3sm79838pll.307.2024.04.04.14.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 14:33:05 -0700 (PDT)
Message-ID: <660f1c91.170a0220.1d138.0638@mx.google.com>
Date: Thu, 04 Apr 2024 14:33:05 -0700 (PDT)
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
X-Kernelci-Kernel: next-20240404
X-Kernelci-Report-Type: test
Subject: next/master baseline: 334 runs, 23 regressions (next-20240404)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 334 runs, 23 regressions (next-20240404)

Regressions Summary
-------------------

platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
acer-R721T-grunt        | x86_64 | lab-collabora   | gcc-10   | x86_64_defc=
onfig+x86-board   | 1          =

at91-sama5d4_xplained   | arm    | lab-baylibre    | gcc-10   | sama5_defco=
nfig              | 1          =

bcm2835-rpi-b-rev2      | arm    | lab-broonie     | gcc-10   | bcm2835_def=
config            | 2          =

bcm2836-rpi-2-b         | arm    | lab-collabora   | gcc-10   | bcm2835_def=
config            | 1          =

bcm2836-rpi-2-b         | arm    | lab-collabora   | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

beagle-xm               | arm    | lab-baylibre    | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

beagle-xm               | arm    | lab-baylibre    | gcc-10   | omap2plus_d=
efconfig          | 1          =

beaglebone-black        | arm    | lab-cip         | gcc-10   | multi_v7_de=
fconfig           | 1          =

hp-11A-G6-EE-grunt      | x86_64 | lab-collabora   | gcc-10   | x86_64_defc=
onfig+x86-board   | 1          =

hp-14-db0003na-grunt    | x86_64 | lab-collabora   | gcc-10   | x86_64_defc=
onfig+x86-board   | 1          =

imx6dl-riotboard        | arm    | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =

imx6qp-wandboard-revd1  | arm    | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =

k3-j721e-beagleboneai64 | arm64  | lab-baylibre    | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

mt8195-cherry-tomato-r2 | arm64  | lab-collabora   | gcc-10   | defconfig+a=
rm...ook+videodec | 1          =

qemu_arm-virt-gicv2     | arm    | lab-broonie     | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =

qemu_arm-virt-gicv2     | arm    | lab-collabora   | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =

qemu_arm-virt-gicv3     | arm    | lab-broonie     | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =

qemu_arm-virt-gicv3     | arm    | lab-collabora   | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =

qemu_smp8_riscv64       | riscv  | lab-collabora   | gcc-10   | defconfig+d=
ebug              | 1          =

r8a7743-iwg20d-q7       | arm    | lab-cip         | gcc-10   | shmobile_de=
fconfig           | 1          =

rk3288-rock2-square     | arm    | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq       | arm    | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240404/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240404
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2b3d5988ae2cb5cd945ddbc653f0a71706231fdd =



Test Regressions
---------------- =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
acer-R721T-grunt        | x86_64 | lab-collabora   | gcc-10   | x86_64_defc=
onfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/660ee59c2f048e6d444c42f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240404/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240404/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660ee59c2f048e6d444c4=
2fa
        failing since 36 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
at91-sama5d4_xplained   | arm    | lab-baylibre    | gcc-10   | sama5_defco=
nfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/660edce41cbaee3ef54c42dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240404/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240404/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660edce41cbaee3ef54c4=
2dd
        failing since 428 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
bcm2835-rpi-b-rev2      | arm    | lab-broonie     | gcc-10   | bcm2835_def=
config            | 2          =


  Details:     https://kernelci.org/test/plan/id/660ee7eb7d9135f3c14c42da

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240404/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240404/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/660ee7eb7d9135f=
3c14c42dd
        failing since 0 day (last pass: next-20240325, first fail: next-202=
40403)
        24 lines

    2024-04-04T17:48:10.051591  k_struct start c3065e00 pointer offset 0 si=
ze 1920
    2024-04-04T17:48:10.056975  kern  :alert : Register r5 information: NUL=
L pointer
    2024-04-04T17:48:10.062187  kern  :alert : Register r6 information: sla=
b kmalloc-4k start c3030000 pointer offset 0 size 4096
    2024-04-04T17:48:10.073674  kern  :alert : Register r7 information: sla=
b task_struct start c3066d00 pointer offset 0 size 1920
    2024-04-04T17:48:10.084817  kern  :alert : Register r8 information: sla=
b task_struct start c3066d00 pointer offset 0 size 1920
    2024-04-04T17:48:10.085128  kern  :alert : Register r9 information: non=
-paged memory
    2024-04-04T17:48:10.095994  kern  :alert : Register r10 information: 4-=
page vmalloc region starting at 0xbf02f000 allocated at load_module+0x730/0=
x16d8
    2024-04-04T17:48:10.101553  kern  :alert : Register r11 information: NU=
LL pointer
    2024-04-04T17:48:10.110564  kern  :alert : Register r12 information: no=
n-paged memory
    2024-04-04T17:48:10.132306  kern  :emerg : Internal error: Oops: 17 [#1=
] ARM =

    ... (6 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/660ee7eb7d9135f=
3c14c42de
        failing since 0 day (last pass: next-20240325, first fail: next-202=
40403)
        16 lines

    2024-04-04T17:48:09.995786  kern  :alert : 8<--- cut here ---
    2024-04-04T17:48:10.007027  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000 when read
    2024-04-04T17:48:10.007424  kern  :alert : [00000000] *pgd=3D00000000
    2024-04-04T17:48:10.012878  kern  :alert : Register r0 information: non=
-paged memory
    2024-04-04T17:48:10.018244  kern  :alert : Register r1 information: NUL=
L pointer
    2024-04-04T17:48:10.023458  kern  :alert : Register r2 information: NUL=
L pointer
    2024-04-04T17:48:10.029092  kern  :alert : Register r3 information: non=
-paged memory
    2024-04-04T17:48:10.044647  kern  :alert : Register r4 information: sla=
b tas<8>[   18.855031] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3D=
fail UNITS=3Dlines MEASUREMENT=3D16>   =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b         | arm    | lab-collabora   | gcc-10   | bcm2835_def=
config            | 1          =


  Details:     https://kernelci.org/test/plan/id/660ee8a7ad863b9bea4c4307

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240404/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240404/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660ee8a7ad863b9bea4c4=
308
        failing since 304 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b         | arm    | lab-collabora   | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/660ee3f67b9e4b2da64c4308

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240404/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240404/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660ee3f67b9e4b2da64c4=
309
        failing since 373 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
beagle-xm               | arm    | lab-baylibre    | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/660ee4c82963a1facf4c4305

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240404/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240404/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660ee4c82963a1facf4c4=
306
        failing since 370 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
beagle-xm               | arm    | lab-baylibre    | gcc-10   | omap2plus_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/660ede887a6ab6f3ca4c42dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240404/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240404/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660ede887a6ab6f3ca4c4=
2dd
        new failure (last pass: next-20240403) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
beaglebone-black        | arm    | lab-cip         | gcc-10   | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/660eeceb54fa9b39714c4327

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240404/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240404/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/660eeceb54fa9b39=
714c432c
        failing since 0 day (last pass: next-20240325, first fail: next-202=
40403)
        1 lines

    2024-04-04T18:09:35.016921  / # =

    2024-04-04T18:09:35.025005  =

    2024-04-04T18:09:35.130224  / # #
    2024-04-04T18:09:35.137031  #
    2024-04-04T18:09:35.282591  / # export SHELL=3D/bin/sh
    2024-04-04T18:09:35.296956  export SHELL=3D/bin/sh
    2024-04-04T18:09:35.398771  / # . /lava-1116141/environment
    2024-04-04T18:09:35.408820  . /lava-1116141/environment
    2024-04-04T18:09:35.510642  / # /lava-1116141/bin/lava-test-runner /lav=
a-1116141/0
    2024-04-04T18:09:35.520718  /lava-1116141/bin/lava-test-runner /lava-11=
16141/0 =

    ... (9 line(s) more)  =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
hp-11A-G6-EE-grunt      | x86_64 | lab-collabora   | gcc-10   | x86_64_defc=
onfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/660ee5812f048e6d444c42ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240404/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240404/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660ee5812f048e6d444c4=
2eb
        failing since 36 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
hp-14-db0003na-grunt    | x86_64 | lab-collabora   | gcc-10   | x86_64_defc=
onfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/660ee596c589f808304c4303

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240404/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240404/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660ee596c589f808304c4=
304
        failing since 36 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
imx6dl-riotboard        | arm    | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/660edfec6520354f6b4c42db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240404/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20240404/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660edfec6520354f6b4c4=
2dc
        failing since 603 days (last pass: next-20220808, first fail: next-=
20220810) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
imx6qp-wandboard-revd1  | arm    | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/660edfeaf969bdfdae4c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240404/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240404/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660edfeaf969bdfdae4c4=
2db
        failing since 590 days (last pass: next-20220810, first fail: next-=
20220822) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
k3-j721e-beagleboneai64 | arm64  | lab-baylibre    | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/660eeb776bcc5a436c4c42f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240404/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-k3-j721=
e-beagleboneai64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240404/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-k3-j721=
e-beagleboneai64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660eeb776bcc5a436c4c4=
2f5
        new failure (last pass: next-20240403) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
mt8195-cherry-tomato-r2 | arm64  | lab-collabora   | gcc-10   | defconfig+a=
rm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/660edc5f410e1ccf834c42f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240404/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8195-=
cherry-tomato-r2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240404/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8195-=
cherry-tomato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660edc5f410e1ccf834c4=
2f8
        new failure (last pass: next-20240403) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
qemu_arm-virt-gicv2     | arm    | lab-broonie     | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/660edf021afd5b3a554c4303

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240404/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240404/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660edf021afd5b3a554c4=
304
        failing since 36 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
qemu_arm-virt-gicv2     | arm    | lab-collabora   | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/660eded31afd5b3a554c42e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240404/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240404/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660eded31afd5b3a554c4=
2e8
        failing since 36 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
qemu_arm-virt-gicv3     | arm    | lab-broonie     | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/660edec77a6ab6f3ca4c42fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240404/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240404/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660edec77a6ab6f3ca4c4=
2ff
        failing since 36 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
qemu_arm-virt-gicv3     | arm    | lab-collabora   | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/660edec37a6ab6f3ca4c42f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240404/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240404/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660edec37a6ab6f3ca4c4=
2f2
        failing since 36 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
qemu_smp8_riscv64       | riscv  | lab-collabora   | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/660eddcf8231ec5a594c42f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240404/risc=
v/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240404/risc=
v/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660eddcf8231ec5a594c4=
2f6
        new failure (last pass: next-20240403) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
r8a7743-iwg20d-q7       | arm    | lab-cip         | gcc-10   | shmobile_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/660ed9acde392ddd9b4c42df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240404/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240404/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660ed9acde392ddd9b4c4=
2e0
        failing since 10 days (last pass: next-20240322, first fail: next-2=
0240325) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
rk3288-rock2-square     | arm    | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/660ede4144e5fed11e4c42e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240404/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240404/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660ede4144e5fed11e4c4=
2e3
        failing since 499 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
rk3288-veyron-jaq       | arm    | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/660edd3dca358265854c42ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240404/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240404/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660edd3dca358265854c4=
2ee
        failing since 499 days (last pass: next-20221121, first fail: next-=
20221122) =

 =20

