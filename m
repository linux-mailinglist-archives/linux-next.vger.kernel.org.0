Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA477BF6A9
	for <lists+linux-next@lfdr.de>; Tue, 10 Oct 2023 11:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbjJJI7r (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Oct 2023 04:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjJJI7q (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Oct 2023 04:59:46 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2130DB9
        for <linux-next@vger.kernel.org>; Tue, 10 Oct 2023 01:59:44 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3ae214a077cso4166458b6e.0
        for <linux-next@vger.kernel.org>; Tue, 10 Oct 2023 01:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1696928383; x=1697533183; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xOCAghNb5q3MpC1TACRIbIZr94Db8T+insBmjJDmKTo=;
        b=nBFYdNrSA4amRg93+N+TzVZGylRwqzxVuhxt+QEGg75oxJnpbHv52ZigmVrCmeHALq
         AXDyg2/j9yv8hMr+fBCqJYCUjZc2Pfqlng317aTA22JJWRig+361llIz3GtDeqm9JOSy
         UlcYg5rHQVXO32vqUMEu3NyyRi9FY75S7FZDqprdAKwy0gQfTpZb09P02baH17+lx/8B
         No1cvV/aT4T/tdIwTBktSFtXxttC1nUe9sVazGsPABZr6aXO6Um9uW7Kntf0T7h/aBlh
         rX+b2sHvMmv7TskoWPnkv8BrExk8tY4IAlh5W8DssuckJSU/O2BFIWmti3s80Nh8Nf5J
         kccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696928383; x=1697533183;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xOCAghNb5q3MpC1TACRIbIZr94Db8T+insBmjJDmKTo=;
        b=jDkdFz/5qatLN2DcyajriqDm48gcKj2N5Sdf6h6JDjASrGOwKO14tnMIgI6Vj0nPh9
         HnJevPYBbMH8YCmX3FrT6/BoXKR1OGPN8GDj9qRmi4ePiqIECoqNXkuFexZ8/lq8vLyC
         W2WgXPdvh2hylyocdcFzzI8lLh/bvalTKVfrZxzfpSdl82dDAW4T9lAFV63ebg8S+UUu
         ai6k0X5UCSvSbO4maluIQ+OM4baHwDNLrGxYfVBUmg/82sUS7nOC5Hqa7L47rAt42BV/
         7u1seYUz4ion8+H/l99DXE7CEQyWkf0PGtOkFIj5aOgAEWC/o6quENAi20q1GbGYCmM8
         p7EQ==
X-Gm-Message-State: AOJu0YzbKLRhviv04IGkEeyFTBe3jA/LTUIvqt6dxCX2QEUUdqoC6AAe
        EwQGfswWFh9gDiWaVfp/oNz9cHYJnh/sKduCYEIS+A==
X-Google-Smtp-Source: AGHT+IHpjgiU5YcofFBsjSJCZsQvhHNpocjJ8+ts7R2JNUTAS9F8psMN56uTc6BshldrChB82G3Bag==
X-Received: by 2002:a05:6358:7206:b0:13c:f631:bed with SMTP id h6-20020a056358720600b0013cf6310bedmr16705830rwa.32.1696928382554;
        Tue, 10 Oct 2023 01:59:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id c6-20020a633506000000b0058579ef9577sm9599629pga.79.2023.10.10.01.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 01:59:41 -0700 (PDT)
Message-ID: <6525127d.630a0220.b7378.8cba@mx.google.com>
Date:   Tue, 10 Oct 2023 01:59:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-rc5-269-g00b249acca70
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 69 runs,
 17 regressions (v6.6-rc5-269-g00b249acca70)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 69 runs, 17 regressions (v6.6-rc5-269-g00b249a=
cca70)

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
v6.6-rc5-269-g00b249acca70/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.6-rc5-269-g00b249acca70
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      00b249acca70baaa39f56e37f5d5ed5da9bc550f =



Test Regressions
---------------- =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
imx8mn-ddr4-evk            | arm64  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/6524e135389a600da9efcf2a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524e135389a600da9efcf33
        failing since 11 days (last pass: v6.5-rc2-295-ge510699ebeee, first=
 fail: v6.6-rc3-321-gad82df6ef94b)

    2023-10-10T05:29:08.668026  + set<8>[   19.547396] <LAVA_SIGNAL_ENDRUN =
0_dmesg 3798728_1.5.2.4.1>
    2023-10-10T05:29:08.668221   +x
    2023-10-10T05:29:08.773209  / # #
    2023-10-10T05:29:09.926972  export SHELL=3D/bin/sh
    2023-10-10T05:29:09.932319  #
    2023-10-10T05:29:11.471648  / # export SHELL=3D/bin/sh. /lava-3798728/e=
nvironment
    2023-10-10T05:29:11.477022  =

    2023-10-10T05:29:14.284567  / # . /lava-3798728/environment/lava-379872=
8/bin/lava-test-runner /lava-3798728/1
    2023-10-10T05:29:14.290187  =

    2023-10-10T05:29:14.290401  / # /lava-3798728/bin/lava-<3>[   23.695322=
] caam_jr 30902000.jr: 20000256: CCB: desc idx 2: RNG: Prediction resistanc=
e =

    ... (13 line(s) more)  =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
imx8mp-evk                 | arm64  | lab-broonie  | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/6524e1d350b94bcc29efcf5c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6524e1d350b94bcc29efcf65
        failing since 35 days (last pass: v6.5-5353-gb22935905f9c, first fa=
il: v6.5-12059-g16fdf769151b)

    2023-10-10T05:31:40.774446  + set<8>[   28.164939] <LAVA_SIGNAL_ENDRUN =
0_dmesg 159762_1.5.2.4.1>
    2023-10-10T05:31:40.774863   +x
    2023-10-10T05:31:40.885483  =

    2023-10-10T05:31:42.051003  / # #export SHELL=3D/bin/sh
    2023-10-10T05:31:42.057178  =

    2023-10-10T05:31:43.556567  / # export SHELL=3D/bin/sh. /lava-159762/en=
vironment
    2023-10-10T05:31:43.562669  =

    2023-10-10T05:31:46.286004  / # . /lava-159762/environment/lava-159762/=
bin/lava-test-runner /lava-159762/1
    2023-10-10T05:31:46.292805  =

    2023-10-10T05:31:46.294306  / # /lava-159762/bin/lava-test-runner /lava=
-159762/1 =

    ... (13 line(s) more)  =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_arm-virt-gicv2        | arm    | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6524e15e6dde3b4fceefcf15

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524e15e6dde3b4fceefc=
f16
        failing since 11 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_arm-virt-gicv2-uefi   | arm    | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6524e15f83f93b43edefcef5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524e15f83f93b43edefc=
ef6
        failing since 11 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_arm-virt-gicv3        | arm    | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6524e15d0988bcb222efcef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524e15d0988bcb222efc=
ef4
        failing since 11 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_arm-virt-gicv3-uefi   | arm    | lab-baylibre | gcc-10   | multi_v7_de=
fconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6524e1606dde3b4fceefcf1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524e1606dde3b4fceefc=
f1c
        failing since 11 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_arm64-virt-gicv2      | arm64  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/6524e0e7389a600da9efcef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524e0e7389a600da9efc=
ef4
        failing since 11 days (last pass: v6.5-rc2-295-ge510699ebeee, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/6524e0e56a7fa4edfaefcef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524e0e56a7fa4edfaefc=
ef4
        failing since 11 days (last pass: v6.5-rc2-295-ge510699ebeee, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_arm64-virt-gicv3      | arm64  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/6524e0e8389a600da9efcef7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524e0e8389a600da9efc=
ef8
        failing since 11 days (last pass: v6.5-rc2-295-ge510699ebeee, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/6524e0e66a7fa4edfaefcef7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vir=
t-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524e0e66a7fa4edfaefc=
ef8
        failing since 11 days (last pass: v6.5-rc2-295-ge510699ebeee, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_i386                  | i386   | lab-baylibre | gcc-10   | i386_defcon=
fig     | 1          =


  Details:     https://kernelci.org/test/plan/id/6524deca7e787df02aefcefa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524deca7e787df02aefc=
efb
        failing since 11 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_i386-uefi             | i386   | lab-baylibre | gcc-10   | i386_defcon=
fig     | 1          =


  Details:     https://kernelci.org/test/plan/id/6524dec87e787df02aefcef4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524dec97e787df02aefc=
ef5
        failing since 11 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_riscv64               | riscv  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/6524df06b2fbf288e2efcf26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_riscv64.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_riscv64.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524df06b2fbf288e2efc=
f27
        failing since 11 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, firs=
t fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_smp8_riscv64          | riscv  | lab-baylibre | gcc-10   | defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/6524df05fdf300acdcefcf38

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_smp8_risc=
v64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_smp8_risc=
v64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524df05fdf300acdcefc=
f39
        failing since 11 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, firs=
t fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_x86_64                | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/6524deccb2fbf288e2efcefe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524deccb2fbf288e2efc=
eff
        failing since 11 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, firs=
t fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_x86_64-uefi           | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/6524decbb2fbf288e2efcefb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524decbb2fbf288e2efc=
efc
        failing since 11 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, firs=
t fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
        | regressions
---------------------------+--------+--------------+----------+------------=
--------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/6524deca7e787df02aefcef7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-26=
9-g00b249acca70/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6524deca7e787df02aefc=
ef8
        failing since 11 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, firs=
t fail: v6.6-rc3-321-gad82df6ef94b) =

 =20
