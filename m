Return-Path: <linux-next+bounces-1678-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0896788139D
	for <lists+linux-next@lfdr.de>; Wed, 20 Mar 2024 15:44:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D2481C20977
	for <lists+linux-next@lfdr.de>; Wed, 20 Mar 2024 14:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C5353E0D;
	Wed, 20 Mar 2024 14:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="AvTdZ5J1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D8052F70
	for <linux-next@vger.kernel.org>; Wed, 20 Mar 2024 14:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710945783; cv=none; b=SqTP9Sh7ZKY4/zYB2XtLaxecYunxp9AYvocFBL4CA3Kfkym4VbLVX4BEXXLFMfuiE6iaatbetz/OyRSZ0RbedqkBquazrVxpkDJmZgtsC+0EoK720++cg9ebNJGzMsLP/fS0I+yAYOSCQoO5yDi3UHyCALenjaxHk/kTGXs7U0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710945783; c=relaxed/simple;
	bh=xrzD+zXTzwGBVw6oU4CIe95CWZGZbUXBWV2N2kEgKvA=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=FRSp4/8QHy4N0A+5eYT8wpSVWGTPr1VvtF/70u+reN1TTjYjT98F9IpSj7GapTXIwfm3wBc/m1WNR5RBQ3Sq0D5rQk0uUIf9gyk0UFEJt22++Cy2eGt/njhLr9eooFwLfgVkh4XwgkfafnOhLLq+CdSjkZgGmtcvEqB9ITJNYPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=AvTdZ5J1; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e6b5432439so6436367b3a.1
        for <linux-next@vger.kernel.org>; Wed, 20 Mar 2024 07:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1710945779; x=1711550579; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pdAx5i7bBmRkOMTrMwtMz0eTNCu1opVLubmMK3WhC70=;
        b=AvTdZ5J1kkWVarfFfRpozh+BDGI9ZQ8qztvCWbyvnDoenibqN0XcshrIANAJWF0PL/
         khCTfUfWPWfvrxMhWKQbh8t8VAOGSNBsIWcP5egdhxH0et3E+ZSUBewh/KSsAfwmo7nJ
         KX7ImN4O88wRtWsPMVhLrYLID3IrKLVW1bObgeRE1kIsWMvXg8zMa/ezo05A9kctJwqS
         z5KOdhFW69ldVvxAF5OEPWNA/aYP979fV2Jy6krh/aMGPOabKRrw7P5IBSdH4Zvw1WyO
         OjRb0kHuKKP8lVKTWpDbymKhAyOUyk4g6rSrUmq17lucOHrLZBh7cVAfC0IjQJ9g/W3V
         1ZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710945779; x=1711550579;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdAx5i7bBmRkOMTrMwtMz0eTNCu1opVLubmMK3WhC70=;
        b=RoFsqtwLBwou6NNx2tHJNczQPuv3yA7Xv+3ngLdTAlt3hvThZ+Y6wUlrtNAoP8l7Sr
         ncsclzbCl+/zZty4T9BMs509L82ABjwL+6OL+/O9BQ/obW3eQe10ySnOcb1H0Jpv6hSd
         TT68uT7+2c9lqSS8ph1yioNBTcoLs6EkBxJDUfYu72V/Y23xOhKU6YpDOPLkL5KbfWfW
         jvXINZvX6GnhAJqBK2CYRb8JW91/CTwHLYZiUueaw8v8S73uFmD4RCHQ6jzPzICSdydi
         V2r+YOvcFzP1YhUfOSqIGbXnbzU4TYZx8OjF8JnAS6X1URSQbppJb59AeZwIurFa/VHT
         PkPA==
X-Gm-Message-State: AOJu0Yyy1fuGdpwF6n2SjWYNo8PD3KLYwAMbcerDeAKktf5jlJub4vjY
	NhLxdK6woALgQhfpWMN9xoBDF/OZAeYerqo4hJp++bstyt/IsLhnNGPms/kYLcRgqPvadap+ee4
	802Q=
