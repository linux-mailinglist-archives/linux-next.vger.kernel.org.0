Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12B4036E9B6
	for <lists+linux-next@lfdr.de>; Thu, 29 Apr 2021 13:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231665AbhD2LmV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Apr 2021 07:42:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231135AbhD2LmU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 29 Apr 2021 07:42:20 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2994DC06138B
        for <linux-next@vger.kernel.org>; Thu, 29 Apr 2021 04:41:34 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id 20so30644610pll.7
        for <linux-next@vger.kernel.org>; Thu, 29 Apr 2021 04:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=L8taOXzzjDOMChbl+f48B3Bf7YaI8KxQRtXB5izHB8I=;
        b=2OnDp2DFh9jjRZPojL3OML733YCHRaTZYkVRvKXqi6Gm5zdCm1FlphEKX8neFu5+5i
         4q8LLn/elBKQ3JtRjE5EYl+Pe3FiK6a2qBjQ88Z8tdFz+aRgJ45U6U6Ztnh2W4x3OYqt
         BfWGZsIHQPF+hmLHsbDvPk35tKSlOr+wX3UXQyYyoJKVOud0PEm5sCzigMCFsNK5JAvn
         tfn21wd0yCNaRBfD7kwUT8R6GqYvuHLdbQnU2xS0giMKfeL7w5YDNL+5fYbk4k0l0uYQ
         QGyMK9sMLV8QZGGnP9Zg1HNhi2FR6DnOqG9ZUiQyvYzu06QBqZCqRdyFNYwn85ji/uAT
         SSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=L8taOXzzjDOMChbl+f48B3Bf7YaI8KxQRtXB5izHB8I=;
        b=bknG2dHNnizrzp5PpLWrDspesj6rpjx1vQyd9X3qPLC795pgOu5B7dRGU6oxlcOGBz
         j0lW+mUGAqtQgbWho+C4yUol+VEU3zPctLVvsRG5d9b0BcVhRbRgdhcZObWOr806/oO3
         gx8TXPfwfwbLDJPUMXK4zRpPj7m8gCuxleWLvziNY5L88RU0FAHfF/LJ0D7NdgMuyi7W
         7tDW99a8XVXHNftD2aivQmYspq5HBpk2ya9rhAK2BVDauu/XPbxwfKggG+QYn6D54XS0
         7QTDa7Y5Q4Ucsc6ziQjnDKi/4NY6CZi9REJhzVmVVa30AthscWu+7OieY+2dQ6ippVLl
         ILng==
X-Gm-Message-State: AOAM533t/86XoojK4gPpEdhIMMQIHvZvpiFWDZeVOaI0fnhfQa8WDf5Z
        7OlPsln4nKd4uR6LeNkFfCjnQ8fuxRb+Fasv
X-Google-Smtp-Source: ABdhPJykw0/l7FXVvBOO42TgF5Xclvzi/z3Ao11TcKbfN7ttMtuDDqmUqCPpwRWhTpUm7Ca/dHSz8Q==
X-Received: by 2002:a17:90b:393:: with SMTP id ga19mr12958496pjb.134.1619696493167;
        Thu, 29 Apr 2021 04:41:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j21sm406901pjl.27.2021.04.29.04.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 04:41:32 -0700 (PDT)
Message-ID: <608a9b6c.1c69fb81.f1738.0b50@mx.google.com>
Date:   Thu, 29 Apr 2021 04:41:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20210429
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 536 runs, 18 regressions (next-20210429)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 536 runs, 18 regressions (next-20210429)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre  | clang-10 | defconfig    =
                | 2          =

bcm2837-rpi-3-b          | arm64 | lab-baylibre  | clang-10 | defconfig+CON=
..._64K_PAGES=3Dy | 2          =

bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 2          =

bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig    =
                | 2          =

imx8mp-evk               | arm64 | lab-nxp       | clang-10 | defconfig    =
                | 1          =

imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig    =
                | 1          =

imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

mt8173-elm-hana          | arm64 | lab-collabora | clang-10 | defconfig+CON=
..._64K_PAGES=3Dy | 2          =

qemu_arm-versatilepb     | arm   | lab-baylibre  | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb     | arm   | lab-broonie   | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb     | arm   | lab-cip       | gcc-8    | versatile_def=
config          | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | clang-10 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210429/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210429
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9e5cff2a1315fec1da1f497714395670366506b6 =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre  | clang-10 | defconfig    =
                | 2          =


  Details:     https://kernelci.org/test/plan/id/608a616cf078f5cf9f9b7798

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210429/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210429/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/608a616cf078f5c=
f9f9b779e
        failing since 22 days (last pass: next-20210323, first fail: next-2=
0210406)
        11 lines

    2021-04-29 07:33:42.436000+00:00  kern  :alert : Mem abort in[   21.680=
553] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D11>
    2021-04-29 07:33:42.437000+00:00  fo:
    2021-04-29 07:33:42.437000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/608a616cf078f5c=
f9f9b779f
        failing since 22 days (last pass: next-20210323, first fail: next-2=
0210406)
        2 lines

    2021-04-29 07:33:42.442000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-29 07:33:42.442000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-29 07:33:42.443000+00:00  kern  :alert : Data abort info:
    2021-04-29 07:33:42.444000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-29 07:33:42.478000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-29 07:33:42.479000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D0000000007259[   21.720367] <LAVA_SIGNAL_TESTCASE TEST=
