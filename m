Return-Path: <linux-next+bounces-2802-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20502923F24
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 15:39:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 993641F21C46
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 13:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB98D1BA087;
	Tue,  2 Jul 2024 13:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="P6p0Kzf4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163E51B5839
	for <linux-next@vger.kernel.org>; Tue,  2 Jul 2024 13:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719927474; cv=none; b=LBlKkQp5fRzYN9PpWl8B0SnlyH3ex0kYPbxmo6fATBHFrMTcdQYfxDny06yY1ygF6KhCKM0we6ARm0DSwbT8CLjkPeDKrQe3S+/Dii2yFr5JsWfAJzT8nmGQ7E0YeQycrypQbQy0FHjhpTDNMTcDocJQ5rVlmmwPh6HT9j0rRLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719927474; c=relaxed/simple;
	bh=1po+L0uN+KCzGHQDD6AheXhGJi710s3g/tEZBWKz0zc=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=JjfZiHyp30j2db3v59mHtRomKLKu80i4jjl6KdoaEPQ5bheHCsbstjfkgf5SnSzblZ6VsKKVskq/EAq7M60KZ6ddqZxta+liTP2AUAtYod7XvrGnMRgbGsbKAAf9WlnkCOj658W+wXFMYkIfA855cR/18IzFc0S6MI7TLIbQtH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=P6p0Kzf4; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1fa78306796so24712085ad.3
        for <linux-next@vger.kernel.org>; Tue, 02 Jul 2024 06:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719927472; x=1720532272; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Wt5IYIa4t/uCDR2ZE2/0+8WIKiyz4GNIojMhlYVv6os=;
        b=P6p0Kzf4ROz++JXmRMNF8kxde/PTbnBDz7dfKisQSvbO82XPzAHUuWbyQFxJDctP83
         NUXM/SS9suV6/4OB/WwY6lz6al8PuriicOxfam8wEeNmKvkF4pIOKzaxE5GIBq8LXzml
         GQtsuo8hqEX1tlfYKeBTMItoekSg9oOQjxpIu5EsuShsCQaACyXax/m0VsN3p7H8H0jV
         Jy00HCnCYSCsZsgtuqicjtHa5Gdri2Vs+T24A1DQrdymyAjszU62e6YAglexzYcyv7fI
         s809jj5vlhXsJ4LIBs3+5waVDt8sLNfz9mpJ6ywfHA254XoXe7UVt8oUUpjF4dnGhpGf
         YViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719927472; x=1720532272;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wt5IYIa4t/uCDR2ZE2/0+8WIKiyz4GNIojMhlYVv6os=;
        b=A+WT4GyGF4D4BHO63xcbLQt8AcPtWtBv5eOdklLn25xXGhSPYnfdavhWgU+qYv2Q0i
         3U3xgj1DjBqH8Oz3JBl8PwfGTgLHO4TYyRibLNCWTXqu6ExXHqGLLtZ4tMy4oKpwCKWq
         FsXBYa7+aLR10c1Xr+Xmg+LWkLkU28nF1rndcxF1M5j8YYalL1nXDyOdsWRPqYkTNXQG
         aUOJmgMA88b2e1ZM7NRrakn8ECAVCMIPmjdozDMqV5CZN9oMGoK3UOJ92XwmqSIhJ+al
         8OKZW8sdVoINdr+f6QqVEebmEZv8e1eO0/hgsDNspNh0gkmWGcpDp3WikSJXkp/gV1uA
         I9jQ==
X-Gm-Message-State: AOJu0Yy0Smk5c11hMRYfGV/8rIZPTUHpGBLn+TAxklZewrglWsSI3TxD
	CEl/AHdguOHUWhx2NrHE0yCwXaZg92Eepq1zmDgVn9PIRWPme5AB5dYmn8Xe7bMe2eDBvGL514C
	k
X-Google-Smtp-Source: AGHT+IExr1cP55sAfkGgY8IulQwvKn8/wLoQAn+bj6pTgCSzhD41utxbyIYngsSrJ/+oG33y9NUu6A==
X-Received: by 2002:a17:903:1c3:b0:1f9:f3d3:bb21 with SMTP id d9443c01a7336-1fadbc89c5cmr67770035ad.28.1719927471826;
        Tue, 02 Jul 2024 06:37:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac15691ebsm83734165ad.213.2024.07.02.06.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 06:37:51 -0700 (PDT)
