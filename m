Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF4B31E163
	for <lists+linux-next@lfdr.de>; Wed, 17 Feb 2021 22:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232785AbhBQVbJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Feb 2021 16:31:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232686AbhBQVbE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Feb 2021 16:31:04 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F430C061574
        for <linux-next@vger.kernel.org>; Wed, 17 Feb 2021 13:30:24 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id s16so23649plr.9
        for <linux-next@vger.kernel.org>; Wed, 17 Feb 2021 13:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=4nx4ePDA+TtJmYbJsKIvGER7g3MgA4pKOPFcsEkhT8A=;
        b=hqpJbnXXJ+b6+zUoupzHyWaGhAwcZyzBQEjjb4ocYmu5C0nCaZ+tCsIZuqxdgsQ0sT
         QnjrG6vVQlMHb+OZY6Zqj243k3nalcSkmOc+33YWAAytyLK8c9rPaU+wTug9ZiSnA2Xj
         MDaZ4jP8YP199yM9jQ7WLL8NCA+QvI/sEOicWk/rNGkLOhrDlbm+Q38fltQvohS19H6V
         /B6WWSb4tZ2TcPw97nhwwEijGXFBal1FXwgvcM+cmZ7ElSO9GfJXa62R+nckRbUDmXZf
         OXCpMcRhFy+p4Jy7Y2eSYH2Nm4mgEJ6BzVg7H74j0syLiqOZd5tboRTfxi5Cg0LmPOKR
         CSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=4nx4ePDA+TtJmYbJsKIvGER7g3MgA4pKOPFcsEkhT8A=;
        b=iiw1+RudxY7tMk3xhyQ2qmUCV7Z+yeFwzNQKy4ikNgnNHZS/bKlWZOvdNbxeGrDJsK
         3PpvXCh7itT3JS6dHdHPXtxnwFyQpefbY0MF1ZqNNenKKHIBvQEQo6bevZdxVVsWzKM4
         SI3HBZbzCCnjiEFsZOHGJHq/Rbz/sZLMeyJqxky6KF8mXg1MmNlQVQGWfL7qzf1UFJfG
         i5r4zFGMiwIK1c5ML3jddkX7buqCLYoj8VxGh1I6TuOs7cp2PTE2r+JOmC4bVQqhmGy2
         0tL1iKySVFvJkj3SKLc84OSWWTywBpS6NJudsRWuwLJYK6SJFMhK3ks1u0rkqPxwLb6t
         4wJg==
X-Gm-Message-State: AOAM532eKTJ5Nqpz3f4puAzI7DOtVzWSdGUxG1yYpriFgXFlxPP0UfUx
        gVehW2/p1/2hCGyN2t/ZDq8Gzjqc7hItdQ==
X-Google-Smtp-Source: ABdhPJzpRizQ6Icq21td9kgT7CmTmeyCUqmeg6B0A0hAmDsKxkMgKjNjWDUaCd5HL4/GDXTP1twfBA==
X-Received: by 2002:a17:90a:e2d0:: with SMTP id fr16mr764897pjb.204.1613597422750;
        Wed, 17 Feb 2021 13:30:22 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s11sm3208989pfu.69.2021.02.17.13.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 13:30:22 -0800 (PST)
Message-ID: <602d8aee.1c69fb81.cfd82.74af@mx.google.com>
Date:   Wed, 17 Feb 2021 13:30:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20210217
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 332 runs, 24 regressions (next-20210217)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 332 runs, 24 regressions (next-20210217)

Regressions Summary
-------------------

platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

imx8mp-evk                 | arm64 | lab-nxp      | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

imx8mp-evk                 | arm64 | lab-nxp      | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                 | arm64 | lab-nxp      | gcc-8    | defconfig   =
                 | 1          =

meson-gxl-s805x-p241       | arm64 | lab-baylibre | gcc-8    | defconfig+CO=
N...BIG_ENDIAN=3Dy | 1          =

meson-sm1-khadas-vim3l     | arm64 | lab-baylibre | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

meson-sm1-khadas-vim3l     | arm64 | lab-baylibre | clang-11 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610           | arm64 | lab-baylibre | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610           | arm64 | lab-baylibre | clang-11 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip      | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip      | clang-11 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip      | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip      | gcc-8    | defconfig   =
                 | 1          =

r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip      | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874             | arm64 | lab-cip      | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874             | arm64 | lab-cip      | clang-11 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874             | arm64 | lab-cip      | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

r8a774c0-ek874             | arm64 | lab-cip      | gcc-8    | defconfig   =
                 | 1          =

r8a774c0-ek874             | arm64 | lab-cip      | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64    | arm64 | lab-clabbe   | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64    | arm64 | lab-clabbe   | clang-11 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64    | arm64 | lab-clabbe   | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64-model-b | arm64 | lab-baylibre | clang-11 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64-model-b | arm64 | lab-baylibre | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210217/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210217
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      cd560d8023bf73c94d755908c8d4a0994dd1ec34 =



Test Regressions
---------------- =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602d4aedae0360a344addcc4

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/602d4aedae0360a3=
44addcc7
        new failure (last pass: next-20210211)
        1 lines

    2021-02-17 16:55:17.593000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2021-02-17 16:55:17.594000+00:00  (user:khilman) is already connected
    2021-02-17 16:55:33.581000+00:00  =00
    2021-02-17 16:55:33.582000+00:00  =

    2021-02-17 16:55:33.582000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2021-02-17 16:55:33.582000+00:00  =

    2021-02-17 16:55:33.582000+00:00  DRAM:  948 MiB
    2021-02-17 16:55:33.597000+00:00  RPI 3 Model B (0xa02082)
    2021-02-17 16:55:33.684000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2021-02-17 16:55:33.716000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (386 line(s) more)  =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
