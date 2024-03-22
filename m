Return-Path: <linux-next+bounces-1697-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FD48869F7
	for <lists+linux-next@lfdr.de>; Fri, 22 Mar 2024 11:09:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C63612814FF
	for <lists+linux-next@lfdr.de>; Fri, 22 Mar 2024 10:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C4C288AE;
	Fri, 22 Mar 2024 10:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Zqs7NuaW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C571426ADB
	for <linux-next@vger.kernel.org>; Fri, 22 Mar 2024 10:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711102159; cv=none; b=Llj0TBmfh/JI1RXSn2wc//dqv2WeEErp4sjEVvf3NDBkGh/9vOpBF0kzNOx9iXKpgeuHJEJsvkqC9WxN3fYPWToA2SHNek9Qvc4O989+PJ3OYneNmiondvUOZUvl606WtGwC6AvVxvtgvFgDrBPf4ENJfLOso5nEAZGQRKxRFKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711102159; c=relaxed/simple;
	bh=aqd9inqdEloU5QqC2BvMtIWbf4GEzYYioLM/+FxEkGE=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=MhKq4TL7OU3HJeGhqGdT/NYR3OcbTWgqVCo/6/u12Z1cv9qDCH8acUahgvcz01GZjEyywk4Ge3fKMj7CHlQh7Ss7CQQwGJrvNMD9m7LswVoJGRnogZTISOUI+ifcQlkG12DpeCTXqmpcLWjFBuaGqE3cZfg8FfEdwav6jk3hxfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Zqs7NuaW; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5dbd519bde6so1205783a12.1
        for <linux-next@vger.kernel.org>; Fri, 22 Mar 2024 03:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1711102155; x=1711706955; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6Hv57329YgqCGN4ZWP8F9Hji1T9EetscjoAnUzVsaSU=;
        b=Zqs7NuaW2QJ/BBO40xYItm1anO2JDBBENmfIW6S/FCY/A10dXeqpsWGTgu17oH+Yl5
         HAg0FH0ZcZVwjQpUMFFTWjHBoWZZ3DKwWzzL0AEtwYyZY5GqyaHEnDhtiFRGDAAuhXYm
         H7GR44lFph228B29kZsM0dO3wT7Xuan4bcXydC/P6j3FOv1jlGEexNAcVkr63FDhglP+
         WMN5RGckE7c8CXRkqaJYuwA3x/y9TsxzpN9XqYyfMUo44BA7XFAcqgOptglT2ZD3scS2
         w6hnXRUOl46fE8RpRa6Yun9yqnv2wks9VRklqFA/0qXxJLimX+oWRaoygP1C6RYrid6d
         azQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711102155; x=1711706955;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Hv57329YgqCGN4ZWP8F9Hji1T9EetscjoAnUzVsaSU=;
        b=EpteZksuzZtMjejBE4ZC1Ka8ziiZPu2UQNOuVkEQYXBilJykNsSgx7j8szg2CpFv+g
         TDeTo5TpJy8ZocGhjE3x7k8XPL2svdRWF1LAdYhKVKgPJwEfk/zAbQ+x2KbIjuSY+QWG
         ZQu+eHzxQsPWn/WH/d/M1UAXVbAErGpD1evibArWjxpDSIbModvXtdxlVhTUpATM3HFI
         m+G1EVHK+CME9mIyqxEOMaJI2nYmO+O4UWgJCaQNE7kYJYu25uMF6xG1QZbMEk4mJIcM
         1cYZ6DZqJjf9np6L/un76R+B8jVxTS2y/qm7k6j+LOwpojYGkIB+UwWjI0oCrcXkfX0s
         B3hg==
X-Gm-Message-State: AOJu0Yy66g7LjBuH+CJTOHqH42joafL4BroX3OC8g42K2FUW5C4/5LCX
	YEWuohD08Rwd2KXQBrWVpJc63Zwu1vzmiLn8i+5Yzo8+8s2gIFRX+s5xC4u/CcJm4RERvRiq5F8
	GC+8=
