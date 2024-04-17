Return-Path: <linux-next+bounces-1960-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BABF28A83C9
	for <lists+linux-next@lfdr.de>; Wed, 17 Apr 2024 15:06:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 268361F238BA
	for <lists+linux-next@lfdr.de>; Wed, 17 Apr 2024 13:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD867D071;
	Wed, 17 Apr 2024 13:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Y5jFRWWQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88C7EDC
	for <linux-next@vger.kernel.org>; Wed, 17 Apr 2024 13:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713359181; cv=none; b=q1FcRkYEFhNDRl/8tbpxiHGJsZBwuQ3LXC1EwW9tj0z84ZBRVG1btGtnETE7X88eH/evCNM+tjCVRscao+MuLI8LTrPTOJMxpYr74CX5WNDV0Q80RCT2vJk19y4R9Bbjm09laLUDE4pB9uuCuj09qLZeDv3n5TYMxGCfwAbT9ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713359181; c=relaxed/simple;
	bh=u4kXCQ4TePfxPqceJfH6FY3aERbEKU8z+fXxYZHPiW0=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=sWfkfzFIZmZbCCDsIv0dakxEwsz4hlAHzyJbfnCV76Dl7kqcBfp1lzekXtSpMW8So6dSj2ppr3EP5MIySrOV0+H9wq9YW1xzag1BTAnliHpm/ylEvmFwlyVyfEihcu15lfZruRmvIKRuQ4veAB9vxeX0nuNijhO8RMCYqCV93qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Y5jFRWWQ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1e65b29f703so29337255ad.3
        for <linux-next@vger.kernel.org>; Wed, 17 Apr 2024 06:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1713359175; x=1713963975; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gieM0PlwVRZpwJ/k25rd/UWVHY1e4k+jsHkOiYj3S8A=;
        b=Y5jFRWWQBGj0eVk6JfIm48DqmDOT1tgve7/iWt6njkIMeOPlcG8fWBuBD6p/PyKWi2
         Clf5tv3FHHdM45xW1z7RFB22twWJA0fvZIt4grMAFcsm9OV9QX9IPpFrLLw/UEnyiku0
         U/ezYIPGnQYWAD8MJRiFqsbEjS6WjK8Y2ElfsP0bgOaKwZIlalVbVLmKeURZWoDYAThG
         bKIFQaxhDLL9cWcOe9RTie3246FJadJQ04vSjIxBu7+nZ9HfiQQ890xm1x/rC0aohFd3
         9tAAcuecmZV1EMh6g1W9g2539W81unfV8MXbcXGx1CESrydI0O1KvrBvBrVuqcSuZglt
         44zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713359175; x=1713963975;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gieM0PlwVRZpwJ/k25rd/UWVHY1e4k+jsHkOiYj3S8A=;
        b=N5c9s5PeyylPcCPxzwiOdtQ3O/q0qfyhY1TkK7G6N5PPP3RqaktZ0DasaILHThoRpL
         tr9YChHF1doe8UOyT1riMZwIVM4t5maR8oNSBP5KsmLL4MgrfDzINEl1oeHE50URkcE1
         ZIzr7XLwkuTQBJLcn3yQgdgtwVpeZBGufx9p3jGrMKm6z6VF/3xNpbRGxKS5hQul/YH8
         CumD8Rasl03IYH2lCSmK6zIQ6T3SdHWTe7HZsoI1GzBekhZ6R/NR18HueESppdKm9UG7
         gwTjRGoMlvdmTzAV7FfN83pVJ4GvZAN5NK0kaNHZhJ1mU4+Aj00mfl83z84gXPU1f2pQ
         /PFg==
X-Gm-Message-State: AOJu0YzAmw7z3GIMxFCQeUC/65N7XrDluwUakW+P6aNQgZCw8TNdRGRs
	QCV2PHXQ3eyrVDCzYktdbfHjgtMg7fKG+gVsPbyF3diFwbZmkCHaFQwLUp+WAtxLF+dtPuLqVQT
	SeUM=
X-Google-Smtp-Source: AGHT+IEyUF1/9VtuHihUNXq2W4lMgze3Llrxw5KjEngj/hcRjFiAXpB2sWL4osIUilPswJ8qz4q7zw==
X-Received: by 2002:a17:90b:4382:b0:2a2:e0b8:2ceb with SMTP id in2-20020a17090b438200b002a2e0b82cebmr14681476pjb.15.1713359175400;
        Wed, 17 Apr 2024 06:06:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id j6-20020a17090aeb0600b002a574ab7f5esm1298896pjz.53.2024.04.17.06.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 06:06:15 -0700 (PDT)
