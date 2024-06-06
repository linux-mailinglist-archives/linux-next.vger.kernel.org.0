Return-Path: <linux-next+bounces-2486-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9728FE4C3
	for <lists+linux-next@lfdr.de>; Thu,  6 Jun 2024 12:56:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 985A2B21C7C
	for <lists+linux-next@lfdr.de>; Thu,  6 Jun 2024 10:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5E4194C80;
	Thu,  6 Jun 2024 10:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="uGPtmERR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2B52E639
	for <linux-next@vger.kernel.org>; Thu,  6 Jun 2024 10:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717671360; cv=none; b=H9RZV/1UgqcYSdwvreSizYdfsnUKv/DjHLFBfGk2Z3RkkgB4sVrvwc9LH+Nzsr5TNF4EToNoZn632hGEn7Kko/plof+3RclnvCjVhUFKipYACNyvKj6rN6ByR9RVhS9QsAScLKpOiz4RfTUrt2chGafXIejnNxCB4GbEVn2HNbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717671360; c=relaxed/simple;
	bh=IZdhlM809xyO/X6Wk7HKpOFd3P0xr61VrBbZQBSxako=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=LstwMLGNzaYzRnHA8pI/0dFrAgQwxu15+FdEUq4aRltgDzJTwRdWBqqxyb7fCeWbVTXagZ+h02NYr/chEAkoe08iBGg11GWWvbn7ebqv7J+7YaHxpyazArkzEbEcVQ4WNEbTWntmLqliL9n7DmjFwmio9dEvrRMAiakHa0IRDMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=uGPtmERR; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f4c7b022f8so7573195ad.1
        for <linux-next@vger.kernel.org>; Thu, 06 Jun 2024 03:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1717671357; x=1718276157; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LQmFm3HU6xpPcFllwQAHFbLQS7yWuGbAfMWj+PjJtLQ=;
        b=uGPtmERRcNbSd3eUqIz1GBV5qy9AYltfnJTGTuRbrPZ/Xch3qG8T2tBn15XMjZMVz8
         baMEQ+M6MFHdXs10AfNFe6vQi3FGIqIjOo3UBdqsLLV0o/3E0tBhjlEHbg5KPMwb4sTz
         HkdJpf+BMJKDR7xxUCo2MpvAYFs6QWqW2gD8+uJqN/UODm6KGmhkJVu3D1AWn35VW3LO
         kDYmPb222AI1ix48KltrNuO0y6GPWt9tzfbVxMFbWUVG0KfXXK1jX6qy+Hsw13m9guU5
         iV6XTNtOZu9/04/nEfYPen968x0nAiPVokV2iNSwHWiMDgSrDP7CvzhekgOwrKa16RnX
         RirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717671357; x=1718276157;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQmFm3HU6xpPcFllwQAHFbLQS7yWuGbAfMWj+PjJtLQ=;
        b=lQkrQdgLBXgt/Q0qNKZm1C5e6l+SA1RV+akjGi/Ir2DkqW5g+Y2YGv9cwK9eBxVGAu
         gEJWKdhqTgIxywuHhFs2iK4wiP12WXRrg3aJQpOMnKJMovUARPEPv0uP9cb3poBA4OFT
         wJoxb6eNivwxwccwJYaiVpC5bQ53w8QJHzFU2RJQBFuyxGQDG4FlNgQ6wcSgOw4GCU7L
         AJAYmFnEWanmO8i5y+sO8X0yqnbjoCMSRXoEeId7pOwyxD9p340FxD2w5z0MIvOOyDPU
         iwfInsyC0FB8xE64/GkoPLN0XmVBtqM4wia1LdMTpDBxXDULRBRtHKEMHCS2TPc3V0Q6
         BfSQ==
X-Gm-Message-State: AOJu0Yxbh39SJQhg8FA+LxkTjTbp1fLeLQTGi5k8CEtEEdibVhlw8ZE4
	9Qi4HdE+0yN6eCqOXBfOli3fZmNck1IAw1n1BUc9WBrCGyjvfP8woIGJoW4gKmXGeRrXyBjRoK7
	E
