Return-Path: <linux-next+bounces-4558-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9199B7A61
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2024 13:17:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CE6A1F24361
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2024 12:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19610197A98;
	Thu, 31 Oct 2024 12:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="2tQqcBNu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1400419CC00
	for <linux-next@vger.kernel.org>; Thu, 31 Oct 2024 12:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730377022; cv=none; b=QP9N89H8dX0xV2ca5h1bj7lOw18LQBtHbkwF+XsjANGljT4zoM0X+MQPxI8W1C+umCZ1ZzNLSjamgUOMLoKgxIzIMNynNPBNBLR8ZfgSu+4tE5MCdKVtoLi7H85QJNXDraACnoGhr4HOp6T6XJ7NkBZxmSH5tbskkdx0si708yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730377022; c=relaxed/simple;
	bh=d0dMIlH7tP6yjtBeDGzT5natKi8nZ867w/skEEaGEv0=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=OcreBWElo4qgCDoFDH1exNPKxISeI8QbH1lrcwPN2/JYTRxgQdvBcmqY9IfbyTXGFP+taMzqj30F9QZ+9r0d+xMJAXnWh0dC8djf1wjM3KeWq1Sjd4w4Mxw+RDQggL0jcl9KwUGGuz/Wj9SIv3MQL2Fzk2AOCAfBYx8zC0tf/Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=2tQqcBNu; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71e592d7f6eso621869b3a.3
        for <linux-next@vger.kernel.org>; Thu, 31 Oct 2024 05:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1730377015; x=1730981815; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=emnIFtRhoi/fsmanFkPOls9xNH7ybA+m4vgme2vfKPc=;
        b=2tQqcBNuGp9Qs9BxEkDxujhNq3PDeGo+pyyaX4ZDzLc60+RMBNYO150vNrOcGlVYpm
         BVbTmSKyOFy7tJwJD70J7mn3A+0edjk1g6j0NEGNqMncMwvIp/WPIsEPIJk5uOki6TeA
         V5MjKsFhZLII5/9n4EnbowV0Fjl8tJkD8oiqyWlkM5QVPIbVx1RKX6z3opQKFutv7npe
         c8OmpBCMaN96QUD8NCjTg4stQ8AL7fwR1cvcu3SOfe3FtzSKZPT3sxCLsTQsKQQ6Y9NO
         b5svYz4U8/yHqFAjMLbr6HbK8IgW6GeAhhOBmL3EISdFOlyAmy9piSb9VQFk+0nFPqel
         n68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730377015; x=1730981815;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=emnIFtRhoi/fsmanFkPOls9xNH7ybA+m4vgme2vfKPc=;
        b=pf9eWKUshagfvuI9W1DNfnaI3gP6vZycPUdFjAV6T0aSANQjk6SviEWgpm22WDRlbW
         Adat5psihtVSR84Ix8J3MaKWWekBgoGnElU5mdEsROJ7OOLqoafpuaT2OFphBboEroc6
         bGQuHGeee2A9J3P4/yfichMq8DwHnZ35srVRN7mxN2UYaiZupy8BeJAx1RhRKFBV0CSf
         nQuiAnFTXHp1ykwOk2xA5P49PBmrEqjclApxzzNvvemtn/HcdYRPUrT14/+AiaeftyjJ
         +B/PbDECLFzYUHp6ffRDbj8XTkWJvIJwOcn7UeP+U4IoS/w5L1L89s+E+WD7Zo4mwDAI
         turQ==
X-Gm-Message-State: AOJu0Yzf8RUQEnnlBcMysqBk/TTkRHWTPWspeqEuOByzlkuFeYqgPlQ7
	Z1pcPKo1ccwavxz6R3zVWcrR1693HSmPH8OXJ5EXPCyjpg8kjDK1QagohrupbWs7VO0AVw7xCQw
	J
X-Google-Smtp-Source: AGHT+IHTiRs8u8Q4FHRtq/o3UJx+jZWi8/wOysQhWHBfUPaDGD+f11tSyAJ5Igz/ErHwoKAe5txAeg==
X-Received: by 2002:a05:6a00:a1d:b0:71e:5de:ad6d with SMTP id d2e1a72fcca58-72063094ed0mr25843164b3a.24.1730377014275;
        Thu, 31 Oct 2024 05:16:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2eb5a1sm1006080b3a.150.2024.10.31.05.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 05:16:53 -0700 (PDT)
