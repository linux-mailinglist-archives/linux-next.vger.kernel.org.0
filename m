Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9140240379E
	for <lists+linux-next@lfdr.de>; Wed,  8 Sep 2021 12:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234707AbhIHKNw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Sep 2021 06:13:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231723AbhIHKNv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Sep 2021 06:13:51 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29418C061575
        for <linux-next@vger.kernel.org>; Wed,  8 Sep 2021 03:12:44 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id w19-20020a17090aaf9300b00191e6d10a19so1136377pjq.1
        for <linux-next@vger.kernel.org>; Wed, 08 Sep 2021 03:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=lKzGx9xrxQ/UBSWW1/lc+s41brxyl98bGmE4jQH3BuQ=;
        b=AHc3flgpW150ySsDe1PywqZgQ0kXXOWy7jGL18A/zhUlo2UlsYJx9mbIIbJfRmE9i8
         XGHIs0FdFd1/YQ4uGBdrkJOgjjrWpqjV2KiVf/v6BOSoNmxyifr8UIhW/aClZbycsPzj
         VM8Bm14vtXN2PCwZYhrBKnhNR/6H1l8WW3q2uX19QVKeFvXNGAmuMgeqI+45+OcNXGki
         AqW9ZKfFNwP0DlO1mjdexGhVse/hZZKAPbTUBos6IUPvrBBsnjF8Eu9VQTCtgFBY4E2i
         Vnch/D5ABp3KtH8X+s51CsanH4GNXEir9yc8AoGbVHoJG5kzRoSAttxNXW3dSVLFRvZP
         yoag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=lKzGx9xrxQ/UBSWW1/lc+s41brxyl98bGmE4jQH3BuQ=;
        b=UI2NZOKYRRFOXkOPTzUueCx0FeFJMZkVO2YLo5JvD5nk2NFrT3qnpX9HWFKla7Tsyd
         eRX1JIhDMHVVLfgDFv7LMYrhotRGPEh0gS1ZiNQyNTIB+1QizYCYcZqrx61MBsbaef2p
         WVAdgonwlZJiTK2IcqoP1Atu4zGPNL9RAm49vbzs9hPWf8h89jx+84mlUY6krTw15GuP
         PyKy1KEVzMrNnkppEuO+f3RUOtvVBchOvha3jz2sYAb7J0Lizl2QcGLBfZwRJlXWNHUt
         EBXUwg1lRWzcaijLb1ZzHuXr6hivnp0oLQ7qINVMSaWu04mHEKP2gwBcfbHBgre1SV5+
         Yldw==
X-Gm-Message-State: AOAM5319hlFOlUibEl5HMl8WGRzHiKcsPlrYVvE8cPG1XNyZ444s5U7x
        CkGvhevBDVKMqokNFOx9FbSlf8R9ofOe4oDS
X-Google-Smtp-Source: ABdhPJynqdRpX2dc/BpfvK42YeO0aocdEeQhdJ9eG9ONU8kHAo56XXKHyfLYqJOgsXROYb3bTnEhew==
X-Received: by 2002:a17:90a:1009:: with SMTP id b9mr3278974pja.184.1631095963031;
        Wed, 08 Sep 2021 03:12:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f10sm1971469pfd.53.2021.09.08.03.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 03:12:42 -0700 (PDT)
Message-ID: <61388c9a.1c69fb81.7a840.56e8@mx.google.com>
Date:   Wed, 08 Sep 2021 03:12:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20210908
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 754 runs, 38 regressions (next-20210908)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 754 runs, 38 regressions (next-20210908)

Regressions Summary
-------------------

platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | clang-12 | defconfig     =
               | 1          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig     =
               | 1          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

beagle-xm               | arm   | lab-baylibre  | gcc-8    | multi_v7_defco=
nfig           | 1          =

beagle-xm               | arm   | lab-baylibre  | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

fsl-ls1088a-rdb         | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb         | arm64 | lab-nxp       | gcc-8    | defconfig     =
               | 1          =

fsl-ls1088a-rdb         | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

hifive-unleashed-a00    | riscv | lab-baylibre  | gcc-8    | defconfig     =
               | 1          =

hip07-d05               | arm64 | lab-collabora | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

hip07-d05               | arm64 | lab-collabora | gcc-8    | defconfig     =
               | 1          =

hip07-d05               | arm64 | lab-collabora | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

imx6q-sabresd           | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =

imx8mn-ddr4-evk         | arm64 | lab-nxp       | clang-12 | defconfig     =
               | 2          =

imx8mn-ddr4-evk         | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 2          =

imx8mn-ddr4-evk         | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =

imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig+cryp=
to             | 1          =

imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig+ima =
               | 1          =

qemu_arm-versatilepb    | arm   | lab-baylibre  | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-broonie   | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-cip       | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-collabora | gcc-8    | versatile_defc=
onfig          | 1          =

r8a77950-salvator-x     | arm64 | lab-baylibre  | clang-12 | defconfig     =
               | 1          =

