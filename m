Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29E9B374F1E
	for <lists+linux-next@lfdr.de>; Thu,  6 May 2021 07:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232750AbhEFF7X (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 May 2021 01:59:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230040AbhEFF7W (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 May 2021 01:59:22 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1A17C061574
        for <linux-next@vger.kernel.org>; Wed,  5 May 2021 22:58:24 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id v191so4306888pfc.8
        for <linux-next@vger.kernel.org>; Wed, 05 May 2021 22:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bHaowJqnr3kghrD09tmvJH5R9PmMOBfCpDSvdWhBAOg=;
        b=vTBxP7dnv/R1s2uNx1vwFfzdsh8LmMXFXPWGF4JiZIuk0g90915QeBgb6zmKA5nMk0
         f3qv2+GFiqE/YsR64xOR6Vryqo+I3gk77P4Xp7Vxj87WHDnH/jey/p9Mf9CytHbjOkbz
         4GFFPnbwq+mUVMhOy8K1WsXeadFi/rficGgtoP+aKhGgcCsqGzsjYgf2llJe5v/qhLr1
         Yvd3xrHWP94lGezLGd0PCYQhyqmhbtJyJSPulp5iXN+2QnGvq44S+ylFv1VH42L51KRy
         Lo4L7yw49eiUjz+XArVFDuJXWyC+Prjs0WCDOucUpvc3H/1gK4uaMr4ELF14yz0L4es3
         P/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bHaowJqnr3kghrD09tmvJH5R9PmMOBfCpDSvdWhBAOg=;
        b=nntF7y1Dei7rNLpb0KHAHJTPeSvDJZJ338qBM+uyu2lSedoNmgZC7NLrVbZ/y32iyK
         hDmHBT/6d9njMtrbOOwmZy8sLtK2es/6HspD6dsrc/IonQMWUpKdYwiCVQJljP43lfDs
         O94aZ85NfdlZtnXikkF8stMKXmmL7jczYpqqIYWmdH2OHPWN7bJznh2k0D8Aajssu47L
         No1MQ87cSrzXYRsrCdpMBUG14qSFgokD7xpjWX/Il5eRytHiQEtxK7cSzHplppL9uvSH
         dbBAO2Oji1NTcVFCmkzto7m0R1ruhlrtieZHLLq0zIm/hQcpOh8TSbuJEgE34uLVTKld
         cHCg==
X-Gm-Message-State: AOAM533qqUlFtZaopsrrBATsP7HEUOMcQt5eZaqoC9+3liaHnuNvINuG
        1sfdg4IUq2xNOiUy/FkSRQbRDy3hQNgOWOd6
X-Google-Smtp-Source: ABdhPJzLmXE7htl88+xQ7UFJTt6Gz/n8R2yrTG2IpsOgVavj2XqlbjYmMEhmrvfY//vhz9tY8LNw/g==
X-Received: by 2002:a63:4a0b:: with SMTP id x11mr2696839pga.8.1620280703822;
        Wed, 05 May 2021 22:58:23 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t11sm962083pji.54.2021.05.05.22.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 22:58:23 -0700 (PDT)
Message-ID: <6093857f.1c69fb81.c1cb5.3a15@mx.google.com>
Date:   Wed, 05 May 2021 22:58:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.12-14615-gcafa2254e3fa3
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 194 runs,
 12 regressions (v5.12-14615-gcafa2254e3fa3)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 194 runs, 12 regressions (v5.12-14615-gcafa225=
4e3fa3)

Regressions Summary
-------------------

platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre    | gcc-8    | defconfig     =
               | 2          =

bcm2837-rpi-3-b-32    | arm   | lab-baylibre    | gcc-8    | bcm2835_defcon=
fig            | 1          =

imx8mp-evk            | arm64 | lab-nxp         | gcc-8    | defconfig     =
               | 1          =

imx8mp-evk            | arm64 | lab-nxp         | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

imx8mq-zii-ultra-zest | arm64 | lab-pengutronix | gcc-8    | defconfig     =
               | 1          =

meson-gxm-q200        | arm64 | lab-baylibre    | gcc-8    | defconfig+CON.=
..BIG_ENDIAN=3Dy | 1          =

qemu_arm-versatilepb  | arm   | lab-baylibre    | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb  | arm   | lab-broonie     | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb  | arm   | lab-cip         | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb  | arm   | lab-linaro-lkft | gcc-8    | versatile_defc=
onfig          | 1          =

r8a77950-salvator-x   | arm64 | lab-baylibre    | gcc-8    | defconfig     =
               | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.12-14615-gcafa2254e3fa3/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.12-14615-gcafa2254e3fa3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      cafa2254e3fa3eabd1609aabc76b9846297ef2f7 =



Test Regressions
---------------- =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre    | gcc-8    | defconfig     =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/60934c8750d79c0b6a6f546b

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-14615=
-gcafa2254e3fa3/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-14615=
-gcafa2254e3fa3/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60934c8750d79c0=
b6a6f546f
        failing since 8 days (last pass: v5.12-121-g07bcd85dd158c, first fa=
il: v5.12-4702-ge27839dcc50b7)
        11 lines

    2021-05-06 01:54:58.692000+00:00  kern  :alert : Mem abort in[   23.288=
673] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D11>
    2021-05-06 01:54:58.692000+00:00  fo:
    2021-05-06 01:54:58.693000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60934c8750d79c0=
b6a6f5470
        failing since 8 days (last pass: v5.12-121-g07bcd85dd158c, first fa=
il: v5.12-4702-ge27839dcc50b7)
        2 lines

    2021-05-06 01:54:58.697000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-05-06 01:54:58.698000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-05-06 01:54:58.699000+00:00  kern  :alert : Data abort info:
    2021-05-06 01:54:58.699000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-05-06 01:54:58.743000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-05-06 01:54:58.745000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D000000003a11d000
    2021-05-06 01:54:58.745000+00:00  kern  :aler[   23.329552] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-05-06 01:54:58.746000+00:00  t : [0000000000000050] p[   23.340607=
] <LAVA_SIGNAL_ENDRUN 0_dmesg 261130_1.5.2.4.1>
    2021-05-06 01:54:58.747000+00:00  gd=3D080000003a11e003   =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b-32    | arm   | lab-baylibre    | gcc-8    | bcm2835_defcon=
fig            | 1          =


  Details:     https://kernelci.org/test/plan/id/60934ea58e1fd30b146f5475

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-14615=
-gcafa2254e3fa3/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-14615=
-gcafa2254e3fa3/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60934ea58e1fd30b146f5=
476
        failing since 8 days (last pass: v5.12-121-g07bcd85dd158c, first fa=
il: v5.12-4702-ge27839dcc50b7) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx8mp-evk            | arm64 | lab-nxp         | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60934e23898eb60a546f5467

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-14615=
-gcafa2254e3fa3/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-14615=
-gcafa2254e3fa3/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60934e23898eb60a546f5=
468
        failing since 6 days (last pass: v5.12-7972-g8db459ff530f, first fa=
il: v5.12-11879-g660c9aba2ae7) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx8mp-evk            | arm64 | lab-nxp         | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/609350f87c7b4cae066f5468

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-14615=
-gcafa2254e3fa3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/bas=
eline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-14615=
-gcafa2254e3fa3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/bas=
eline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609350f87c7b4cae066f5=
469
        new failure (last pass: v5.12-13980-g822909eab3c2) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx8mq-zii-ultra-zest | arm64 | lab-pengutronix | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60934d5ed41729b3556f5476

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-14615=
-gcafa2254e3fa3/arm64/defconfig/gcc-8/lab-pengutronix/baseline-imx8mq-zii-u=
ltra-zest.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-14615=
-gcafa2254e3fa3/arm64/defconfig/gcc-8/lab-pengutronix/baseline-imx8mq-zii-u=
ltra-zest.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60934d5ed41729b3556f5=
477
        new failure (last pass: v5.12-rc7-172-g314f802f6efd0) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
meson-gxm-q200        | arm64 | lab-baylibre    | gcc-8    | defconfig+CON.=
..BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/609353ca1de1fd689c6f5477

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-14615=
-gcafa2254e3fa3/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-14615=
-gcafa2254e3fa3/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609353ca1de1fd689c6f5=
478
        new failure (last pass: v5.12-13980-g822909eab3c2) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb  | arm   | lab-baylibre    | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60934e967a1aed1a916f546c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-14615=
-gcafa2254e3fa3/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-14615=
-gcafa2254e3fa3/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60934e967a1aed1a916f5=
46d
        failing since 170 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb  | arm   | lab-broonie     | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60934ea08e1fd30b146f5467

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-14615=
-gcafa2254e3fa3/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-14615=
-gcafa2254e3fa3/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60934ea08e1fd30b146f5=
468
        failing since 170 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb  | arm   | lab-cip         | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60934ea68e1fd30b146f5478

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-14615=
-gcafa2254e3fa3/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ver=
satilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-14615=
-gcafa2254e3fa3/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ver=
satilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60934ea68e1fd30b146f5=
479
        failing since 170 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb  | arm   | lab-linaro-lkft | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60935350e2f2475ff56f547c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-14615=
-gcafa2254e3fa3/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-14615=
-gcafa2254e3fa3/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60935350e2f2475ff56f5=
47d
        failing since 170 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
r8a77950-salvator-x   | arm64 | lab-baylibre    | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60934d4d3b6c22c1706f547b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-14615=
-gcafa2254e3fa3/arm64/defconfig/gcc-8/lab-baylibre/baseline-r8a77950-salvat=
or-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-14615=
-gcafa2254e3fa3/arm64/defconfig/gcc-8/lab-baylibre/baseline-r8a77950-salvat=
or-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60934d4d3b6c22c1706f5=
47c
        new failure (last pass: v5.12-13817-gacfd309800c1) =

 =20