Message-ID: <661fc947.170a0220.2869b.378e@mx.google.com>
Date: Wed, 17 Apr 2024 06:06:15 -0700 (PDT)
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
X-Kernelci-Kernel: next-20240417
X-Kernelci-Report-Type: test
Subject: next/master baseline: 203 runs, 14 regressions (next-20240417)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 203 runs, 14 regressions (next-20240417)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =

beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defconfig           | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | gcc-10   | multi_v=
7_defconfig+kselftest | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron     | gcc-10   | multi_v=
7_defconfig+kselftest | 1          =

meson-g12b-a3...libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+videodec           | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+videodec           | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+videodec           | 1          =

qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240417/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240417
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4eab358930711bbeb85bf5ee267d0d42d3394c2c =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/661f8c5401a418d59e4c42e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240417/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240417/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/661f8c5401a418d59e4c4=
2e7
        failing since 317 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/661f92c1c58d915d0b4c42da

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240417/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240417/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/661f92c1c58d915d=
0b4c42df
        failing since 6 days (last pass: next-20240408, first fail: next-20=
240410)
        1 lines

    2024-04-17T09:13:30.999299  / # =

    2024-04-17T09:13:31.008223  =

    2024-04-17T09:13:31.112637  / # #
    2024-04-17T09:13:31.120249  #
    2024-04-17T09:13:31.222402  / # export SHELL=3D/bin/sh
    2024-04-17T09:13:31.232226  export SHELL=3D/bin/sh
    2024-04-17T09:13:31.333875  / # . /lava-1121332/environment
    2024-04-17T09:13:31.344109  . /lava-1121332/environment
    2024-04-17T09:13:31.445992  / # /lava-1121332/bin/lava-test-runner /lav=
a-1121332/0
    2024-04-17T09:13:31.455949  /lava-1121332/bin/lava-test-runner /lava-11=
21332/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/661f8dfb10695bab9c4c433d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20240417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/661f8dfb10695bab9c4c4=
33e
        failing since 616 days (last pass: next-20220808, first fail: next-=
20220810) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | gcc-10   | multi_v=
7_defconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/661f87bde7c0971a244c42db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240417/arm/=
multi_v7_defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240417/arm/=
multi_v7_defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/661f87bde7c0971a244c4=
2dc
        failing since 9 days (last pass: next-20240325, first fail: next-20=
240408) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron     | gcc-10   | multi_v=
7_defconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/661f87a9ee141ede1d4c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240417/arm/=
multi_v7_defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240417/arm/=
multi_v7_defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/661f87a9ee141ede1d4c4=
2db
        failing since 9 days (last pass: next-20240325, first fail: next-20=
240408) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a3...libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/661f99f5663f27f6914c4328

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240417/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-meson-g12b-a311d-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240417/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-meson-g12b-a311d-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/661f99f5663f27f6914c4=
329
        failing since 2 days (last pass: next-20240318, first fail: next-20=
240415) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/661f9939ac86a8138d4c42e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240417/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-=
cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240417/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-=
cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/661f9939ac86a8138d4c4=
2ea
        failing since 2 days (last pass: next-20240408, first fail: next-20=
240415) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/661f99456e92be40d74c42de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240417/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-c=
c.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240417/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-c=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/661f99456e92be40d74c4=
2df
        failing since 2 days (last pass: next-20240408, first fail: next-20=
240415) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/661f8ce219acd3bb144c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/661f8ce219acd3bb144c4=
2db
        failing since 48 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/661f8ce108aeedf6bf4c4312

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/661f8ce108aeedf6bf4c4=
313
        failing since 48 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/661f8ce3b76ad1bae54c42f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/661f8ce3b76ad1bae54c4=
2f7
        failing since 48 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/661f8ccdb76ad1bae54c42ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/661f8ccdb76ad1bae54c4=
2ee
        failing since 48 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/661f8a23f572c159b24c42f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240417/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240417/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/661f8a23f572c159b24c4=
2fa
        failing since 511 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/661f89202b8d4fdad94c42de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240417/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240417/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/661f89202b8d4fdad94c4=
2df
        failing since 511 days (last pass: next-20221121, first fail: next-=
20221122) =

 =20