X-Google-Smtp-Source: AGHT+IH6qfvKv5G+FhdolPG7LGpdqaaOeEyQlI3BXT1ZJGIyM8DLEfDJIxcPfxIztRmL6kBtBh1YdQ==
X-Received: by 2002:a17:90a:72c4:b0:29c:776f:8911 with SMTP id l4-20020a17090a72c400b0029c776f8911mr2109710pjk.21.1711102155038;
        Fri, 22 Mar 2024 03:09:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090b004f00b0029bb4712610sm1510843pjt.6.2024.03.22.03.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 03:09:14 -0700 (PDT)
Message-ID: <65fd58ca.170a0220.78e1c.5470@mx.google.com>
Date: Fri, 22 Mar 2024 03:09:14 -0700 (PDT)
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
X-Kernelci-Kernel: next-20240322
X-Kernelci-Report-Type: test
Subject: next/master baseline: 276 runs, 32 regressions (next-20240322)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 276 runs, 32 regressions (next-20240322)

Regressions Summary
-------------------

platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
acer-R721T-grunt       | x86_64 | lab-collabora   | gcc-10   | x86_64_defco=
nfig+x86-board   | 1          =

at91-sama5d4_xplained  | arm    | lab-baylibre    | gcc-10   | sama5_defcon=
fig              | 1          =

bcm2836-rpi-2-b        | arm    | lab-collabora   | gcc-10   | bcm2835_defc=
onfig            | 1          =

bcm2836-rpi-2-b        | arm    | lab-collabora   | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

beagle-xm              | arm    | lab-baylibre    | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

beagle-xm              | arm    | lab-baylibre    | gcc-10   | omap2plus_de=
fconfig          | 1          =

hp-11A-G6-EE-grunt     | x86_64 | lab-collabora   | gcc-10   | x86_64_defco=
nfig+x86-board   | 1          =

hp-14-db0003na-grunt   | x86_64 | lab-collabora   | gcc-10   | x86_64_defco=
nfig+x86-board   | 1          =

imx6dl-riotboard       | arm    | lab-pengutronix | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

imx6dl-riotboard       | arm    | lab-pengutronix | gcc-10   | multi_v7_def=
config+debug     | 1          =

imx6qp-wandboard-revd1 | arm    | lab-pengutronix | gcc-10   | multi_v7_def=
config+debug     | 1          =

jetson-tk1             | arm    | lab-baylibre    | gcc-10   | multi_v7_def=
config           | 1          =

jetson-tk1             | arm    | lab-baylibre    | gcc-10   | multi_v7_def=
c...G_ARM_LPAE=3Dy | 1          =

kontron-kbox-a-230-ls  | arm64  | lab-kontron     | gcc-10   | defconfig+vi=
deodec           | 5          =

kontron-sl28-var3-ads2 | arm64  | lab-kontron     | gcc-10   | defconfig+vi=
deodec           | 2          =

mt8173-elm-hana        | arm64  | lab-collabora   | gcc-10   | defconfig+ar=
m64-chromebook   | 2          =

qemu_arm-virt-gicv2    | arm    | lab-broonie     | gcc-10   | multi_v7_def=
config+debug     | 1          =

qemu_arm-virt-gicv2    | arm    | lab-collabora   | gcc-10   | multi_v7_def=
config+debug     | 1          =

qemu_arm-virt-gicv3    | arm    | lab-broonie     | gcc-10   | multi_v7_def=
config+debug     | 1          =

qemu_arm-virt-gicv3    | arm    | lab-collabora   | gcc-10   | multi_v7_def=
config+debug     | 1          =

rk3288-rock2-square    | arm    | lab-collabora   | gcc-10   | multi_v7_def=
c...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq      | arm    | lab-collabora   | gcc-10   | multi_v7_def=
c...G_ARM_LPAE=3Dy | 1          =