rk3288-veyron-jaq       | arm   | lab-collabora | clang-12 | multi_v7_defco=
nfig           | 1          =

rk3288-veyron-jaq       | arm   | lab-collabora | gcc-8    | multi_v7_defco=
nfig           | 1          =

rk3288-veyron-jaq       | arm   | lab-collabora | gcc-8    | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq       | arm   | lab-collabora | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

rk3328-rock64           | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | clang-12 | defconfig     =
               | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+cryp=
to             | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig     =
               | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210908/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210908
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      999569d59a0aa2509ae4a67ecc266c1134e37e7b =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6138563658a5e727eed59683

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6138563658a5e727eed59=
684
        failing since 195 days (last pass: next-20210223, first fail: next-=
20210224) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | clang-12 | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/613858fe0c575fcfb0d59695

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210825103134+fed41=
342a82f-1~exp1~20210825083911.137)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613858fe0c575fcfb0d59=
696
        failing since 82 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61385399e25ade2a95d59677

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61385399e25ade2a95d59=
678
        failing since 82 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/613854ed0a0d240d34d5967b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613854ed0a0d240d34d59=
67c
        failing since 82 days (last pass: next-20210611, first fail: next-2=
0210617) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/613857aa2b1468e7e4d59679

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613857aa2b1468e7e4d59=
67a
        failing since 82 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
beagle-xm               | arm   | lab-baylibre  | gcc-8    | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6138541e34b1985cadd59686

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6138541e34b1985cadd59=
687
        failing since 0 day (last pass: next-20210903, first fail: next-202=
10907) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
beagle-xm               | arm   | lab-baylibre  | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/613855d6383cbced29d5967f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613855d6383cbced29d59=
680
        failing since 42 days (last pass: next-20210723, first fail: next-2=
0210726) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
fsl-ls1088a-rdb         | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61385541c096dba53bd59729

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61385541c096dba53bd59=
72a
        failing since 291 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
fsl-ls1088a-rdb         | arm64 | lab-nxp       | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6138574d68513432c9d596af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6138574d68513432c9d59=
6b0
        failing since 291 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
fsl-ls1088a-rdb         | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61385b38fef0d06008d59779

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61385b38fef0d06008d59=
77a
        failing since 291 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
hifive-unleashed-a00    | riscv | lab-baylibre  | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/613850428b3b88e043d5968b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613850428b3b88e043d59=
68c
        failing since 131 days (last pass: next-20210429, first fail: next-=
20210430) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
hip07-d05               | arm64 | lab-collabora | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/613856698cecb1168ad59673

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-hip07-d=
05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-hip07-d=
05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613856698cecb1168ad59=
674
        failing since 69 days (last pass: next-20210628, first fail: next-2=
0210629) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
hip07-d05               | arm64 | lab-collabora | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/613859595ce71791cdd59698

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613859595ce71791cdd59=
699
        failing since 69 days (last pass: next-20210624, first fail: next-2=
0210629) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
hip07-d05               | arm64 | lab-collabora | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6138607c5dda91c851d59672

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6138607c5dda91c851d59=
673
        failing since 69 days (last pass: next-20210628, first fail: next-2=
0210629) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx6q-sabresd           | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61385196ebd90ef467d59692

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61385196ebd90ef467d59=
693
        failing since 317 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mn-ddr4-evk         | arm64 | lab-nxp       | clang-12 | defconfig     =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/613857da0996de647ed59665

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210825103134+fed41=
342a82f-1~exp1~20210825083911.137)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/613857da0996de6=
47ed5966c
        new failure (last pass: next-20210903)
        12 lines

    2021-09-08T06:27:24.623176  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   13.850855] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2021-09-08T06:27:24.623471  0098
    2021-09-08T06:27:24.623661  kern  :alert : Mem abort info:
    2021-09-08T06:27:24.623868  kern  :alert :   ESR =3D 0x96000046   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/613857da0996de6=
47ed5966d
        new failure (last pass: next-20210903)
        2 lines

    2021-09-08T06:27:24.625038  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2021-09-08T06:27:24.625272  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-09-08T06:27:24.625474  kern  :alert :   EA<8>[   13.877843] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2021-09-08T06:27:24.625680   =3D 0, S1PTW =3D 0
    2021-09-08T06:27:24.625881  kern  :alert :  <8>[   13.887934] <LAVA_SIG=
NAL_ENDRUN 0_dmesg 641533_1.5.2.4.1>
    2021-09-08T06:27:24.626085   FSC =3D 0x06: level 2 translation fault
    2021-09-08T06:27:24.626282  kern  :alert : Data abort info:   =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mn-ddr4-evk         | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/613852d43c2e66c321d596aa

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mn-ddr4-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mn-ddr4-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/613852d43c2e66c=
321d596b1
        failing since 0 day (last pass: next-20210903, first fail: next-202=
10907)
        12 lines

    2021-09-08T06:05:49.362356  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   64.654489] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2021-09-08T06:05:49.362664  0098
    2021-09-08T06:05:49.362823  kern  :alert : Mem abort info:
    2021-09-08T06:05:49.362975  kern  :alert :   ESR =3D 0x96000047   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/613852d43c2e66c=
