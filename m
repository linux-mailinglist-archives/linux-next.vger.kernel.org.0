Return-Path: <linux-next+bounces-1997-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A40858ACC0D
	for <lists+linux-next@lfdr.de>; Mon, 22 Apr 2024 13:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59004282358
	for <lists+linux-next@lfdr.de>; Mon, 22 Apr 2024 11:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F121465A2;
	Mon, 22 Apr 2024 11:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="xDVcduMV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDDA1465A8
	for <linux-next@vger.kernel.org>; Mon, 22 Apr 2024 11:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713785473; cv=none; b=F2OD2QoI2n9vKxOBYMnsptoXBBKmT9Oy5D25Get2zH94xUqw51g48HUUIVedvdtG7olWEfVYtzVT+yTHMHVgcMh6aucS+3cLULSnfL61BgR3briqboz0lHozp9EnVYZ0USVPwj5fKTT2eggorCJYNXY8D9tb890Cf9L8fvjLzw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713785473; c=relaxed/simple;
	bh=MlOpeAaIsCJJXr3/6OJ5eeH1yFX+3OaKjPwnsxm6Gfg=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=rMN9hjTGUzzfn6zjNnGIc96jz5qus1fxFlMd1edfQhhHF1SDHZ/uaEBQREfvelpoA7JhrkQfNwvk9xntycHWZXhQz9EQsPExFmecJoShWv3YMt5K9bInRnI/FAUz3KEO1FE0X92MvkkDqzWBas++QUBY2+D8fS0sl3aPOixKdW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=xDVcduMV; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e8bbcbc2b7so29706515ad.0
        for <linux-next@vger.kernel.org>; Mon, 22 Apr 2024 04:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1713785470; x=1714390270; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fY9vOlaG6Ke76ryqWwDnfjSmzbDfdVFC8Z7aZECW/XM=;
        b=xDVcduMVgdqJJgZLt0v5Gq/KIkDfYuT3F+5mJzcI4fSJPKFINJEMNgpN5sjibyAPMd
         nSwd0ZR8TaSicx9FedZFaKu6fzkoTffG1Ci3rgk5CKSa5TXLud7XqrmqKw6j+4+3j7Bl
         PfCCEywO6SaObbTeSd3D3uABtfcxYsFbsTOLLKnJc9sw+7s6ZMrrJtW6v6bSohYlR6ZG
         M0wQM0P2+D77VT0homVTN+1QJ7+pwzoHSvKNp7R8MNbkif9PmADYIdlN+epAy2DNK6hd
         6JX7afFLAAl+a/8kxy2LyOMxsSXp3l4FHDquSV8sWJDk/AI3ym1N44tm1BIlr7/99LJV
         bN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713785470; x=1714390270;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fY9vOlaG6Ke76ryqWwDnfjSmzbDfdVFC8Z7aZECW/XM=;
        b=eGKq1UFCD1O7pIIBYdoM/2i8oy1ElTjAYeTavCNtIjmsy+MZlCvLE1I9KgKYIqql6t
         XWWXM1mfTsnyUKpTzHh2ZBv5VB94CJ39sAYa8NPX5SoRe48Lxpf3JmwMxcbTnT6/Ip/y
         wYTKJfsop2LAF/4a6UZjjGFnMC+pHo5j7o0tdt+RbF3U1QCjCjM/3OD2lNXK7SmPx7Ao
         QnQT2JBMCNTD5UmEJpxZGTscILTo+NNbjuIUazmB1vlTZmifrIbJVBgW5PyBmDPS9F6u
         IqW0QqzzocrO3vOvmcxRrNomRLlCwYt4O6J/BnwdOxJecPuKXrN9UyEWZx9Fi/VuH8Hn
         HeVQ==
X-Gm-Message-State: AOJu0YwUwHsNhcNTuSgUt08XILNaDBA9w0N8zOQhOedwzF8K3rwrC9n+
	E0EtVKODK2aAlNfIpOEs3w5SlZiUfSVQWgNZmMVmmEPK35T7UqXfQGXA7xZ3/lS/lSgs0foMhz/
	f
X-Google-Smtp-Source: AGHT+IHggprsPzo3lJbOS6YSN38LZx1OJhly6QF1dGxrUcNjVdSR+5e6SAXcwT2BTTdj9DWnZUYZeQ==
X-Received: by 2002:a17:902:d2cf:b0:1e3:d0fd:236c with SMTP id n15-20020a170902d2cf00b001e3d0fd236cmr15710579plc.37.1713785469877;
        Mon, 22 Apr 2024 04:31:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id k6-20020a170902694600b001e20afa1038sm7940720plt.8.2024.04.22.04.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 04:31:09 -0700 (PDT)
Message-ID: <66264a7d.170a0220.e84ca.959f@mx.google.com>
Date: Mon, 22 Apr 2024 04:31:09 -0700 (PDT)
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
X-Kernelci-Kernel: next-20240422
X-Kernelci-Report-Type: test
Subject: next/master baseline: 204 runs, 15 regressions (next-20240422)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 204 runs, 15 regressions (next-20240422)

