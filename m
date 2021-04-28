Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CEFD36D103
	for <lists+linux-next@lfdr.de>; Wed, 28 Apr 2021 05:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhD1D5f (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Apr 2021 23:57:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbhD1D5e (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 27 Apr 2021 23:57:34 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DEB2C061574
        for <linux-next@vger.kernel.org>; Tue, 27 Apr 2021 20:56:50 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id gc22-20020a17090b3116b02901558435aec1so4658845pjb.4
        for <linux-next@vger.kernel.org>; Tue, 27 Apr 2021 20:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+mIeMSpa34zVbVGVEqqBMOavqrhCdua3lCRquGpiP+4=;
        b=Lv3QgV01AMVYHDWj3W3gxUBZsTABI6JoGvZTpBvKiQeRGwSHYY54iDIKmKsqVA2I/x
         LeLaxNyx014sJ6REXwF3M/AChEwW0cov/GOoZVO+2DOdIJ0u10XT7o20+3WUSrZfwvzX
         PpgQWd+c8uRvjcMPzEEMOMHLfFaZgN0tV0lrUDGFiJLPaZebryCy1aRAmt240uvo+Pa2
         cBF9EAwyafbktx7q6s1bzbvgwdY7xJ+bQ2yrUa9sGRBeerL8BpVY8sVxiYUu6rpwi8yb
         RuagPF58JJHmAmMIosfunXFMSgHWd59KiHZopjvVmaKhhh/9Y3ZdFkusvc/gy2vvfxrp
         whDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+mIeMSpa34zVbVGVEqqBMOavqrhCdua3lCRquGpiP+4=;
        b=U/On3JCmCOHKhlZyXLzoikm+/ceaswoeV4wfMYSRqgIqLTg1PkjaTfLIxquyrL9DTK
         WeLdAW771OuJJHSZKU/D1pTeM1jKmNZHpxRaY3psZ5CNGpCFxk6gE0E0/B/yYFEf+iXN
         2Fi0cKqegJFqyeaab9HK9nX+cg/aWLbyKY5GEESc4ZGcVA3FTzE9m8agU5Clvn1Nw3c8
         4Itr1I48PuEalhz1in3epLNfAjr15yp7iduK9jqYhmYstmo/davCfK7xmlcQwkTyMvKL
         zQYeQkRxGFYUv5ubAf7xKFRZbK/QEBOy02ZqfBJAfRf/AFcut3tq1xl3izIsdnh6n83a
         cxTQ==
X-Gm-Message-State: AOAM532XKjKpjtlqDKfHXWEzSnoj8oMz+Xv/yuvfamI0GFlpkJfWt1Lo
        CaUzyE9d6T1ndYwhE8IE9R9eSASJz49Fue72
X-Google-Smtp-Source: ABdhPJwn/QRNuywvDpj3gKlhJoMFhqsAh4Rbk5DPmXK5Fx7lw7PIino7LmY6AVmP1i1y1DW8VCpakg==
X-Received: by 2002:a17:902:9a0a:b029:e6:bf00:8a36 with SMTP id v10-20020a1709029a0ab02900e6bf008a36mr28230361plp.51.1619582209650;
        Tue, 27 Apr 2021 20:56:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b20sm3356880pju.17.2021.04.27.20.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 20:56:49 -0700 (PDT)
Message-ID: <6088dd01.1c69fb81.f6370.b3e8@mx.google.com>
Date:   Tue, 27 Apr 2021 20:56:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-5597-g76619f2c150ab
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 293 runs,
 11 regressions (v5.12-5597-g76619f2c150ab)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 293 runs, 11 regressions (v5.12-5597-g76619f2c=
150ab)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 2          =

bcm2837-rpi-3-b-32   | arm   | lab-baylibre    | gcc-8    | bcm2835_defconf=
ig            | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
              | 1          =

qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.12-5597-g76619f2c150ab/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.12-5597-g76619f2c150ab
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      76619f2c150abe97edd7158920bfcb2e8fdfca39 =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6088a749fbe3ed69219b77a3

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-5597-=
g76619f2c150ab/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-5597-=
g76619f2c150ab/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6088a749fbe3ed6=
9219b77a7
        failing since 0 day (last pass: v5.12-121-g07bcd85dd158c, first fai=
l: v5.12-4702-ge27839dcc50b7)
        11 lines

    2021-04-28 00:07:17.607000+00:00  kern  :alert : Mem abort in[   23.216=
543] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D11>
    2021-04-28 00:07:17.608000+00:00  fo:
    2021-04-28 00:07:17.609000+00:00  kern  :alert :   ESR =3D 0x96000006
    2021-04-28 00:07:17.610000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-28 00:07:17.611000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0=
   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6088a749fbe3ed6=
9219b77a8
        failing since 0 day (last pass: v5.12-121-g07bcd85dd158c, first fai=
l: v5.12-4702-ge27839dcc50b7)
        2 lines

    2021-04-28 00:07:17.615000+00:00  kern  :alert : Data abort info:
    2021-04-28 00:07:17.615000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-28 00:07:17.649000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-28 00:07:17.651000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D000000003abf9[   23.256381] <LAVA_SIGNAL_TESTCASE TEST=
_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-28 00:07:17.651000+00:00  000
    2021-04-28 00:07:17.652000+00:00  kern  :alert : [000[   23.267225] <LA=
VA_SIGNAL_ENDRUN 0_dmesg 146393_1.5.2.4.1>   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/6088aa061a1e40d1279b7795

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-5597-=
g76619f2c150ab/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-5597-=
g76619f2c150ab/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6088aa061a1e40d=
1279b7799
        failing since 0 day (last pass: v5.12-121-g07bcd85dd158c, first fai=
l: v5.12-4702-ge27839dcc50b7)
        11 lines

    2021-04-28 00:18:59.077000+00:00  kern  :alert : Mem [   23.213267] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-28 00:18:59.078000+00:00  abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6088aa061a1e40d=
1279b779a
        failing since 0 day (last pass: v5.12-121-g07bcd85dd158c, first fai=
l: v5.12-4702-ge27839dcc50b7)
        2 lines

    2021-04-28 00:18:59.082000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-28 00:18:59.083000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-28 00:18:59.084000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-28 00:18:59.084000+00:00  kern  :alert : Data abort info:
    2021-04-28 00:18:59.085000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-28 00:18:59.120000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-28 00:18:59.121000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D000000003a07c[   23.252872] <LAVA_SIGNAL_TESTCASE TEST=
_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-28 00:18:59.122000+00:00  000
    2021-04-28 00:18:59.123000+00:00  kern  :alert : [000[   23.263792] <LA=
VA_SIGNAL_ENDRUN 0_dmesg 146483_1.5.2.4.1>   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b-32   | arm   | lab-baylibre    | gcc-8    | bcm2835_defconf=
ig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6088a6811b738852829b77d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-5597-=
g76619f2c150ab/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rp=
i-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-5597-=
g76619f2c150ab/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rp=
i-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6088a6811b738852829b7=
7d1
        failing since 0 day (last pass: v5.12-121-g07bcd85dd158c, first fai=
l: v5.12-4702-ge27839dcc50b7) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6088a93137309029069b77b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-5597-=
g76619f2c150ab/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/base=
line-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-5597-=
g76619f2c150ab/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/base=
line-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6088a93137309029069b7=
7b8
        failing since 1 day (last pass: v5.12-rc8-129-g209594898343e, first=
 fail: v5.12-121-g07bcd85dd158c) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/6088ac0104eadc64f59b7795

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-5597-=
g76619f2c150ab/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-5597-=
g76619f2c150ab/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6088ac0104eadc64f59b7=
796
        failing since 3 days (last pass: v5.12-rc8-84-g9cb58cd2220c, first =
fail: v5.12-rc8-94-g1040b90b8c83) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6088a615ae3f7d19d49b7797

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-5597-=
g76619f2c150ab/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-5597-=
g76619f2c150ab/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6088a615ae3f7d19d49b7=
798
        failing since 162 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6088a5fb2c61b3d5b39b77bf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-5597-=
g76619f2c150ab/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-=
versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-5597-=
g76619f2c150ab/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-=
versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6088a5fb2c61b3d5b39b7=
7c0
        failing since 162 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6088a53cc8593291d39b77af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-5597-=
g76619f2c150ab/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vers=
atilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-5597-=
g76619f2c150ab/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vers=
atilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6088a53cc8593291d39b7=
7b0
        failing since 162 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6088a4d02e694833519b7795

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-5597-=
g76619f2c150ab/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-5597-=
g76619f2c150ab/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6088a4d02e694833519b7=
796
        failing since 162 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