321d596b2
        failing since 0 day (last pass: next-20210903, first fail: next-202=
10907)
        2 lines

    2021-09-08T06:05:49.363898  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2021-09-08T06:05:49.364049  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-09-08T06:05:49.364196  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-09-08T06:05:49.405176  kern  :alert :   FSC =3D 0x07: level 3 tran=
slat<8>[   64.684444] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Df=
ail UNITS=3Dlines MEASUREMENT=3D2>
    2021-09-08T06:05:49.405509  ion fault   =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mn-ddr4-evk         | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6138567435adc75168d59668

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mn-ddr4-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mn-ddr4-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6138567435adc75=
168d5966f
        new failure (last pass: next-20210907)
        12 lines

    2021-09-08T06:21:09.041099  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   14.526113] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2021-09-08T06:21:09.041459  0098
    2021-09-08T06:21:09.041694  kern  :alert : Mem abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6138567435adc75=
168d59670
        new failure (last pass: next-20210907)
        2 lines

    2021-09-08T06:21:09.042923  kern  :alert :   ESR =3D 0x96000046
    2021-09-08T06:21:09.043140  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2021-09-08T06:21:09.043353  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-09-08T06:21:09.043558  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-09-08T06:21:09.084090  kern  :alert :<8>[   14.555017] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2=
>   =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig+cryp=
to             | 1          =


  Details:     https://kernelci.org/test/plan/id/61385328cd3a301042d59677

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61385328cd3a301042d59=
678
        new failure (last pass: next-20210907) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61385555331fa529a0d59665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61385555331fa529a0d59=
666
        failing since 0 day (last pass: next-20210906, first fail: next-202=
10907) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig+ima =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/61385c7609679ab4afd5967d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61385c7609679ab4afd59=
67e
        new failure (last pass: next-20210907) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-baylibre  | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61384f1478f375607fd5966a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61384f1478f375607fd59=
66b
        failing since 294 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-broonie   | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61384f0c8c49db31d4d59668

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61384f0c8c49db31d4d59=
669
        failing since 294 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-cip       | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61384f0d55714723acd59671

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61384f0d55714723acd59=
672
        failing since 294 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-collabora | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6138654aac33dbf569d59665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6138654aac33dbf569d59=
666
        failing since 294 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
r8a77950-salvator-x     | arm64 | lab-baylibre  | clang-12 | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/61385ae552f3de66add59670

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210825103134+fed41=
342a82f-1~exp1~20210825083911.137)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61385ae652f3de66add59=
671
        new failure (last pass: next-20210903) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
rk3288-veyron-jaq       | arm   | lab-collabora | clang-12 | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61385e8e8fbaec4203d59677

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210825103134+fed41=
342a82f-1~exp1~20210825083911.137)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm/=
multi_v7_defconfig/clang-12/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm/=
multi_v7_defconfig/clang-12/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61385e8e8fbaec4203d59=
678
        failing since 20 days (last pass: next-20210813, first fail: next-2=
0210818) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
rk3288-veyron-jaq       | arm   | lab-collabora | gcc-8    | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6138577d68513432c9d596bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6138577d68513432c9d59=
6bc
        failing since 20 days (last pass: next-20210813, first fail: next-2=
0210818) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
rk3288-veyron-jaq       | arm   | lab-collabora | gcc-8    | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61385bb6a595140385d59692

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61385bb6a595140385d59=
693
        failing since 20 days (last pass: next-20210813, first fail: next-2=
0210818) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
rk3288-veyron-jaq       | arm   | lab-collabora | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61385bcbb10f488cc0d5967b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61385bcbb10f488cc0d59=
67c
        failing since 20 days (last pass: next-20210813, first fail: next-2=
0210818) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
rk3328-rock64           | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6138516e50095f1727d59684

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6138516e50095f1727d59=
685
        failing since 84 days (last pass: next-20210611, first fail: next-2=
0210615) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | clang-12 | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6138590859c6c9c541d5968b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210825103134+fed41=
342a82f-1~exp1~20210825083911.137)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig/clang-12/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig/clang-12/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6138590859c6c9c541d59=
68c
        new failure (last pass: next-20210903) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+cryp=
to             | 1          =


  Details:     https://kernelci.org/test/plan/id/6138527991cf5fdae3d59693

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig+crypto/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig+crypto/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6138527991cf5fdae3d59=
694
        new failure (last pass: next-20210907) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/613853e1de786b910ad596b3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613853e1de786b910ad59=
6b4
        failing since 209 days (last pass: next-20210209, first fail: next-=
20210210) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/61385549c096dba53bd59761

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210908/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61385549c096dba53bd59=
762
        failing since 0 day (last pass: next-20210906, first fail: next-202=
10907) =

 =20
