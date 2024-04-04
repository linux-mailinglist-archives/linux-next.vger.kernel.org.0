Return-Path: <linux-next+bounces-1798-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 141DD897D14
	for <lists+linux-next@lfdr.de>; Thu,  4 Apr 2024 02:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22D95286E7C
	for <lists+linux-next@lfdr.de>; Thu,  4 Apr 2024 00:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF17E46BA;
	Thu,  4 Apr 2024 00:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="FW/qlHPQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355554400
	for <linux-next@vger.kernel.org>; Thu,  4 Apr 2024 00:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712190662; cv=none; b=W6cdzp9OjqQx88eSeqUMPPWOf/nSwi7dACVH17DvOtsRV6yA928AFCT3yDJv8hZyIFQucKbMYYdIWY7Ok0zlRISvYwFTGZsA9gDhAIyV+F1Zak1NNEtEqcT1EKauv0Ui+zk0cD73p2rElOX1/6OwIyoegeMEQgduTrDm270YH/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712190662; c=relaxed/simple;
	bh=KC4slXefqid4wDAiyyJ0H8AcaZHZ3xhKAo/dBOfFG9I=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=nfuEU/3VYAEIHoCWqm2ow7Ls6WohPXy7M3RQzWay8UVJwDP4WPDxTWcmn9S7ArTWuXlghnwEtkvtAyUBf6qkrOQ50lvWvH1vPaIwn+vjIYfOv1t0jJG8D6Wrxy7yyNNzCIpAgV4UvMb9eo3IjC3AcPj7mT1WEoAFOtzXegc51/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=FW/qlHPQ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e0d8403257so3538645ad.1
        for <linux-next@vger.kernel.org>; Wed, 03 Apr 2024 17:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712190659; x=1712795459; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dAyPAJOUP9dP95/V/QQs4jL2iWfyiJGhwVkD9T70DVc=;
        b=FW/qlHPQmmTlE8GQ6a/AzdWueaWhNrSlAG9uQS40ndBmVLtmfSQCSJUXfIKYiT7kDI
         E4ybwhc8pzZy1a422aHkrcMu80hM3EwueTh8E6vgQKB/+0BbwLpAStbzaBJplPOdsXKF
         gW9KWY286XaJc5dBglTpTXqftcafJdQENAub5dODgMGxmC7els4X+IqqsII+tmNCLy/N
         yXJgP+HvqbnfPOGAdH24BfRAQWKRz0bnIFa352sp0UpJyXE2207yzYKqdB3kyIMlq9tQ
         IsptN4eWZ15Vhs/qoMID1gJ8fYTTVrBxR+bS2x4GYbHzCS+h9+DJwlO3qbaCNqWKDzlZ
         f0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712190659; x=1712795459;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dAyPAJOUP9dP95/V/QQs4jL2iWfyiJGhwVkD9T70DVc=;
        b=oRE4laB+XfuJWrqndbaa36F5Jd53z5sczEwpQgOPqXBKqDwAqGOgKmiYkyK9e1WW9X
         GaNDYqr1kDfdo0NNi/uoZloT1L8UWg+trm6mpXvyobA0EP9dtbvLl4SI7M5Zg5umKUwR
         bitGTfyt7S+8Y4bmVrYKYLuikbsd1tdo5+AjpILi5TOm2DSIk4J4vbeyac4kIp2Xly4R
         yDWQUlbAHglqU/PBI8dc3zn0xioQFOKsM/V0Bdv7wYJGp647WqEjBvEQfkyptpr0lV8y
         PrAxdVDaehmuBOtd5jZWTfJNLz/sWKX3rw4lFYYKdFgeTDsOK0lvdFlq3wHP7qyCe8ws
         M0OQ==
X-Gm-Message-State: AOJu0Yx8UIpr4jscIZR3WEuGAXxMXULu78VKHDx3eLPQFf+EwCIrCyMb
	dOo+ijlvTRVyXeEc3CVocFF28J5QL+a8hf1kzBcgQOgupgHleFqD1JQkrbFMNgWOAdm/cViE3QB
	m1BM=
X-Google-Smtp-Source: AGHT+IEb5ofZhY9Cm8r0DTuDR8XrxnSaTw0cQelS1Yogh/t9fsxN/cBh/ma/SoKvetQmzetvsFtkcA==
X-Received: by 2002:a17:902:f813:b0:1e2:992a:ae3 with SMTP id ix19-20020a170902f81300b001e2992a0ae3mr806020plb.45.1712190658434;
        Wed, 03 Apr 2024 17:30:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id k5-20020a170902ba8500b001deecb4f897sm13973021pls.100.2024.04.03.17.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 17:30:57 -0700 (PDT)