Message-ID: <67237535.620a0220.34144a.2f60@mx.google.com>
Date: Thu, 31 Oct 2024 05:16:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20241031
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 145 runs, 54 regressions (next-20241031)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 145 runs, 54 regressions (next-20241031)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
bcm2711-rpi-4-b              | arm64 | lab-broonie  | clang-17 | defconfig =
                   | 1          =

beaglebone-black             | arm   | lab-cip      | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

beaglebone-black             | arm   | lab-cip      | gcc-12   | multi_v7_d=
efconfig           | 1          =

beaglebone-black             | arm   | lab-cip      | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

hifive-unleashed-a00         | riscv | lab-baylibre | clang-17 | defconfig =
                   | 1          =

hifive-unleashed-a00         | riscv | lab-baylibre | gcc-12   | defconfig =
                   | 1          =

imx6dl-udoo                  | arm   | lab-broonie  | gcc-12   | multi_v7_d=
efconfig           | 1          =

imx6dl-udoo                  | arm   | lab-broonie  | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

imx6q-udoo                   | arm   | lab-broonie  | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-broonie  | clang-17 | defconfig =
                   | 1          =

jetson-tk1                   | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

jetson-tk1                   | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre | gcc-12   | tegra_defc=
onfig              | 1          =

juno-uboot                   | arm64 | lab-broonie  | clang-17 | defconfig =
                   | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron  | clang-17 | defconfig =
                   | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig           | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig           | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron  | clang-17 | defconfig =
                   | 1          =

meson-g12a-u200              | arm64 | lab-baylibre | clang-17 | defconfig =
                   | 1          =

meson-g12a-x96-max           | arm64 | lab-baylibre | clang-17 | defconfig =
                   | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre | clang-17 | defconfig =
                   | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie  | clang-17 | defconfig =
                   | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =

meson-sm1-s90...libretech-cc | arm64 | lab-broonie  | clang-17 | defconfig =
                   | 1          =

meson-sm1-s90...libretech-cc | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =

qemu_arm-vexpress-a15        | arm   | lab-broonie  | gcc-12   | vexpress_d=
efconfig           | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-broonie  | clang-17 | defconfig =
                   | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie  | clang-17 | defconfig =
                   | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-broonie  | clang-17 | defconfig =
                   | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie  | clang-17 | defconfig =
                   | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =

qemu_smp8_riscv64            | riscv | lab-broonie  | clang-17 | defconfig =
                   | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip      | gcc-12   | shmobile_d=
efconfig           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip      | clang-17 | defconfig =
                   | 1          =

stm32mp157a-dhcor-avenger96  | arm   | lab-broonie  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =

stm32mp157a-dhcor-avenger96  | arm   | lab-broonie  | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

stm32mp157a-dhcor-avenger96  | arm   | lab-broonie  | gcc-12   | multi_v7_d=
efconfig           | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie  | clang-17 | defconfig =
                   | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe   | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre | gcc-12   | sunxi_defc=
onfig              | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe   | gcc-12   | sunxi_defc=
onfig              | 1          =

zynqmp-zcu102                | arm64 | lab-cip      | clang-17 | defconfig =
                   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
241031/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20241031
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f9f24ca362a4d84dd8aeb4b8f3ec28cb6c43dd06 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
bcm2711-rpi-4-b              | arm64 | lab-broonie  | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/67233d5192094787dbc86861

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-broonie/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-broonie/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233d5192094787dbc86=
862
        new failure (last pass: next-20241025) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
beaglebone-black             | arm   | lab-cip      | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/67233ec8e89bf3aa7bc86864

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-cip/baseline-beaglebone-black.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-cip/baseline-beaglebone-black.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/67233ec8e89bf3aa=
7bc86868
        failing since 2 days (last pass: next-20241028, first fail: next-20=
241029)
        1 lines

    2024-10-31T08:24:33.912880  / # =

    2024-10-31T08:24:33.921794  =

    2024-10-31T08:24:34.026796  / # #
    2024-10-31T08:24:34.033497  #
    2024-10-31T08:24:34.151545  / # export SHELL=3D/bin/sh
    2024-10-31T08:24:34.161594  export SHELL=3D/bin/sh
    2024-10-31T08:24:34.263399  / # . /lava-1214296/environment
    2024-10-31T08:24:34.273327  . /lava-1214296/environment
    2024-10-31T08:24:34.375219  / # /lava-1214296/bin/lava-test-runner /lav=