X-Google-Smtp-Source: AGHT+IEepvYSqdxghFjWF2U7WOrK5zsPzXIPK3qqnjqgeF2IQnJ1gVKYoTAx6OU1eaSXmUU2gqcIxw==
X-Received: by 2002:a05:6a00:99d:b0:6e6:9a14:8d1c with SMTP id u29-20020a056a00099d00b006e69a148d1cmr22565576pfg.25.1710945778340;
        Wed, 20 Mar 2024 07:42:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id n9-20020a63ee49000000b005dc4f9cecdcsm11031221pgk.86.2024.03.20.07.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 07:42:57 -0700 (PDT)
Message-ID: <65faf5f1.630a0220.e5bdb.056c@mx.google.com>
Date: Wed, 20 Mar 2024 07:42:57 -0700 (PDT)
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
X-Kernelci-Kernel: next-20240320
X-Kernelci-Report-Type: test
Subject: next/master baseline: 380 runs, 38 regressions (next-20240320)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 380 runs, 38 regressions (next-20240320)

Regressions Summary
-------------------

platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
acer-R721T-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+x86-board   | 1          =

bcm2836-rpi-2-b          | arm    | lab-collabora   | gcc-10   | bcm2835_de=
fconfig            | 1          =

bcm2836-rpi-2-b          | arm    | lab-collabora   | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

beagle-xm                | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

beaglebone-black         | arm    | lab-cip         | gcc-10   | multi_v7_d=
efconfig           | 1          =

hp-11A-G6-EE-grunt       | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+x86-board   | 1          =

hp-14-db0003na-grunt     | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+x86-board   | 1          =

imx8mm-innocomm-wb15-evk | arm64  | lab-pengutronix | clang-17 | defconfig =
                   | 1          =

jetson-tk1               | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =

jetson-tk1               | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efconfig           | 1          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron     | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 5          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron     | gcc-10   | defconfig =
                   | 1          =

kontron-pitx-imx8m       | arm64  | lab-kontron     | clang-17 | defconfig =
                   | 2          =

kontron-sl28-var3-ads2   | arm64  | lab-kontron     | clang-17 | defconfig =
                   | 2          =

kontron-sl28-var3-ads2   | arm64  | lab-kontron     | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 2          =

mt8173-elm-hana          | arm64  | lab-collabora   | gcc-10   | defconfig+=
arm64-chromebook   | 2          =

mt8195-cherry-tomato-r2  | arm64  | lab-collabora   | gcc-10   | defconfig+=
arm64-chromebook   | 1          =

qemu_riscv64             | riscv  | lab-broonie     | gcc-10   | defconfig+=
debug              | 1          =

qemu_riscv64             | riscv  | lab-collabora   | gcc-10   | defconfig+=
debug              | 1          =

qemu_smp8_riscv64        | riscv  | lab-broonie     | gcc-10   | defconfig+=
debug              | 1          =

qemu_smp8_riscv64        | riscv  | lab-collabora   | gcc-10   | defconfig+=
debug              | 1          =

r8a774a1-hihope-rzg2m-ex | arm64  | lab-cip         | clang-17 | defconfig =
                   | 1          =

rk3288-rock2-square      | arm    | lab-collabora   | gcc-10   | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq        | arm    | lab-collabora   | gcc-10   | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =

sun7i-a20-cubieboard2    | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2    | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2    | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efconfig           | 1          =

sun7i-a20-cubieboard2    | arm    | lab-clabbe      | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2    | arm    | lab-clabbe      | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2    | arm    | lab-clabbe      | gcc-10   | multi_v7_d=
efconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240320/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240320
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      72fb52fb0ac44b6a1edd9bc390e44bce3acccd26 =



Test Regressions
---------------- =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
acer-R721T-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65fab8ea25d93943104c4391

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fab8ea25d93943104c4=
392
        failing since 20 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora   | gcc-10   | bcm2835_de=
fconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65fab6c1b8547f00f64c42e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fab6c1b8547f00f64c4=
2ea
        failing since 289 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora   | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65fabd8e8f07ec4e8a4c4301

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fabd8e8f07ec4e8a4c4=
302
        failing since 357 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
beagle-xm                | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65fabd96afefe5545c4c42e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fabd96afefe5545c4c4=
2ea
        failing since 355 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
beaglebone-black         | arm    | lab-cip         | gcc-10   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65fac3f82b00cd77ae4c42da

  Results:     40 PASS, 9 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/65fac3f82b00cd77=
ae4c42df
        new failure (last pass: next-20240318)
        1 lines

    2024-03-20T11:09:18.430458  / # =

    2024-03-20T11:09:18.439335  =

    2024-03-20T11:09:18.545146  / # #
    2024-03-20T11:09:18.551285  #
    2024-03-20T11:09:18.694609  / # export SHELL=3D/bin/sh
    2024-03-20T11:09:18.711242  export SHELL=3D/bin/sh
    2024-03-20T11:09:18.813181  / # . /lava-1109550/environment
    2024-03-20T11:09:18.823230  . /lava-1109550/environment
    2024-03-20T11:09:18.925256  / # /lava-1109550/bin/lava-test-runner /lav=
a-1109550/0
    2024-03-20T11:09:18.935035  /lava-1109550/bin/lava-test-runner /lava-11=
09550/0 =

    ... (9 line(s) more)  =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
hp-11A-G6-EE-grunt       | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65faba325e658fed624c432e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65faba325e658fed624c4=
32f
        failing since 20 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
hp-14-db0003na-grunt     | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65fab8cdf8ec1675c44c43b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fab8cdf8ec1675c44c4=
3b8
        failing since 20 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx8mm-innocomm-wb15-evk | arm64  | lab-pengutronix | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/65fab9aa6f74025d934c43f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/arm6=
4/defconfig/clang-17/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/arm6=
4/defconfig/clang-17/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fab9aa6f74025d934c4=
3f5
        new failure (last pass: next-20240318) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
jetson-tk1               | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65fabec999cd52b0c94c431d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fabec999cd52b0c94c4=
31e
        failing since 708 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
jetson-tk1               | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65fac0e74dc4cc54534c4339

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fac0e74dc4cc54534c4=
33a
        new failure (last pass: next-20240315) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron     | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/65fab802de11c062514c42f4

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fab802de11c062514c42fb
        failing since 98 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-03-20T10:18:16.990476  / # #
    2024-03-20T10:18:17.091603  export SHELL=3D/bin/sh
    2024-03-20T10:18:17.091901  #
    2024-03-20T10:18:17.192568  / # export SHELL=3D/bin/sh. /lava-444992/en=
vironment
    2024-03-20T10:18:17.192855  =

    2024-03-20T10:18:17.293577  / # . /lava-444992/environment/lava-444992/=
bin/lava-test-runner /lava-444992/1
    2024-03-20T10:18:17.294544  =

    2024-03-20T10:18:17.302939  / # /lava-444992/bin/lava-test-runner /lava=
-444992/1
    2024-03-20T10:18:17.358785  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-20T10:18:17.358925  + <8>[   20.690541] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 444992_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65fab802de11c062514c42ff
        failing since 98 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-03-20T10:18:18.431215  <8>[   21.778893] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-driver-present RESULT=3Dpass>
    2024-03-20T10:18:19.466512  /lava-444992/1/../bin/lava-test-case
    2024-03-20T10:18:19.466655  <8>[   22.800430] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-03-20T10:18:19.466753  /lava-444992/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
