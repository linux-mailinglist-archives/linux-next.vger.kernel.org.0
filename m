Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2E903C8625
	for <lists+linux-next@lfdr.de>; Wed, 14 Jul 2021 16:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232065AbhGNObh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Jul 2021 10:31:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231994AbhGNObh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Jul 2021 10:31:37 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5DEFC06175F
        for <linux-next@vger.kernel.org>; Wed, 14 Jul 2021 07:28:44 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id p36so2174189pfw.11
        for <linux-next@vger.kernel.org>; Wed, 14 Jul 2021 07:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Z6AFQR7MYlTc5ir0fbWug6XZrrAX5ReuCKLOhYn/TaA=;
        b=tRXxHcDC4K+Jx8D5ggohI95HXyRSJXdI0O0yLyDc1gzpbhWkYBxvuloLxKNHvRg63s
         wnTO3vhfDK4jgQHE6M9sKUasdIAD6yTIXOVclF2DuJ2QDkVk3RWjXvxIyk0wVv+m15Hv
         udjKVr+K0FBa6WJXKK/UrpU0Uwn0YBAK9qk2GEpwaDmwjbWIF17FH8oIa3m+wZdqH2PP
         lQY6YO66P1MjwHtH0h2lL81u0KWxNlbl+jMvlksWsk5DXoUtaCOgTUBm17NrT4BwhiQC
         CuTa/l25dF8xUFgcNZ4T7dKRdIJPA/jVCXhdw7SiqZY9eGXx9dWWiuFg6lhESFl5rPBY
         kpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Z6AFQR7MYlTc5ir0fbWug6XZrrAX5ReuCKLOhYn/TaA=;
        b=FLPm0BvUdYLLuCkkt/j11gFfuMbNmN15w6Jnp/HYpqrcNdYzcv5yEnAOjmAnegk+6/
         YcUC55d7Uu1l1FHus19aMxWrAQDY/hQ7NTJ5aKH/QsO1XoM7i6SjIH6mbfPIyLpU1C+q
         KM1fK/ughVuTUqeQqswITEOuuhUrc6+aagpHlwsDPIdd0StNaA7n4Fp1t+HihZ1i15Ie
         9sa0A0y/62d2R2TSBB//mh9blK56OdJ/eHPufD3Q4AIZvtmQypL7nBL8rPWCPhLjp9KF
         7pf6Iq0/FLC+7IpnYyjmDsygJNY5j+QVEtTC/drKHjhP5wCDFEKkBGydw3LXT0cnyFBv
         ajGA==
X-Gm-Message-State: AOAM5328aETVYL22XVLjDSPIQYwxliTAuOynVqf3nu34Gx3NYKLce10G
        rGV/ZOvZoleTmdGUjJDeLofTAX9Oy1kuHNiv
X-Google-Smtp-Source: ABdhPJyOExs0IdMF4BkZSkY6yhV12oNUiOZCelGlrAoQytgs26dGQJXN/DxzJzpdcF7etTMcHCDyVw==
X-Received: by 2002:a63:5508:: with SMTP id j8mr9965028pgb.85.1626272923887;
        Wed, 14 Jul 2021 07:28:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g9sm3187818pfr.133.2021.07.14.07.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 07:28:43 -0700 (PDT)
Message-ID: <60eef49b.1c69fb81.5d3b5.8845@mx.google.com>
Date:   Wed, 14 Jul 2021 07:28:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20210714
Subject: next/master baseline: 690 runs, 29 regressions (next-20210714)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 690 runs, 29 regressions (next-20210714)

Regressions Summary
-------------------

platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
bcm2836-rpi-2-b       | arm    | lab-collabora   | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b       | arm64  | lab-baylibre    | clang-10 | defconfig    =
                | 1          =

bcm2837-rpi-3-b       | arm64  | lab-baylibre    | clang-10 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b       | arm64  | lab-baylibre    | clang-12 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b       | arm64  | lab-baylibre    | clang-12 | defconfig    =
                | 1          =

bcm2837-rpi-3-b       | arm64  | lab-baylibre    | gcc-8    | defconfig    =
                | 1          =

bcm2837-rpi-3-b       | arm64  | lab-baylibre    | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b-32    | arm    | lab-baylibre    | gcc-8    | bcm2835_defco=
nfig            | 1          =