X-Google-Smtp-Source: AGHT+IEJYgy5cdhA6C44wHCOCzaHz9tEXqb5Nl9jo6F38gR6h16t3VAtIB/f+phkWIMr5fr/UclAPg==
X-Received: by 2002:a17:903:2944:b0:1e4:6519:816d with SMTP id d9443c01a7336-1f6a5a6be84mr45434935ad.48.1717671356713;
        Thu, 06 Jun 2024 03:55:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd81ca08sm11774945ad.307.2024.06.06.03.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 03:55:56 -0700 (PDT)
Message-ID: <666195bc.170a0220.d8ba7.2821@mx.google.com>
Date: Thu, 06 Jun 2024 03:55:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20240606
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 415 runs, 26 regressions (next-20240606)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 415 runs, 26 regressions (next-20240606)

Regressions Summary
-------------------

platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
asus-CM1400CXA-dalboz   | x86_64 | lab-collabora   | gcc-10   | x86_64_defc=
onfig+x86-board   | 1          =

at91-sama5d4_xplained   | arm    | lab-baylibre    | gcc-10   | sama5_defco=
nfig              | 1          =

bcm2836-rpi-2-b         | arm    | lab-collabora   | gcc-10   | bcm2835_def=
config            | 1          =

bcm2836-rpi-2-b         | arm    | lab-collabora   | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

beagle-xm               | arm    | lab-baylibre    | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

beaglebone-black        | arm    | lab-cip         | clang-17 | multi_v7_de=
fconfig           | 1          =

beaglebone-black        | arm    | lab-cip         | gcc-10   | omap2plus_d=
efconfig          | 1          =

hp-11A-G6-EE-grunt      | x86_64 | lab-collabora   | gcc-10   | x86_64_defc=
onfig+x86-board   | 1          =

imx6dl-riotboard        | arm    | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =

jetson-tk1              | arm    | lab-baylibre    | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

jetson-tk1              | arm    | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig           | 1          =

k3-j721e-beagleboneai64 | arm64  | lab-baylibre    | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

k3-j721e-sk             | arm64  | lab-baylibre    | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

mt8195-cherry-tomato-r2 | arm64  | lab-collabora   | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =

qemu_arm-virt-gicv2     | arm    | lab-broonie     | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =

qemu_arm-virt-gicv2     | arm    | lab-collabora   | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =

qemu_arm-virt-gicv3     | arm    | lab-broonie     | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =

qemu_arm-virt-gicv3     | arm    | lab-collabora   | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =

qemu_i386               | i386   | lab-collabora   | clang-17 | i386_defcon=
fig               | 1          =

qemu_i386               | i386   | lab-collabora   | gcc-10   | i386_defcon=
fig               | 1          =

qemu_i386-uefi          | i386   | lab-collabora   | clang-17 | i386_defcon=
fig               | 1          =

qemu_i386-uefi          | i386   | lab-collabora   | gcc-10   | i386_defcon=
fig               | 1          =

r8a7743-iwg20d-q7       | arm    | lab-cip         | gcc-10   | shmobile_de=
fconfig           | 1          =

rk3288-rock2-square     | arm    | lab-collabora   | clang-17 | multi_v7_de=
fconfig           | 1          =

rk3288-rock2-square     | arm    | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq       | arm    | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240606/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240606
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ee78a17615ad0cfdbbc27182b1047cd36c9d4d5f =



Test Regressions
---------------- =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
asus-CM1400CXA-dalboz   | x86_64 | lab-collabora   | gcc-10   | x86_64_defc=
onfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/66615ead8b55e71b327e7083

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240606/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-asus-CM1400CXA-=
dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240606/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-asus-CM1400CXA-=
dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66615ead8b55e71b327e7=
084
        new failure (last pass: next-20240605) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
at91-sama5d4_xplained   | arm    | lab-baylibre    | gcc-10   | sama5_defco=
nfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/66615bc86eb816934a7e70a2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240606/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240606/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66615bc86eb816934a7e7=
0a3
        failing since 491 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b         | arm    | lab-collabora   | gcc-10   | bcm2835_def=
