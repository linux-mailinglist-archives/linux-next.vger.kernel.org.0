Return-Path: <linux-next+bounces-2619-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9177F9114B1
	for <lists+linux-next@lfdr.de>; Thu, 20 Jun 2024 23:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C54B1F27C25
	for <lists+linux-next@lfdr.de>; Thu, 20 Jun 2024 21:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E846A80055;
	Thu, 20 Jun 2024 21:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="jWhlgoU5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5809474267
	for <linux-next@vger.kernel.org>; Thu, 20 Jun 2024 21:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718919143; cv=none; b=IK+b8cJNyscIQjvMhJsiSc1wnMZ2kTC6oLclj0ReTqW8fCafwJxcV9YY+y+mSgww0m8LlEoxisE3JIQzxH7TvjarA+0OT8yU9GUjrtrITJ5KHh0vCN9ZHp5Bb+QPR+JEvIFI9G06hkMR473zMf7UEUubDZlaecXi5SszLMOcacQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718919143; c=relaxed/simple;
	bh=B8K1VDXGW6/i3xsHC9W6nHqXaMOQQatix6gwbZjbTJ0=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=uM/bVrLzTPwPAHNEZ3GFL5A+wBa7H7yGp40a8c09x5pJ4iccOvZGIRV8Y3APUkI+SS9WrCdY9q2j3DLYL9D/3A90Rs9GupSShwZks+NQATDgXgRH2Q6As8BJ4Tg3jrlY2vujZ2nvivc4MEWdiZF3xGroFcSJrw7YjcekQL5JInk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=jWhlgoU5; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-1f4a0050b9aso11451905ad.2
        for <linux-next@vger.kernel.org>; Thu, 20 Jun 2024 14:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718919139; x=1719523939; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=itO31ak4SoInX2rJoSASmsU31fXysRrnCNmoWRqpUlc=;
        b=jWhlgoU5pPxKk6+A2vsKaOPGO3DgwU1IAm1SniAAeXEDsIdbX6C6MrwbPD+/8/khUc
         UsSuKPjoh6evLnCyPzzYZLx30I14hE9QMh6QqmYNIU7pObkvmC9GrGMkY6oNmv/PTSdD
         iuwPucLjU7ocYQYgRUhGNLZZb7Zvq4eda3LP1VRq5FPkWfhs/fY2ene74WA/3l+0VZJn
         8yoRnjiNvmx8aBD+NRP3Bb2SQGC2yaPOiuJ8hOmtJwxOjxUw9zIfa4kl/Bd1pOHUY8Ai
         /ZsFerzZLaXnbHLSgRnYxoHE5xUWnDF8cSOMae5V7NTw8KKa/bMS8BYoIRlBkvmLgAOe
         3bog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718919139; x=1719523939;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=itO31ak4SoInX2rJoSASmsU31fXysRrnCNmoWRqpUlc=;
        b=o/8tJ42PAqZUzuqjsKimrQpx1uvj/h6HM2Z0331kGbolLAJg63BOXTHXXxmLTmVDE1
         7rnPdJ6FObBQSxJ1niNW8oOTAs/OemxgOd8AH+K+CMTzeBWnM9ikxkGoPipmuvIxzouL
         o7vXciLYguN2ixcGSBcnepzWWpT8d3eURvQpbHmVl54csGcb0idITh56+j1aNEa/GIw6
         /0q512dzYMKu5W1UEdoM9zTdOlctVNqQtUZfwbeqLlPwYFZ2ew18i5c3KLWpWyH+F5P4
         9/lkhBwCwcZtCYIOshi/NKqAO3adnH5UPSHkHWMHw+8aRGbztzD31Dt8pun1E5WoFOCs
         Zxmw==
X-Gm-Message-State: AOJu0Yy6qsNqm/1DnZJ8d5P5pMo/yjy96D2vSl65i0yvRc5/abQ7XG21
	vT9ZT/EPOzwZQGcVgS2FvK8WF5D44N84yZJYBsjFMYcRqDuddGfLqeQU0hnR2RYW8Jr3cGc2IXI
	UTFAXn/JK
