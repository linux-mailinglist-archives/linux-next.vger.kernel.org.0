Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44C082EEEA0
	for <lists+linux-next@lfdr.de>; Fri,  8 Jan 2021 09:33:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727384AbhAHIdO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Jan 2021 03:33:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727147AbhAHIdO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Jan 2021 03:33:14 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFD25C0612F6
        for <linux-next@vger.kernel.org>; Fri,  8 Jan 2021 00:32:33 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id m6so5793924pfm.6
        for <linux-next@vger.kernel.org>; Fri, 08 Jan 2021 00:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0smox5x5qNgyMo28nqRuxu/5Ydt+KpUS0Gp47J8icbc=;
        b=uc1t1mDogAjQMQib9MkfNPMQ0ux0eXCjqZ/V+4Wkfxfya6nk06ybFUykqjMwhDsURs
         neC8BsDtpXwhRJpXvlnhYz/CzHoDSybVG7ZE74vsW6lNhs0mKa1uRIngk8+gyQYh4j8u
         9truIQVRrYPnPgt3w7Z7moWkHDOZHB5CP0YmwPleRgamDSHUA96bpdTX+hdTce9wL+Es
         DSBVKyamhGezDbgxF2Xzuranf7uuMhS/eXhNanz1tKWU7RcaAu2nwrS3cpnOCFik+bzt
         OBfuwzBxaCUT38207RgNeCrGvH18jMt3gEzYYTU30fqhrYl8gl1s4KP7V4X26nbUYSvJ
         QfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0smox5x5qNgyMo28nqRuxu/5Ydt+KpUS0Gp47J8icbc=;
        b=Z+31/+hRe6gkhsuw4oPtGO4xgBXYsT0O+TSa1kkLLQtleHZ8/JLYBgtG16QleuQWXO
         u2TaiRiQ6I/NSgRt+MQ2TJT+Zi45g5gRwPHl17zkfeHHLNwiyP8SZ2o8KE2GBJVRpObW
         NrzXNfpnWz/4UGC5tsFLN0nUAhfmcu6we8cr/3s07AWL8HSUt8jO9HJ8vwibYMjcT0y0
         mMfAAH3I2k1YA/ZQcH634ywPsirhXa29aAjIOPYy0bCRvEbzUzEt/6ZfUGL5KgHbKijV
         RAbvZW5sLg9Erv5Qnq1cHQooknWK8FImm7d7ir8iRqxHFb5+qRV2YfGLe5oSc9HOmzGo
         TvRA==
X-Gm-Message-State: AOAM530bxLJqD9Lkq15J6ACS5hUqYdouUe9tW5mn+PrcaqQENTiTKltw
        NGihREASKk3UTW3JokGfMqCotlsPHoXFbQ==
X-Google-Smtp-Source: ABdhPJwBm24tgFTR6agvo+OZUAItBLC/dMA9UW5X8xuelyYwTbfHaBi0psfi3SHxQIp3NI6HR0XCYA==
X-Received: by 2002:a63:e10b:: with SMTP id z11mr5953632pgh.40.1610094752972;
        Fri, 08 Jan 2021 00:32:32 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b19sm7726512pfo.24.2021.01.08.00.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 00:32:32 -0800 (PST)
Message-ID: <5ff818a0.1c69fb81.c08d0.3158@mx.google.com>
Date:   Fri, 08 Jan 2021 00:32:32 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.11-rc2-506-g48b46fac6daa
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 308 runs,
 11 regressions (v5.11-rc2-506-g48b46fac6daa)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 308 runs, 11 regressions (v5.11-rc2-506-g48b46=
fac6daa)

Regressions Summary
-------------------

platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx6q-sabresd            | arm    | lab-nxp         | gcc-8    | imx_v6_v7_=
defconfig          | 1          =

imx6q-var-dt6customboard | arm    | lab-baylibre    | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit       | arm    | lab-pengutronix | gcc-8    | imx_v6_v7_=
defconfig          | 1          =

imx8mp-evk               | arm64  | lab-nxp         | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

qemu_arm-versatilepb     | arm    | lab-baylibre    | gcc-8    | versatile_=
defconfig          | 1          =

qemu_arm-versatilepb     | arm    | lab-broonie     | gcc-8    | versatile_=
defconfig          | 1          =