fab802de11c062514c4301
        failing since 98 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-03-20T10:18:20.528919  /lava-444992/1/../bin/lava-test-case
    2024-03-20T10:18:20.529098  <8>[   23.839473] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-03-20T10:18:20.529197  /lava-444992/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65fab802de11c062514c4306
        failing since 98 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-03-20T10:18:21.605436  /lava-444992/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65fab802de11c062514c4307
        failing since 98 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-03-20T10:18:21.608499  <8>[   24.957090] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-20T10:18:22.669434  /lava-444992/1/../bin/lava-test-case
    2024-03-20T10:18:22.669611  <8>[   25.979114] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-03-20T10:18:22.669709  /lava-444992/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron     | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/65fabb4adf5e2d6b304c430c

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fabb4adf5e2d6b304c4313
        failing since 26 days (last pass: next-20240221, first fail: next-2=
0240222)

    2024-03-20T10:32:25.148440  / # #
    2024-03-20T10:32:25.250577  export SHELL=3D/bin/sh
    2024-03-20T10:32:25.251298  #
    2024-03-20T10:32:25.352770  / # export SHELL=3D/bin/sh. /lava-445021/en=
vironment
    2024-03-20T10:32:25.353490  =

    2024-03-20T10:32:25.454981  / # . /lava-445021/environment/lava-445021/=
bin/lava-test-runner /lava-445021/1
    2024-03-20T10:32:25.456110  =

    2024-03-20T10:32:25.460045  / # /lava-445021/bin/lava-test-runner /lava=
-445021/1
    2024-03-20T10:32:25.519240  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-20T10:32:25.519664  + <8>[   20.705867] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 445021_1.5.2.4.5> =

    ... (14 line(s) more)  =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
kontron-pitx-imx8m       | arm64  | lab-kontron     | clang-17 | defconfig =
                   | 2          =


  Details:     https://kernelci.org/test/plan/id/65fab9baba6bc4a3e44c4307

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/arm6=
4/defconfig/clang-17/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/arm6=
4/defconfig/clang-17/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fab9baba6bc4a3e44c430e
        new failure (last pass: next-20240318)

    2024-03-20T10:25:35.565191  / # #
    2024-03-20T10:25:35.666772  export SHELL=3D/bin/sh
    2024-03-20T10:25:35.667380  #
    2024-03-20T10:25:35.768599  / # export SHELL=3D/bin/sh. /lava-445011/en=
vironment
    2024-03-20T10:25:35.769350  =

    2024-03-20T10:25:35.870484  / # . /lava-445011/environment/lava-445011/=
bin/lava-test-runner /lava-445011/1
    2024-03-20T10:25:35.871241  =

    2024-03-20T10:25:35.878801  / # /lava-445011/bin/lava-test-runner /lava=
-445011/1
    2024-03-20T10:25:35.941809  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-20T10:25:35.942086  + cd /lava-445011/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/65f=
ab9baba6bc4a3e44c431e
        new failure (last pass: next-20240318)

    2024-03-20T10:25:38.337710  /lava-445011/1/../bin/lava-test-case
    2024-03-20T10:25:38.338172  <8>[   18.305922] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2024-03-20T10:25:38.338566  /lava-445011/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
kontron-sl28-var3-ads2   | arm64  | lab-kontron     | clang-17 | defconfig =
                   | 2          =


  Details:     https://kernelci.org/test/plan/id/65fab956d50c7f17624c4365

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/arm6=
4/defconfig/clang-17/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/arm6=
4/defconfig/clang-17/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fab956d50c7f17624c436c
        failing since 100 days (last pass: next-20231208, first fail: next-=
20231211)

    2024-03-20T10:23:59.509442  / # #
    2024-03-20T10:23:59.611715  export SHELL=3D/bin/sh
    2024-03-20T10:23:59.612460  #
    2024-03-20T10:23:59.713929  / # export SHELL=3D/bin/sh. /lava-445010/en=
vironment
    2024-03-20T10:23:59.714671  =

    2024-03-20T10:23:59.816250  / # . /lava-445010/environment/lava-445010/=
bin/lava-test-runner /lava-445010/1
    2024-03-20T10:23:59.817463  =

    2024-03-20T10:23:59.861986  / # /lava-445010/bin/lava-test-runner /lava=