X-Google-Smtp-Source: AGHT+IHjRDkaxGsmi9tVPaG1d8WgrSpq1DaC9C0euOH9bos0lbjjdsUGtmqWJj8nzGr+7Lca/9mYUA==
X-Received: by 2002:a17:902:d2ce:b0:1f7:1bf3:5850 with SMTP id d9443c01a7336-1f9aa46b6a8mr73314495ad.56.1718919138294;
        Thu, 20 Jun 2024 14:32:18 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3c609asm752885ad.152.2024.06.20.14.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 14:32:17 -0700 (PDT)
Message-ID: <66749fe1.170a0220.4eb23.04fc@mx.google.com>
Date: Thu, 20 Jun 2024 14:32:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20240620
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 372 runs, 40 regressions (next-20240620)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 372 runs, 40 regressions (next-20240620)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

acer-cbv514-1h-34uz-brya     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

acer-chromebox-cxi5-brask    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

acer-cp514-2h-1130g7-volteer | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

acer-cp514-3wh-r0qs-guybrush | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

asus-C433TA-AJ0005-rammus    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre  | gcc-10   | sama5_de=
fconfig              | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | bcm2835_=
defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm    | lab-cip       | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

jetson-tk1                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =

jetson-tk1                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

rk3288-rock2-square          | arm    | lab-collabora | clang-17 | multi_v7=
_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-roc-pc                | arm64  | lab-broonie   | clang-17 | defconfi=
g                    | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre  | clang-17 | multi_v7=
_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe    | clang-17 | multi_v7=
_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | sunxi_de=
fconfig              | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240620/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240620
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b992b79ca8bc336fa8e2c80990b5af80ed8f36fd =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66746c97bab1ce53147e707c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66746c97bab1ce53147e7=
07d
        new failure (last pass: next-20240619) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66746c70232e55ea6a7e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
cb317-1h-c3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
cb317-1h-c3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66746c70232e55ea6a7e7=
06e
        new failure (last pass: next-20240619) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cbv514-1h-34uz-brya     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66746ca0cb9c96c8157e7083

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
cbv514-1h-34uz-brya.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
cbv514-1h-34uz-brya.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66746ca0cb9c96c8157e7=
084
        new failure (last pass: next-20240619) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66746c9f507c7cc2e17e7076

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
chromebox-cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
chromebox-cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66746c9f507c7cc2e17e7=
077
        new failure (last pass: next-20240619) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi5-brask    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66746cc4972a1633fa7e7074

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
chromebox-cxi5-brask.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
chromebox-cxi5-brask.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66746cc4972a1633fa7e7=
075
        new failure (last pass: next-20240619) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cp514-2h-1130g7-volteer | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66746cc598a867ba477e7085

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
cp514-2h-1130g7-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
cp514-2h-1130g7-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66746cc598a867ba477e7=
086
        new failure (last pass: next-20240619) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cp514-3wh-r0qs-guybrush | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66746cdbaef363a6b27e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
cp514-3wh-r0qs-guybrush.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
cp514-3wh-r0qs-guybrush.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66746cdbaef363a6b27e7=
06e
        new failure (last pass: next-20240619) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C433TA-AJ0005-rammus    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66746c920b9feed6957e708c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-asus-=
C433TA-AJ0005-rammus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-asus-=
C433TA-AJ0005-rammus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66746c920b9feed6957e7=
08d
        new failure (last pass: next-20240619) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66746cc9972a1633fa7e707c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-asus-=
C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-asus-=
C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66746cc9972a1633fa7e7=
07d
        new failure (last pass: next-20240619) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66746c81232e55ea6a7e707b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-asus-=
C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-asus-=
C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66746c81232e55ea6a7e7=
07c
        new failure (last pass: next-20240619) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66746cb40a802762bf7e7071

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-asus-=
CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-asus-=
CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66746cb40a802762bf7e7=
072
        new failure (last pass: next-20240619) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre  | gcc-10   | sama5_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/667467a262dea320fb7e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667467a262dea320fb7e7=
06e
        failing since 505 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | bcm2835_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/66746874fdde0bba707e71b5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66746874fdde0bba707e7=
