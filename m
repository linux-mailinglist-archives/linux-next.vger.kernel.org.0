Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFBB13B8347
	for <lists+linux-next@lfdr.de>; Wed, 30 Jun 2021 15:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234872AbhF3Njg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Jun 2021 09:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234768AbhF3Njf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Jun 2021 09:39:35 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 690B6C061756
        for <linux-next@vger.kernel.org>; Wed, 30 Jun 2021 06:37:05 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id a2so2287305pgi.6
        for <linux-next@vger.kernel.org>; Wed, 30 Jun 2021 06:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Q3ZEX4Rz68FvrgKhGgs9/8bWHfh8nRqPxv5ZRxAf2Lw=;
        b=zW7irKbCtYOggBrkPSUkGYwIu7h+IUa5d2nCCJXIdXTmak0qNGf0vue4FP/Qi2U2cD
         BO+RcvBtQaaTXdSFaC/+lpaCYyJDipAmnwn5JLesccHwAk5NO+sDZnZdzO5uT4fMSeXG
         27aS8vjRNdS3/LgYhU47KnjlBAi4NIEMDM5ScK3qM8zlegbDPMKUXIDgyb/m/LgyjIBH
         BKT/yNvuei4HBKDZF3gDiaqMEnUyRCCNCchw1MNaUONYaHhbRXIO88bhfGEZc/LbBgqr
         J0R1eK8j3ltrp9bx35nzf4osBKm3G2LElMF+1rAFsOgAF4GZvtDXfI5BrLRoZCFTEkP7
         //oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Q3ZEX4Rz68FvrgKhGgs9/8bWHfh8nRqPxv5ZRxAf2Lw=;
        b=WQjlrGNlKcn534g/4xrzsrPJKGw+tI88GnbySVzR999YjAhzae2zXaB2p2+jDvlQnH
         NXof5eFnUmmrhegfpmZyJkK4KUldpFln0XTxi7Ln2S7fMBfVmJB+8vY13DTPXjrnHMz9
         7u/sy8r05yT+MwId7svvBhk+wkKsD7d1RHZEmn2XJAFTFDh7hsxXp8MqxQKlyhGWtksy
         xuju1BEbCv+yi84EGZUS4nZBolsWza7SUqtlUWMYmsMlMGQhSyVmIcpG/4KAnELV3s6s
         HaoX+jQoP7fzdTP9s/ST5Qkxt1jVCnmF0b6s1yFLigKTktgH4sbJnlDZDdwfcIhmNOo5
         Kadg==
X-Gm-Message-State: AOAM530kP8DDDDvuPHjyCjUTBd1ncimRwIE1qb5G0TUyqe9gP0Ihy6Qr
        DCQVEGyujB8yGAMH8wzjoVqU0j/QSXiux0rK
X-Google-Smtp-Source: ABdhPJxaUN86dJMvzvPrrvHYb9yDruaKmZL36rg5lNx+Ds1zlZvA6ZEIChQjoYRFkuLpoZ5EDSqHhA==
X-Received: by 2002:a65:624e:: with SMTP id q14mr33323359pgv.103.1625060224453;
        Wed, 30 Jun 2021 06:37:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w21sm8606448pge.30.2021.06.30.06.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 06:37:04 -0700 (PDT)
Message-ID: <60dc7380.1c69fb81.bcee5.98be@mx.google.com>
Date:   Wed, 30 Jun 2021 06:37:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20210630
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 430 runs, 38 regressions (next-20210630)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 430 runs, 38 regressions (next-20210630)

Regressions Summary
-------------------

platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b        | arm64 | lab-baylibre    | clang-12 | defconfig    =
                | 1          =

bcm2837-rpi-3-b        | arm64 | lab-baylibre    | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b        | arm64 | lab-baylibre    | gcc-8    | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b        | arm64 | lab-baylibre    | gcc-8    | defconfig    =
                | 1          =

bcm2837-rpi-3-b-32     | arm   | lab-baylibre    | gcc-8    | bcm2835_defco=
nfig            | 1          =

beaglebone-black       | arm   | lab-cip         | clang-10 | multi_v7_defc=
onfig           | 1          =