a-1214296/0
    2024-10-31T08:24:34.385237  /lava-1214296/bin/lava-test-runner /lava-12=
14296/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
beaglebone-black             | arm   | lab-cip      | gcc-12   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6723417079beeca2f8c86855

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig/gcc-12/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig/gcc-12/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6723417079beeca2=
f8c8685a
        failing since 2 days (last pass: next-20241025, first fail: next-20=
241028)
        1 lines

    2024-10-31T08:35:40.300043  / # =

    2024-10-31T08:35:40.308908  =

    2024-10-31T08:35:40.413977  / # #
    2024-10-31T08:35:40.420778  #
    2024-10-31T08:35:40.522886  / #export SHELL=3D/bin/sh
    2024-10-31T08:35:40.532686   export SHELL=3D/bin/sh
    2024-10-31T08:35:40.634518  / # . /lava-1214306/environment
    2024-10-31T08:35:40.644565  . /lava-1214306/environment
    2024-10-31T08:35:40.746434  / # /lava-1214306/bin/lava-test-runner /lav=
a-1214306/0
    2024-10-31T08:35:40.756537  /lava-1214306/bin/lava-test-runner /lava-12=
14306/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
beaglebone-black             | arm   | lab-cip      | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/672348280b48b731aec86872

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-cip/baseline-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-cip/baseline-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/672348280b48b731=
aec86877
        failing since 0 day (last pass: next-20241029, first fail: next-202=
41030)
        1 lines

    2024-10-31T09:04:20.588948  / # =

    2024-10-31T09:04:20.595018  =

    2024-10-31T09:04:20.698338  / # #
    2024-10-31T09:04:20.704326  #
    2024-10-31T09:04:20.805524  / # export SHELL=3D/bin/sh
    2024-10-31T09:04:20.811571  export SHELL=3D/bin/sh
    2024-10-31T09:04:20.912511  / # . /lava-1214328/environment
    2024-10-31T09:04:20.918690  . /lava-1214328/environment
    2024-10-31T09:04:21.019681  / # /lava-1214328/bin/lava-test-runner /lav=
a-1214328/0
    2024-10-31T09:04:21.024585  /lava-1214328/bin/lava-test-runner /lava-12=
14328/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/67233ab5d81989d9ebc86857

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/risc=
v/defconfig/clang-17/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/risc=
v/defconfig/clang-17/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233ab5d81989d9ebc86=
858
        new failure (last pass: next-20241029) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre | gcc-12   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/67233d9d5ee48a0a46c86864

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/risc=
v/defconfig/gcc-12/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/risc=
v/defconfig/gcc-12/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233d9d5ee48a0a46c86=
865
        new failure (last pass: next-20241030) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx6dl-udoo                  | arm   | lab-broonie  | gcc-12   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/67233dc925bca89b9bc8686f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig/gcc-12/lab-broonie/baseline-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig/gcc-12/lab-broonie/baseline-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233dc925bca89b9bc86=
870
        new failure (last pass: next-20241030) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx6dl-udoo                  | arm   | lab-broonie  | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/67233f1d6b64c53872c86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-broonie/baseline-imx=
6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-broonie/baseline-imx=
6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233f1d6b64c53872c86=
856
        new failure (last pass: next-20241030) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx6q-udoo                   | arm   | lab-broonie  | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/67234539a92867777ec86881

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-broonie/baseline-imx=
6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-broonie/baseline-imx=
6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67234539a92867777ec86=
882
        new failure (last pass: next-20241030) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx8mp-evk                   | arm64 | lab-broonie  | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/67233e4f385b23ad74c86879

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233e4f385b23ad74c86=
87a
        new failure (last pass: next-20241025) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
jetson-tk1                   | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/67233ca96c300984fdc86867

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-baylibre/baseline-jetson-tk1.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-baylibre/baseline-jetson-tk1.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233ca96c300984fdc86=
868
        failing since 20 days (last pass: next-20241008, first fail: next-2=
0241011) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
jetson-tk1                   | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/67233d49620bd048d2c86869

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-baylibre/baseline-je=
tson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-baylibre/baseline-je=
tson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233d49620bd048d2c86=
86a
        new failure (last pass: next-20241030) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
