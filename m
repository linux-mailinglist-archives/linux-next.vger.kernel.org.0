Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD8036C673
	for <lists+linux-next@lfdr.de>; Tue, 27 Apr 2021 14:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235446AbhD0MyX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Apr 2021 08:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235426AbhD0MyW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 27 Apr 2021 08:54:22 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1A34C061574
        for <linux-next@vger.kernel.org>; Tue, 27 Apr 2021 05:53:39 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id o16so17203636plg.5
        for <linux-next@vger.kernel.org>; Tue, 27 Apr 2021 05:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=LC89wL2CtGNEKo8mKbGlZ+QRz17ooawqbK9yDLq5YPs=;
        b=DiffGEQ7IeioLZc7LqYWyrUCVMFr2xnlRwa1xPz/FE/mbtfm/nnakVg6/JTivRUFWk
         SFXALSJttgG/ARemH3oEQv7k8rs1dJ4cDKAAO9guZmjfCxWb40HO5cyx1R+Fsku/827m
         cXrCztrsCGcKMKZtcoOzYmyVDd/e71He4GcT7ziRLrSM69htvzPYFwD1cLxvSnrJLtj3
         OufaP9P2wlxfbRl/hs+UBG8G3KxvnZapAu6NwAb/0vYirECvZ9C+AKsCokyMGhc89JoH
         o1+msEgTcP2dxeSSQxop2lyhX0rAJ52DAMnuFHmqGQ8Liu9Onh7Q4U93iLY+y/EjEx6m
         NMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=LC89wL2CtGNEKo8mKbGlZ+QRz17ooawqbK9yDLq5YPs=;
        b=mMIBTfa5XJDTBuvGv8XbZF03viI6iE+dAKcZSVYka61G3yH7Deam0zr4xyaHO3yB0b
         UsRKTeLkMnCym0o6JzCRux2wuSVLo3Hrpk/WMMDdHJYfpMdRUzYsC5dnN64lhRwkWnGi
         GLEc5BH9LqaVIHzeCYPme1GAJ+xmO/Ky9xj8DS5/BTu8gXqPKJutxfKghlTfsDPcPNw3
         61lHTrkDqD68FPkygHuaaTK7XUsHPOmgAK7LI2gr5DKDc9BTNfqpnzh9ZE17KiTMWvMN
         d+9ikLhbFWistjqz+q6L35pZgHW2Dc1NSz3sclbL+XPdDrGcK428UQb0n+wGodMnVnJI
         d5kQ==
X-Gm-Message-State: AOAM531sH9O1cscFMfZpcKDbujHdLksqH0DxB6GUoV1cFAXDg8we/c9V
        q5C06n4BI2QQsjYDnXGOHfe68+/Fvl0/uAUz
X-Google-Smtp-Source: ABdhPJw/TkjbaAkHD+PjuPVmAu52RqOhOs07FP03ENfA9acb4D/AS3fb6UbcuhSHWDSubosr9osrXQ==
X-Received: by 2002:a17:902:7402:b029:ed:1bf0:1ef1 with SMTP id g2-20020a1709027402b02900ed1bf01ef1mr12953459pll.24.1619528018840;
        Tue, 27 Apr 2021 05:53:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id cv12sm2390769pjb.35.2021.04.27.05.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 05:53:38 -0700 (PDT)
Message-ID: <60880952.1c69fb81.63b77.6e88@mx.google.com>
Date:   Tue, 27 Apr 2021 05:53:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-4702-ge27839dcc50b7
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 275 runs,
 14 regressions (v5.12-4702-ge27839dcc50b7)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 275 runs, 14 regressions (v5.12-4702-ge27839dc=
c50b7)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 2          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

bcm2837-rpi-3-b-32   | arm   | lab-baylibre    | gcc-8    | bcm2835_defconf=
ig            | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
              | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

meson-gxl-s905d-p230 | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.BIG_ENDIAN=3Dy | 1          =

mt8173-elm-hana      | arm64 | lab-collabora   | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.12-4702-ge27839dcc50b7/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.12-4702-ge27839dcc50b7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e27839dcc50b7755388b11977f6640eeef9ed69c =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/6087d2f0857bc1867a9b77bf

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-4702-=
ge27839dcc50b7/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-4702-=
ge27839dcc50b7/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6087d2f0857bc18=
67a9b77c3
        new failure (last pass: v5.12-121-g07bcd85dd158c)
        11 lines

    2021-04-27 09:01:18.633000+00:00  kern  :alert : Mem abort in[   23.305=
570] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D11>
    2021-04-27 09:01:18.633000+00:00  fo:
    2021-04-27 09:01:18.634000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6087d2f0857bc18=