beagle-xm             | arm    | lab-baylibre    | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

beagle-xm             | arm    | lab-baylibre    | gcc-8    | multi_v7_defc=
onfig           | 1          =

beagle-xm             | arm    | lab-baylibre    | gcc-8    | omap2plus_def=
config          | 1          =

beaglebone-black      | arm    | lab-cip         | gcc-8    | omap2plus_def=
config          | 1          =

hifive-unleashed-a00  | riscv  | lab-baylibre    | gcc-8    | defconfig    =
                | 1          =

hip07-d05             | arm64  | lab-collabora   | clang-10 | defconfig    =
                | 1          =

hip07-d05             | arm64  | lab-collabora   | clang-10 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

hip07-d05             | arm64  | lab-collabora   | gcc-8    | defconfig    =
                | 1          =

hip07-d05             | arm64  | lab-collabora   | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

hp-11A-G6-EE-grunt    | x86_64 | lab-collabora   | gcc-8    | x86_64_defcon=
...6-chromebook | 1          =

imx6q-sabresd         | arm    | lab-nxp         | gcc-8    | imx_v6_v7_def=
config          | 1          =

imx8mp-evk            | arm64  | lab-nxp         | clang-10 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

imx8mp-evk            | arm64  | lab-nxp         | clang-12 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

imx8mp-evk            | arm64  | lab-nxp         | gcc-8    | defconfig    =
                | 1          =

kontron-kbox-a-230-ls | arm64  | lab-kontron     | clang-10 | defconfig    =
                | 1          =

kontron-kbox-a-230-ls | arm64  | lab-kontron     | gcc-8    | defconfig    =
                | 1          =

qemu_arm-versatilepb  | arm    | lab-baylibre    | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb  | arm    | lab-broonie     | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb  | arm    | lab-cip         | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb  | arm    | lab-collabora   | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb  | arm    | lab-linaro-lkft | gcc-8    | versatile_def=
config          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210714/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210714
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c0d438dbc0b74901f1901d97a6c84f38daa0c831 =



Test Regressions
---------------- =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
bcm2836-rpi-2-b       | arm    | lab-collabora   | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60eebabcdd47d736608a939b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eebabcdd47d736608a9=
39c
        failing since 139 days (last pass: next-20210223, first fail: next-=
20210224) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b       | arm64  | lab-baylibre    | clang-10 | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60eeb6984cdede7db28a93da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eeb6984cdede7db28a9=
3db
        failing since 26 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b       | arm64  | lab-baylibre    | clang-10 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60eebb34173d3816ce8a93d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eebb34173d3816ce8a9=
3d2
        failing since 26 days (last pass: next-20210611, first fail: next-2=
0210617) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b       | arm64  | lab-baylibre    | clang-12 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60eeb7ec4b8834d40e8a93ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eeb7ec4b8834d40e8a9=
3bb
        failing since 26 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b       | arm64  | lab-baylibre    | clang-12 | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60eeb9e04b975471ec8a93fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eeb9e04b975471ec8a9=
3fb
        failing since 26 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b       | arm64  | lab-baylibre    | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60eeb3ef8647bf66c88a93ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eeb3ef8647bf66c88a9=
3af
        failing since 26 days (last pass: next-20210611, first fail: next-2=
0210617) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b       | arm64  | lab-baylibre    | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60eeb544d880eabdd28a939f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eeb544d880eabdd28a9=
3a0
        failing since 26 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b-32    | arm    | lab-baylibre    | gcc-8    | bcm2835_defco=
nfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/60eeafca3b8c39813f8a93f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eeafca3b8c39813f8a9=
3f4
        failing since 33 days (last pass: next-20210609, first fail: next-2=
0210610) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
beagle-xm             | arm    | lab-baylibre    | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60eeb460f6b68a93fc8a93b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eeb460f6b68a93fc8a9=
3b3
        new failure (last pass: next-20201208) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
beagle-xm             | arm    | lab-baylibre    | gcc-8    | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60eeb94d8420753f748a93a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eeb94d8420753f748a9=
3a7
        new failure (last pass: next-20201208) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
