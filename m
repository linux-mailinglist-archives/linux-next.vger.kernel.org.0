Return-Path: <linux-next+bounces-1684-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D288857CE
	for <lists+linux-next@lfdr.de>; Thu, 21 Mar 2024 12:09:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78AAFB20E26
	for <lists+linux-next@lfdr.de>; Thu, 21 Mar 2024 11:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4050A5731E;
	Thu, 21 Mar 2024 11:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="yq+t3bf1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096015732B
	for <linux-next@vger.kernel.org>; Thu, 21 Mar 2024 11:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711019379; cv=none; b=Uh8jNctx3oHsPt74xsWxMlNbWTPPYjw/QFguuscG9hwPMvJachQ647Tc+SaavCp77mP5P1dWE+o+eVN8YgG2N6OPEUYXGtH/dOxWZX7DOHrew/lRmecHJbVgKVux/6VxvwhwMT+wEE559Qet8VMFIwwKgxcH94j8ljaPDIcF73I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711019379; c=relaxed/simple;
	bh=/ltQDJ+4MUv30Wfpmg/y+3KCU3pPdtFNeAAuE3jpHpU=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=a5Hme/82PWysvvxERQ8NrDro6QlRbA/LZeFr9KyuQSdKK/dAokccjdRTjMoNVyr3XKv3PPvx7F/FRpPqsl9LPkRmvsZGnFwj1y+xb0X1RF9HsD7KtVQd2PhivR5FXuwfRTWI7l1g/CBv6kyrNKYmomAC+qgyl/X1iZ3r1mHqAgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=yq+t3bf1; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-789f1b59a28so53848485a.3
        for <linux-next@vger.kernel.org>; Thu, 21 Mar 2024 04:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1711019374; x=1711624174; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Co3066LYEqAt2ealgO/lva9InlM9YJiHcv0aMFw9yJ0=;
        b=yq+t3bf1uD8oeuLByB5jzC4Fskj+j29wL7iHMj1dSZ0qsIguI+HZp9vH+sy2a0FV25
         V50cw9Cu4L8rHLG1QOROKovLGXuUEavNgaMEENdhsbHOufUE0eCO3WcAP8xoaPG0MiT6
         B/ae4wJvEqs7Al8F7Ufjc+buxm9KSknfwVPew+97X0VbNlZsD7yh0IMNAfz562ylDlaA
         fPVRTb+2SE4UEqGn4kPCwdl/0Fdn3gkl1hEmjkwRaUzz5uuz6F0LEj2mIuf+LqDiXbCJ
         jvOS6Qr0wDe8QYdirO6tT8LrKYG3u3WlGl6oVxDqu1OyrTq0/8n/x3do1vLSEIdu+qms
         8hIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711019374; x=1711624174;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Co3066LYEqAt2ealgO/lva9InlM9YJiHcv0aMFw9yJ0=;
        b=FU92sRh1jN/C+UwYJSH8sfFz/ctEgnlwuAUFuMac3cWAxMjZbuTrOV/Ny7neKy5yUp
         RBduRACeiosJ886FMiLeGxcHpEFCaQQfaC0TwApOd9hF77F6DfDb1mFKDWXkohFS5ZPg
         9HkkYvyrVl7kMgnceXQpBLTDx3+dLdWW1XdKjG8MYyFjiUv/II4GdQM8OtdYA1NjSDzl
         TrAZfy8HlI8COLSPXiH7v+Zh34O7YELSGDwOaQXCEF+Y4YAkzpDDKk31OGZRfhe4jXg2
         Yz+MKEOh4m2K08cz/HRl6YB7VDWzB0Bhx9G+tL0rox+s+dBrzqgRZ0oKfIZsIW98+u3U
         9apQ==
X-Gm-Message-State: AOJu0YyN+PIrppmM1Pbz1adKDDYr+w1F58HvEAUv0rbsYBDKMQWBG2Wa
	mH2zPGgsNaTqzJ32psCKWulYIdV3UeKFL7Pmb6lGUVYc3fZTXTUWdmfZY0GFhCODssJSy6BDTwz
	05mg=