sun7i-a20-cubieboard2  | arm    | lab-baylibre    | gcc-10   | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2  | arm    | lab-baylibre    | gcc-10   | multi_v7_def=
config           | 1          =

sun7i-a20-cubieboard2  | arm    | lab-clabbe      | gcc-10   | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2  | arm    | lab-clabbe      | gcc-10   | multi_v7_def=
config           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240322/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240322
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      13ee4a7161b6fd938aef6688ff43b163f6d83e37 =



Test Regressions
---------------- =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
acer-R721T-grunt       | x86_64 | lab-collabora   | gcc-10   | x86_64_defco=
nfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65fd1e0b01ce9240b54c42df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240322/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240322/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fd1e0b01ce9240b54c4=
2e0
        failing since 22 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
at91-sama5d4_xplained  | arm    | lab-baylibre    | gcc-10   | sama5_defcon=
fig              | 1          =


  Details:     https://kernelci.org/test/plan/id/65fd1fe8fe67b284c44c43a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240322/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240322/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fd1fe8fe67b284c44c4=
3aa
        failing since 415 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b        | arm    | lab-collabora   | gcc-10   | bcm2835_defc=
onfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65fd20809f157fe78f4c42db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240322/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240322/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fd20809f157fe78f4c4=
2dc
        failing since 291 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b        | arm    | lab-collabora   | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65fd189ac6124385194c431d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fd189ac6124385194c4=
31e
        failing since 359 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
beagle-xm              | arm    | lab-baylibre    | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65fd18846a579f18f14c433a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fd18846a579f18f14c4=
33b
        failing since 356 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
beagle-xm              | arm    | lab-baylibre    | gcc-10   | omap2plus_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/65fd1b2731800f22144c42e3

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240322/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240322/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fd1b2731800f22144c42ea
        new failure (last pass: next-20240321)

    2024-03-22T05:45:46.178816  Segmentation fault
    2024-03-22T05:45:46.281486  / # #
    2024-03-22T05:45:46.382511  export SHELL=3D/bin/sh
    2024-03-22T05:45:46.382931  #
    2024-03-22T05:45:46.483756  / # export SHELL=3D/bin/sh. /lava-3960835/e=
nvironment
    2024-03-22T05:45:46.485125  =

    2024-03-22T05:45:46.586817  / # . /lava-3960835/environment/lava-396083=
5/bin/lava-test-runner /lava-3960835/1
    2024-03-22T05:45:46.587525  =

    2024-03-22T05:45:46.593234  / # /lava-3960835/bin/lava-test-runner /lav=
a-3960835/1
    2024-03-22T05:45:46.635896  date: symbol lookup error: /lib/libc.so.6: =
undefined symbol: __pointer_chk_guard, version  =

    ... (12 line(s) more)  =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
hp-11A-G6-EE-grunt     | x86_64 | lab-collabora   | gcc-10   | x86_64_defco=
nfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65fd1e0464821781dd4c42fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240322/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240322/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fd1e0464821781dd4c4=
2fe
        failing since 22 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
hp-14-db0003na-grunt   | x86_64 | lab-collabora   | gcc-10   | x86_64_defco=
nfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65fd1dfca749c136aa4c42df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240322/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240322/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fd1dfca749c136aa4c4=
2e0
        failing since 22 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
imx6dl-riotboard       | arm    | lab-pengutronix | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65fd1859f8cd4a00d74c439b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fd1859f8cd4a00d74c43a4
        new failure (last pass: next-20240321)

    2024-03-22T05:33:54.146859  + set[   15.974705] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 1035982_1.5.2.3.1>
    2024-03-22T05:33:54.147006   +x
    2024-03-22T05:33:54.252151  / # #
    2024-03-22T05:33:54.353371  export SHELL=3D/bin/sh
    2024-03-22T05:33:54.353991  #
    2024-03-22T05:33:54.454994  / # export SHELL=3D/bin/sh. /lava-1035982/e=