beagle-xm             | arm    | lab-baylibre    | gcc-8    | omap2plus_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60eeb5f2a171c19e2f8a93d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eeb5f2a171c19e2f8a9=
3d1
        new failure (last pass: next-20201208) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
beaglebone-black      | arm    | lab-cip         | gcc-8    | omap2plus_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60eeb5f1a171c19e2f8a93cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/arm/=
omap2plus_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/arm/=
omap2plus_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eeb5f1a171c19e2f8a9=
3ce
        new failure (last pass: next-20210712) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
hifive-unleashed-a00  | riscv  | lab-baylibre    | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60eeb147c10184d1388a93ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eeb147c10184d1388a9=
3ac
        failing since 75 days (last pass: next-20210429, first fail: next-2=
0210430) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
hip07-d05             | arm64  | lab-collabora   | clang-10 | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60eed6576537ea87e18a93bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig/clang-10/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig/clang-10/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eed6576537ea87e18a9=
3be
        failing since 92 days (last pass: next-20210409, first fail: next-2=
0210412) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
hip07-d05             | arm64  | lab-collabora   | clang-10 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60eee1bcb17e293c4a8a939b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-hip0=
7-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-hip0=
7-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eee1bcb17e293c4a8a9=
39c
        failing since 92 days (last pass: next-20210409, first fail: next-2=
0210412) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
hip07-d05             | arm64  | lab-collabora   | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60eec92fb9f84ff8198a939e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eec92fb9f84ff8198a9=
39f
        failing since 13 days (last pass: next-20210624, first fail: next-2=
0210629) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
hip07-d05             | arm64  | lab-collabora   | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60eecf271e778bf1b38a939b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eecf271e778bf1b38a9=
39c
        failing since 13 days (last pass: next-20210628, first fail: next-2=
0210629) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
hp-11A-G6-EE-grunt    | x86_64 | lab-collabora   | gcc-8    | x86_64_defcon=
...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60eeb1826b5dab6b568a93b3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-hp-11A-G6-E=
E-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-hp-11A-G6-E=
E-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eeb1826b5dab6b568a9=
3b4
        new failure (last pass: next-20210712) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
imx6q-sabresd         | arm    | lab-nxp         | gcc-8    | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60eeb12164ec9216a18a9418

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eeb12164ec9216a18a9=
419
        failing since 261 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
imx8mp-evk            | arm64  | lab-nxp         | clang-10 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60eebcfd3d02b53a1f8a939d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eebcfd3d02b53a1f8a9=
39e
        failing since 1 day (last pass: next-20210629, first fail: next-202=
10712) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
imx8mp-evk            | arm64  | lab-nxp         | clang-12 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60eeb9f3e60f8fba208a939b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eeb9f3e60f8fba208a9=
39c
        new failure (last pass: next-20210712) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
imx8mp-evk            | arm64  | lab-nxp         | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60eeb519707973f0c28a93ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eeb519707973f0c28a9=
3bb
        failing since 13 days (last pass: next-20210630, first fail: next-2=
0210701) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
kontron-kbox-a-230-ls | arm64  | lab-kontron     | clang-10 | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60eeb67037379137d28a93bf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig/clang-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig/clang-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eeb67037379137d28a9=
3c0
        failing since 15 days (last pass: next-20210625, first fail: next-2=
0210628) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
kontron-kbox-a-230-ls | arm64  | lab-kontron     | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60eeb42c25828fead48a93ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eeb42c25828fead48a9=
3ac
        new failure (last pass: next-20210712) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb  | arm    | lab-baylibre    | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60eeb04fc9e33832468a93b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eeb04fc9e33832468a9=
3b5
        failing since 238 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb  | arm    | lab-broonie     | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60eeb1ad60569660888a943b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eeb1ad60569660888a9=
43c
        failing since 238 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb  | arm    | lab-cip         | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60eeafb13b8c39813f8a93c1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eeafb13b8c39813f8a9=
3c2
        failing since 238 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb  | arm    | lab-collabora   | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60eeaf5edebcdccc088a9423

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eeaf5edebcdccc088a9=
424
        failing since 238 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb  | arm    | lab-linaro-lkft | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60eebc80e5f167dc158a945b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210714/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210714/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eebc80e5f167dc158a9=
45c
        failing since 238 days (last pass: next-20201113, first fail: next-=
20201117) =

 =20
