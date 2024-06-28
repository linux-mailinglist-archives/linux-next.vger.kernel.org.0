Return-Path: <linux-next+bounces-2699-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 516B991B446
	for <lists+linux-next@lfdr.de>; Fri, 28 Jun 2024 02:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F6151C20FBD
	for <lists+linux-next@lfdr.de>; Fri, 28 Jun 2024 00:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 040F5A38;
	Fri, 28 Jun 2024 00:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="HqYlUrm1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD67E7EF
	for <linux-next@vger.kernel.org>; Fri, 28 Jun 2024 00:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719536069; cv=none; b=UebR2zp/0zruWAvcnVbvUQ/5sZHtN4jI+qUbal/znAPfIdJgx48HZ/+XPwbBjb2irzo7WzYRb9Wx0NWrAsVPeVLihxRh5noYtEi8U8EcD4r+oXRw/cEQTc9KAFbhTJ5Tct5iKBo85rW2Mg2CGw+aKiRclar+QgpKMUcYKQ1EwzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719536069; c=relaxed/simple;
	bh=fbSueX8UMdaL0A6ZFhtwaXq2l1McdjNpM+qRaIpSx+U=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Y28e9aG6aZbk4jTpmYZ5X8LPTKqLCT8XYLsofecCnxBRhNZBGhjCgvtnu01+PDcZIrImxdh5moZqs5nrEpvwuBoMVZUs1CtiCQ6Xied/X7lGVspZ0runOprQ88ewIdGrLgEGexga914TgX9M8qHAhP2iTfVSDwJA38WsvduAAMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=HqYlUrm1; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-706738c209bso69897b3a.3
        for <linux-next@vger.kernel.org>; Thu, 27 Jun 2024 17:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719536067; x=1720140867; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PqnQ5uQxXOeCiJoli5pdOti4iwIKudaY/53c27eVcfE=;
        b=HqYlUrm160JmCS+AOGo+dDSJoNaHlmlOi9Qty/6ppx7qRCyHjMnTk200IjNHVCdh7x
         sQwZG0ZG/Pe8ls4L92n3InjjonWtXktZfitYx0+NmzPMTCq7Ap3B2BT7d52iwpjmQhzq
         wEXQ8xg1JsBWfNQid2Cy4zIVM7ZomCOAOxFUf0EAwDqU4JWm2ap7W/XyYEgDWza/mzZ7
         hcH9ZuAqPGvCZQPH0FGvLO+d90ridwCEt7TBmUYK6+IvcnArHqkOtpzqmUDd2vhcvvuo
         VRkjXgi8wnlk0uEITIuH0eaGOd1SVNAPaDL8s6HaiuHlniGaNQtKt4omRlay0Jsc5h6T
         pUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719536067; x=1720140867;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PqnQ5uQxXOeCiJoli5pdOti4iwIKudaY/53c27eVcfE=;
        b=L8IeryKQua3FV4r4XSQPASx3aYzeyaHLgUNlP0oJuD3QuAKHGw9K6d8F7WuBiCcc5k
         MSVeJu3gQkm1MuS+4qV0Ma0KhitRk6GjEyVIdwf+zp4zetKXjZm4lKI6un2xQAaRMoyC
         MtBWFb34WzRfgxDg+nANg15kRBy+BGz0quGHgzc9j0ZeRXZ6X5EvJxUL/JKQ4fT7xLQ0
         QyXjrqyWf+Q/XD/3f5S9F1t9GNcLzPFFhuVALwmk4PuZ6uwOVronZCpguv/6SektO0d5
         SKNHWQMcnBiybBhj3uFU7EjU/GDGsqmbvxDFPTec6sZKfyVdxS+TaeS4j6rdk20zqvvn
         kD6Q==
X-Gm-Message-State: AOJu0YxBqfyRAudL3RfrRFRTXJ45i03RYrv1tF2ot8DUFT6oeo0q5Ulv
	oYaesgG+kNIOKkR2W9JzWN7FAswOTxctFB6kY/cqcYmDSnUgrRQ2vrBexBfj1Wu+ff8jYK5b8jm
	s
X-Google-Smtp-Source: AGHT+IHCtNBPmMQr+wuNJAxyMfPm6kl1ltt6vP1AGTO6+hYet01i1VpTooFTICqvCG2Y7VqWBpz6sA==
X-Received: by 2002:a05:6a21:9989:b0:1be:cbde:be5e with SMTP id adf61e73a8af0-1becbdec522mr5599870637.24.1719536066504;
        Thu, 27 Jun 2024 17:54:26 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91ce1683csm420939a91.8.2024.06.27.17.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 17:54:25 -0700 (PDT)
Message-ID: <667e09c1.170a0220.e08eb.22b6@mx.google.com>
Date: Thu, 27 Jun 2024 17:54:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20240627
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 312 runs, 12 regressions (next-20240627)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 312 runs, 12 regressions (next-20240627)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cp514-3wh-r0qs-guybrush | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre  | gcc-10   | sama5_de=
fconfig              | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | bcm2835_=
defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm    | lab-cip       | gcc-10   | multi_v7=
_defconfig           | 1          =