nvironment
    2024-03-22T05:33:54.455442  =

    2024-03-22T05:33:54.556207  / # . /lava-1035982/environment/lava-103598=
2/bin/lava-test-runner /lava-1035982/1
    2024-03-22T05:33:54.556745  =

    2024-03-22T05:33:54.559768  / # /lava-1035982/bin/lava-test-runner /lav=
a-1035982/1 =

    ... (12 line(s) more)  =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
imx6dl-riotboard       | arm    | lab-pengutronix | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/65fd1a75301c78fdde4c433f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fd1a75301c78fdde4c4=
340
        failing since 590 days (last pass: next-20220808, first fail: next-=
20220810) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
imx6qp-wandboard-revd1 | arm    | lab-pengutronix | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/65fd1a74301c78fdde4c433a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fd1a74301c78fdde4c4=
33b
        failing since 577 days (last pass: next-20220810, first fail: next-=
20220822) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
jetson-tk1             | arm    | lab-baylibre    | gcc-10   | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/65fd209c9f157fe78f4c42ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fd209c9f157fe78f4c4=
2f0
        failing since 1 day (last pass: next-20240315, first fail: next-202=
40320) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
jetson-tk1             | arm    | lab-baylibre    | gcc-10   | multi_v7_def=
c...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65fd2256363f3b59bc4c42ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fd2256363f3b59bc4c4=
2eb
        failing since 710 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
kontron-kbox-a-230-ls  | arm64  | lab-kontron     | gcc-10   | defconfig+vi=
deodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/65fd1787e86ac77e0b4c42de

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240322/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240322/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fd1787e86ac77e0b4c42e5
        failing since 100 days (last pass: next-20231207, first fail: next-=
20231212)

    2024-03-22T05:30:22.425758  / ##
    2024-03-22T05:30:22.526802  export SHELL=3D/bin/sh
    2024-03-22T05:30:22.527106   #
    2024-03-22T05:30:22.627768  / # export SHELL=3D/bin/sh. /lava-446019/en=
vironment
    2024-03-22T05:30:22.628163  =

    2024-03-22T05:30:22.729127  / # . /lava-446019/environment/lava-446019/=
bin/lava-test-runner /lava-446019/1
    2024-03-22T05:30:22.730110  =

    2024-03-22T05:30:22.738249  / # /lava-446019/bin/lava-test-runner /lava=
-446019/1
    2024-03-22T05:30:22.794582  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-22T05:30:22.795007  + <8>[   20.933481] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 446019_1.5.2.4.5> =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65fd1787e86ac77e0b4c42e9
        failing since 100 days (last pass: next-20231207, first fail: next-=
20231212)

    2024-03-22T05:30:24.903899  /lava-446019/1/../bin/lava-test-case
    2024-03-22T05:30:24.904320  <8>[   23.044533] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-03-22T05:30:24.904637  /lava-446019/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
fd1787e86ac77e0b4c42eb
        failing since 100 days (last pass: next-20231207, first fail: next-=
20231212)

    2024-03-22T05:30:25.962314  /lava-446019/1/../bin/lava-test-case
    2024-03-22T05:30:25.962821  <8>[   24.083610] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65fd1787e86ac77e0b4c42f0
        failing since 100 days (last pass: next-20231207, first fail: next-=
20231212)

    2024-03-22T05:30:27.037620  /lava-446019/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65fd1787e86ac77e0b4c42f1
        failing since 100 days (last pass: next-20231207, first fail: next-=
20231212)

    2024-03-22T05:30:27.040830  <8>[   25.196447] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-22T05:30:28.078005  /lava-446019/1/../bin/lava-test-case   =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2 | arm64  | lab-kontron     | gcc-10   | defconfig+vi=
deodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/65fd1785520ba76e5b4c42db

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240322/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240322/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fd1785520ba76e5b4c42e2
        failing since 100 days (last pass: next-20231207, first fail: next-=
20231212)

    2024-03-22T05:30:23.660117  / # #
    2024-03-22T05:30:23.762140  export SHELL=3D/bin/sh
    2024-03-22T05:30:23.762873  #
    2024-03-22T05:30:23.863954  / # export SHELL=3D/bin/sh. /lava-446017/en=
vironment
    2024-03-22T05:30:23.864472  =

    2024-03-22T05:30:23.965315  / # . /lava-446017/environment/lava-446017/=
bin/lava-test-runner /lava-446017/1
    2024-03-22T05:30:23.966270  =

    2024-03-22T05:30:24.006119  / # /lava-446017/bin/lava-test-runner /lava=
-446017/1
    2024-03-22T05:30:24.039065  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-22T05:30:24.039270  + <8>[   21.128423] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 446017_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65fd1785520ba76e5b4c42f5
        failing since 100 days (last pass: next-20231207, first fail: next-=
20231212)

    2024-03-22T05:30:26.481042  /lava-446017/1/../bin/lava-test-case
    2024-03-22T05:30:26.481474  <8>[   23.556963] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-22T05:30:26.481747  /lava-446017/1/../bin/lava-test-case   =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
mt8173-elm-hana        | arm64  | lab-collabora   | gcc-10   | defconfig+ar=
m64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/65fd18e25fbad14eea4c43c6

  Results:     27 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240322/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240322/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.armv8-pmu-a72-probed: https://kernelci.org/test/case/id=
/65fd18e25fbad14eea4c43e3
        failing since 35 days (last pass: next-20240214, first fail: next-2=
0240215)

    2024-03-22T05:36:12.146114  <8>[   31.118954] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Darmv8-pmu-a53-probed RESULT=3Dfail>

    2024-03-22T05:36:13.168762  /lava-13118091/1/../bin/lava-test-case

    2024-03-22T05:36:13.175854  <8>[   32.149716] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Darmv8-pmu-a72-probed RESULT=3Dfail>
   =


  * baseline.bootrr.armv8-pmu-a53-probed: https://kernelci.org/test/case/id=
/65fd18e25fbad14eea4c43e4
        failing since 35 days (last pass: next-20240214, first fail: next-2=
0240215)

    2024-03-22T05:36:12.134326  /lava-13118091/1/../bin/lava-test-case
   =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-virt-gicv2    | arm    | lab-broonie     | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/65fd196f3274a22fd84c435a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fd196f3274a22fd84c4=
35b
        failing since 22 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-virt-gicv2    | arm    | lab-collabora   | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/65fd193c43c088540d4c439e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fd193c43c088540d4c4=
39f
        failing since 22 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-virt-gicv3    | arm    | lab-broonie     | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/65fd196d3274a22fd84c431f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fd196d3274a22fd84c4=
320
        failing since 22 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-virt-gicv3    | arm    | lab-collabora   | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/65fd1965c3f21a692d4c42dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fd1965c3f21a692d4c4=
2dd
        failing since 22 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
rk3288-rock2-square    | arm    | lab-collabora   | gcc-10   | multi_v7_def=
c...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65fd237553af261c604c42e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fd237553af261c604c4=
2ea
        failing since 485 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
rk3288-veyron-jaq      | arm    | lab-collabora   | gcc-10   | multi_v7_def=
c...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65fd2239bd49e99c6a4c42e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fd2239bd49e99c6a4c4=
2e4
        failing since 485 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
sun7i-a20-cubieboard2  | arm    | lab-baylibre    | gcc-10   | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65fd1e954580cc2c514c4309

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fd1e954580cc2c514c4312
        failing since 295 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-03-22T06:00:28.168421  / # #
    2024-03-22T06:00:28.269734  export SHELL=3D/bin/sh
    2024-03-22T06:00:28.270516  #
    2024-03-22T06:00:28.371750  / # export SHELL=3D/bin/sh. /lava-3960871/e=