-445010/1
    2024-03-20T10:23:59.889973  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-20T10:23:59.890187  + <8>[   20.968448] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 445010_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65fab956d50c7f17624c437f
        failing since 100 days (last pass: next-20231208, first fail: next-=
20231211)

    2024-03-20T10:24:02.337517  /lava-445010/1/../bin/lava-test-case
    2024-03-20T10:24:02.338021  <8>[   23.401285] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-20T10:24:02.338307  /lava-445010/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
kontron-sl28-var3-ads2   | arm64  | lab-kontron     | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65fab8de25d93943104c42e4

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fab8de25d93943104c42eb
        failing since 98 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-03-20T10:22:02.216900  / # #
    2024-03-20T10:22:02.318874  export SHELL=3D/bin/sh
    2024-03-20T10:22:02.319636  #
    2024-03-20T10:22:02.420767  / # export SHELL=3D/bin/sh. /lava-444996/en=
vironment
    2024-03-20T10:22:02.421475  =

    2024-03-20T10:22:02.522629  / # . /lava-444996/environment/lava-444996/=
bin/lava-test-runner /lava-444996/1
    2024-03-20T10:22:02.523647  =

    2024-03-20T10:22:02.528506  / # /lava-444996/bin/lava-test-runner /lava=
-444996/1
    2024-03-20T10:22:02.596506  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-20T10:22:02.596933  + <8>[   21.134496] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 444996_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65fab8de25d93943104c42fe
        failing since 98 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-03-20T10:22:05.039571  /lava-444996/1/../bin/lava-test-case
    2024-03-20T10:22:05.040040  <8>[   23.563843] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-20T10:22:05.040392  /lava-444996/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
mt8173-elm-hana          | arm64  | lab-collabora   | gcc-10   | defconfig+=
arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/65fab8df25d93943104c434a

  Results:     27 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.armv8-pmu-a72-probed: https://kernelci.org/test/case/id=
/65fab8df25d93943104c4365
        failing since 34 days (last pass: next-20240214, first fail: next-2=
0240215)

    2024-03-20T10:24:58.305022  /lava-13106394/1/../bin/lava-test-case

    2024-03-20T10:24:58.316082  <8>[   32.683784] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Darmv8-pmu-a72-probed RESULT=3Dfail>
   =


  * baseline.bootrr.armv8-pmu-a53-probed: https://kernelci.org/test/case/id=
/65fab8df25d93943104c4366
        failing since 34 days (last pass: next-20240214, first fail: next-2=
0240215)

    2024-03-20T10:24:56.256642  <8>[   30.624527] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Darmv8-pmu-driver-present RESULT=3Dpass>

    2024-03-20T10:24:57.273234  /lava-13106394/1/../bin/lava-test-case

    2024-03-20T10:24:57.283911  <8>[   31.652232] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Darmv8-pmu-a53-probed RESULT=3Dfail>
   =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
mt8195-cherry-tomato-r2  | arm64  | lab-collabora   | gcc-10   | defconfig+=
arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/65fab8a39479ba62cd4c4310

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fab8a39479ba62cd4c4=
311
        new failure (last pass: next-20240315) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_riscv64             | riscv  | lab-broonie     | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65fac211a1ed17c8a54c42dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/risc=
