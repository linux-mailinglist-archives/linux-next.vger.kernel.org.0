Return-Path: <linux-next+bounces-2146-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2380B8B9AFA
	for <lists+linux-next@lfdr.de>; Thu,  2 May 2024 14:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5EF21F23603
	for <lists+linux-next@lfdr.de>; Thu,  2 May 2024 12:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4063E49D;
	Thu,  2 May 2024 12:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="pKr4d2BZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C181CAB8
	for <linux-next@vger.kernel.org>; Thu,  2 May 2024 12:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714653473; cv=none; b=RL65a6QNhlxj4Qq9UDs9zaZH6/sZLHHB7h5l2R/+eC13vtucEoeETtkenmkX01Cm4pBRFEd34TzXft46mWMyOm2sV8XZzf1KyK2KSrkXiRjyQDvwttbVttWtOhQaIKseCEnYqPFxGeUcno62zCqWtvpSvUKaA0RMySap4TKUWUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714653473; c=relaxed/simple;
	bh=hZNfzSmLjWOYbTquWZvqg5GlhuFbYlq/s+maImneEGc=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=d7CrEBno6qYUcrnoKcDE+RrCEfK3SL9jjI3LGL3/pGQauxH4nlrCuqkQI23tULKg/woIYbQf83wV3qDBatpLe0N6/h1uxjQornMFamHsTNSCn6ERIHnmGLFua9jqjvo7Z62QZhtyfDXaxoQ5BYt1ykQSAFRJatCeBP29GL2FWEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=pKr4d2BZ; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6eff2be3b33so7229326b3a.2
        for <linux-next@vger.kernel.org>; Thu, 02 May 2024 05:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1714653471; x=1715258271; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V7ixr6uCgRSywcsrzEm7o4hyeWb8+M2Cx6exTmi48ls=;
        b=pKr4d2BZb1RQrMQeePglOB7021m8RKB14O0Znp4CCzKU0ZmNOJ767ImoIu2wACrqp9
         5N//XTwGca8C9bycwDEyIpzfKz+7NemfeEDxB+mj5fcu9OIp9RQNQtuwAeURiJEKLe1W
         WUvTF4J6iv+QcKB1jcqpVpzkgMoeoEyEy/ZJH7JWhUfjbgCATzmwdspWdigoSxIdoLc+
         ezZBDHZek6hYXLKB5iZCtwP6NUfKiEKHxfHg/rMXNc6wlCeWQTmaFIJfcyzAISBYCqn6
         wGmJH4aab2IdyGYGow/oALExUpP2LBd+5OZ0NpohSRr4sCSPJEjQP+mxgRPE+TEtFWtE
         hrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714653471; x=1715258271;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V7ixr6uCgRSywcsrzEm7o4hyeWb8+M2Cx6exTmi48ls=;
        b=AweMhO7orMto99s5tDnkwWvoLoOJx5yGqoX5XdoKosS+Gqsk9+woiS5YMFpqbBDuQr
         uxQwov69HbJN6jpTxuuGUtZ9hlkM7fjG5qirPCZ1hOvsfs1e0gYNkRMJQz6W9diOppvl
         lNqz0nxFlxzoR+P3NtLSZNq9Nvt4bNjpO1MO5E3DgZz12oabzclAd7tVnFfPoso4WZSm
         vRtmo3L2c6Q+mj3RVhq0P92QHEEy1s2akqs/nSmpRg9m+V+gXZMwtUJvkrBuyHqeMRfg
         517fYnIu/dqDT/VStwp27W5dfeGHpRMtUUoKqJ8vOAh2mk7k9UFXi/sAMM/WLAIqSXl8
         HKQQ==
X-Gm-Message-State: AOJu0Yx9OuOK84GiAxmn0NEg+LP8rwlZze665twS7uhabgBZTBCM3BlZ
	+esnc61uODEBc/JiYwq1wuRQidhNCNZuRm3+LLbfDiFiijTpogypWp31Wf3cbAM2JcmNxYMZCOn
	I7sY=
