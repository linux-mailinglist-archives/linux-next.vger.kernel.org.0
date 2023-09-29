Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC3A7B2AFB
	for <lists+linux-next@lfdr.de>; Fri, 29 Sep 2023 06:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbjI2EcN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Sep 2023 00:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjI2EcN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 Sep 2023 00:32:13 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD0531A2
        for <linux-next@vger.kernel.org>; Thu, 28 Sep 2023 21:32:09 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1c3bd829b86so111518955ad.0
        for <linux-next@vger.kernel.org>; Thu, 28 Sep 2023 21:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695961929; x=1696566729; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KVu88zExrfJUmjjHv1RMnekhlyrYqz4DMtQ4Lbd01xY=;
        b=AmIPNe4QqXzMZ+kVMvQGjfXGBucxSvTDDUa4/Lcu/nCXa3pqsT/j6c/m3tL6eiVfaN
         4qUmDUTOANeetN/RH93lXdj2q/zadre7hXNuZfM6ZpwIYu9Auzx4qdjT3vchpZOhyky5
         J7as9XnSj3e9gy4BV/t2BeTArjLbtipx9eiP9a4MJKU1CaGU0KxwryBCtw9hekrE6j+C
         CD6JCyFd//cgt6qtZbZUNj0yuHrMOeQOujoHEhuVBvBvUm8YHKBLpEf0QOPovgUj2WoB
         zwl1jII56N2s9cIR+n/LsK1XW6sw+rrhItXZuhTsxzCMO3M2+frRG1hhxslX5Ys0Bves
         WRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695961929; x=1696566729;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KVu88zExrfJUmjjHv1RMnekhlyrYqz4DMtQ4Lbd01xY=;
        b=j5PUqpbes1xGGjUk2n331zHSFilBE/hCzQQujYEgMHrfo3dDhUjKOytcNTZ2DocMpn
         CeUaJOrzEyO9ixZnl9nIm/Vuc9r6RFFJohhl36f1gUwjg5PHRMtkM1fHgV83ujOK4fTe
         1wFMKOZImC54ovJ7Ec866GEBo1Nge1zhMaig49YFvcCs9toqAKVg6bnIHZLA+ZwBWYw9
         05qSfHDUaS8MInjZGkDUrXtvpriemI9M0jkXw+u99wK/NC3YMXjvFGLNd1xWnQFJgQs4
         FHx2Gyhr1KReYbuXzT1cxLywK/3SjhIVBA6a81eJv5dFC4IEWog+DXtMNz6POws4bkDV
         4RBA==
X-Gm-Message-State: AOJu0Yyf2GcQCyi+765pV2e+alT8tZrgtJGak6XqBuL5rVTsfs0n7+jQ
        NvWJdOrFiypQOjhue43LtcSfeNo2hQSI90szie6/3g==
X-Google-Smtp-Source: AGHT+IGQdCC1Us/kNDs/A33ysIZ6TLkOAswUQaKt3DENUkWP+c9H92UpVHixiuzNDslfNblNTxjPZw==
X-Received: by 2002:a17:903:18f:b0:1bf:69af:b4e4 with SMTP id z15-20020a170903018f00b001bf69afb4e4mr3573502plg.37.1695961928787;
        Thu, 28 Sep 2023 21:32:08 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id g11-20020a170902868b00b001c22292ad7esm4418024plo.232.2023.09.28.21.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 21:32:07 -0700 (PDT)
Message-ID: <65165347.170a0220.25212.0719@mx.google.com>
Date:   Thu, 28 Sep 2023 21:32:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc3-342-g4bd3c2b6ac51
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 67 runs,
 17 regressions (v6.6-rc3-342-g4bd3c2b6ac51)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 67 runs, 17 regressions (v6.6-rc3-342-g4bd3c2b=
6ac51)

Regressions Summary
-------------------

platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
imx8mn-ddr4-evk            | arm64  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =

imx8mp-evk                 | arm64  | lab-broonie  | gcc-10   | defconfig  =
        | 1          =

qemu_arm-virt-gicv2        | arm    | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =

qemu_arm-virt-gicv2-uefi   | arm    | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =

qemu_arm-virt-gicv3        | arm    | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =

qemu_arm-virt-gicv3-uefi   | arm    | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =

qemu_arm64-virt-gicv2      | arm64  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =

qemu_arm64-virt-gicv3      | arm64  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =

qemu_i386                  | i386   | lab-baylibre | gcc-10   | i386_defcon=
fig     | 1          =

qemu_i386-uefi             | i386   | lab-baylibre | gcc-10   | i386_defcon=
fig     | 1          =

qemu_riscv64               | riscv  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =

qemu_smp8_riscv64          | riscv  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =

qemu_x86_64                | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig   | 1          =

qemu_x86_64-uefi           | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig   | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.6-rc3-342-g4bd3c2b6ac51/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.6-rc3-342-g4bd3c2b6ac51
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4bd3c2b6ac5170584f2fcca0ad94cd890073b4c8 =



Test Regressions
---------------- =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
imx8mn-ddr4-evk            | arm64  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/6516227d2ec6fbaa468a0acd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6516227d2ec6fbaa468a0ad6
        failing since 0 day (last pass: v6.5-rc2-295-ge510699ebeee, first f=
ail: v6.6-rc3-321-gad82df6ef94b)

    2023-09-29T01:03:38.981998  + set<8>[   18.251778] <LAVA_SIGNAL_ENDRUN =
0_dmesg 3788673_1.5.2.4.1>
    2023-09-29T01:03:38.982217   +x
    2023-09-29T01:03:39.086970  / # #
    2023-09-29T01:03:40.241042  export SHELL=3D/bin/sh
    2023-09-29T01:03:40.246444  #
    2023-09-29T01:03:41.786114  / # export SHELL=3D/bin/sh. /lava-3788673/e=