1b6
        failing since 381 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6674646396af4670637e7079

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6674646396af4670637e7=
07a
        failing since 450 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beagle-xm                    | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/667463fc5c09808db77e708d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667463fc5c09808db77e7=
08e
        failing since 447 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beaglebone-black             | arm    | lab-cip       | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66746bdcf6252cfd677e7106

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/66746bdcf6252cfd=
677e710b
        new failure (last pass: next-20240619)
        1 lines

    2024-06-20T17:49:59.681422  / # =

    2024-06-20T17:49:59.689575  =

    2024-06-20T17:49:59.793801  / # #
    2024-06-20T17:49:59.802001  #
    2024-06-20T17:49:59.904216  / # export SHELL=3D/bin/sh
    2024-06-20T17:49:59.913902  export SHELL=3D/bin/sh
    2024-06-20T17:50:00.015643  / # . /lava-1153356/environment
    2024-06-20T17:50:00.025835  . /lava-1153356/environment
    2024-06-20T17:50:00.127731  / # /lava-1153356/bin/lava-test-runner /lav=
a-1153356/0
    2024-06-20T17:50:00.137582  /lava-1153356/bin/lava-test-runner /lava-11=
53356/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66746eb3411b5810ae7e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-dell-=
latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-dell-=
latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66746eb3411b5810ae7e7=
06e
        new failure (last pass: next-20240619) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66746d97e8e1be88737e7091

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-dell-=
latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-dell-=
latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66746d97e8e1be88737e7=
092
        new failure (last pass: next-20240619) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66746c7c232e55ea6a7e7074

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-11=
A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-11=
A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66746c7c232e55ea6a7e7=
075
        new failure (last pass: next-20240619) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66746c7e0b9feed6957e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-14=
-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-14=
-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66746c7e0b9feed6957e7=
06e
        new failure (last pass: next-20240619) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66746c860b9feed6957e707b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-x3=
60-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-x3=
60-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66746c860b9feed6957e7=
07c
        new failure (last pass: next-20240619) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66746d8c8a11fc07377e7101

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-x3=
60-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-x3=
60-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66746d8c8a11fc07377e7=
102
        new failure (last pass: next-20240619) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66746cae507c7cc2e17e708d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-x3=
60-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-x3=
60-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66746cae507c7cc2e17e7=
08e
        new failure (last pass: next-20240619) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
jetson-tk1                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66746280c3f56ccb487e706e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66746280c3f56ccb487e7=
06f
        failing since 92 days (last pass: next-20240315, first fail: next-2=
0240320) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
jetson-tk1                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66746d137a4d800c557e7076

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66746d137a4d800c557e7=
077
        failing since 800 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66746cbd0a802762bf7e7076

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-lenov=
o-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-lenov=
o-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66746cbd0a802762bf7e7=
077
        new failure (last pass: next-20240619) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm    | lab-collabora | clang-17 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/667465cb3fd9718d307e7074

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667465cb3fd9718d307e7=
075
        failing since 91 days (last pass: next-20240315, first fail: next-2=
0240321) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66746e1570458e0e1a7e70db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66746e1570458e0e1a7e7=
0dc
        failing since 576 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66746d17a0ddf45ad57e7073

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66746d17a0ddf45ad57e7=
074
        failing since 576 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-roc-pc                | arm64  | lab-broonie   | clang-17 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6674713a5fcf1d270d7e7095

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/arm6=
4/defconfig/clang-17/lab-broonie/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/arm6=
4/defconfig/clang-17/lab-broonie/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6674713a5fcf1d270d7e7=
096
        new failure (last pass: next-20240604) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre  | clang-17 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66746663c9fc90b6ec7e7076

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/66746663c9fc90b6=
ec7e707b
        failing since 13 days (last pass: next-20240606, first fail: next-2=
0240607)
        28 lines

    2024-06-20T17:26:11.888676  / # =

    2024-06-20T17:26:11.990117  / # #
    2024-06-20T17:26:12.091695  / # export SHELL=3D/bin/sh
    2024-06-20T17:26:12.193648  / # . /lava-3861116/environment
    2024-06-20T17:26:12.212213  / # /lava-3861116/bin/lava-test-runner /lav=