beaglebone-black       | arm   | lab-cip         | gcc-8    | multi_v7_defc=
onfig           | 1          =

beaglebone-black       | arm   | lab-cip         | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

fsl-ls2088a-rdb        | arm64 | lab-nxp         | clang-12 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

fsl-ls2088a-rdb        | arm64 | lab-nxp         | clang-12 | defconfig    =
                | 1          =

fsl-ls2088a-rdb        | arm64 | lab-nxp         | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

fsl-ls2088a-rdb        | arm64 | lab-nxp         | gcc-8    | defconfig    =
                | 1          =

fsl-lx2160a-rdb        | arm64 | lab-nxp         | clang-12 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

fsl-lx2160a-rdb        | arm64 | lab-nxp         | clang-12 | defconfig    =
                | 1          =

fsl-lx2160a-rdb        | arm64 | lab-nxp         | gcc-8    | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

fsl-lx2160a-rdb        | arm64 | lab-nxp         | gcc-8    | defconfig    =
                | 1          =

hifive-unleashed-a00   | riscv | lab-baylibre    | gcc-8    | defconfig    =
                | 1          =

imx6q-sabresd          | arm   | lab-nxp         | gcc-8    | imx_v6_v7_def=
config          | 1          =

imx8mp-evk             | arm64 | lab-nxp         | clang-12 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

imx8mp-evk             | arm64 | lab-nxp         | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron     | clang-12 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron     | clang-12 | defconfig    =
                | 1          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-8    | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-8    | defconfig    =
                | 1          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron     | clang-12 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron     | clang-12 | defconfig    =
                | 1          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-8    | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-8    | defconfig    =
                | 1          =

meson-gxbb-p200        | arm64 | lab-baylibre    | gcc-8    | defconfig+CON=
...BIG_ENDIAN=3Dy | 2          =

qemu_arm-versatilepb   | arm   | lab-baylibre    | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb   | arm   | lab-broonie     | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb   | arm   | lab-cip         | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb   | arm   | lab-linaro-lkft | gcc-8    | versatile_def=
config          | 1          =

r8a77950-salvator-x    | arm64 | lab-baylibre    | gcc-8    | defconfig+CON=
...BIG_ENDIAN=3Dy | 1          =

rk3328-rock64          | arm64 | lab-baylibre    | gcc-8    | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210630/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210630
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2e0046650f0f192a84a1793f0dc2f0991ed9a3e4 =



Test Regressions
---------------- =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b        | arm64 | lab-baylibre    | clang-12 | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc474f238da040ba23bbbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210626052608+b7c7b=
42db1d1-1~exp1~20210626034043.129)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc474f238da040ba23b=
bbe
        failing since 12 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b        | arm64 | lab-baylibre    | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc4352b398dfd34223bbc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc4352b398dfd34223b=
bca
        failing since 12 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b        | arm64 | lab-baylibre    | gcc-8    | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc44a69cd5919eca23bbc7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc44a69cd5919eca23b=
bc8
        failing since 12 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b        | arm64 | lab-baylibre    | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc45fb2f17c5a1a223bbc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc45fb2f17c5a1a223b=
bc9
        failing since 12 days (last pass: next-20210611, first fail: next-2=
0210617) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b-32     | arm   | lab-baylibre    | gcc-8    | bcm2835_defco=
nfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc30cb254de41cc023bbfc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc30cb254de41cc023b=
bfd
        failing since 19 days (last pass: next-20210609, first fail: next-2=
0210610) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
beaglebone-black       | arm   | lab-cip         | clang-10 | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc394c5499fe561323bbdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm/=
multi_v7_defconfig/clang-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm/=
multi_v7_defconfig/clang-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc394c5499fe561323b=
be0
        new failure (last pass: next-20210628) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
beaglebone-black       | arm   | lab-cip         | gcc-8    | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc343bed55b2655923bbe2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc343bed55b2655923b=
be3
        new failure (last pass: next-20210629) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
beaglebone-black       | arm   | lab-cip         | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc34736c8f264df023bbf0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-beaglebone-black.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-beaglebone-black.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc34736c8f264df023b=
bf1
        new failure (last pass: next-20210629) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