jetson-tk1                   | arm   | lab-baylibre | gcc-12   | tegra_defc=
onfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6723362e2081e19d7ac86866

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm/=
tegra_defconfig/gcc-12/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm/=
tegra_defconfig/gcc-12/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6723362e2081e19d7ac86=
867
        new failure (last pass: next-20241030) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
juno-uboot                   | arm64 | lab-broonie  | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/67233ea15687086ab3c86876

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-broonie/baseline-juno-uboot.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-broonie/baseline-juno-uboot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233ea15687086ab3c86=
877
        new failure (last pass: next-20241025) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron  | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/67233d4f92094787dbc8685e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233d4f92094787dbc86=
85f
        new failure (last pass: next-20241025) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/672337366f528c09e4c86873

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672337366f528c09e4c86=
874
        failing since 64 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/67233eb9527541da23c8685f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-kontron/baseline-kontron-kswit=
ch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-kontron/baseline-kontron-kswit=
ch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233eb9527541da23c86=
860
        failing since 2 days (last pass: next-20241022, first fail: next-20=
241028) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/672340393cecab2a85c8685d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig/gcc-12/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g-2=
gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig/gcc-12/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g-2=
gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672340393cecab2a85c86=
85e
        failing since 5 days (last pass: next-20241022, first fail: next-20=
241025) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/672341afa52e134747c86862

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-kontron/baseline-kon=
tron-kswitch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-kontron/baseline-kon=
tron-kswitch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672341afa52e134747c86=
863
        failing since 2 days (last pass: next-20241021, first fail: next-20=
241028) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/67233735cd264eac41c8685c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233735cd264eac41c86=
85d
        failing since 64 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/67233eb7527541da23c8685c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-kontron/baseline-kontron-kswit=
ch-d10-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-kontron/baseline-kontron-kswit=
ch-d10-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233eb7527541da23c86=
85d
        failing since 2 days (last pass: next-20241022, first fail: next-20=
241028) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/672340333cecab2a85c86858

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig/gcc-12/lab-kontron/baseline-kontron-kswitch-d10-mmt-8g.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig/gcc-12/lab-kontron/baseline-kontron-kswitch-d10-mmt-8g.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672340333cecab2a85c86=
859
        failing since 5 days (last pass: next-20241022, first fail: next-20=
241025) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/672341b1fc0a1c4d97c86857

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-kontron/baseline-kon=
tron-kswitch-d10-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-kontron/baseline-kon=
tron-kswitch-d10-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672341b1fc0a1c4d97c86=
858
        failing since 2 days (last pass: next-20241021, first fail: next-20=
241028) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron  | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/67233d3f620bd048d2c86866

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233d3f620bd048d2c86=
867
        new failure (last pass: next-20241025) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-g12a-u200              | arm64 | lab-baylibre | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/67233d5f76d81ee305c86869

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233d5f76d81ee305c86=
86a
        new failure (last pass: next-20241025) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/67233d61779456125ec86860

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233d61779456125ec86=
861
        new failure (last pass: next-20241025) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/67233d5eb73e77bbf6c8685c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233d5eb73e77bbf6c86=
85d
        new failure (last pass: next-20241025) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie  | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/67234150fdf8770896c8685d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67234150fdf8770896c86=
85e
        new failure (last pass: next-20241025) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6723446726e86a7100c8685c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-12/lab-broonie/baseline-meson-gxl=
-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-12/lab-broonie/baseline-meson-gxl=
-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6723446726e86a7100c86=
85d
        new failure (last pass: next-20241030) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-sm1-s90...libretech-cc | arm64 | lab-broonie  | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/6723520885317fdfa5c86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-broonie/baseline-meson-sm1-s905d3-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-broonie/baseline-meson-sm1-s905d3-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6723520885317fdfa5c86=
856
        new failure (last pass: next-20241008) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-sm1-s90...libretech-cc | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/67235370f6c242b17ec86857

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-12/lab-broonie/baseline-meson-sm1=
-s905d3-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-12/lab-broonie/baseline-meson-sm1=
-s905d3-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67235370f6c242b17ec86=
858
        new failure (last pass: next-20241028) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm-vexpress-a15        | arm   | lab-broonie  | gcc-12   | vexpress_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/672335fc6ced09f5ebc8685e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm/=