beaglebone-black             | arm    | lab-cip       | gcc-10   | omap2plu=
s_defconfig          | 1          =

jetson-tk1                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =

jetson-tk1                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip       | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

rk3288-rock2-square          | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240627/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240627
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      642a16ca7994a50d7de85715996a8ce171a5bdfb =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cp514-3wh-r0qs-guybrush | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/667dce37734bfeeacc7e7084

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240627/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cp514-3wh-=
r0qs-guybrush.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240627/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cp514-3wh-=
r0qs-guybrush.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667dce37734bfeea=
cc7e7089
        failing since 2 days (last pass: next-20240621, first fail: next-20=
240624)
        4 lines

    2024-06-27T20:40:05.509113  / #

    2024-06-27T20:40:05.513452   =


    2024-06-27T20:40:05.614663  / # #

    2024-06-27T20:40:05.618887  #

    2024-06-27T20:40:05.719491  / # export SHELL=3D/bin/sh

    2024-06-27T20:40:05.724226  export SHELL=3D/bin/sh

    2024-06-27T20:40:05.824739  / # . /lava-14633217/environment

    2024-06-27T20:40:05.829233  . /lava-14633217/environment

    2024-06-27T20:40:05.929752  / # /lava-14633217/bin/lava-test-runner /la=
va-14633217/0

    2024-06-27T20:40:05.934783  /lava-14633217/bin/lava-test-runner /lava-1=
4633217/0
 =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre  | gcc-10   | sama5_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/667dd18ca62ab24aa57e71b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240627/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240627/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667dd18ca62ab24aa57e7=
1b2
        failing since 512 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | bcm2835_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/667dca2bdc6f0d60bf7e7083

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240627/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240627/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667dca2bdc6f0d60bf7e7=
084
        failing since 388 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/667dd7255b235d9ee07e7090

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240627/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240627/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667dd7255b235d9ee07e7=
091
        failing since 457 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beagle-xm                    | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/667dd75f20b8f51ac87e708f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240627/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240627/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667dd75f20b8f51ac87e7=
090
        failing since 454 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beaglebone-black             | arm    | lab-cip       | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/667dd6e5b3c3ea124f7e7097

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240627/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240627/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667dd6e5b3c3ea12=
4f7e709c
        failing since 2 days (last pass: next-20240621, first fail: next-20=
240624)
        1 lines

    2024-06-27T21:17:03.246354  / # =

    2024-06-27T21:17:03.255075  =

    2024-06-27T21:17:03.360192  / # #
    2024-06-27T21:17:03.366949  #
    2024-06-27T21:17:03.509498  / # export SHELL=3D/bin/sh
    2024-06-27T21:17:03.526880  export SHELL=3D/bin/sh
    2024-06-27T21:17:03.628678  / # . /lava-1157910/environment
    2024-06-27T21:17:03.638812  . /lava-1157910/environment
    2024-06-27T21:17:03.740763  / # /lava-1157910/bin/lava-test-runner /lav=
a-1157910/0
    2024-06-27T21:17:03.750529  /lava-1157910/bin/lava-test-runner /lava-11=
57910/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beaglebone-black             | arm    | lab-cip       | gcc-10   | omap2plu=
s_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/667dd9b572c6272e127e7070

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240627/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240627/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/667dd9b572c6272e=
127e7075
        new failure (last pass: next-20240625)
        1 lines

    2024-06-27T21:29:12.072575  / # =

    2024-06-27T21:29:12.081056  =

    2024-06-27T21:29:12.185335  / # #
    2024-06-27T21:29:12.193223  #
    2024-06-27T21:29:12.295525  / # export SHELL=3D/bin/sh
    2024-06-27T21:29:12.305139  export SHELL=3D/bin/sh
    2024-06-27T21:29:12.407333  / # . /lava-1157939/environment
    2024-06-27T21:29:12.417143  . /lava-1157939/environment
    2024-06-27T21:29:12.518838  / # /lava-1157939/bin/lava-test-runner /lav=
a-1157939/0
    2024-06-27T21:29:12.529000  /lava-1157939/bin/lava-test-runner /lava-11=
57939/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
jetson-tk1                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/667dcb941f01bd1e477e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240627/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240627/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667dcb941f01bd1e477e7=
06e
        failing since 99 days (last pass: next-20240315, first fail: next-2=
0240320) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
jetson-tk1                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/667dd3372a652d78817e70b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240627/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240627/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667dd3372a652d78817e7=
0b8
        failing since 808 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/667dd7cd615332e97a7e7076

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240627/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240627/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667dd7cd615332e97a7e7=
077
        new failure (last pass: next-20240625) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/667dd42d2c4b18e57b7e7077

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240627/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240627/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667dd42d2c4b18e57b7e7=
078
        failing since 583 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/667dd32835c305a8b37e7084

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240627/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240627/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/667dd32835c305a8b37e7=
085
        failing since 583 days (last pass: next-20221121, first fail: next-=
20221122) =

 =20

