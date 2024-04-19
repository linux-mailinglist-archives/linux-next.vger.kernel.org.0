Return-Path: <linux-next+bounces-1984-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B18DC8AB573
	for <lists+linux-next@lfdr.de>; Fri, 19 Apr 2024 21:12:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E66D9B233B8
	for <lists+linux-next@lfdr.de>; Fri, 19 Apr 2024 19:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCB213C3FE;
	Fri, 19 Apr 2024 19:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="YnGQuyd0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E13413B284
	for <linux-next@vger.kernel.org>; Fri, 19 Apr 2024 19:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713553956; cv=none; b=hlFzw03x3EmKN+RlCdLs/8wif3bvgfNFQKhochpS8oarDoN6uCSYaaXO6F2lRCknMjGdCv+ZikbYjF0Nv2PtZXhA76nB7fdLg4biAg50ycZZTd3PwIbdlm7LHyouUCfSz/pQaU+V9txUrgpCUjSLacVllg3/PMO5m2rR4axaq/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713553956; c=relaxed/simple;
	bh=qQ6IvLN3ETvb3LgG1bEZM0gGXK4+3vBbXP1nURQW9kw=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=DwkZy/0nxa/9rdrC9C5mP1IpIJlMDXTqiiMqAA+jnRhIemrHOzklqRNof6rgOy4npWpGXlkBHwBp7+jAgGm0oWDNZwJnpuHiURjufajVvvgLXaGkSKOI9Vn5L9bDcIsu8S6BoMQJHEvLVS2BfFn+0aXlcvNQ8OnAmirw9ld+7eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=YnGQuyd0; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5dbd519bde6so1663512a12.1
        for <linux-next@vger.kernel.org>; Fri, 19 Apr 2024 12:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1713553953; x=1714158753; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vTNMAkInHaaGrJIFB7zcytFH7mAFj41Sg7CnlqCHDbA=;
        b=YnGQuyd051L+VaiBQVKfmbhmPPZTvIFejBac/fLdV1gltxmLpV7HIqPSOvI0OZO7R4
         QImVcDTMSuWuPECU9xAfyrCXtn/7v9FX5CWpYTr01ILgK5OcLo16IWE4VGpJfd1k/nzP
         HGworRK8ZznYRaCy7YLDCfwBywCFrOe2xnHAzagzYvgxUsDWOI+suUg7sk2dVGIeQSew
         oPo5Y0EyNQmJdebbT9NrAq7IRMazpZK4q5HSKy+W/s1CD75YVHNDSng+w3Q1MvQBJIMZ
         UkHRZmOqqPb8Mtx6JRSB18vX8HNggFcJmU+rpzK/ZRIzC79QC5Racw8HRlaMMhxoXRtG
         j5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713553953; x=1714158753;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vTNMAkInHaaGrJIFB7zcytFH7mAFj41Sg7CnlqCHDbA=;
        b=vpH6/B2Ujdipasro1AqCA9sxwce+zaZRpjTk3/e2ZQsxdeculIAwxMTi0ewv9QnL25
         9kr1GtBAFw1fe5xoAPUWPeaZEbpQytHzMDTFM3iB2qdA2YiAt8PykChbw8CtNGmsGOGh
         U8t2Lgy99/ko6nbjR/t6ajREjX8HbschUrOJJ0nOwlbTB0wgCAIP33ZSYRgK5CT/CxQf
         hvgKaM68/KLxm7T0IW4EOYPbAwo/BlzX+00dvLV/6RmSE5QLCZBHraJM0dVWSVoDpwsO
         l/56iSYccjwUX/LXObFfn1A48SPsaGozThk4rIBZhbeAB9dy/zm+MBVBZsVbKye9tGe8
         JrBw==
X-Gm-Message-State: AOJu0YxfRSkBsQHprmyH/HjFoPg5lrRQwUeTe7v0dRWvfjTcTaR18cVa
	JbKXswvO9kugfoEbGDflEUrYoCBYx6kQ0aOxCMcSw3shNleOngMizd1uXIakoW7qKvul1PA4Aqg
	l