X-Google-Smtp-Source: AGHT+IE8ydc9PDDT3TA7RQQ9GW/Hj1LFsoPqrCVpK0Eb/RlZVk1xxql/wVNZlboffliqfzwcgtskrQ==
X-Received: by 2002:a05:6a21:33a8:b0:1ac:663f:9efd with SMTP id yy40-20020a056a2133a800b001ac663f9efdmr7055959pzb.19.1714653470737;
        Thu, 02 May 2024 05:37:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id b11-20020aa78ecb000000b006ed0199bd57sm1143347pfr.177.2024.05.02.05.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 05:37:50 -0700 (PDT)
Message-ID: <6633891e.a70a0220.4afe.23ad@mx.google.com>
Date: Thu, 02 May 2024 05:37:50 -0700 (PDT)
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
X-Kernelci-Kernel: next-20240502
X-Kernelci-Report-Type: test
Subject: next/master baseline: 229 runs, 13 regressions (next-20240502)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 229 runs, 13 regressions (next-20240502)

Regressions Summary
-------------------

platform              | arch | lab             | compiler | defconfig      =
              | regressions
----------------------+------+-----------------+----------+----------------=
--------------+------------
at91-sama5d4_xplained | arm  | lab-baylibre    | gcc-10   | sama5_defconfig=
              | 1          =

bcm2836-rpi-2-b       | arm  | lab-collabora   | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =

beagle-xm             | arm  | lab-baylibre    | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =

beagle-xm             | arm  | lab-baylibre    | gcc-10   | omap2plus_defco=
nfig          | 1          =

beaglebone-black      | arm  | lab-cip         | gcc-10   | omap2plus_defco=
nfig          | 1          =

imx6dl-riotboard      | arm  | lab-pengutronix | gcc-10   | multi_v7_defcon=
fig+debug     | 1          =

jetson-tk1            | arm  | lab-baylibre    | gcc-10   | multi_v7_defc..=
.G_ARM_LPAE=3Dy | 1          =

qemu_arm-virt-gicv2   | arm  | lab-broonie     | gcc-10   | multi_v7_defcon=
fig+debug     | 1          =

qemu_arm-virt-gicv2   | arm  | lab-collabora   | gcc-10   | multi_v7_defcon=
fig+debug     | 1          =

qemu_arm-virt-gicv3   | arm  | lab-broonie     | gcc-10   | multi_v7_defcon=
fig+debug     | 1          =

qemu_arm-virt-gicv3   | arm  | lab-collabora   | gcc-10   | multi_v7_defcon=
fig+debug     | 1          =

rk3288-rock2-square   | arm  | lab-collabora   | gcc-10   | multi_v7_defc..=
.G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq     | arm  | lab-collabora   | gcc-10   | multi_v7_defc..=
.G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240502/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240502
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9c6ecb3cb6e20c4fd7997047213ba0efcf9ada1a =



Test Regressions
---------------- =



platform              | arch | lab             | compiler | defconfig      =
              | regressions
----------------------+------+-----------------+----------+----------------=
--------------+------------
at91-sama5d4_xplained | arm  | lab-baylibre    | gcc-10   | sama5_defconfig=
              | 1          =


  Details:     https://kernelci.org/test/plan/id/663348a1c607aeee9b4c42e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240502/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240502/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/663348a1c607aeee9b4c4=
2e6
        failing since 456 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform              | arch | lab             | compiler | defconfig      =
              | regressions
----------------------+------+-----------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b       | arm  | lab-collabora   | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66334f11c7d32e31c14c42f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240502/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240502/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66334f11c7d32e31c14c4=
2f8
        failing since 400 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform              | arch | lab             | compiler | defconfig      =
              | regressions
----------------------+------+-----------------+----------+----------------=
--------------+------------
beagle-xm             | arm  | lab-baylibre    | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66334ff12346d7207d4c42e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240502/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240502/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66334ff12346d7207d4c4=
2e6
        failing since 398 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform              | arch | lab             | compiler | defconfig      =
              | regressions
----------------------+------+-----------------+----------+----------------=
--------------+------------
beagle-xm             | arm  | lab-baylibre    | gcc-10   | omap2plus_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6633538203d78eeeac4c42e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240502/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240502/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6633538203d78eeeac4c4=
2e2
        failing since 3 days (last pass: next-20240426, first fail: next-20=
240429) =

 =



platform              | arch | lab             | compiler | defconfig      =
              | regressions