nvironment
    2024-03-22T06:00:28.372129  =

    2024-03-22T06:00:28.472825  / # . /lava-3960871/environment/lava-396087=
1/bin/lava-test-runner /lava-3960871/1
    2024-03-22T06:00:28.473363  =

    2024-03-22T06:00:28.492227  / # /lava-3960871/bin/lava-test-runner /lav=
a-3960871/1
    2024-03-22T06:00:28.606150  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-22T06:00:28.607105  + cd /lava-3960871/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
sun7i-a20-cubieboard2  | arm    | lab-baylibre    | gcc-10   | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/65fd1fc036810311494c431a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fd1fc036810311494c4323
        failing since 295 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-03-22T06:05:25.896065  <8>[   13.780106] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3960896_1.5.2.4.1>
    2024-03-22T06:05:26.005171  / # #
    2024-03-22T06:05:26.108189  export SHELL=3D/bin/sh
    2024-03-22T06:05:26.109413  #
    2024-03-22T06:05:26.211198  / # export SHELL=3D/bin/sh. /lava-3960896/e=
nvironment
    2024-03-22T06:05:26.212290  =

    2024-03-22T06:05:26.313911  / # . /lava-3960896/environment/lava-396089=
6/bin/lava-test-runner /lava-3960896/1
    2024-03-22T06:05:26.315369  =

    2024-03-22T06:05:26.327687  / # /lava-3960896/bin/lava-test-runner /lav=
a-3960896/1
    2024-03-22T06:05:26.407401  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
sun7i-a20-cubieboard2  | arm    | lab-clabbe      | gcc-10   | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65fd1e794580cc2c514c42eb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fd1e794580cc2c514c42f4
        failing since 295 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-03-22T06:00:09.751606  + set +x
    2024-03-22T06:00:09.753376  [   24.096537] <LAVA_SIGNAL_ENDRUN 0_dmesg =
463086_1.5.2.4.1>
    2024-03-22T06:00:09.860429  / # #
    2024-03-22T06:00:09.962229  export SHELL=3D/bin/sh
    2024-03-22T06:00:09.963289  #
    2024-03-22T06:00:10.064376  / # export SHELL=3D/bin/sh. /lava-463086/en=
vironment
    2024-03-22T06:00:10.064825  =

    2024-03-22T06:00:10.165715  / # . /lava-463086/environment/lava-463086/=
bin/lava-test-runner /lava-463086/1
    2024-03-22T06:00:10.166479  =

    2024-03-22T06:00:10.169013  / # /lava-463086/bin/lava-test-runner /lava=
-463086/1 =

    ... (12 line(s) more)  =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
sun7i-a20-cubieboard2  | arm    | lab-clabbe      | gcc-10   | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/65fd1fa48f4b5904164c4322

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240322/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fd1fa48f4b5904164c432b
        failing since 295 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-03-22T06:05:03.885748  + set +x[   18.736123] <LAVA_SIGNAL_ENDRUN =
0_dmesg 463090_1.5.2.4.1>
    2024-03-22T06:05:03.886079  =

    2024-03-22T06:05:03.995889  / # #
    2024-03-22T06:05:04.097695  export SHELL=3D/bin/sh
    2024-03-22T06:05:04.098268  #
    2024-03-22T06:05:04.199242  / # export SHELL=3D/bin/sh. /lava-463090/en=
vironment
    2024-03-22T06:05:04.199757  =

    2024-03-22T06:05:04.300669  / # . /lava-463090/environment/lava-463090/=
bin/lava-test-runner /lava-463090/1
    2024-03-22T06:05:04.301569  =

    2024-03-22T06:05:04.304294  / # /lava-463090/bin/lava-test-runner /lava=
-463090/1 =

    ... (12 line(s) more)  =

 =20