Message-ID: <660df4c1.170a0220.82fbe.8353@mx.google.com>
Date: Wed, 03 Apr 2024 17:30:57 -0700 (PDT)
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
X-Kernelci-Kernel: next-20240403
X-Kernelci-Report-Type: test
Subject: next/master baseline: 364 runs, 28 regressions (next-20240403)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 364 runs, 28 regressions (next-20240403)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...rd+kselftest | 1          =

acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | sama5_=
defconfig              | 1          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 2          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm    | lab-cip         | gcc-10   | multi_=
v7_defconfig           | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...rd+kselftest | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...rd+kselftest | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+kselftest          | 1          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

mt8195-cherry-tomato-r2      | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240403/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240403
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      727900b675b749c40ba1f6669c7ae5eb7eb8e837 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/660db6b202758b5b5e4c42e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240403/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240403/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660db6b202758b5b5e4c4=
2e3
        failing since 29 days (last pass: next-20240226, first fail: next-2=
0240305) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/660dbeed148e1a8a284c4372

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240403/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240403/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660dbeed148e1a8a284c4=
373
        failing since 35 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | sama5_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/660db93d58045164ce4c42f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240403/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240403/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660db93d58045164ce4c4=
2f8
        failing since 427 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 2          =


  Details:     https://kernelci.org/test/plan/id/660db6f5ef2cd259964c42da

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240403/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240403/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/660db6f5ef2cd25=
9964c42dd
        new failure (last pass: next-20240325)
        24 lines

    2024-04-03T20:06:59.633151  k_struct start c4ada580 pointer offset 0 si=
ze 1920
    2024-04-03T20:06:59.638353  kern  :alert : Register r5 information: NUL=
L pointer
    2024-04-03T20:06:59.643895  kern  :alert : Register r6 information: sla=
b kmalloc-4k start c4a80000 pointer offset 0 size 4096
    2024-04-03T20:06:59.655147  kern  :alert : Register r7 information: sla=
b task_struct start c4adb480 pointer offset 0 size 1920
    2024-04-03T20:06:59.668254  kern  :alert : Register r8 information: sla=
b task_struct start c4adb480 pointer offset 0 size 1920
    2024-04-03T20:06:59.668497  kern  :alert : Register r9 information: non=
-paged memory
    2024-04-03T20:06:59.677293  kern  :alert : Register r10 information: 4-=
page vmalloc region starting at 0xbf02f000 allocated at load_module+0x730/0=
x16d8
    2024-04-03T20:06:59.682893  kern  :alert : Register r11 information: NU=
LL pointer
    2024-04-03T20:06:59.691885  kern  :alert : Register r12 information: no=