config            | 1          =


  Details:     https://kernelci.org/test/plan/id/66615af864122fcdf77e707d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240606/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240606/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66615af864122fcdf77e7=
07e
        failing since 367 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b         | arm    | lab-collabora   | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/666161899eca913e527e7201

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240606/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240606/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/666161899eca913e527e7=
202
        failing since 435 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
beagle-xm               | arm    | lab-baylibre    | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/666162399c74da44937e70db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240606/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240606/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/666162399c74da44937e7=
0dc
        failing since 433 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
beaglebone-black        | arm    | lab-cip         | clang-17 | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66616b375f1748e5a17e7072

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240606/arm/=
multi_v7_defconfig/clang-17/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240606/arm/=
multi_v7_defconfig/clang-17/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/66616b375f1748e5=
a17e7077
        new failure (last pass: next-20240605)
        1 lines

    2024-06-06T07:54:21.616243  / # =

    2024-06-06T07:54:21.625062  =

    2024-06-06T07:54:21.730121  / # #
    2024-06-06T07:54:21.736976  #
    2024-06-06T07:54:21.854655  / # export SHELL=3D/bin/sh
    2024-06-06T07:54:21.864900  export SHELL=3D/bin/sh
    2024-06-06T07:54:21.966704  / # . /lava-1144297/environment
    2024-06-06T07:54:21.976841  . /lava-1144297/environment
    2024-06-06T07:54:22.078672  / # /lava-1144297/bin/lava-test-runner /lav=
a-1144297/0
    2024-06-06T07:54:22.088810  /lava-1144297/bin/lava-test-runner /lava-11=
44297/0 =

    ... (9 line(s) more)  =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
beaglebone-black        | arm    | lab-cip         | gcc-10   | omap2plus_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/66615b0bce926c7d507e7081

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240606/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240606/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/66615b0bce926c7d=
507e7086
        failing since 0 day (last pass: next-20240604, first fail: next-202=
40605)
        1 lines

    2024-06-06T06:45:10.103693  / # =

    2024-06-06T06:45:10.110162  =

    2024-06-06T06:45:10.214024  / # #
    2024-06-06T06:45:10.223122  #
    2024-06-06T06:45:10.324827  / # export SHELL=3D/bin/sh
    2024-06-06T06:45:10.334641  export SHELL=3D/bin/sh
    2024-06-06T06:45:10.436085  / # . /lava-1144240/environment
    2024-06-06T06:45:10.445981  . /lava-1144240/environment
    2024-06-06T06:45:10.547386  / # /lava-1144240/bin/lava-test-runner /lav=
a-1144240/0
    2024-06-06T06:45:10.557381  /lava-1144240/bin/lava-test-runner /lava-11=
44240/0 =

    ... (9 line(s) more)  =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
hp-11A-G6-EE-grunt      | x86_64 | lab-collabora   | gcc-10   | x86_64_defc=
onfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/66615d9d139f627be77e7084

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240606/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240606/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/66615d9d139f627=
be77e7087
        new failure (last pass: next-20240605)
        1 lines

    2024-06-06T06:56:04.358315  kern  :emerg : call_irq_handler: 1.55 No ir=
q handler for vector

    2024-06-06T06:56:04.368782  <8>[    9.215124] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
   =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
imx6dl-riotboard        | arm    | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/666160309cd7c561c57e707f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240606/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20240606/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/666160309cd7c561c57e7=
080
        failing since 666 days (last pass: next-20220808, first fail: next-=
20220810) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
jetson-tk1              | arm    | lab-baylibre    | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/666159cc2f00a916d27e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240606/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240606/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/666159cc2f00a916d27e7=
06e
        failing since 786 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