nvironment
    2023-09-29T01:03:41.791510  =

    2023-09-29T01:03:44.599429  / # . /lava-3788673/environment/lava-378867=
3/bin/lava-test-runner /lava-3788673/1
    2023-09-29T01:03:44.605084  =

    2023-09-29T01:03:44.605302  / # /lava-3788673/bin/lava-t<3>[   22.41650=
3] caam_jr 30902000.jr: 20000256: CCB: desc idx 2: RNG: Prediction resistan=
ce =

    ... (13 line(s) more)  =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
imx8mp-evk                 | arm64  | lab-broonie  | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/651622802ec6fbaa468a0ad8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651622802ec6fbaa468a0ae1
        failing since 24 days (last pass: v6.5-5353-gb22935905f9c, first fa=
il: v6.5-12059-g16fdf769151b)

    2023-09-29T01:03:39.665680  + set<8>[   29.884825] <LAVA_SIGNAL_ENDRUN =
0_dmesg 139586_1.5.2.4.1>
    2023-09-29T01:03:39.666271   +x
    2023-09-29T01:03:39.775060  / # #
    2023-09-29T01:03:40.940985  export SHELL=3D/bin/sh
    2023-09-29T01:03:40.947093  #
    2023-09-29T01:03:42.446036  / # export SHELL=3D/bin/sh. /lava-139586/en=
vironment
    2023-09-29T01:03:42.452107  =

    2023-09-29T01:03:45.175582  / # . /lava-139586/environment/lava-139586/=
bin/lava-test-runner /lava-139586/1
    2023-09-29T01:03:45.182295  =

    2023-09-29T01:03:45.183103  / # /lava-139586/bin/lava-test-runner /lava=
-139586/1 =

    ... (12 line(s) more)  =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_arm-virt-gicv2        | arm    | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/651621f154d389c13f8a0a55

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651621f154d389c13f8a0=
a56
        failing since 0 day (last pass: v6.5-rc2-353-g4b0f0b4c6081, first f=
ail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_arm-virt-gicv2-uefi   | arm    | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/651622f51dea49cace8a0a52

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651622f51dea49cace8a0=
a53
        failing since 0 day (last pass: v6.5-rc2-353-g4b0f0b4c6081, first f=
ail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_arm-virt-gicv3        | arm    | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65162241bd779795848a0a75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65162241bd779795848a0=
a76
        failing since 0 day (last pass: v6.5-rc2-353-g4b0f0b4c6081, first f=
ail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_arm-virt-gicv3-uefi   | arm    | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/651622918590d94eba8a0a6a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651622918590d94eba8a0=
a6b
        failing since 0 day (last pass: v6.5-rc2-353-g4b0f0b4c6081, first f=
ail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_arm64-virt-gicv2      | arm64  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/65162435c60a7cc1748a0ace

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65162435c60a7cc1748a0=
acf
        failing since 0 day (last pass: v6.5-rc2-295-ge510699ebeee, first f=
ail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/65162345f1585a80938a0aa7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65162345f1585a80938a0=
aa8
        failing since 0 day (last pass: v6.5-rc2-295-ge510699ebeee, first f=
ail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_arm64-virt-gicv3      | arm64  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/651623955e2049be458a0a43

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651623955e2049be458a0=
a44
        failing since 0 day (last pass: v6.5-rc2-295-ge510699ebeee, first f=
ail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/651623e5b58e6df3918a0a4a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651623e5b58e6df3918a0=
a4b
        failing since 0 day (last pass: v6.5-rc2-295-ge510699ebeee, first f=
ail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_i386                  | i386   | lab-baylibre | gcc-10   | i386_defcon=
fig     | 1          =


  Details:     https://kernelci.org/test/plan/id/651620b021b2a2d9ca8a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651620b021b2a2d9ca8a0=
a43
        failing since 0 day (last pass: v6.5-rc2-353-g4b0f0b4c6081, first f=
ail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_i386-uefi             | i386   | lab-baylibre | gcc-10   | i386_defcon=
fig     | 1          =


  Details:     https://kernelci.org/test/plan/id/65162100f3bd30f2fe8a0b3a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65162100f3bd30f2fe8a0=
b3b
        failing since 0 day (last pass: v6.5-rc2-353-g4b0f0b4c6081, first f=
ail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_riscv64               | riscv  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/651621a1736646030a8a0a55

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_riscv64.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_riscv64.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651621a1736646030a8a0=
a56
        failing since 0 day (last pass: v6.5-rc3-160-g3ab5fb77387e6, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_smp8_riscv64          | riscv  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/65162150c8341284548a0a62

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_smp8_risc=
v64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_smp8_risc=
v64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65162150c8341284548a0=
a63
        failing since 0 day (last pass: v6.5-rc3-160-g3ab5fb77387e6, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_x86_64                | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/65161fc026dccc7aa18a0ac7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65161fc026dccc7aa18a0=
ac8
        failing since 0 day (last pass: v6.5-rc3-160-g3ab5fb77387e6, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_x86_64-uefi           | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/65162060a6eb5635948a0a69

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65162060a6eb5635948a0=
a6a
        failing since 0 day (last pass: v6.5-rc3-160-g3ab5fb77387e6, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/65162010668062ca908a0a9e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-34=
2-g4bd3c2b6ac51/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65162010668062ca908a0=
a9f
        failing since 0 day (last pass: v6.5-rc3-160-g3ab5fb77387e6, first =
fail: v6.6-rc3-321-gad82df6ef94b) =

 =20
