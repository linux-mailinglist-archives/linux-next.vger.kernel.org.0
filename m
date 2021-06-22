Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94E543B089E
	for <lists+linux-next@lfdr.de>; Tue, 22 Jun 2021 17:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231604AbhFVPWn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Jun 2021 11:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbhFVPWk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Jun 2021 11:22:40 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A13BC061574
        for <linux-next@vger.kernel.org>; Tue, 22 Jun 2021 08:20:23 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id a2so45658pgi.6
        for <linux-next@vger.kernel.org>; Tue, 22 Jun 2021 08:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=mgSIIf7ymTor1zJricQXbFTs5P8KbFEsjuWdWhI35N0=;
        b=xXscqI3xWNVDN9Fb2ON5dDIgGfy/KLKDuA33r9dMvpoHEH/9L18VRzAOvd/L+acE6W
         UGRan3wgEFQVnZFjvAMWCRqwvw5ahgJVI5atjY6b+L7ZRRiq786g2kkSZ2PswScC9ot2
         r0hEPxNK6kb5mvKTsn3ayvxbsPzIcM4Yk39qxEx9jeKOJPH3JLNbrdp0UP0zMpmA8THU
         gt6eW0j3WhqFV9VLip69V9hdU2vJbTtzE0DrKNY/SOgjHZjRwvCQ9A47J2G9xHTwl5wp
         Gg5+7I/eJjtAU1SNMNUTuFeqhFI7o0Tq7FupPXpnIlBhud6gzikxe4BeIF5lwm4T8Soy
         01Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=mgSIIf7ymTor1zJricQXbFTs5P8KbFEsjuWdWhI35N0=;
        b=U7x2MejWRdpVR7C1A4cOkgl7/ZUb2tjftYSmXOCSPkxiE7aH2+Mc2oxunVlClaDKjI
         AWU9j5gRtStf5CyEVav6KxI636B8rNhCk5Am9o5YTwXWKU4b8Z7NlLk9fRcw8RiD69Ya
         +SlcuOe/CZG/U6JYLCCv31hOaHMCkOD3SkI61PzKBvxOt1yAGzaMKmFExwZG3tKYvbwx
         WqkxImSZO5Zrx4uXV6D4oED05g9RDFg+KK0wAp/ehjkc6k4X+pvl6Efb+ZlYrDD+3E9d
         kq4E9gqJ7hHOZZP/O3wAH/y4BaW82PCVowYi2O2B8Pa8Rsu4Vbi0Qt2TBT5K0vVORnYj
         R6sw==
X-Gm-Message-State: AOAM531j2Cx3GIJyggTpTp4hG/qg1G/YU6ZfYh7SmemB6WsF7tDXbWd1
        CD4b6lrLILaMxZcYgrPtCXtay436InEQ0Q==
X-Google-Smtp-Source: ABdhPJx6e+fywO9Ky0Q3YuiKhD21o6FBx4wO1QbeWpdsHWzwQqf5KXqwge6MfyspyPA0nmpYmNia4Q==
X-Received: by 2002:a62:1782:0:b029:2f7:dcbe:c292 with SMTP id 124-20020a6217820000b02902f7dcbec292mr4228481pfx.63.1624375222843;
        Tue, 22 Jun 2021 08:20:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g8sm2981101pja.14.2021.06.22.08.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 08:20:22 -0700 (PDT)
Message-ID: <60d1ffb6.1c69fb81.951bc.768b@mx.google.com>
Date:   Tue, 22 Jun 2021 08:20:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.13-rc7-157-g6a2d9370c405
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 281 runs,
 10 regressions (v5.13-rc7-157-g6a2d9370c405)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 281 runs, 10 regressions (v5.13-rc7-157-g6a2d9=
370c405)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

imx6q-sabresd        | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
              | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

meson-gxl-s805x-p241 | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.BIG_ENDIAN=3Dy | 1          =

qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.13-rc7-157-g6a2d9370c405/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.13-rc7-157-g6a2d9370c405
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6a2d9370c405eafe28975036f266289a54de53ff =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d1c5b5666d7bc53441328a

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-1=
57-g6a2d9370c405/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-1=
57-g6a2d9370c405/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/60d1c5b5666d7bc5=
3441328d
        new failure (last pass: v5.13-rc7-108-ga39bc0c7697f)
        1 lines

    2021-06-22T11:12:29.970247  / # =

    2021-06-22T11:12:29.980051  =

    2021-06-22T11:12:30.083242  / # #
    2021-06-22T11:12:30.091952  #
    2021-06-22T11:12:31.351694  / # export SHELL=3D/bin/sh
    2021-06-22T11:12:31.362270  export SHELL=3D/bin/sh
    2021-06-22T11:12:32.983400  / # . /lava-473979/environment
    2021-06-22T11:12:32.999896  . /lava-473979/environment
    2021-06-22T11:12:35.949949  / # /lava-473979/bin/lava-test-runner /lava=
-473979/0
    2021-06-22T11:12:35.961292  /lava-473979/bin/lava-test-runner /lava-473=
979/0 =

    ... (9 line(s) more)  =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6q-sabresd        | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60d1c2e994553c00f0413267

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-1=
57-g6a2d9370c405/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-1=
57-g6a2d9370c405/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d1c2e994553c00f0413=
268
        failing since 239 days (last pass: v5.9-13195-g0281c5220c40, first =
fail: v5.9-14860-gd56fc2efcc70) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/60d1c774584440193141328b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-1=
57-g6a2d9370c405/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-1=
57-g6a2d9370c405/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d1c7745844401931413=
28c
        failing since 1 day (last pass: v5.13-rc6-296-g227cd20c3337, first =
fail: v5.13-rc7-108-ga39bc0c7697f) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d1c9cad4cbb8ca8d413270

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-1=
57-g6a2d9370c405/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-1=
57-g6a2d9370c405/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d1c9cad4cbb8ca8d413=
271
        failing since 6 days (last pass: v5.13-rc5-356-g3bcfdddd7a62, first=
 fail: v5.13-rc6-246-g11b3d1320de4) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
meson-gxl-s805x-p241 | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d1cab0e46cbc4d5b413274

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-1=
57-g6a2d9370c405/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-1=
57-g6a2d9370c405/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d1cab0e46cbc4d5b413=
275
        new failure (last pass: v5.13-rc5-302-g2413b547bbb1) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60d1c10470804649e241328a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-1=
57-g6a2d9370c405/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-1=
57-g6a2d9370c405/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d1c10470804649e2413=
28b
        failing since 218 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60d1cd70287dce1228413278

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-1=
57-g6a2d9370c405/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-1=
57-g6a2d9370c405/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d1cd70287dce1228413=
279
        failing since 218 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60d1c1227b52595237413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-1=
57-g6a2d9370c405/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-1=
57-g6a2d9370c405/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d1c1227b52595237413=
267
        failing since 218 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60d1d1e7a08e56659a413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-1=
57-g6a2d9370c405/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-1=
57-g6a2d9370c405/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d1d1e7a08e56659a413=
267
        failing since 218 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60d1c0b11ea5855be441328b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-1=
57-g6a2d9370c405/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-1=
57-g6a2d9370c405/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d1c0b11ea5855be4413=
28c
        failing since 218 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