X-Google-Smtp-Source: AGHT+IGdxjjR24axXUW9Qx5z3EZW7RunHiYOTmY6axFmI5rnb76ycFX3C+AvGtK8Gu4LE0WX2xARzA==
X-Received: by 2002:a05:6a20:9151:b0:1a3:6465:1fc3 with SMTP id x17-20020a056a20915100b001a364651fc3mr13643187pzc.4.1711019031618;
        Thu, 21 Mar 2024 04:03:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p6-20020a170902eac600b001dd689a6ff4sm15459470pld.227.2024.03.21.04.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 04:03:51 -0700 (PDT)
Message-ID: <65fc1417.170a0220.c8385.d84a@mx.google.com>
Date: Thu, 21 Mar 2024 04:03:51 -0700 (PDT)
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
X-Kernelci-Kernel: next-20240321
X-Kernelci-Report-Type: test
Subject: next/master baseline: 322 runs, 31 regressions (next-20240321)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 322 runs, 31 regressions (next-20240321)

Regressions Summary
-------------------

platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
acer-R721T-grunt       | x86_64 | lab-collabora | gcc-10   | x86_64_defconf=
ig+x86-board   | 1          =

at91-sama5d4_xplained  | arm    | lab-baylibre  | clang-17 | multi_v7_defco=
nfig           | 1          =

at91-sama5d4_xplained  | arm    | lab-baylibre  | gcc-10   | sama5_defconfi=
g              | 1          =

bcm2836-rpi-2-b        | arm    | lab-collabora | gcc-10   | bcm2835_defcon=
fig            | 1          =

bcm2836-rpi-2-b        | arm    | lab-collabora | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =

beagle-xm              | arm    | lab-baylibre  | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =

beaglebone-black       | arm    | lab-cip       | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =

hp-11A-G6-EE-grunt     | x86_64 | lab-collabora | gcc-10   | x86_64_defconf=
ig+x86-board   | 1          =

hp-14-db0003na-grunt   | x86_64 | lab-collabora | gcc-10   | x86_64_defconf=
ig+x86-board   | 1          =

jetson-tk1             | arm    | lab-baylibre  | gcc-10   | multi_v7_defco=
nfig           | 1          =

jetson-tk1             | arm    | lab-baylibre  | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =

kontron-kbox-a-230-ls  | arm64  | lab-kontron   | gcc-10   | defconfig+vide=
odec           | 5          =

kontron-sl28-var3-ads2 | arm64  | lab-kontron   | gcc-10   | defconfig+vide=
odec           | 2          =

meson-gxl-s905d-p230   | arm64  | lab-baylibre  | gcc-10   | defconfig+vide=
odec           | 1          =

r8a7743-iwg20d-q7      | arm    | lab-cip       | gcc-10   | shmobile_defco=
nfig           | 1          =

rk3288-rock2-square    | arm    | lab-collabora | clang-17 | multi_v7_defco=
nfig           | 1          =

rk3288-rock2-square    | arm    | lab-collabora | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq      | arm    | lab-collabora | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =

sun7i-a20-cubieboard2  | arm    | lab-baylibre  | clang-17 | multi_v7_defco=
nfig           | 1          =

sun7i-a20-cubieboard2  | arm    | lab-clabbe    | clang-17 | multi_v7_defco=
nfig           | 1          =

sun7i-a20-cubieboard2  | arm    | lab-baylibre  | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2  | arm    | lab-baylibre  | gcc-10   | multi_v7_defco=
nfig           | 1          =

sun7i-a20-cubieboard2  | arm    | lab-baylibre  | gcc-10   | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2  | arm    | lab-clabbe    | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2  | arm    | lab-clabbe    | gcc-10   | multi_v7_defco=
nfig           | 1          =

sun7i-a20-cubieboard2  | arm    | lab-clabbe    | gcc-10   | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240321/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240321
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e7528c088874326d3060a46f572252be43755a86 =



Test Regressions
---------------- =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
acer-R721T-grunt       | x86_64 | lab-collabora | gcc-10   | x86_64_defconf=
ig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65fbd73372902b467c4c42df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240321/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240321/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fbd73372902b467c4c4=
2e0
        failing since 21 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