X-Google-Smtp-Source: AGHT+IHQeCbzq2rWugbs+AWi4QvSppzwbBs8g9R3o8QH0mMRTkbAyA7tc+U2K/64PX23Nj/7eePJXA==
X-Received: by 2002:a17:90b:3108:b0:2a2:ab2c:da40 with SMTP id gc8-20020a17090b310800b002a2ab2cda40mr3218641pjb.33.1713553953405;
        Fri, 19 Apr 2024 12:12:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id o5-20020a17090a5b0500b002aaa404eb8asm3542818pji.14.2024.04.19.12.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 12:12:32 -0700 (PDT)
Message-ID: <6622c220.170a0220.d023c.dfde@mx.google.com>
Date: Fri, 19 Apr 2024 12:12:32 -0700 (PDT)
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
X-Kernelci-Kernel: next-20240419
X-Kernelci-Report-Type: test
Subject: next/master baseline: 137 runs, 8 regressions (next-20240419)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 137 runs, 8 regressions (next-20240419)

Regressions Summary
-------------------

platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b        | arm    | lab-collabora | gcc-10   | bcm2835_defcon=
fig            | 1          =

bcm2836-rpi-2-b        | arm    | lab-collabora | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =

qemu_x86_64            | x86_64 | lab-broonie   | gcc-10   | x86_64_defconf=
ig+debug       | 1          =

qemu_x86_64            | x86_64 | lab-collabora | gcc-10   | x86_64_defconf=
ig+debug       | 1          =

qemu_x86_64-uefi       | x86_64 | lab-broonie   | gcc-10   | x86_64_defconf=
ig+debug       | 1          =

qemu_x86_64-uefi       | x86_64 | lab-collabora | gcc-10   | x86_64_defconf=
ig+debug       | 1          =

qemu_x86_64-uefi-mixed | x86_64 | lab-broonie   | gcc-10   | x86_64_defconf=
ig+debug       | 1          =

qemu_x86_64-uefi-mixed | x86_64 | lab-collabora | gcc-10   | x86_64_defconf=
ig+debug       | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240419/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240419
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a35e92ef04c07bd473404b9b73d489aea19a60a8 =



Test Regressions
---------------- =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b        | arm    | lab-collabora | gcc-10   | bcm2835_defcon=
fig            | 1          =


  Details:     https://kernelci.org/test/plan/id/66227ed4ff7adae71f4c42e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240419/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240419/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66227ed4ff7adae71f4c4=
2e2
        failing since 319 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b        | arm    | lab-collabora | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6622825971e6f622cc4c42e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240419/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240419/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6622825971e6f622cc4c4=
2e4
        failing since 387 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
qemu_x86_64            | x86_64 | lab-broonie   | gcc-10   | x86_64_defconf=
ig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/66228db87f4c9353c44c42f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240419/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240419/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66228db87f4c9353c44c4=
2f2
        new failure (last pass: next-20240418) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
qemu_x86_64            | x86_64 | lab-collabora | gcc-10   | x86_64_defconf=
ig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/66228d56008fb6c4764c42ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240419/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240419/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66228d56008fb6c4764c4=
2ed
        new failure (last pass: next-20240418) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
qemu_x86_64-uefi       | x86_64 | lab-broonie   | gcc-10   | x86_64_defconf=
ig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/66228e6ed4ea59b29a4c42fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240419/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240419/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66228e6ed4ea59b29a4c4=
2ff
        new failure (last pass: next-20240418) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
qemu_x86_64-uefi       | x86_64 | lab-collabora | gcc-10   | x86_64_defconf=
ig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/66228d57d95d65b3404c42dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240419/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240419/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66228d57d95d65b3404c4=
2de
        new failure (last pass: next-20240418) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
qemu_x86_64-uefi-mixed | x86_64 | lab-broonie   | gcc-10   | x86_64_defconf=
ig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/66228d69008fb6c4764c42f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240419/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240419/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66228d69008fb6c4764c4=
2f4
        new failure (last pass: next-20240418) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
qemu_x86_64-uefi-mixed | x86_64 | lab-collabora | gcc-10   | x86_64_defconf=
ig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/66228d4d008fb6c4764c42e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240419/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mi=
xed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240419/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mi=
xed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66228d4d008fb6c4764c4=
2e9
        new failure (last pass: next-20240418) =

 =20