n-paged memory
    2024-04-03T20:06:59.714483  kern  :emerg : Internal error: Oops: 17 [#1=
] ARM =

    ... (6 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/660db6f5ef2cd25=
9964c42de
        new failure (last pass: next-20240325)
        16 lines

    2024-04-03T20:06:59.577468  kern  :alert : 8<--- cut here ---
    2024-04-03T20:06:59.588509  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000 when read
    2024-04-03T20:06:59.588819  kern  :alert : [00000000] *pgd=3D00000000
    2024-04-03T20:06:59.594200  kern  :alert : Register r0 information: non=
-paged memory
    2024-04-03T20:06:59.599571  kern  :alert : Register r1 information: NUL=
L pointer
    2024-04-03T20:06:59.604914  kern  :alert : Register r2 information: NUL=
L pointer
    2024-04-03T20:06:59.610853  kern  :alert : Register r3 information: non=
-paged memory
    2024-04-03T20:06:59.626339  kern  :alert : Register r4 information: sla=
b tas<8>[   18.814847] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3D=
fail UNITS=3Dlines MEASUREMENT=3D16>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/660db7c6ee3142ad024c42f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240403/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240403/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660db7c6ee3142ad024c4=
2fa
        failing since 303 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/660dbd53a585672cf24c431f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240403/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240403/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660dbd53a585672cf24c4=
320
        failing since 372 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/660dbd1be40eb0e1244c430a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240403/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240403/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660dbd1be40eb0e1244c4=
30b
        failing since 369 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-cip         | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/660dc03179d00e908a4c42f6

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240403/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240403/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/660dc03179d00e90=
8a4c42fb
        new failure (last pass: next-20240325)
        1 lines

    2024-04-03T20:46:23.457032  / # =

    2024-04-03T20:46:23.464731  =

    2024-04-03T20:46:23.570626  / # #
    2024-04-03T20:46:23.576474  #
    2024-04-03T20:46:23.694495  / # export SHELL=3D/bin/sh
    2024-04-03T20:46:23.704626  export SHELL=3D/bin/sh
    2024-04-03T20:46:23.806540  / # . /lava-1115689/environment
    2024-04-03T20:46:23.816460  . /lava-1115689/environment
    2024-04-03T20:46:23.918384  / # /lava-1115689/bin/lava-test-runner /lav=
a-1115689/0
    2024-04-03T20:46:23.928391  /lava-1115689/bin/lava-test-runner /lava-11=
15689/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/660db9f4580280f0124c42e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240403/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-11=
A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240403/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-11=
A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660db9f4580280f0124c4=
2e7
        failing since 29 days (last pass: next-20240226, first fail: next-2=
0240305) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/660dbfba8f65663c564c4311

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240403/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240403/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660dbfba8f65663c564c4=
312
        failing since 35 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/660db6c402758b5b5e4c42f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240403/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-14=
-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240403/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-14=
-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660db6c402758b5b5e4c4=
2f3
        failing since 29 days (last pass: next-20240226, first fail: next-2=
0240305) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/660dbf0af8b4cc80204c4303

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240403/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240403/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660dbf0af8b4cc80204c4=
304
        failing since 35 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/660dbd6f11ec93e92b4c438b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240403/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-pengutronix/baseline-imx8=
mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240403/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-pengutronix/baseline-imx8=
mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660dbd6f11ec93e92b4c4=
38c
        failing since 19 days (last pass: next-20240308, first fail: next-2=
0240315) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/660dbeea0cb1a4a7c84c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240403/arm6=
4/defconfig+kselftest/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-=
evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240403/arm6=
4/defconfig+kselftest/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660dbeea0cb1a4a7c84c4=
2db
        failing since 42 days (last pass: next-20240212, first fail: next-2=
0240221) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/660dbdae0e025342ee4c42ee

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240403/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240403/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/660dbdae0e02534=
2ee4c42f2
        new failure (last pass: next-20240315)
        13 lines

    2024-04-03T20:35:45.093174  kern  :alert : Unable to handle kernel pagi=
ng request at virtual<8>[   20.437163] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D13>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/660dbdae0e02534=
2ee4c42f3
        new failure (last pass: next-20240315)
        2 lines

    2024-04-03T20:35:45.133396   address ffff801ffdbd0000
    2024-04-03T20:35:45.133587  kern  :alert : Mem abort info:
    2024-04-03T20:35:45.133734  kern  :alert :   ESR =3D 0x0000000096000006
    2024-04-03T20:35:45.133875  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2024-04-03T20:35:45.134007  kern  :alert <8>[   20.460981] <LAVA_SIGNAL=
_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2024-04-03T20:35:45.134143  :   SET =3D 0, FnV<8>[   20.471661] <LAVA_S=
IGNAL_ENDRUN 0_dmesg 448636_1.5.2.4.1>
    2024-04-03T20:35:45.134260   =3D 0
    2024-04-03T20:35:45.134333  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/660dc0cf2df455f4cf4c42dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240403/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240403/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660dc0cf2df455f4cf4c4=
2de
        failing since 110 days (last pass: next-20231205, first fail: next-=
20231215) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/660dbff3734b9b0b2c4c42f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240403/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240403/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660dbff3734b9b0b2c4c4=
2f6
        failing since 110 days (last pass: next-20231205, first fail: next-=
20231215) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/660dc15328562719404c42df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240403/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240403/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660dc15328562719404c4=
2e0
        failing since 421 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/660dbfeb734b9b0b2c4c42eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240403/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240403/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660dbfeb734b9b0b2c4c4=
2ec
        failing since 421 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/660dbfb3ea40e7ed084c42f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240403/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-=
cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240403/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-=
cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660dbfb3ea40e7ed084c4=
2f1
        failing since 421 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8195-cherry-tomato-r2      | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/660dc2655c33a67e2f4c4339

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240403/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240403/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660dc2655c33a67e2f4c4=
33a
        new failure (last pass: next-20240325) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/660dbb37ab148e04324c42dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240403/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240403/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660dbb37ab148e04324c4=
2dd
        failing since 9 days (last pass: next-20240322, first fail: next-20=
240325) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/660db9a748d58878fc4c42dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240403/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240403/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660db9a748d58878fc4c4=
2de
        failing since 498 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/660db88faa80e8f6f64c42e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240403/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240403/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660db88faa80e8f6f64c4=
2e2
        failing since 498 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/660dbfadea40e7ed084c42ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240403/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240403/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660dbfadea40e7ed084c4=
2eb
        failing since 418 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/660dbfd48f65663c564c4345

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240403/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240403/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/660dbfd48f65663c564c4=
346
        failing since 418 days (last pass: next-20230127, first fail: next-=
20230210) =

 =20