at91-sama5d4_xplained  | arm    | lab-baylibre  | clang-17 | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65fbe21e4e3e4fca804c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fbe21e4e3e4fca804c4=
2db
        new failure (last pass: next-20240125) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
at91-sama5d4_xplained  | arm    | lab-baylibre  | gcc-10   | sama5_defconfi=
g              | 1          =


  Details:     https://kernelci.org/test/plan/id/65fbe0b8132bb74e9a4c430b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240321/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240321/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fbe0b8132bb74e9a4c4=
30c
        failing since 414 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b        | arm    | lab-collabora | gcc-10   | bcm2835_defcon=
fig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65fbda814dc2b992604c4348

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240321/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240321/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fbda814dc2b992604c4=
349
        failing since 290 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b        | arm    | lab-collabora | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65fbd5e6e930b54e774c42eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fbd5e6e930b54e774c4=
2ec
        failing since 358 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
beagle-xm              | arm    | lab-baylibre  | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65fbd6b9f6ffaebe384c4321

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fbd6b9f6ffaebe384c4=
322
        failing since 356 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
beaglebone-black       | arm    | lab-cip       | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65fbd6632e11569ccf4c433b

  Results:     40 PASS, 9 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/65fbd6632e11569c=
cf4c4340
        new failure (last pass: next-20240320)
        1 lines

    2024-03-21T06:40:09.299477  / # =

    2024-03-21T06:40:09.307972  =

    2024-03-21T06:40:09.413073  / # #
    2024-03-21T06:40:09.419887  #
    2024-03-21T06:40:09.521840  / #export SHELL=3D/bin/sh
    2024-03-21T06:40:09.531953   export SHELL=3D/bin/sh
    2024-03-21T06:40:09.633758  / # . /lava-1109761/environment
    2024-03-21T06:40:09.643902  . /lava-1109761/environment
    2024-03-21T06:40:09.745838  / # /lava-1109761/bin/lava-test-runner /lav=
a-1109761/0
    2024-03-21T06:40:09.755662  /lava-1109761/bin/lava-test-runner /lava-11=
09761/0 =

    ... (9 line(s) more)  =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
hp-11A-G6-EE-grunt     | x86_64 | lab-collabora | gcc-10   | x86_64_defconf=
ig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65fbd726eb99fca6954c4316

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240321/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240321/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fbd726eb99fca6954c4=
317
        failing since 21 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
hp-14-db0003na-grunt   | x86_64 | lab-collabora | gcc-10   | x86_64_defconf=
ig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65fbd722eb99fca6954c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240321/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240321/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fbd722eb99fca6954c4=
2db
        failing since 21 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
jetson-tk1             | arm    | lab-baylibre  | gcc-10   | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65fbd71d41c3c3ef324c435c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fbd71d41c3c3ef324c4=
35d
        failing since 0 day (last pass: next-20240315, first fail: next-202=
40320) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
jetson-tk1             | arm    | lab-baylibre  | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65fbd7e9470060da354c4305

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fbd7e9470060da354c4=
306
        failing since 709 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
kontron-kbox-a-230-ls  | arm64  | lab-kontron   | gcc-10   | defconfig+vide=
odec           | 5          =


  Details:     https://kernelci.org/test/plan/id/65fbd9bb12e99d157f4c431e

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240321/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240321/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fbd9bb12e99d157f4c4325
        failing since 99 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-03-21T06:54:30.099925  <8>[   20.248585] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 445562_1.5.2.4.1>
    2024-03-21T06:54:30.203923  / # #
    2024-03-21T06:54:30.306000  export SHELL=3D/bin/sh
    2024-03-21T06:54:30.306696  #
    2024-03-21T06:54:30.407927  / # export SHELL=3D/bin/sh. /lava-445562/en=
vironment
    2024-03-21T06:54:30.408718  =

    2024-03-21T06:54:30.510091  / # . /lava-445562/environment/lava-445562/=
bin/lava-test-runner /lava-445562/1
    2024-03-21T06:54:30.511523  =

    2024-03-21T06:54:30.531151  / # /lava-445562/bin/lava-test-runner /lava=
