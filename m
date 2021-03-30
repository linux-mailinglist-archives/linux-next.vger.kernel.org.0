Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C03434E92C
	for <lists+linux-next@lfdr.de>; Tue, 30 Mar 2021 15:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231873AbhC3NdT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Mar 2021 09:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231434AbhC3NdE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Mar 2021 09:33:04 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 302A2C061574
        for <linux-next@vger.kernel.org>; Tue, 30 Mar 2021 06:33:03 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id y32so10581169pga.11
        for <linux-next@vger.kernel.org>; Tue, 30 Mar 2021 06:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=mgW63YF5EWDEyUCwWuV2QEu+2tWdSUd/wf956NC9a9k=;
        b=QVXTUSAP+8JMCggNnPvVBwkNi7DNBGyZVECSX+xtNrkAJpzuSKMcvtzotmElF4oNdA
         M21VJYJ427ihw2QC/Zhv2N3/QS0Gp/BOoNcPo6wiqL7dqtEODuhcwqLCRGZvdfMCt1D/
         lfdbExnmYvR2g43mInzgjtlucUqfqGWYRohB4KVYdJxFG8dBhpdFEjehlnM9JaywVE5/
         /zUvdex1G9/eyyDzLhqRQ6Wip17fk5yUCcKwNp8eqzgYc4Qv0OGgqYXcv9/glc7zIz3A
         0Aw4YGGUqSvKOrVf3QUpD0vmbLGC4nIxJJ+Mc25WgXwrP4Dh0GMOem1FWByk1/e2KfRz
         4WMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=mgW63YF5EWDEyUCwWuV2QEu+2tWdSUd/wf956NC9a9k=;
        b=OyKogC2LZBtc/0XoFoBgwzzIskk33fG9oaNSDizrdheu8mFSjzeKRkHjGtJGQjQoCB
         4ngukxwsA6HjqLldc6OcA5D0QpyzLThMpvtAIw/te5DatJLpqFtJoiczrprMLnIEwswN
         63xV5onTegWVY+GxRciG0qLaLAKzghrQWvrx78ktpfaazGQ5So78b+RHo6rZmZ8hPmDW
         p04HOcsoA8VU7KxtpgD9zHkaPkj3/xI9YP7grhzhBe7rb4Mrc+Z0o2edZw3E32FYICvX
         ESLPSk1AwIOj48Pd7to1gJXbh7QpeZa/Rizd8dpbScTGkON+QbyNd7bJwFq4Oc+wZxKi
         MGJg==
X-Gm-Message-State: AOAM530PRO0PCuIAZusKe2Ueh6H0p+jkZh/Y3YrAH98fkrpV/OnCJK25
        +C+ESVqiH3XIJT6CrCp7YF7BTlZ05ojPesab
X-Google-Smtp-Source: ABdhPJxHTsNJIPjFeQfOBW6kEMGUxa2pOu9NZkVFuZFruQLdQE+PnCYfaZVE/iHVXggaNgQ/PeDiTA==
X-Received: by 2002:a63:1502:: with SMTP id v2mr28222977pgl.22.1617111182505;
        Tue, 30 Mar 2021 06:33:02 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 190sm19887866pgh.61.2021.03.30.06.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 06:33:02 -0700 (PDT)
Message-ID: <6063288e.1c69fb81.28e55.01b4@mx.google.com>
Date:   Tue, 30 Mar 2021 06:33:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20210330
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 352 runs, 7 regressions (next-20210330)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 352 runs, 7 regressions (next-20210330)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
bcm2837-rpi-3-b-32   | arm   | lab-baylibre    | gcc-8    | bcm2835_defconf=
ig   | 1          =

hifive-unleashed-a00 | riscv | lab-baylibre    | gcc-8    | defconfig      =
     | 1          =

qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig | 1          =

qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig | 1          =

qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig | 1          =

qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig | 1          =

qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210330/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210330
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4143e05b7b171902f4938614c2a68821e1af46bc =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
bcm2837-rpi-3-b-32   | arm   | lab-baylibre    | gcc-8    | bcm2835_defconf=
ig   | 1          =


  Details:     https://kernelci.org/test/plan/id/6062ebe5370a3d89a4af02d7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210330/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210330/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6062ebe5370a3d89a4af0=
2d8
        failing since 4 days (last pass: next-20210324, first fail: next-20=
210325) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
hifive-unleashed-a00 | riscv | lab-baylibre    | gcc-8    | defconfig      =
     | 1          =


  Details:     https://kernelci.org/test/plan/id/6062ebb7536c7833c0af02bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210330/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210330/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6062ebb7536c7833c0af0=
2bc
        failing since 6 days (last pass: next-20210312, first fail: next-20=
210323) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6062eb6e36271a18c4af02b6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210330/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210330/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6062eb6e36271a18c4af0=
2b7
        failing since 132 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6062eb755c0f1fbff7af02e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210330/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210330/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6062eb755c0f1fbff7af0=
2e8
        failing since 132 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6062eb7536271a18c4af02c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210330/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210330/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6062eb7536271a18c4af0=
2c6
        failing since 132 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6062fe4fdaba60a02ddac6d8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210330/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210330/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6062fe4fdaba60a02ddac=
6d9
        failing since 132 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6063238357f954dc26dac6b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210330/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210330/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6063238357f954dc26dac=
6b2
        failing since 132 days (last pass: next-20201113, first fail: next-=
20201117) =

 =20