qemu_arm-versatilepb     | arm    | lab-cip         | gcc-8    | versatile_=
defconfig          | 1          =

qemu_arm-versatilepb     | arm    | lab-collabora   | gcc-8    | versatile_=
defconfig          | 1          =

qemu_arm-versatilepb     | arm    | lab-linaro-lkft | gcc-8    | versatile_=
defconfig          | 1          =

qemu_x86_64              | x86_64 | lab-baylibre    | gcc-8    | x86_64_def=
con...6-chromebook | 1          =

sun8i-h3-orangepi-pc     | arm    | lab-clabbe      | gcc-8    | sunxi_defc=
onfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.11-rc2-506-g48b46fac6daa/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.11-rc2-506-g48b46fac6daa
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      48b46fac6daaf69aa3b6cc599402bf1bd6153552 =



Test Regressions
---------------- =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx6q-sabresd            | arm    | lab-nxp         | gcc-8    | imx_v6_v7_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7e349d51c6a323bc94cc4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-5=
06-g48b46fac6daa/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-5=
06-g48b46fac6daa/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7e349d51c6a323bc94=
cc5
        failing since 74 days (last pass: v5.9-13195-g0281c5220c40, first f=
ail: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx6q-var-dt6customboard | arm    | lab-baylibre    | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7e6f110941fbe3cc94cc1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-5=
06-g48b46fac6daa/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-5=
06-g48b46fac6daa/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7e6f110941fbe3cc94=
cc2
        failing since 21 days (last pass: v5.10-9016-g31c318f75dc4, first f=
ail: v5.10-11328-gc41c506b38eb) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx6ul-pico-hobbit       | arm    | lab-pengutronix | gcc-8    | imx_v6_v7_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7e28c5c56cd481ec94cbb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-5=
06-g48b46fac6daa/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-5=
06-g48b46fac6daa/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7e28c5c56cd481ec94=
cbc
        new failure (last pass: v5.11-rc2-439-g7507456d8b0c) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx8mp-evk               | arm64  | lab-nxp         | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7e516d33e7129aac94cc7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-5=
06-g48b46fac6daa/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-5=
06-g48b46fac6daa/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7e516d33e7129aac94=
cc8
        failing since 1 day (last pass: v5.11-rc2-384-g0bac5ecdd304, first =
fail: v5.11-rc2-439-g7507456d8b0c) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb     | arm    | lab-baylibre    | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7dff9e4da92ee3dc94cdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-5=
06-g48b46fac6daa/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-5=
06-g48b46fac6daa/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7dff9e4da92ee3dc94=
cdd
        failing since 52 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb     | arm    | lab-broonie     | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7dff6e4da92ee3dc94cd7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-5=
06-g48b46fac6daa/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-5=
06-g48b46fac6daa/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7dff6e4da92ee3dc94=
cd8
        failing since 52 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb     | arm    | lab-cip         | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7dfee66d4c7d46fc94cd6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-5=
06-g48b46fac6daa/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-5=
06-g48b46fac6daa/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7dfee66d4c7d46fc94=
cd7
        failing since 52 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb     | arm    | lab-collabora   | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7dfe966d4c7d46fc94cce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-5=
06-g48b46fac6daa/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-5=
06-g48b46fac6daa/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7dfe966d4c7d46fc94=
ccf
        failing since 52 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb     | arm    | lab-linaro-lkft | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7e2e9e733570983c94ccb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-5=
06-g48b46fac6daa/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-5=
06-g48b46fac6daa/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7e2e9e733570983c94=
ccc
        failing since 52 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-baylibre    | gcc-8    | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7e2b75c56cd481ec94ce1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-5=
06-g48b46fac6daa/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-baylibre/=
baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-5=
06-g48b46fac6daa/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-baylibre/=
baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7e2b75c56cd481ec94=
ce2
        new failure (last pass: v5.11-rc2-439-g7507456d8b0c) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
sun8i-h3-orangepi-pc     | arm    | lab-clabbe      | gcc-8    | sunxi_defc=
onfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7e11275e704510cc94cc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-5=
06-g48b46fac6daa/arm/sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun8i-h3-ora=
ngepi-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc2-5=
06-g48b46fac6daa/arm/sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun8i-h3-ora=
ngepi-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7e11275e704510cc94=
cc9
        new failure (last pass: v5.11-rc2-384-g0bac5ecdd304) =

 =20