-445562/1
    2024-03-21T06:54:30.574314  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65fbd9bb12e99d157f4c4329
        failing since 99 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-03-21T06:54:32.683213  /lava-445562/1/../bin/lava-test-case
    2024-03-21T06:54:32.683642  <8>[   22.819863] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-03-21T06:54:32.683932  /lava-445562/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
fbd9bb12e99d157f4c432b
        failing since 99 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-03-21T06:54:33.744858  /lava-445562/1/../bin/lava-test-case
    2024-03-21T06:54:33.744998  <8>[   23.860331] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-03-21T06:54:33.745083  /lava-445562/1/../bin/lava-test-case
    2024-03-21T06:54:33.745154  <8>[   23.879458] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2024-03-21T06:54:33.745224  /lava-445562/1/../bin/lava-test-case
    2024-03-21T06:54:33.745292  <8>[   23.898704] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65fbd9bb12e99d157f4c4330
        failing since 99 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-03-21T06:54:34.821595  /lava-445562/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65fbd9bb12e99d157f4c4331
        failing since 99 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-03-21T06:54:34.824835  <8>[   24.975384] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-21T06:54:35.886144  /lava-445562/1/../bin/lava-test-case
    2024-03-21T06:54:35.886329  <8>[   25.997461] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-03-21T06:54:35.886472  /lava-445562/1/../bin/lava-test-case
    2024-03-21T06:54:35.886590  <8>[   26.016270] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-03-21T06:54:35.886694  /lava-445562/1/../bin/lava-test-case   =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
kontron-sl28-var3-ads2 | arm64  | lab-kontron   | gcc-10   | defconfig+vide=
odec           | 2          =


  Details:     https://kernelci.org/test/plan/id/65fbd8df4e4de214164c4381

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240321/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240321/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fbd8df4e4de214164c4388
        failing since 99 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-03-21T06:50:59.333502  / # #
    2024-03-21T06:50:59.435636  export SHELL=3D/bin/sh
    2024-03-21T06:50:59.436370  #
    2024-03-21T06:50:59.537886  / # export SHELL=3D/bin/sh. /lava-445557/en=
vironment
    2024-03-21T06:50:59.538626  =

    2024-03-21T06:50:59.640250  / # . /lava-445557/environment/lava-445557/=
bin/lava-test-runner /lava-445557/1
    2024-03-21T06:50:59.641430  =

    2024-03-21T06:50:59.661501  / # /lava-445557/bin/lava-test-runner /lava=
-445557/1
    2024-03-21T06:50:59.714461  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-21T06:50:59.714891  + <8>[   20.943236] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 445557_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65fbd8df4e4de214164c439b
        failing since 99 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-03-21T06:51:02.152322  /lava-445557/1/../bin/lava-test-case
    2024-03-21T06:51:02.152788  <8>[   23.372208] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-21T06:51:02.153094  /lava-445557/1/../bin/lava-test-case   =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
meson-gxl-s905d-p230   | arm64  | lab-baylibre  | gcc-10   | defconfig+vide=
odec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65fbdb8d6a4808ca754c42f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240321/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240321/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fbdb8d6a4808ca754c4=
2f9
        new failure (last pass: next-20240216) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
r8a7743-iwg20d-q7      | arm    | lab-cip       | gcc-10   | shmobile_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65fbd2d7fba1db26934c4324

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240321/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240321/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fbd2d7fba1db26934c4=
325
        new failure (last pass: next-20240320) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
rk3288-rock2-square    | arm    | lab-collabora | clang-17 | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65fbe1da98c9360be34c4312

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fbe1da98c9360be34c4=
313
        new failure (last pass: next-20240315) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
rk3288-rock2-square    | arm    | lab-collabora | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65fbd8f16ff70cf4b14c42f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fbd8f16ff70cf4b14c4=
2f4
        failing since 484 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
rk3288-veyron-jaq      | arm    | lab-collabora | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65fbd7ee0a6374f2584c42e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fbd7ee0a6374f2584c4=
2e4
        failing since 484 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