_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-29 07:33:42.480000+00:00  000
    2021-04-29 07:33:42.480000+00:00  kern  :alert : [000[   21.730999] <LA=
VA_SIGNAL_ENDRUN 0_dmesg 154812_1.5.2.4.1>   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre  | clang-10 | defconfig+CON=
..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/608a64c9f7af0472499b77a4

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210429/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210429/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/608a64c9f7af047=
2499b77aa
        failing since 22 days (last pass: next-20210323, first fail: next-2=
0210406)
        11 lines

    2021-04-29 07:48:01.938000+00:00  kern  :alert : Mem abort info:
    2021-04-29 07:48:01.939000+00:00  kern  :aler[   21.802787] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1=
1>
    2021-04-29 07:48:01.940000+00:00  t :   ESR =3D 0x96000007   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/608a64c9f7af047=
2499b77ab
        failing since 22 days (last pass: next-20210323, first fail: next-2=
0210406)
        2 lines

    2021-04-29 07:48:01.944000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-29 07:48:01.945000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-29 07:48:01.945000+00:00  kern  :alert : Data abort info:
    2021-04-29 07:48:01.946000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000007
    2021-04-29 07:48:01.947000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-29 07:48:01.980000+00:00  kern  :alert : user pgtable: 64k page=
s, 48-bit VAs, pgdp=3D0000000002820e00
    2021-04-29 07:48:01.982000+00:00  kern  :alert : [0000000000000050] pgd=
=3D080000000c810003, p4d=3D080000000c810003, pud=3D08000000[   21.849702] <=
LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASU=
REMENT=3D2>   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/608a5d3471950306759b77aa

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210429/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210429/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/608a5d347195030=
6759b77b0
        failing since 22 days (last pass: next-20210323, first fail: next-2=
0210406)
        11 lines

    2021-04-29 07:15:43.889000+00:00  kern  :alert : Mem [   21.785155] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-29 07:15:43.890000+00:00  abort info:
    2021-04-29 07:15:43.891000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/608a5d347195030=
6759b77b1
        failing since 22 days (last pass: next-20210323, first fail: next-2=
0210406)
        2 lines

    2021-04-29 07:15:43.895000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-29 07:15:43.896000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-29 07:15:43.896000+00:00  kern  :alert : Data abort info:
    2021-04-29 07:15:43.897000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-29 07:15:43.925000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-29 07:15:43.926000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000[   21.824464] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-29 07:15:43.927000+00:00  0003a995000
    2021-04-29 07:15:43.928000+00:00  kern  :aler[   21.835184] <LAVA_SIGNA=
L_ENDRUN 0_dmesg 154590_1.5.2.4.1>   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig    =
                | 2          =


  Details:     https://kernelci.org/test/plan/id/608a5e883c7f2ea7529b7799

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210429/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210429/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/608a5e883c7f2ea=
7529b779f
        failing since 9 days (last pass: next-20210416, first fail: next-20=
210419)
        11 lines

    2021-04-29 07:21:24.337000+00:00  kern  :alert : Mem abort in[   21.770=
771] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D11>
    2021-04-29 07:21:24.338000+00:00  fo:
    2021-04-29 07:21:24.339000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/608a5e883c7f2ea=
7529b77a0
        failing since 9 days (last pass: next-20210416, first fail: next-20=
210419)
        2 lines

    2021-04-29 07:21:24.343000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-29 07:21:24.344000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-29 07:21:24.344000+00:00  kern  :alert : Data abort info:
    2021-04-29 07:21:24.345000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-29 07:21:24.389000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-29 07:21:24.390000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D000000003a8f8000
    2021-04-29 07:21:24.391000+00:00  ker[   21.810944] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mp-evk               | arm64 | lab-nxp       | clang-10 | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/608a668266b12421359b7816

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210429/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210429/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608a668266b12421359b7=
817
        failing since 1 day (last pass: next-20210427, first fail: next-202=
10428) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/608a5f03fa649e88b89b77c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210429/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210429/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608a5f03fa649e88b89b7=
7c9
        failing since 1 day (last pass: next-20210427, first fail: next-202=
10428) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/608a61195b0a073ce79b77a2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210429/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210429/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608a61195b0a073ce79b7=
7a3
        new failure (last pass: next-20210428) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/608a63ad814142ad7c9b77a5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210429/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210429/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608a63ad814142ad7c9b7=
7a6
        new failure (last pass: next-20210428) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
mt8173-elm-hana          | arm64 | lab-collabora | clang-10 | defconfig+CON=
..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/608a64c9b9e962e9f09b77a8

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210429/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-mt81=
73-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210429/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-mt81=
73-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/608a64c9b9e962e9f09b77bc
        failing since 22 days (last pass: next-20210323, first fail: next-2=
0210406) =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/608=
a64c9b9e962e9f09b77c2
        failing since 22 days (last pass: next-20210323, first fail: next-2=
0210406)

    2021-04-29 07:48:22.453000+00:00  <8>[   56.878908] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-baylibre  | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/608a5c8177f2fd363e9b7795

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210429/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210429/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608a5c8177f2fd363e9b7=
796
        failing since 162 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-broonie   | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/608a5c9eb13af838d99b77a1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210429/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210429/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608a5c9eb13af838d99b7=
7a2
        failing since 162 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-cip       | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/608a5cbbb13af838d99b77b5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210429/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210429/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608a5cbbb13af838d99b7=
7b6
        failing since 162 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | clang-10 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/608a65cb7d9b6dc0489b77df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210429/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774a1-h=
ihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210429/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774a1-h=
ihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608a65cb7d9b6dc0489b7=
7e0
        new failure (last pass: next-20210428) =

 =20