v/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/risc=
v/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fac211a1ed17c8a54c4=
2de
        failing since 2 days (last pass: next-20240314, first fail: next-20=
240318) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_riscv64             | riscv  | lab-collabora   | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65fac19c1ddf7fc93f4c43ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/risc=
v/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/risc=
v/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fac19c1ddf7fc93f4c4=
3af
        failing since 2 days (last pass: next-20240314, first fail: next-20=
240318) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_smp8_riscv64        | riscv  | lab-broonie     | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65fac1d5614729f2e34c44db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/risc=
v/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/risc=
v/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fac1d5614729f2e34c4=
4dc
        failing since 2 days (last pass: next-20240314, first fail: next-20=
240318) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_smp8_riscv64        | riscv  | lab-collabora   | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65fac19b1ddf7fc93f4c43ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/risc=
v/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/risc=
v/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fac19b1ddf7fc93f4c4=
3ac
        failing since 2 days (last pass: next-20240314, first fail: next-20=
240318) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
r8a774a1-hihope-rzg2m-ex | arm64  | lab-cip         | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/65fac0b0e5691a6f7e4c43d5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fac0b0e5691a6f7e4c43de
        failing since 205 days (last pass: next-20230710, first fail: next-=
20230828)

    2024-03-20T10:55:14.300023  + set +x
    2024-03-20T10:55:14.303477  <8>[   28.614904] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1109496_1.5.2.4.1>
    2024-03-20T10:55:14.411810  / # #
    2024-03-20T10:55:15.876468  export SHELL=3D/bin/sh
    2024-03-20T10:55:15.897504  #
    2024-03-20T10:55:15.897968  / # export SHELL=3D/bin/sh
    2024-03-20T10:55:17.855925  / # . /lava-1109496/environment
    2024-03-20T10:55:21.457518  /lava-1109496/bin/lava-test-runner /lava-11=
09496/1
    2024-03-20T10:55:21.479041  . /lava-1109496/environment
    2024-03-20T10:55:21.479407  / # /lava-1109496/bin/lava-test-runner /lav=
a-1109496/1 =

    ... (27 line(s) more)  =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
rk3288-rock2-square      | arm    | lab-collabora   | gcc-10   | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65fabf823848d2cdb34c4363

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fabf823848d2cdb34c4=
364
        failing since 484 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
rk3288-veyron-jaq        | arm    | lab-collabora   | gcc-10   | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65fabe7f7b20935fac4c4477

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65fabe7f7b20935fac4c4=
478
        failing since 484 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2    | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65fab7be56926f7a3f4c42e1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fab7be56926f7a3f4c42ea
        failing since 293 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-03-20T10:16:59.977722  <8>[   16.609931] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3959404_1.5.2.4.1>
    2024-03-20T10:17:00.086729  / # #
    2024-03-20T10:17:00.189630  export SHELL=3D/bin/sh
    2024-03-20T10:17:00.190580  #
    2024-03-20T10:17:00.292934  / # export SHELL=3D/bin/sh. /lava-3959404/e=
nvironment
    2024-03-20T10:17:00.293834  =

    2024-03-20T10:17:00.395423  / # . /lava-3959404/environment/lava-395940=
4/bin/lava-test-runner /lava-3959404/1
    2024-03-20T10:17:00.396885  =

    2024-03-20T10:17:00.409320  / # /lava-3959404/bin/lava-test-runner /lav=
a-3959404/1
    2024-03-20T10:17:00.521437  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2    | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65fabd992fc2ae19cd4c4398

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fabd992fc2ae19cd4c43a1
        failing since 287 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-03-20T10:41:46.643430  / # #
    2024-03-20T10:41:46.746817  export SHELL=3D/bin/sh
    2024-03-20T10:41:46.747814  #
    2024-03-20T10:41:46.849399  / # export SHELL=3D/bin/sh. /lava-3959615/e=
nvironment
    2024-03-20T10:41:46.850224  =

    2024-03-20T10:41:46.951710  / # . /lava-3959615/environment/lava-395961=
5/bin/lava-test-runner /lava-3959615/1
    2024-03-20T10:41:46.953145  =

    2024-03-20T10:41:46.965878  / # /lava-3959615/bin/lava-test-runner /lav=