Message-ID: <668402af.170a0220.51314.c35e@mx.google.com>
Date: Tue, 02 Jul 2024 06:37:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20240702
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 386 runs, 9 regressions (next-20240702)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 386 runs, 9 regressions (next-20240702)

Regressions Summary
-------------------

platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
at91-sama5d4_xplained   | arm   | lab-baylibre  | gcc-10   | sama5_defconfi=
g              | 1          =

bcm2836-rpi-2-b         | arm   | lab-collabora | gcc-10   | bcm2835_defcon=
fig            | 1          =

beaglebone-black        | arm   | lab-cip       | gcc-10   | multi_v7_defco=
nfig           | 1          =

jetson-tk1              | arm   | lab-baylibre  | gcc-10   | multi_v7_defco=
nfig           | 1          =

jetson-tk1              | arm   | lab-baylibre  | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =

mt8195-cherry-tomato-r2 | arm64 | lab-collabora | gcc-10   | defconfig+arm6=
4-chromebook   | 1          =

r8a7743-iwg20d-q7       | arm   | lab-cip       | gcc-10   | shmobile_defco=
nfig           | 1          =

rk3288-rock2-square     | arm   | lab-collabora | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq       | arm   | lab-collabora | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240702/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240702
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      82e4255305c554b0bb18b7ccf2db86041b4c8b6e =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
at91-sama5d4_xplained   | arm   | lab-baylibre  | gcc-10   | sama5_defconfi=
g              | 1          =


  Details:     https://kernelci.org/test/plan/id/6683c2fc7ae5514fa97e708b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240702/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240702/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6683c2fc7ae5514fa97e7=
08c
        failing since 517 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora | gcc-10   | bcm2835_defcon=
fig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6683c472a54929aaa27e7083

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240702/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240702/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6683c472a54929aaa27e7=
084
        failing since 393 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
beaglebone-black        | arm   | lab-cip       | gcc-10   | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6683d115bcde9759f07e7082

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240702/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240702/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6683d115bcde9759=
f07e7087
        new failure (last pass: next-20240628)
        1 lines

    2024-07-02T10:05:59.680422  / # =

    2024-07-02T10:05:59.689092  =

    2024-07-02T10:05:59.791877  / # #
    2024-07-02T10:05:59.801152  #
    2024-07-02T10:05:59.903285  / # export SHELL=3D/bin/sh
    2024-07-02T10:05:59.913209  export SHELL=3D/bin/sh
    2024-07-02T10:06:00.014984  / # . /lava-1160098/environment
    2024-07-02T10:06:00.024668  . /lava-1160098/environment
    2024-07-02T10:06:00.126570  / # /lava-1160098/bin/lava-test-runner /lav=
a-1160098/0
    2024-07-02T10:06:00.136957  /lava-1160098/bin/lava-test-runner /lava-11=
60098/0 =

    ... (9 line(s) more)  =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
jetson-tk1              | arm   | lab-baylibre  | gcc-10   | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6683cc5b16390370647e7085

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240702/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240702/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6683cc5b16390370647e7=
086
        failing since 103 days (last pass: next-20240315, first fail: next-=
20240320) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
jetson-tk1              | arm   | lab-baylibre  | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6683ce51b053d8fc4a7e7072

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240702/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240702/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6683ce51b053d8fc4a7e7=
073
        failing since 812 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
mt8195-cherry-tomato-r2 | arm64 | lab-collabora | gcc-10   | defconfig+arm6=
4-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6683d2426a969919cb7e70da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240702/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240702/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6683d2426a969919cb7e7=
0db
        new failure (last pass: next-20240701) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
r8a7743-iwg20d-q7       | arm   | lab-cip       | gcc-10   | shmobile_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6683bff098e73e8bb47e708b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240702/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240702/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6683bff098e73e8bb47e7=
08c
        new failure (last pass: next-20240701) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
rk3288-rock2-square     | arm   | lab-collabora | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6683cf50c98d8498c47e707e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240702/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240702/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6683cf50c98d8498c47e7=
07f
        failing since 588 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
rk3288-veyron-jaq       | arm   | lab-collabora | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6683ce4c6fda48217c7e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240702/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240702/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6683ce4c6fda48217c7e7=
06e
        failing since 588 days (last pass: next-20221121, first fail: next-=
20221122) =

 =20