a-3861116/0
    2024-06-20T17:26:12.331892  + export 'TESTRUN_ID=3D0_dmesg'
    2024-06-20T17:26:12.332361  + cd /lava-3861116/0/tests/0_dmesg
    2024-06-20T17:26:12.332582  + cat uuid
    2024-06-20T17:26:12.332774  + UUID=3D3861116_1.5.2.4.1<8>[  187.227651]=
 <LAVA_SIGNAL_STARTRUN 0_dmesg 3861116_1.5.2.4.1>
    2024-06-20T17:26:12.332939   =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe    | clang-17 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/667465dd7da3f8887f7e7074

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667465dd7da3f8887f7e7=
075
        new failure (last pass: next-20240619) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/667463352e971989d87e706d

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667463352e971989=
d87e7072
        failing since 13 days (last pass: next-20240606, first fail: next-2=
0240607)
        27 lines

    2024-06-20T17:13:04.833274  / # =

    2024-06-20T17:13:04.945116  / # #
    2024-06-20T17:13:05.057019  / # export SHELL=3D/bin/sh
    2024-06-20T17:13:05.169019  / # . /lava-3861071/environment
    2024-06-20T17:13:05.280971  / # /lava-3861071/bin/lava-test-runner /lav=
a-3861071/0
    2024-06-20T17:13:05.412978  + export 'TESTRUN_ID=3D0_dmesg'
    2024-06-20T17:13:05.413406  + cd /lava-3861071/0/tests/0_dmesg
    2024-06-20T17:13:05.413545  + cat uuid
    2024-06-20T17:13:05.413677  + UUID=3D3861071_1.5.2.4.1
    2024-06-20T17:13:05.413799  <8>[  176.262111] <LAVA_SIGNAL_STARTRUN 0_d=
mesg 3861071_1.5.2.4.1> =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/667464ad41ebf595e77e706d

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667464ad41ebf595=
e77e7072
        failing since 13 days (last pass: next-20240606, first fail: next-2=
0240607)
        28 lines

    2024-06-20T17:19:13.578100  / # =

    2024-06-20T17:19:13.680762  / # #
    2024-06-20T17:19:13.782817  / # export SHELL=3D/bin/sh
    2024-06-20T17:19:13.885074  / # . /lava-3861108/environment
    2024-06-20T17:19:13.927134  / # /lava-3861108/bin/lava-test-runner /lav=
a-3861108/0
    2024-06-20T17:19:13.992596  + export 'TESTRUN_ID=3D0_dmesg'
    2024-06-20T17:19:13.993130  + cd /lava-3861108/0/tests/0_dmesg
    2024-06-20T17:19:13.993336  + cat uuid
    2024-06-20T17:19:13.993568  + UUID=3D3861108_1.5.2.4.1
    2024-06-20T17:19:13.993754  <8>[  183.623344] <LAVA_SIGNAL_STARTRUN 0_d=
mesg 3861108_1.5.2.4.1> =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/667468a6021e8445f87e70ab

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667468a6021e8445=
f87e70b0
        failing since 13 days (last pass: next-20240605, first fail: next-2=
0240607)
        29 lines

    2024-06-20T17:36:20.582655  / # =

    2024-06-20T17:36:20.685988  / # #
    2024-06-20T17:36:20.788897  / # export SHELL=3D/bin/sh
    2024-06-20T17:36:20.893012  / # . /lava-3861202/environment
    2024-06-20T17:36:20.897720  / # /lava-3861202/bin/lava-test-runner /lav=
a-3861202/0
    2024-06-20T17:36:21.012934  + export 'TESTRUN_ID=3D0_dmesg'
    2024-06-20T17:36:21.013822  + cd /lava-3861202/0/tests/0_dmesg
    2024-06-20T17:36:21.014197  + cat uuid
    2024-06-20T17:36:21.014559  + UUID=3D3861202_1.5.2.4.1
    2024-06-20T17:36:21.014910  + set +x =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/667463702e971989d87e70f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667463702e971989d87e7=
