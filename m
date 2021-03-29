Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A0D934DCA6
	for <lists+linux-next@lfdr.de>; Tue, 30 Mar 2021 01:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbhC2Xxm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Mar 2021 19:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbhC2XxV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Mar 2021 19:53:21 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57044C061762
        for <linux-next@vger.kernel.org>; Mon, 29 Mar 2021 16:53:21 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id 11so10895087pfn.9
        for <linux-next@vger.kernel.org>; Mon, 29 Mar 2021 16:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jDhig+H8+4VzPZxcsVYgXDxfeL7f0OJIfAmnYC9hZnI=;
        b=W+UvVj2BC0HHegW/d9GKDHdFQUpUvE4gZjfmFg3dWtGA0ZNfXGPOEgGJmLKGy4nvPU
         H17jDHpiZ3jA8Xv2ObsTQo27ib/888cbMxcX45DA3SHYHU3hJG1qjCOvPkzuMUW7f7zd
         QcSVghSkpGnuEISRCu+bbH2iZK5Ty8jSiFRFeCNYiqoW8/b02YqR8atIyRfn20RIMOig
         iqhHUL/IFqO4zt3E/G2uCarAsW8qUD8TSwetpj8GbvegiSIUUnl70frHo1o00hTCNCdr
         uFNQvO4D9gZA9t4RVoFYRo2hcNKYz7EjPEN4r0CjGW7IA9WOfNOwLuTovRggWAdFxS/+
         uqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jDhig+H8+4VzPZxcsVYgXDxfeL7f0OJIfAmnYC9hZnI=;
        b=MuSwGh+1RRR5U1JILjHJAZ+n34lVolySlSG6ulXzIxLMu2f7S6c1ytWV5p/4JOJ3x8
         LIbg+/hTtPqAxpji+Q9LzD/Y2sHPL97DYKdSHU5NaG8o3uEZybyQnfCK5p2M6rJD+1V3
         kfIhGQEOuAkBPi0mnWZI45Gi3Ft9eJ9o8WXuyJnBul1D7R5nGavm5VDwzk9sZoddeW87
         xaVbb5//8csSCBlwsb478qd11P3d1UMThFAqjApH7k/vfm2H0HmoeiQniYvf+7OX/jzc
         S0pLWenscvWif3g3WRwGJyIOFlZAib7KNRxQca5ZNq3P8P4dsfSryLmfc0PgKyYxkgik
         GS6g==
X-Gm-Message-State: AOAM531fgZT/267gwtXV9mJz8F71A9kYQiI1osByE57KYfYn4lGKKyPo
        Ze56hZ2tYLXHBzZye6b66QlkK+jyyNc80pWJ
X-Google-Smtp-Source: ABdhPJxsaYRAwNhdstT0OUb4G/OLxH1zW5On8F78qyeHic1mkVbvaq26Af1EvaKVYOb3sJHkeu60Jw==
X-Received: by 2002:a05:6a00:852:b029:211:d819:7f57 with SMTP id q18-20020a056a000852b0290211d8197f57mr26848344pfk.17.1617062000620;
        Mon, 29 Mar 2021 16:53:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y22sm17925918pfn.32.2021.03.29.16.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 16:53:20 -0700 (PDT)
Message-ID: <60626870.1c69fb81.e77e7.cc09@mx.google.com>
Date:   Mon, 29 Mar 2021 16:53:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20210329
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 346 runs, 7 regressions (next-20210329)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 346 runs, 7 regressions (next-20210329)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
        | regressions
---------------------+-------+-----------------+----------+----------------=
--------+------------
bcm2837-rpi-3-b-32   | arm   | lab-baylibre    | gcc-8    | bcm2835_defconf=
ig      | 1          =

hifive-unleashed-a00 | riscv | lab-baylibre    | clang-11 | defconfig+CONFI=
G_EFI=3Dn | 1          =

qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig    | 1          =

qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig    | 1          =

qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig    | 1          =

qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig    | 1          =

qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig    | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210329/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210329
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9d49ed9ca93b8c564033c1d6808017bc9052b5db =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
        | regressions
---------------------+-------+-----------------+----------+----------------=
--------+------------
bcm2837-rpi-3-b-32   | arm   | lab-baylibre    | gcc-8    | bcm2835_defconf=
ig      | 1          =


  Details:     https://kernelci.org/test/plan/id/60622a4ff0cb17f28caf02b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210329/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210329/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60622a4ff0cb17f28caf0=
2b8
        failing since 4 days (last pass: next-20210324, first fail: next-20=
210325) =

 =



platform             | arch  | lab             | compiler | defconfig      =
        | regressions
---------------------+-------+-----------------+----------+----------------=
--------+------------
hifive-unleashed-a00 | riscv | lab-baylibre    | clang-11 | defconfig+CONFI=
G_EFI=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60622ac6f656188a11af02dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_EFI=3Dn
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210329/risc=
v/defconfig+CONFIG_EFI=3Dn/clang-11/lab-baylibre/baseline-hifive-unleashed-=
a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210329/risc=
v/defconfig+CONFIG_EFI=3Dn/clang-11/lab-baylibre/baseline-hifive-unleashed-=
a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60622ac6f656188a11af0=
2de
        failing since 84 days (last pass: next-20201223, first fail: next-2=
0210104) =

 =



platform             | arch  | lab             | compiler | defconfig      =
        | regressions
---------------------+-------+-----------------+----------+----------------=
--------+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig    | 1          =


  Details:     https://kernelci.org/test/plan/id/6062283b3b66fdd171af02c0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210329/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210329/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6062283b3b66fdd171af0=
2c1
        failing since 131 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
        | regressions
---------------------+-------+-----------------+----------+----------------=
--------+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig    | 1          =


  Details:     https://kernelci.org/test/plan/id/6062281f3b66fdd171af02ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210329/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210329/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6062281f3b66fdd171af0=
2af
        failing since 131 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
        | regressions
---------------------+-------+-----------------+----------+----------------=
--------+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig    | 1          =


  Details:     https://kernelci.org/test/plan/id/60622a52f0cb17f28caf02ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210329/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210329/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60622a52f0cb17f28caf0=
2bb
        failing since 131 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
        | regressions
---------------------+-------+-----------------+----------+----------------=
--------+------------
qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig    | 1          =


  Details:     https://kernelci.org/test/plan/id/606265085491b1c818af02de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210329/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210329/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606265085491b1c818af0=
2df
        failing since 131 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
        | regressions
---------------------+-------+-----------------+----------+----------------=
--------+------------
qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig    | 1          =


  Details:     https://kernelci.org/test/plan/id/60624831d6e37c949eaf02b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210329/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210329/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60624831d6e37c949eaf0=
2b9
        failing since 131 days (last pass: next-20201113, first fail: next-=
20201117) =

 =20