vexpress_defconfig/gcc-12/lab-broonie/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm/=
vexpress_defconfig/gcc-12/lab-broonie/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672335fc6ced09f5ebc86=
85f
        new failure (last pass: next-20241030) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-broonie  | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/67233d5676d81ee305c8685d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233d5676d81ee305c86=
85e
        failing since 13 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6723365ae9de675011c8685a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6723365ae9de675011c86=
85b
        failing since 13 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie  | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/67233d6b896ec6e3a8c86859

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233d6b896ec6e3a8c86=
85a
        failing since 13 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/67233662998946ea83c86861

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233662998946ea83c86=
862
        failing since 13 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-broonie  | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/67233d635ee48a0a46c86858

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233d635ee48a0a46c86=
859
        failing since 13 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/67233663998946ea83c86864

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233663998946ea83c86=
865
        failing since 13 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie  | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/67233d0714508e2e1dc8685d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233d0714508e2e1dc86=
85e
        failing since 13 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6723366161b8d03e25c8685d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-12/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6723366161b8d03e25c86=
85e
        failing since 13 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_smp8_riscv64            | riscv | lab-broonie  | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/67233b619530ebd7f0c8686a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/risc=
v/defconfig/clang-17/lab-broonie/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/risc=
v/defconfig/clang-17/lab-broonie/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233b619530ebd7f0c86=
86b
        new failure (last pass: next-20241029) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip      | gcc-12   | shmobile_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/672334042c45cb59cdc86877

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672334042c45cb59cdc86=
878
        failing since 13 days (last pass: next-20241016, first fail: next-2=
0241017) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip      | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/67233ea0e89bf3aa7bc86857

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233ea0e89bf3aa7bc86=
858
        new failure (last pass: next-20241025) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
stm32mp157a-dhcor-avenger96  | arm   | lab-broonie  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/67233a3f25c872a284c86863

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-broonie/baseline-stm32mp157a-dhcor-=
avenger96.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-broonie/baseline-stm32mp157a-dhcor-=
avenger96.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233a3f25c872a284c86=
864
        new failure (last pass: next-20241029) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
stm32mp157a-dhcor-avenger96  | arm   | lab-broonie  | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/67233f667fb0cec397c86862

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-broonie/baseline-stm=
32mp157a-dhcor-avenger96.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-broonie/baseline-stm=
32mp157a-dhcor-avenger96.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233f667fb0cec397c86=
863
        new failure (last pass: next-20241030) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
stm32mp157a-dhcor-avenger96  | arm   | lab-broonie  | gcc-12   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/672340bcebfa80f7f5c86876

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig/gcc-12/lab-broonie/baseline-stm32mp157a-dhcor-avenger96.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig/gcc-12/lab-broonie/baseline-stm32mp157a-dhcor-avenger96.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672340bcebfa80f7f5c86=
877
        new failure (last pass: next-20241030) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie  | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/67233dc29135236e83c8686c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-broonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233dc29135236e83c86=
86d
        new failure (last pass: next-20241025) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6723443f3ff38c0d3ec86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-12/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-12/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6723443f3ff38c0d3ec86=
856
        new failure (last pass: next-20241030) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/67233eee8837611f1dc86858

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig/gcc-12/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig/gcc-12/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233eee8837611f1dc86=
859
        new failure (last pass: next-20241030) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/672340553cecab2a85c86864

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672340553cecab2a85c86=
865
        new failure (last pass: next-20241030) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe   | gcc-12   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/67233f0f8837611f1dc86862

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233f0f8837611f1dc86=
863
        new failure (last pass: next-20241030) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre | gcc-12   | sunxi_defc=
onfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/672339b1c5075b658ec86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm/=
sunxi_defconfig/gcc-12/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm/=
sunxi_defconfig/gcc-12/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672339b1c5075b658ec86=
856
        new failure (last pass: next-20241030) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe   | gcc-12   | sunxi_defc=
onfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/672339a644c4bd582bc86859

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm/=
sunxi_defconfig/gcc-12/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm/=
sunxi_defconfig/gcc-12/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/672339a644c4bd582bc86=
85a
        new failure (last pass: next-20241030) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
zynqmp-zcu102                | arm64 | lab-cip      | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/67233c344f803ae7dbc8685a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241031/arm6=
4/defconfig/clang-17/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/67233c344f803ae7dbc86=
85b
        new failure (last pass: next-20241025) =

 =20