----------------------+------+-----------------+----------+----------------=
--------------+------------
beaglebone-black      | arm  | lab-cip         | gcc-10   | omap2plus_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6633546dbff924ccb04c42e7

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240502/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240502/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6633546dbff924cc=
b04c42ec
        new failure (last pass: next-20240501)
        1 lines

    2024-05-02T08:52:43.174186  / # =

    2024-05-02T08:52:43.182959  =

    2024-05-02T08:52:43.287123  / # #
    2024-05-02T08:52:43.295185  #
    2024-05-02T08:52:43.397491  / # export SHELL=3D/bin/sh
    2024-05-02T08:52:43.407230  export SHELL=3D/bin/sh
    2024-05-02T08:52:43.509003  / # . /lava-1127606/environment
    2024-05-02T08:52:43.519159  . /lava-1127606/environment
    2024-05-02T08:52:43.621063  / # /lava-1127606/bin/lava-test-runner /lav=
a-1127606/0
    2024-05-02T08:52:43.630939  /lava-1127606/bin/lava-test-runner /lava-11=
27606/0 =

    ... (9 line(s) more)  =

 =



platform              | arch | lab             | compiler | defconfig      =
              | regressions
----------------------+------+-----------------+----------+----------------=
--------------+------------
imx6dl-riotboard      | arm  | lab-pengutronix | gcc-10   | multi_v7_defcon=
fig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/66334c36cc2e4bc4e34c42dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240502/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20240502/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66334c36cc2e4bc4e34c4=
2dd
        failing since 631 days (last pass: next-20220808, first fail: next-=
20220810) =

 =



platform              | arch | lab             | compiler | defconfig      =
              | regressions
----------------------+------+-----------------+----------+----------------=
--------------+------------
jetson-tk1            | arm  | lab-baylibre    | gcc-10   | multi_v7_defc..=
.G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66334a1dfd675080d04c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240502/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240502/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66334a1dfd675080d04c4=
2db
        failing since 751 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform              | arch | lab             | compiler | defconfig      =
              | regressions
----------------------+------+-----------------+----------+----------------=
--------------+------------
qemu_arm-virt-gicv2   | arm  | lab-broonie     | gcc-10   | multi_v7_defcon=
fig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/66334b3f95bc4b2a974c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240502/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240502/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66334b3f95bc4b2a974c4=
2db
        failing since 63 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform              | arch | lab             | compiler | defconfig      =
              | regressions
----------------------+------+-----------------+----------+----------------=
--------------+------------
qemu_arm-virt-gicv2   | arm  | lab-collabora   | gcc-10   | multi_v7_defcon=
fig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/66334b1960dc5a4cc84c4321

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240502/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240502/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66334b1960dc5a4cc84c4=
322
        failing since 63 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform              | arch | lab             | compiler | defconfig      =
              | regressions
----------------------+------+-----------------+----------+----------------=
--------------+------------
qemu_arm-virt-gicv3   | arm  | lab-broonie     | gcc-10   | multi_v7_defcon=
fig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/66334b8386aafd276e4c4300

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240502/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240502/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66334b8386aafd276e4c4=
301
        failing since 63 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform              | arch | lab             | compiler | defconfig      =
              | regressions
----------------------+------+-----------------+----------+----------------=
--------------+------------
qemu_arm-virt-gicv3   | arm  | lab-collabora   | gcc-10   | multi_v7_defcon=
fig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/66334b1a60dc5a4cc84c4324

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240502/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240502/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66334b1a60dc5a4cc84c4=
325
        failing since 63 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform              | arch | lab             | compiler | defconfig      =
              | regressions
----------------------+------+-----------------+----------+----------------=
--------------+------------
rk3288-rock2-square   | arm  | lab-collabora   | gcc-10   | multi_v7_defc..=
.G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66334b1460dc5a4cc84c431b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240502/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240502/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66334b1460dc5a4cc84c4=
31c
        failing since 526 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform              | arch | lab             | compiler | defconfig      =
              | regressions
----------------------+------+-----------------+----------+----------------=
--------------+------------
rk3288-veyron-jaq     | arm  | lab-collabora   | gcc-10   | multi_v7_defc..=
.G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66334a10f669b76ac44c4315

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240502/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240502/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66334a10f669b76ac44c4=
316
        failing since 526 days (last pass: next-20221121, first fail: next-=
20221122) =

 =20