sun7i-a20-cubieboard2  | arm    | lab-baylibre  | clang-17 | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65fbe10b5f69fbc3654c42ec

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fbe10b5f69fbc3654c42f5
        failing since 294 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-03-21T07:25:33.894572  / # #
    2024-03-21T07:25:33.997196  export SHELL=3D/bin/sh
    2024-03-21T07:25:33.998276  #
    2024-03-21T07:25:34.099967  / # export SHELL=3D/bin/sh. /lava-3960267/e=
nvironment
    2024-03-21T07:25:34.100843  =

    2024-03-21T07:25:34.202430  / # . /lava-3960267/environment/lava-396026=
7/bin/lava-test-runner /lava-3960267/1
    2024-03-21T07:25:34.203821  =

    2024-03-21T07:25:34.216586  / # /lava-3960267/bin/lava-test-runner /lav=
a-3960267/1
    2024-03-21T07:25:34.296949  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-21T07:25:34.330735  + cd /lava-3960267/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
sun7i-a20-cubieboard2  | arm    | lab-clabbe    | clang-17 | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65fbe0fb50cc8014504c4326

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fbe0fb50cc8014504c432f
        failing since 294 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-03-21T07:25:22.802570  + set +x
    2024-03-21T07:25:22.804398  [   20.943947] <LAVA_SIGNAL_ENDRUN 0_dmesg =
462987_1.5.2.4.1>
    2024-03-21T07:25:22.912899  / # #
    2024-03-21T07:25:23.014436  export SHELL=3D/bin/sh
    2024-03-21T07:25:23.015023  #
    2024-03-21T07:25:23.116000  / # export SHELL=3D/bin/sh. /lava-462987/en=
vironment
    2024-03-21T07:25:23.116519  =

    2024-03-21T07:25:23.217502  / # . /lava-462987/environment/lava-462987/=
bin/lava-test-runner /lava-462987/1
    2024-03-21T07:25:23.218307  =

    2024-03-21T07:25:23.221207  / # /lava-462987/bin/lava-test-runner /lava=
-462987/1 =

    ... (12 line(s) more)  =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
sun7i-a20-cubieboard2  | arm    | lab-baylibre  | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65fbd5ca3e9fd2d6864c431a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fbd5ca3e9fd2d6864c4323
        failing since 288 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-03-21T06:37:47.579783  <8>[   13.879519] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3960060_1.5.2.4.1>
    2024-03-21T06:37:47.690407  / # #
    2024-03-21T06:37:47.793420  export SHELL=3D/bin/sh
    2024-03-21T06:37:47.793783  #
    2024-03-21T06:37:47.894642  / # export SHELL=3D/bin/sh. /lava-3960060/e=
nvironment
    2024-03-21T06:37:47.895942  =

    2024-03-21T06:37:47.997615  / # . /lava-3960060/environment/lava-396006=
0/bin/lava-test-runner /lava-3960060/1
    2024-03-21T06:37:47.999205  =

    2024-03-21T06:37:48.010830  / # /lava-3960060/bin/lava-test-runner /lav=
a-3960060/1
    2024-03-21T06:37:48.135636  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
sun7i-a20-cubieboard2  | arm    | lab-baylibre  | gcc-10   | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65fbd656818654efb44c42f8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fbd656818654efb44c4301
        failing since 288 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-03-21T06:40:12.309811  <8>[   13.951001] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3960087_1.5.2.4.1>
    2024-03-21T06:40:12.417819  / # #
    2024-03-21T06:40:12.520730  export SHELL=3D/bin/sh
    2024-03-21T06:40:12.521809  #
    2024-03-21T06:40:12.623449  / # export SHELL=3D/bin/sh. /lava-3960087/e=
nvironment
    2024-03-21T06:40:12.624466  =

    2024-03-21T06:40:12.726129  / # . /lava-3960087/environment/lava-396008=
7/bin/lava-test-runner /lava-3960087/1
    2024-03-21T06:40:12.727694  =

    2024-03-21T06:40:12.740254  / # /lava-3960087/bin/lava-test-runner /lav=
a-3960087/1
    2024-03-21T06:40:12.870201  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