Regressions Summary
-------------------

platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
at91-sama5d4_xplained  | arm    | lab-baylibre  | gcc-10   | sama5_defconfi=
g              | 1          =

bcm2836-rpi-2-b        | arm    | lab-collabora | gcc-10   | bcm2835_defcon=
fig            | 1          =

bcm2836-rpi-2-b        | arm    | lab-collabora | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =

beagle-xm              | arm    | lab-baylibre  | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =

beagle-xm              | arm    | lab-baylibre  | gcc-10   | omap2plus_defc=
onfig          | 1          =

jetson-tk1             | arm    | lab-baylibre  | gcc-10   | multi_v7_defco=
nfig           | 1          =

jetson-tk1             | arm    | lab-baylibre  | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =

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

rk3288-rock2-square    | arm    | lab-collabora | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq      | arm    | lab-collabora | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240422/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240422
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f529a6d274b3b8c75899e949649d231298f30a32 =



Test Regressions
---------------- =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
at91-sama5d4_xplained  | arm    | lab-baylibre  | gcc-10   | sama5_defconfi=
g              | 1          =


  Details:     https://kernelci.org/test/plan/id/662609bde99cc8313f4c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240422/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240422/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/662609bde99cc8313f4c4=
2db
        failing since 446 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b        | arm    | lab-collabora | gcc-10   | bcm2835_defcon=
fig            | 1          =


  Details:     https://kernelci.org/test/plan/id/66261193c2eb06dbfa4c42ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240422/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240422/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66261193c2eb06dbfa4c4=
300
        failing since 322 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b        | arm    | lab-collabora | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66260f4fff608600944c4305

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240422/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240422/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66260f4fff608600944c4=
306
        failing since 390 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
beagle-xm              | arm    | lab-baylibre  | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66260f0e52551010354c4300

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240422/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240422/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66260f0e52551010354c4=
301
        failing since 388 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
beagle-xm              | arm    | lab-baylibre  | gcc-10   | omap2plus_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/662613473cae03eeb14c42dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240422/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240422/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/662613473cae03eeb14c4=
2dd
        failing since 17 days (last pass: next-20240403, first fail: next-2=
0240404) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
jetson-tk1             | arm    | lab-baylibre  | gcc-10   | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66260d9198f89fc4044c42f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240422/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240422/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66260d9198f89fc4044c4=
2fa
        failing since 32 days (last pass: next-20240315, first fail: next-2=
0240320) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
jetson-tk1             | arm    | lab-baylibre  | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66261190f14cc7545a4c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240422/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240422/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66261190f14cc7545a4c4=
2db
        failing since 741 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
qemu_x86_64            | x86_64 | lab-broonie   | gcc-10   | x86_64_defconf=
ig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/66260dea8e7f525e3d4c42fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240422/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240422/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66260dea8e7f525e3d4c4=
2fc
        failing since 2 days (last pass: next-20240418, first fail: next-20=
240419) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
qemu_x86_64            | x86_64 | lab-collabora | gcc-10   | x86_64_defconf=
ig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/66260dcd00dab591454c42f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240422/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240422/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66260dcd00dab591454c4=
2f7
        failing since 2 days (last pass: next-20240418, first fail: next-20=
240419) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
qemu_x86_64-uefi       | x86_64 | lab-broonie   | gcc-10   | x86_64_defconf=
ig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/66260deb8e7f525e3d4c4306

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240422/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240422/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66260deb8e7f525e3d4c4=
307
        failing since 2 days (last pass: next-20240418, first fail: next-20=
240419) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
qemu_x86_64-uefi       | x86_64 | lab-collabora | gcc-10   | x86_64_defconf=
ig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/66260ddb00dab591454c430f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240422/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240422/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66260ddb00dab591454c4=
310
        failing since 2 days (last pass: next-20240418, first fail: next-20=
240419) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
qemu_x86_64-uefi-mixed | x86_64 | lab-broonie   | gcc-10   | x86_64_defconf=
ig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/66260e3a85e0ae0a104c42ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240422/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240422/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66260e3a85e0ae0a104c4=
2ed
        failing since 2 days (last pass: next-20240418, first fail: next-20=
240419) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
qemu_x86_64-uefi-mixed | x86_64 | lab-collabora | gcc-10   | x86_64_defconf=
ig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/66260e048e7f525e3d4c4318

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240422/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mi=
xed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240422/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mi=
xed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66260e048e7f525e3d4c4=
319
        failing since 2 days (last pass: next-20240418, first fail: next-20=
240419) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
rk3288-rock2-square    | arm    | lab-collabora | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66261284c543f2e6b94c42fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240422/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240422/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66261284c543f2e6b94c4=
2fb
        failing since 516 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
rk3288-veyron-jaq      | arm    | lab-collabora | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6626118098cc210cbd4c4361

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240422/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240422/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6626118098cc210cbd4c4=
362
        failing since 516 days (last pass: next-20221121, first fail: next-=
20221122) =

 =20