0f6
        new failure (last pass: next-20240619) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/667464883b465832a57e7075

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667464883b465832=
a57e707a
        failing since 13 days (last pass: next-20240606, first fail: next-2=
0240607)
        27 lines

    2024-06-20T17:18:36.317237  / # =

    2024-06-20T17:18:36.322141  =

    2024-06-20T17:18:36.425643  / # #
    2024-06-20T17:18:36.429270  #
    2024-06-20T17:18:36.531798  / # export SHELL=3D/bin/sh
    2024-06-20T17:18:36.536162  export SHELL=3D/bin/sh
    2024-06-20T17:18:36.637188  / # . /lava-470574/environment
    2024-06-20T17:18:36.640847  . /lava-470574/environment
    2024-06-20T17:18:36.743640  / # /lava-470574/bin/lava-test-runner /lava=
-470574/0
    2024-06-20T17:18:36.747058  /lava-470574/bin/lava-test-runner /lava-470=
574/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/667467e4537a5e113a7e7092

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667467e4537a5e11=
3a7e7097
        failing since 13 days (last pass: next-20240605, first fail: next-2=
0240607)
        29 lines

    2024-06-20T17:32:54.953574  / # =

    2024-06-20T17:32:54.957762  =

    2024-06-20T17:32:55.061194  / # #
    2024-06-20T17:32:55.064818  #
    2024-06-20T17:32:55.167610  / # export SHELL=3D/bin/sh
    2024-06-20T17:32:55.171103  export SHELL=3D/bin/sh
    2024-06-20T17:32:55.273562  / # . /lava-470579/environment
    2024-06-20T17:32:55.277011  . /lava-470579/environment
    2024-06-20T17:32:55.379815  / # /lava-470579/bin/lava-test-runner /lava=
-470579/0
    2024-06-20T17:32:55.383169  /lava-470579/bin/lava-test-runner /lava-470=
579/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6674677d18f7dc1a717e70a5

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6674677d18f7dc1a=
717e70aa
        failing since 13 days (last pass: next-20240606, first fail: next-2=
0240607)
        10 lines

    2024-06-20T17:31:19.429266  / # =

    2024-06-20T17:31:19.532452  / # #
    2024-06-20T17:31:19.634841  / # export SHELL=3D/bin/sh
    2024-06-20T17:31:19.738305  / # . /lava-3861159/environment
    2024-06-20T17:31:19.756147  / # /lava-3861159/bin/lava-test-runner /lav=
a-3861159/0
    2024-06-20T17:31:19.872989  + export 'TESTRUN_ID=3D0_dmesg'
    2024-06-20T17:31:19.873980  + cd /lava-3861159/0/tests/0_dmesg
    2024-06-20T17:31:19.874436  + cat uuid
    2024-06-20T17:31:19.874975  + UUID=3D3861159_1.5.2.4.1
    2024-06-20T17:31:19.875478  <8>[  163.643314] <LAVA_SIGNAL_STARTRUN 0_d=
mesg 3861159_1.5.2.4.1> =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/667466cd74b9c6c8677e7147

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240620/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240620/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667466cd74b9c6c8=
677e714c
        failing since 13 days (last pass: next-20240606, first fail: next-2=
0240607)
        10 lines

    2024-06-20T17:28:31.930615  / # =

    2024-06-20T17:28:31.935635  =

    2024-06-20T17:28:32.039124  / # #
    2024-06-20T17:28:32.044115  #
    2024-06-20T17:28:32.146605  / # export SHELL=3D/bin/sh
    2024-06-20T17:28:32.154955  export SHELL=3D/bin/sh
    2024-06-20T17:28:32.255981  / # . /lava-470577/environment
    2024-06-20T17:28:32.264544  . /lava-470577/environment
    2024-06-20T17:28:32.365627  / # /lava-470577/bin/lava-test-runner /lava=
-470577/0
    2024-06-20T17:28:32.374783  /lava-470577/bin/lava-test-runner /lava-470=
577/0 =

    ... (10 line(s) more)  =

 =20