sun7i-a20-cubieboard2  | arm    | lab-baylibre  | gcc-10   | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65fbd8174e7d28a85d4c433f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fbd8174e7d28a85d4c4348
        failing since 294 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-03-21T06:47:20.978547  <8>[   16.491459] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3960131_1.5.2.4.1>
    2024-03-21T06:47:21.083031  / # #
    2024-03-21T06:47:21.184063  export SHELL=3D/bin/sh
    2024-03-21T06:47:21.184432  #
    2024-03-21T06:47:21.285249  / # export SHELL=3D/bin/sh. /lava-3960131/e=
nvironment
    2024-03-21T06:47:21.285861  =

    2024-03-21T06:47:21.386858  / # . /lava-3960131/environment/lava-396013=
1/bin/lava-test-runner /lava-3960131/1
    2024-03-21T06:47:21.387584  =

    2024-03-21T06:47:21.431943  / # /lava-3960131/bin/lava-test-runner /lav=
a-3960131/1
    2024-03-21T06:47:21.530891  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
sun7i-a20-cubieboard2  | arm    | lab-clabbe    | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65fbd5b9edab5afb334c430a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fbd5b9edab5afb334c4313
        failing since 288 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-03-21T06:37:24.964663  + set +x
    2024-03-21T06:37:24.966428  [   20.106334] <LAVA_SIGNAL_ENDRUN 0_dmesg =
462962_1.5.2.4.1>
    2024-03-21T06:37:25.074814  / # #
    2024-03-21T06:37:25.176421  export SHELL=3D/bin/sh
    2024-03-21T06:37:25.177094  #
    2024-03-21T06:37:25.278167  / # export SHELL=3D/bin/sh. /lava-462962/en=
vironment
    2024-03-21T06:37:25.278830  =

    2024-03-21T06:37:25.379821  / # . /lava-462962/environment/lava-462962/=
bin/lava-test-runner /lava-462962/1
    2024-03-21T06:37:25.380642  =

    2024-03-21T06:37:25.383282  / # /lava-462962/bin/lava-test-runner /lava=
-462962/1 =

    ... (12 line(s) more)  =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
sun7i-a20-cubieboard2  | arm    | lab-clabbe    | gcc-10   | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65fbd68194257a7d844c4340

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fbd68194257a7d844c4349
        failing since 288 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-03-21T06:40:48.142040  + set +x
    2024-03-21T06:40:48.143801  [   20.854519] <LAVA_SIGNAL_ENDRUN 0_dmesg =
462965_1.5.2.4.1>
    2024-03-21T06:40:48.252354  / # #
    2024-03-21T06:40:48.353897  export SHELL=3D/bin/sh
    2024-03-21T06:40:48.354455  #
    2024-03-21T06:40:48.455425  / # export SHELL=3D/bin/sh. /lava-462965/en=
vironment
    2024-03-21T06:40:48.455954  =

    2024-03-21T06:40:48.556939  / # . /lava-462965/environment/lava-462965/=
bin/lava-test-runner /lava-462965/1
    2024-03-21T06:40:48.557814  =

    2024-03-21T06:40:48.560721  / # /lava-462965/bin/lava-test-runner /lava=
-462965/1 =

    ... (12 line(s) more)  =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
sun7i-a20-cubieboard2  | arm    | lab-clabbe    | gcc-10   | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65fbd8120b76ad5e064c4303

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240321/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fbd8120b76ad5e064c430c
        failing since 294 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-03-21T06:47:22.878429  + set +x
    2024-03-21T06:47:22.880158  [   24.497479] <LAVA_SIGNAL_ENDRUN 0_dmesg =
462972_1.5.2.4.1>
    2024-03-21T06:47:22.988131  / # #
    2024-03-21T06:47:23.089660  export SHELL=3D/bin/sh
    2024-03-21T06:47:23.090261  #
    2024-03-21T06:47:23.191226  / # export SHELL=3D/bin/sh. /lava-462972/en=
vironment
    2024-03-21T06:47:23.191762  =

    2024-03-21T06:47:23.292746  / # . /lava-462972/environment/lava-462972/=
bin/lava-test-runner /lava-462972/1
    2024-03-21T06:47:23.293554  =

    2024-03-21T06:47:23.296212  / # /lava-462972/bin/lava-test-runner /lava=
-462972/1 =

    ... (12 line(s) more)  =

 =20

