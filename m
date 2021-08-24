Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65CA73F6861
	for <lists+linux-next@lfdr.de>; Tue, 24 Aug 2021 19:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238580AbhHXRuR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Aug 2021 13:50:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241981AbhHXRt0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Aug 2021 13:49:26 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA033C0698C7
        for <linux-next@vger.kernel.org>; Tue, 24 Aug 2021 10:09:34 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id k24so20363141pgh.8
        for <linux-next@vger.kernel.org>; Tue, 24 Aug 2021 10:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bbBnZCRDm5Y0KxuUPyjkAjeMGFm3DrlN4aWfvBemKZ0=;
        b=lN25WPlTwxKJj3vlUqcgj74XOEmj8ByPKjKsfGAoerWxaeRObUtEU3/Vy2Zk1nG+WZ
         /2dQ2rbpo1+SWvp9P2nOIINwyawzJxQI/q8q+AadTmob5Lcfd53W8wpwHKMn/LXFO1if
         PPBaWSVd3IyIP89KYU82bJDCDQYe4tg/UsVKKZ3BeDJ1r/4VDblTK3SoryX4sTScbWMy
         gpQHU4gnzNCuxsSguB9s8aMcbx9qwrf0iPJdV9+MseNxQhmsYN5lcnSz9vSfqSszR75C
         ecA5LtkCuKOmKBxe/FakKPMlFKq+3NeA9Hb8C3mI+8rHq6NSpy5i8OMNMpNGTEoFEiCM
         RXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bbBnZCRDm5Y0KxuUPyjkAjeMGFm3DrlN4aWfvBemKZ0=;
        b=eW83MYooeOU5Lrvb9tqtoeQZgxZIypP8pUy9R8R2/DFvWWjOgkhqU9NntN+L5cd1OF
         bB4Q7KVMxR2kCr3DQ4lshkAQC2J/8E4+xPYgkGyZwPKL73TGBQZaMRM6WD+jYteX2DmP
         6H/68R6CD40kMn/WG9M7L9l4NLx/xtRNrAAmJEZ2BZ+XeLBj3FiUHVdOMO0mBzb1kmit
         HvM/Iv2gkzmrUIa56kNhCAV64edzK5VEhRMKv1La7jMRyFG+m4OSvOAYZytO3BBcp/oV
         QoBVrArpylOow7XzxTULf5CegIVjVBWxjOhaHtMaivulJxKAPoW/JavMp+suEnHqFYKJ
         p2Tg==
X-Gm-Message-State: AOAM532dmP5j9DW3oFl8NajgCnpUDgjVlAM4r/U7IwvumsvjRTgYqGGM
        nifOYbc6fmVCuiI+6YG3BrrbHhvi6SfkxE8U
X-Google-Smtp-Source: ABdhPJy6BaQV5joV50/Csa0Nvw16w5Y75cofCmQrnbSGWCZsmfbSky2lNcnrfH+pyipdanL1CX4H7Q==
X-Received: by 2002:a05:6a00:ac6:b029:374:a33b:a74 with SMTP id c6-20020a056a000ac6b0290374a33b0a74mr40715183pfl.51.1629824974009;
        Tue, 24 Aug 2021 10:09:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w16sm2130068pff.130.2021.08.24.10.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 10:09:33 -0700 (PDT)
Message-ID: <612527cd.1c69fb81.4dd52.437b@mx.google.com>
Date:   Tue, 24 Aug 2021 10:09:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20210824
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
Subject: next/master baseline: 609 runs, 32 regressions (next-20210824)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 609 runs, 32 regressions (next-20210824)

Regressions Summary
-------------------

platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | clang-12 | defconfig     =
               | 1          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | clang-12 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig     =
               | 1          =

bcm2837-rpi-3-b-32      | arm   | lab-baylibre  | gcc-8    | bcm2835_defcon=
fig            | 1          =