imx8mp-evk                 | arm64 | lab-nxp      | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602d4c0f3f16f21d9daddcc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602d4c0f3f16f21d9dadd=
cc7
        new failure (last pass: next-20210211) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
imx8mp-evk                 | arm64 | lab-nxp      | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602d4fb5c0f86afd60addcd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602d4fb5c0f86afd60add=
cd3
        new failure (last pass: next-20210211) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
imx8mp-evk                 | arm64 | lab-nxp      | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/602d51eb63b581f607addcda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602d51eb63b581f607add=
cdb
        failing since 7 days (last pass: next-20210208, first fail: next-20=
210209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
meson-gxl-s805x-p241       | arm64 | lab-baylibre | gcc-8    | defconfig+CO=
N...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602d5074705e894039addce3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602d5074705e894039add=
ce4
        new failure (last pass: next-20210212) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
meson-sm1-khadas-vim3l     | arm64 | lab-baylibre | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602d4bb5c5df66fdafaddcc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602d4bb5c5df66fdafadd=
cc4
        failing since 6 days (last pass: next-20210210, first fail: next-20=
210211) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
meson-sm1-khadas-vim3l     | arm64 | lab-baylibre | clang-11 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602d5218590dbf6fddaddcc2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602d5218590dbf6fddadd=
cc3
        failing since 6 days (last pass: next-20210210, first fail: next-20=
210211) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
meson-sm1-sei610           | arm64 | lab-baylibre | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602d4b8d853d1438b8addcc7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602d4b8d853d1438b8add=
cc8
        failing since 6 days (last pass: next-20210210, first fail: next-20=
210211) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
meson-sm1-sei610           | arm64 | lab-baylibre | clang-11 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602d51e463b581f607addcd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602d51e463b581f607add=
cd4
        failing since 6 days (last pass: next-20210209, first fail: next-20=
210211) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip      | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602d4b80c5df66fdafaddcb6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774a1-h=
ihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774a1-h=
ihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602d4b80c5df66fdafadd=
cb7
        failing since 37 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip      | clang-11 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602d51cdaf4da1608aaddcea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-r8a774a1-h=
ihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-r8a774a1-h=
ihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602d51cdaf4da1608aadd=
ceb
        failing since 37 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip      | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602d4f414042f4083daddccc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hihop=
e-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hihop=
e-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602d4f414042f4083dadd=
ccd
        failing since 37 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip      | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/602d505c705e894039addcc2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602d505c705e894039add=
cc3
        failing since 35 days (last pass: next-20210108, first fail: next-2=
0210112) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip      | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602d54170d5675117caddcc7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hiho=
pe-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hiho=
pe-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602d54170d5675117cadd=
cc8
        failing since 37 days (last pass: next-20210107, first fail: next-2=
0210111) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
r8a774c0-ek874             | arm64 | lab-cip      | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602d4b89c8c4595b59addcc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774c0-e=
k874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774c0-e=
k874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602d4b89c8c4595b59add=
cc7
        failing since 37 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
r8a774c0-ek874             | arm64 | lab-cip      | clang-11 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602d51e8ff4da2ddefaddcc2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-r8a774c0-e=
k874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-r8a774c0-e=
k874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602d51e8ff4da2ddefadd=
cc3
        failing since 37 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
r8a774c0-ek874             | arm64 | lab-cip      | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602d4f5902cf92cd97addcc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek874=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek874=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602d4f5902cf92cd97add=
cc7
        failing since 37 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
r8a774c0-ek874             | arm64 | lab-cip      | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/602d508f9e48c989a1addcc1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602d508f9e48c989a1add=
cc2
        failing since 35 days (last pass: next-20210108, first fail: next-2=
0210112) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
r8a774c0-ek874             | arm64 | lab-cip      | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602d53fea223a9535eaddcbe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek87=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek87=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602d53fea223a9535eadd=
cbf
        failing since 37 days (last pass: next-20210107, first fail: next-2=
0210111) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
sun50i-a64-bananapi-m64    | arm64 | lab-clabbe   | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602d4baaa3958af83faddd3b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602d4baaa3958af83fadd=
d3c
        failing since 6 days (last pass: next-20210209, first fail: next-20=
210210) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
sun50i-a64-bananapi-m64    | arm64 | lab-clabbe   | clang-11 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602d51fe96444da5d9addcc4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602d51fe96444da5d9add=
cc5
        failing since 6 days (last pass: next-20210209, first fail: next-20=
210210) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
sun50i-a64-bananapi-m64    | arm64 | lab-clabbe   | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602d541a0d5675117caddccd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602d541a0d5675117cadd=
cce
        failing since 6 days (last pass: next-20210209, first fail: next-20=
210210) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
sun50i-h6-pine-h64-model-b | arm64 | lab-baylibre | clang-11 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602d533cfae6ffa29caddce0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602d533cfae6ffa29cadd=
ce1
        failing since 98 days (last pass: next-20201110, first fail: next-2=
0201111) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
sun50i-h6-pine-h64-model-b | arm64 | lab-baylibre | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602d553e0683b38d5faddcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210217/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602d553e0683b38d5fadd=
cb2
        failing since 98 days (last pass: next-20201110, first fail: next-2=
0201111) =

 =20