67a9b77c4
        new failure (last pass: v5.12-121-g07bcd85dd158c)
        2 lines

    2021-04-27 09:01:18.638000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-27 09:01:18.639000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-27 09:01:18.640000+00:00  kern  :alert : Data abort info:
    2021-04-27 09:01:18.640000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-27 09:01:18.674000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-27 09:01:18.676000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D000000003a167[   23.345740] <LAVA_SIGNAL_TESTCASE TEST=
_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-27 09:01:18.676000+00:00  000   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6087d4d0378e4ef7a49b77ba

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-4702-=
ge27839dcc50b7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-4702-=
ge27839dcc50b7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6087d4d1378e4ef=
7a49b77be
        new failure (last pass: v5.12-121-g07bcd85dd158c)
        11 lines

    2021-04-27 09:09:17.384000+00:00  kern  :alert : Mem [   23.178067] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-27 09:09:17.385000+00:00  abort info:
    2021-04-27 09:09:17.385000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6087d4d1378e4ef=
7a49b77bf
        new failure (last pass: v5.12-121-g07bcd85dd158c)
        2 lines

    2021-04-27 09:09:17.390000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-27 09:09:17.390000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-27 09:09:17.391000+00:00  kern  :alert : Data abort info:
    2021-04-27 09:09:17.392000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-27 09:09:17.435000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-27 09:09:17.437000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pg[   23.216748] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg R=
ESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-27 09:09:17.438000+00:00  dp=3D000000003a0d5000
    2021-04-27 09:09:17.438000+00:00  ker[   23.227597] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 142716_1.5.2.4.1>   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b-32   | arm   | lab-baylibre    | gcc-8    | bcm2835_defconf=
ig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6087d4086ed7fd9d4a9b779d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-4702-=
ge27839dcc50b7/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rp=
i-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-4702-=
ge27839dcc50b7/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rp=
i-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6087d4086ed7fd9d4a9b7=
79e
        new failure (last pass: v5.12-121-g07bcd85dd158c) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/6087d423886d04f41d9b77c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-4702-=
ge27839dcc50b7/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-4702-=
ge27839dcc50b7/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6087d423886d04f41d9b7=
7c5
        failing since 3 days (last pass: v5.12-rc8-84-g9cb58cd2220c, first =
fail: v5.12-rc8-94-g1040b90b8c83) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6087d603a29bba28c29b77c0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-4702-=
ge27839dcc50b7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/base=
line-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-4702-=
ge27839dcc50b7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/base=
line-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6087d603a29bba28c29b7=
7c1
        failing since 0 day (last pass: v5.12-rc8-129-g209594898343e, first=
 fail: v5.12-121-g07bcd85dd158c) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
meson-gxl-s905d-p230 | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6087d416886d04f41d9b77a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-4702-=
ge27839dcc50b7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-4702-=
ge27839dcc50b7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6087d416886d04f41d9b7=
7a7
        new failure (last pass: v5.12-rc8-129-g209594898343e) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
mt8173-elm-hana      | arm64 | lab-collabora   | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6087d560f159efb94a9b77d5

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-4702-=
ge27839dcc50b7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabor=
a/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-4702-=
ge27839dcc50b7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabor=
a/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/6087d560f159efb94a9b77ed
        new failure (last pass: v5.12-121-g07bcd85dd158c) =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/608=
7d560f159efb94a9b77f3
        new failure (last pass: v5.12-121-g07bcd85dd158c)

    2021-04-27 09:11:55.201000+00:00  <8>[   59.138633] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6087d057abfeca51449b7795

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-4702-=
ge27839dcc50b7/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-4702-=
ge27839dcc50b7/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6087d057abfeca51449b7=
796
        failing since 162 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6087d05babfeca51449b779b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-4702-=
ge27839dcc50b7/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-=
versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-4702-=
ge27839dcc50b7/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-=
versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6087d05babfeca51449b7=
79c
        failing since 162 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6087d05aabfeca51449b7798

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-4702-=
ge27839dcc50b7/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vers=
atilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-4702-=
ge27839dcc50b7/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vers=
atilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6087d05aabfeca51449b7=
799
        failing since 162 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6087e5b79d5906fab29b77ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-4702-=
ge27839dcc50b7/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-4702-=
ge27839dcc50b7/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6087e5b79d5906fab29b7=
7ac
        failing since 162 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