jetson-tk1              | arm    | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66615b79752c8ae64a7e71b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240606/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240606/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66615b79752c8ae64a7e7=
1b8
        failing since 77 days (last pass: next-20240315, first fail: next-2=
0240320) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
k3-j721e-beagleboneai64 | arm64  | lab-baylibre    | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/666162657c4e3ad6ff7e70ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240606/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-k3-j721=
e-beagleboneai64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240606/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-k3-j721=
e-beagleboneai64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/666162657c4e3ad6ff7e7=
0af
        new failure (last pass: next-20240605) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
k3-j721e-sk             | arm64  | lab-baylibre    | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6661635f82076f1f177e70b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240606/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-k3-j721=
e-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240606/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-k3-j721=
e-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6661635f82076f1f177e7=
0b2
        failing since 0 day (last pass: next-20240523, first fail: next-202=
40605) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
mt8195-cherry-tomato-r2 | arm64  | lab-collabora   | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6661608e607cb0ddf77e706e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240606/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240606/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6661608e607cb0ddf77e7=
06f
        new failure (last pass: next-20240604) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
qemu_arm-virt-gicv2     | arm    | lab-broonie     | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/66615f20b7153b72297e70ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240606/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240606/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66615f20b7153b72297e7=
0bb
        failing since 98 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
qemu_arm-virt-gicv2     | arm    | lab-collabora   | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/66615f118422c6accd7e7075

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240606/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240606/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66615f118422c6accd7e7=
076
        failing since 98 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
qemu_arm-virt-gicv3     | arm    | lab-broonie     | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/66615f387fb7f522137e70fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240606/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240606/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66615f387fb7f522137e7=
0fd
        failing since 98 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
qemu_arm-virt-gicv3     | arm    | lab-collabora   | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/66615f128422c6accd7e7078

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240606/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240606/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66615f128422c6accd7e7=
079
        failing since 98 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
qemu_i386               | i386   | lab-collabora   | clang-17 | i386_defcon=
fig               | 1          =


  Details:     https://kernelci.org/test/plan/id/66615eb08f8b2d11357e7083

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240606/i386=
/i386_defconfig/clang-17/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240606/i386=
/i386_defconfig/clang-17/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66615eb08f8b2d11357e7=
084
        new failure (last pass: next-20240605) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
qemu_i386               | i386   | lab-collabora   | gcc-10   | i386_defcon=
fig               | 1          =


  Details:     https://kernelci.org/test/plan/id/66615755dd0cc76cf47e70ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240606/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240606/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66615755dd0cc76cf47e7=
0ee
        new failure (last pass: next-20240605) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
qemu_i386-uefi          | i386   | lab-collabora   | clang-17 | i386_defcon=
fig               | 1          =


  Details:     https://kernelci.org/test/plan/id/66615eae8b55e71b327e7086

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240606/i386=
/i386_defconfig/clang-17/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240606/i386=
/i386_defconfig/clang-17/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66615eae8b55e71b327e7=
087
        new failure (last pass: next-20240605) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
qemu_i386-uefi          | i386   | lab-collabora   | gcc-10   | i386_defcon=
fig               | 1          =


  Details:     https://kernelci.org/test/plan/id/66615754dd0cc76cf47e70ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240606/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240606/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66615754dd0cc76cf47e7=
0eb
        new failure (last pass: next-20240605) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
r8a7743-iwg20d-q7       | arm    | lab-cip         | gcc-10   | shmobile_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66615e998f8b2d11357e7073

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240606/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240606/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66615e998f8b2d11357e7=
074
        failing since 3 days (last pass: next-20240531, first fail: next-20=
240603) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
rk3288-rock2-square     | arm    | lab-collabora   | clang-17 | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66615f1c8422c6accd7e70d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240606/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240606/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66615f1c8422c6accd7e7=
0d3
        failing since 76 days (last pass: next-20240315, first fail: next-2=
0240321) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
rk3288-rock2-square     | arm    | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66615ae411c3161b367e7075

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240606/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240606/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66615ae411c3161b367e7=
076
        failing since 561 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
rk3288-veyron-jaq       | arm    | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/666159d490cc69a07f7e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240606/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240606/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/666159d490cc69a07f7e7=
06e
        failing since 561 days (last pass: next-20221121, first fail: next-=
20221122) =

 =20