a-3959615/1
    2024-03-20T10:41:47.085338  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-20T10:41:47.086188  + cd /lava-3959615/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2    | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65fac1010f5a4ad1424c42f3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fac1010f5a4ad1424c42fc
        failing since 287 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-03-20T10:56:50.815989  <8>[   13.551966] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3959642_1.5.2.4.1>
    2024-03-20T10:56:50.922867  / # #
    2024-03-20T10:56:51.023887  export SHELL=3D/bin/sh
    2024-03-20T10:56:51.024650  #
    2024-03-20T10:56:51.125972  / # export SHELL=3D/bin/sh. /lava-3959642/e=
nvironment
    2024-03-20T10:56:51.126806  =

    2024-03-20T10:56:51.228351  / # . /lava-3959642/environment/lava-395964=
2/bin/lava-test-runner /lava-3959642/1
    2024-03-20T10:56:51.229860  =

    2024-03-20T10:56:51.246999  / # /lava-3959642/bin/lava-test-runner /lav=
a-3959642/1
    2024-03-20T10:56:51.355989  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2    | arm    | lab-clabbe      | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65fab7bc5d02e2a5674c42e2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fab7bc5d02e2a5674c42eb
        failing since 293 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-03-20T10:17:07.736022  + set +x
    2024-03-20T10:17:07.737848  [   22.767970] <LAVA_SIGNAL_ENDRUN 0_dmesg =
462891_1.5.2.4.1>
    2024-03-20T10:17:07.845894  / # #
    2024-03-20T10:17:07.947454  export SHELL=3D/bin/sh
    2024-03-20T10:17:07.947951  #
    2024-03-20T10:17:08.048901  / # export SHELL=3D/bin/sh. /lava-462891/en=
vironment
    2024-03-20T10:17:08.049409  =

    2024-03-20T10:17:08.150396  / # . /lava-462891/environment/lava-462891/=
bin/lava-test-runner /lava-462891/1
    2024-03-20T10:17:08.151225  =

    2024-03-20T10:17:08.153792  / # /lava-462891/bin/lava-test-runner /lava=
-462891/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2    | arm    | lab-clabbe      | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65fabd838f07ec4e8a4c42db

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fabd838f07ec4e8a4c42e4
        failing since 287 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-03-20T10:41:45.426700  + set +x
    2024-03-20T10:41:45.428474  [   20.285963] <LAVA_SIGNAL_ENDRUN 0_dmesg =
462901_1.5.2.4.1>
    2024-03-20T10:41:45.537553  / # #
    2024-03-20T10:41:45.639156  export SHELL=3D/bin/sh
    2024-03-20T10:41:45.639673  #
    2024-03-20T10:41:45.740675  / # export SHELL=3D/bin/sh. /lava-462901/en=
vironment
    2024-03-20T10:41:45.741201  =

    2024-03-20T10:41:45.842186  / # . /lava-462901/environment/lava-462901/=
bin/lava-test-runner /lava-462901/1
    2024-03-20T10:41:45.843000  =

    2024-03-20T10:41:45.846074  / # /lava-462901/bin/lava-test-runner /lava=
-462901/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2    | arm    | lab-clabbe      | gcc-10   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65fac107e815b264bf4c42f9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240320/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240320/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65fac107e815b264bf4c4302
        failing since 287 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-03-20T10:56:53.960709  + set +x
    2024-03-20T10:56:53.962460  [   21.781697] <LAVA_SIGNAL_ENDRUN 0_dmesg =
462909_1.5.2.4.1>
    2024-03-20T10:56:54.071158  / # #
    2024-03-20T10:56:54.172688  export SHELL=3D/bin/sh
    2024-03-20T10:56:54.173217  #
    2024-03-20T10:56:54.274227  / # export SHELL=3D/bin/sh. /lava-462909/en=
vironment
    2024-03-20T10:56:54.274980  =

    2024-03-20T10:56:54.376121  / # . /lava-462909/environment/lava-462909/=
bin/lava-test-runner /lava-462909/1
    2024-03-20T10:56:54.377022  =

    2024-03-20T10:56:54.379570  / # /lava-462909/bin/lava-test-runner /lava=
-462909/1 =

    ... (12 line(s) more)  =

 =20