fsl-ls2088a-rdb        | arm64 | lab-nxp         | clang-12 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc38134b4c9225ec23bbd5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210626052608+b7c7b=
42db1d1-1~exp1~20210626034043.129)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-fsl-ls2088=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-fsl-ls2088=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc38134b4c9225ec23b=
bd6
        new failure (last pass: next-20210625) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
fsl-ls2088a-rdb        | arm64 | lab-nxp         | clang-12 | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc3bc03ed33d03ee23bbbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210626052608+b7c7b=
42db1d1-1~exp1~20210626034043.129)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig/clang-12/lab-nxp/baseline-fsl-ls2088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig/clang-12/lab-nxp/baseline-fsl-ls2088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc3bc03ed33d03ee23b=
bbe
        new failure (last pass: next-20210629) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
fsl-ls2088a-rdb        | arm64 | lab-nxp         | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc3800ef587bf00a23bbe2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls2088a-rd=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls2088a-rd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc3800ef587bf00a23b=
be3
        new failure (last pass: next-20210629) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
fsl-ls2088a-rdb        | arm64 | lab-nxp         | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc386115d93c1da623bbcc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls2088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls2088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc386115d93c1da623b=
bcd
        new failure (last pass: next-20210629) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
fsl-lx2160a-rdb        | arm64 | lab-nxp         | clang-12 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc35d02c25b8906023bbbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210626052608+b7c7b=
42db1d1-1~exp1~20210626034043.129)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-fsl-lx2160=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-fsl-lx2160=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc35d02c25b8906023b=
bc0
        new failure (last pass: next-20210628) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
fsl-lx2160a-rdb        | arm64 | lab-nxp         | clang-12 | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc3a05a0ccefd81e23bbbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210626052608+b7c7b=
42db1d1-1~exp1~20210626034043.129)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig/clang-12/lab-nxp/baseline-fsl-lx2160a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig/clang-12/lab-nxp/baseline-fsl-lx2160a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc3a05a0ccefd81e23b=
bbe
        new failure (last pass: next-20210629) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
fsl-lx2160a-rdb        | arm64 | lab-nxp         | gcc-8    | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc382736fff704d323bbe2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-lx2160a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-lx2160a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc382736fff704d323b=
be3
        new failure (last pass: next-20210625) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
fsl-lx2160a-rdb        | arm64 | lab-nxp         | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc38daf5f3c652bf23bbc1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-lx2160a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-lx2160a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc38daf5f3c652bf23b=
bc2
        new failure (last pass: next-20210629) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
hifive-unleashed-a00   | riscv | lab-baylibre    | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc31a23c296428a823bbd4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc31a33c296428a823b=
bd5
        failing since 61 days (last pass: next-20210429, first fail: next-2=
0210430) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
imx6q-sabresd          | arm   | lab-nxp         | gcc-8    | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc34f1f045af886f23bbe1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc34f1f045af886f23b=
be2
        failing since 247 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
imx8mp-evk             | arm64 | lab-nxp         | clang-12 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc36acfce015bba823bbc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210626052608+b7c7b=
42db1d1-1~exp1~20210626034043.129)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc36acfce015bba823b=
bc9
        new failure (last pass: next-20210628) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
imx8mp-evk             | arm64 | lab-nxp         | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc3a2faf9758e12f23bbcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc3a2faf9758e12f23b=
bd0
        failing since 0 day (last pass: next-20210628, first fail: next-202=
10629) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron     | clang-12 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc34ef325602061e23bbe9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210626052608+b7c7b=
42db1d1-1~exp1~20210626034043.129)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc34ef325602061e23b=
bea
        new failure (last pass: next-20210628) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron     | clang-12 | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc3967ff92f6a1db23bbe8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210626052608+b7c7b=
42db1d1-1~exp1~20210626034043.129)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig/clang-12/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig/clang-12/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc3967ff92f6a1db23b=
be9
        new failure (last pass: next-20210629) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc36d15f2dc0a5ec23bbcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc36d15f2dc0a5ec23b=