beagle-xm               | arm   | lab-baylibre  | gcc-8    | multi_v7_defco=
nfig           | 1          =

beagle-xm               | arm   | lab-baylibre  | gcc-8    | omap2plus_defc=
onfig          | 1          =

fsl-ls1043a-rdb         | arm64 | lab-nxp       | clang-12 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

fsl-ls1043a-rdb         | arm64 | lab-nxp       | gcc-8    | defconfig+ima =
               | 1          =

fsl-ls1088a-rdb         | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

fsl-ls1088a-rdb         | arm64 | lab-nxp       | gcc-8    | defconfig     =
               | 1          =

hifive-unleashed-a00    | riscv | lab-baylibre  | gcc-8    | defconfig     =
               | 1          =

hip07-d05               | arm64 | lab-collabora | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

hip07-d05               | arm64 | lab-collabora | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

hip07-d05               | arm64 | lab-collabora | gcc-8    | defconfig     =
               | 1          =

imx6q-sabresd           | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =

imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig+ima =
               | 1          =

imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig+cryp=
to             | 1          =

imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig     =
               | 1          =

qemu_arm-versatilepb    | arm   | lab-baylibre  | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-broonie   | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-cip       | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-collabora | gcc-8    | versatile_defc=
onfig          | 1          =

rk3288-veyron-jaq       | arm   | lab-collabora | gcc-8    | multi_v7_defco=
nfig           | 1          =

rk3288-veyron-jaq       | arm   | lab-collabora | gcc-8    | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =

rk3328-rock64           | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | clang-12 | defconfig     =
               | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+ima =
               | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210824/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210824
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      372b2891c15acbf7b90d948b08ac174bde77102c =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | clang-12 | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6124ed08ae64be75068e2c8d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124ed08ae64be75068e2=
c8e
        failing since 68 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | clang-12 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6124eee8843757e2d78e2cad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124eee8843757e2d78e2=
cae
        failing since 68 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6124ebb453e89c23938e2cb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124ebb453e89c23938e2=
cb2
        failing since 68 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6124f19103e3f985068e2c79

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124f19103e3f985068e2=
c7a
        failing since 68 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6124f2e955adb7bd4a8e2cc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124f2e955adb7bd4a8e2=
cc9
        failing since 68 days (last pass: next-20210611, first fail: next-2=
0210617) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b-32      | arm   | lab-baylibre  | gcc-8    | bcm2835_defcon=
fig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6124e87f141a0a6eb58e2c8f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124e87f141a0a6eb58e2=
c90
        failing since 75 days (last pass: next-20210609, first fail: next-2=
0210610) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
beagle-xm               | arm   | lab-baylibre  | gcc-8    | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6124e76ca90323570c8e2c78

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124e76ca90323570c8e2=
c79
        failing since 0 day (last pass: next-20210820, first fail: next-202=
10823) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
beagle-xm               | arm   | lab-baylibre  | gcc-8    | omap2plus_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6124ea51bfec4fae5e8e2c91

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124ea51bfec4fae5e8e2=
c92
        failing since 1 day (last pass: next-20210818, first fail: next-202=
10820) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
fsl-ls1043a-rdb         | arm64 | lab-nxp       | clang-12 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6124f2c924a9efe78c8e2c79

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-fsl-ls1043=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-fsl-ls1043=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124f2c924a9efe78c8e2=
c7a
        new failure (last pass: next-20210820) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
fsl-ls1043a-rdb         | arm64 | lab-nxp       | gcc-8    | defconfig+ima =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6124eb89e46d3439948e2c8b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-fsl-ls1043a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-fsl-ls1043a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124eb89e46d3439948e2=
c8c
        failing since 1 day (last pass: next-20210819, first fail: next-202=
10820) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
fsl-ls1088a-rdb         | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6124f07203391356138e2c78

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124f07203391356138e2=
c79
        failing since 277 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
fsl-ls1088a-rdb         | arm64 | lab-nxp       | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6124fbc946a14b354b8e2c7a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124fbc946a14b354b8e2=
c7b
        failing since 277 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
hifive-unleashed-a00    | riscv | lab-baylibre  | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6124e8443a3faff86a8e2c7a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124e8443a3faff86a8e2=
c7b
        failing since 116 days (last pass: next-20210429, first fail: next-=
20210430) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
hip07-d05               | arm64 | lab-collabora | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6124ef14c90cfc3bfc8e2c8e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124ef14c90cfc3bfc8e2=
c8f
        failing since 54 days (last pass: next-20210628, first fail: next-2=
0210629) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
hip07-d05               | arm64 | lab-collabora | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6124fbe5354f4b2afb8e2c77

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-hip07-d=
05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-hip07-d=
05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124fbe5354f4b2afb8e2=
c78
        failing since 54 days (last pass: next-20210628, first fail: next-2=
0210629) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
hip07-d05               | arm64 | lab-collabora | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6124fd42e06a2d013a8e2c82

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124fd42e06a2d013a8e2=
c83
        failing since 54 days (last pass: next-20210624, first fail: next-2=
0210629) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx6q-sabresd           | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6124ea8555c16502788e2cd1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124ea8555c16502788e2=
cd2
        failing since 302 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig+ima =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6124eb0e2d9e6bd5318e2ca7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124eb0e2d9e6bd5318e2=
ca8
        failing since 9 days (last pass: next-20210812, first fail: next-20=
210813) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig+cryp=
to             | 1          =


  Details:     https://kernelci.org/test/plan/id/6124f1b40fff46e45a8e2c81

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124f1b40fff46e45a8e2=
c82
        new failure (last pass: next-20210820) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6124f356c62c1e6ef18e2c77

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124f356c62c1e6ef18e2=
c78
        failing since 5 days (last pass: next-20210813, first fail: next-20=
210819) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6124f5dec912de24668e2c79

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124f5dec912de24668e2=
c7a
        failing since 5 days (last pass: next-20210818, first fail: next-20=
210819) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-baylibre  | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6124e4cbd7155d89b98e2c93

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124e4cbd7155d89b98e2=
c94
        failing since 279 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-broonie   | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6124e3f26c355972d38e2c79

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124e3f26c355972d38e2=
c7a
        failing since 279 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-cip       | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6124e3846556f696d78e2c92

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124e3846556f696d78e2=
c93
        failing since 279 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-collabora | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6124e32547984667e28e2ca8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124e32647984667e28e2=
ca9
        failing since 279 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
rk3288-veyron-jaq       | arm   | lab-collabora | gcc-8    | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6124e854bae1290d808e2cb3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124e854bae1290d808e2=
cb4
        failing since 6 days (last pass: next-20210813, first fail: next-20=
210818) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
rk3288-veyron-jaq       | arm   | lab-collabora | gcc-8    | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6124edf0e97d01a2318e2c88

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124edf0e97d01a2318e2=
c89
        failing since 6 days (last pass: next-20210813, first fail: next-20=
210818) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
rk3328-rock64           | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6124eb509dcd16ce2a8e2c7e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124eb509dcd16ce2a8e2=
c7f
        failing since 70 days (last pass: next-20210611, first fail: next-2=
0210615) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | clang-12 | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6124ed4a7b267be25e8e2c8b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig/clang-12/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig/clang-12/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124ed4a7b267be25e8e2=
c8c
        new failure (last pass: next-20210820) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+ima =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6124ea7a55c16502788e2c86

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124ea7a55c16502788e2=
c87
        new failure (last pass: next-20210820) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6124ebe2a25143ce4d8e2c80

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124ebe2a25143ce4d8e2=
c81
        new failure (last pass: next-20210820) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6124f07f03391356138e2c8f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210824/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6124f07f03391356138e2=
c90
        failing since 194 days (last pass: next-20210209, first fail: next-=
20210210) =

 =20