bd0
        new failure (last pass: next-20210629) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-8    | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc37c6f802d8eca723bbbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc37c6f802d8eca723b=
bc0
        new failure (last pass: next-20210629) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron     | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc3915222e216ca223bbc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc3915222e216ca223b=
bca
        failing since 0 day (last pass: next-20210624, first fail: next-202=
10629) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron     | clang-12 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc34f041f8210f0423bbcc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210626052608+b7c7b=
42db1d1-1~exp1~20210626034043.129)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc34f041f8210f0423b=
bcd
        new failure (last pass: next-20210628) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron     | clang-12 | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc39b5d87f07372f23bbdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210626052608+b7c7b=
42db1d1-1~exp1~20210626034043.129)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig/clang-12/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig/clang-12/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc39b5d87f07372f23b=
bdc
        new failure (last pass: next-20210629) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc36d4b17854eca323bbca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontron/baseline-kontron-sl=
28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontron/baseline-kontron-sl=
28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc36d4b17854eca323b=
bcb
        new failure (last pass: next-20210629) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-8    | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc38279ec40b13eb23bbe9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc38279ec40b13eb23b=
bea
        new failure (last pass: next-20210629) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron     | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc39015822daab5a23bbbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc39015822daab5a23b=
bc0
        new failure (last pass: next-20210629) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
meson-gxbb-p200        | arm64 | lab-baylibre    | gcc-8    | defconfig+CON=
...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60dc4793fdc70cc54823bbbd

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/60dc4793fdc70cc5=
4823bbc3
        new failure (last pass: next-20210629)
        1 lines

    2021-06-30T10:29:19.390664  / # =

    2021-06-30T10:29:19.511113  #
    2021-06-30T10:29:19.617681  export SHELL=3D/bin/sh
    2021-06-30T10:29:19.619687  <3>[   15.193096] mmc0: error -84 whilst in=
itialising SD card
    2021-06-30T10:29:19.620900  =

    2021-06-30T10:29:19.622039  / # #
    2021-06-30T10:29:19.725782  / # export SHELL=3D/bin/sh. /lava-506887/en=
vironment
    2021-06-30T10:29:19.829772  /lava-506887/bin/lava-test-runner /lava-506=
887/0
    2021-06-30T10:29:19.835853  =

    2021-06-30T10:29:19.837096  / # . /lava-506887/environment =

    ... (9 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60dc4793fdc70cc=
54823bbc5
        new failure (last pass: next-20210629)
        2 lines

    2021-06-30T10:29:19.976247  kern  :emerg : Internal error: Oops - BUG: =
0 [#1] PREEMPT SMP
    2021-06-30T10:29:19.977477  kern  :emerg : Code: 54fffd01 aa1b03e0 97f9=
761c 17ffffe5 (d4210000<8>[   15.773128] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-06-30T10:29:19.978761  ) =

    2021-06-30T10:29:19.979977  + set +x<8>[   15.782668] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 506887_1.5.2.4.1>
    2021-06-30T10:29:19.981207     =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb   | arm   | lab-baylibre    | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc30ab254de41cc023bbc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc30ab254de41cc023b=
bc4
        failing since 224 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb   | arm   | lab-broonie     | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc30d5a3b4e47fad23bbec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc30d5a3b4e47fad23b=
bed
        failing since 224 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb   | arm   | lab-cip         | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc3099e00ba629c923bbbe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc3099e00ba629c923b=
bbf
        failing since 224 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb   | arm   | lab-linaro-lkft | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc5b347e589a9bf923bbc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc5b347e589a9bf923b=
bca
        failing since 224 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
r8a77950-salvator-x    | arm64 | lab-baylibre    | gcc-8    | defconfig+CON=
...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc3fc9463aef7bab23bbc5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc3fc9463aef7bab23b=
bc6
        new failure (last pass: next-20210629) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
rk3328-rock64          | arm64 | lab-baylibre    | gcc-8    | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60dc42c10b2ccb5adc23bbdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210630/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dc42c10b2ccb5adc23b=
be0
        failing since 15 days (last pass: next-20210611, first fail: next-2=
0210615) =

 =20
