Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 010A340156A
	for <lists+linux-next@lfdr.de>; Mon,  6 Sep 2021 06:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbhIFESF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Sep 2021 00:18:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbhIFESD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Sep 2021 00:18:03 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 599A7C061575
        for <linux-next@vger.kernel.org>; Sun,  5 Sep 2021 21:16:59 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id c17so5495710pgc.0
        for <linux-next@vger.kernel.org>; Sun, 05 Sep 2021 21:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bXuKlGMtm8BAVz6n+/dxyuGuFHoTy0s/v5q/lhAfhWY=;
        b=MKrweq7c3savFdBwoQN86d5rQxISozQ4Tbf5hv7t0OZoPN/auIGf5x+iOVmgbivE1F
         cBdgUo0o0YAtagu91uHNFvvMg34PH0j5lGU+AchzQBJOX68P38xhCyhimLKvq0VsovQe
         Co7OMEVfdEv71OqfpUM/yAzAEhhjui/A1xwj/dKkc+B8iBTWXfzeYwEEBSoWufZcj+Fl
         EqLaFwOHWAMArmjBhlCkPFVhmc9OHXfi1NH/eZ8rc5FazCYnFXPiICvjke3gz0raDpvz
         amwXIZ0HI3vf3LZoDGkLw6CsIOV1kplAev/qJylODxcliTgYIYPstSuXq5faxTSBNOUL
         lk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bXuKlGMtm8BAVz6n+/dxyuGuFHoTy0s/v5q/lhAfhWY=;
        b=eIZ8bBy1slCKr2tI/T3a1GJeoRWJ7dsKw8SkTxZmycqEe9V58Dg/6veg/3lQCl37OB
         JBpQbs4MzR4R2R8Za/gtNfswfyrPMqHYUKScJxeISf9bgjUdazE6D3TY6XwhS/s9jX0z
         5q66Vs8/12P3ZPk2F9+n1UN70S48Dnxet9IMryr73KhZ6MMOHIi2ZhZkrVerccbnRMsY
         IEvFK7blDu8CrtfjXlC1D684HR+0vTbk4qhhbHoTTwVMvbpNekNjmECvO+F8vvKket6X
         R1d0m58gMO2Baql5CP+4W8HId1nwj+3RrlvZZBFPCygLTl1YWAyIair97rzBTVHJxV92
         2yqQ==
X-Gm-Message-State: AOAM5331qOrvzWJi51Wqjayc048aEuk0jfRBaLvNhXIf26/GPmouC/eU
        V8GkxKDusGSQ1TveayRAA0XyogINoeB85VK5
X-Google-Smtp-Source: ABdhPJyAIJzfp8tOWRu09dGmkDsVxZDPmL8my6wAHqi7rDQlosJFdctFHTRiTPTxHtj3+1g/XLSfhA==
X-Received: by 2002:aa7:8e81:0:b0:3fe:f212:f9dd with SMTP id a1-20020aa78e81000000b003fef212f9ddmr9842388pfr.46.1630901818260;
        Sun, 05 Sep 2021 21:16:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i10sm5874908pfk.87.2021.09.05.21.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 21:16:57 -0700 (PDT)
Message-ID: <61359639.1c69fb81.80831.192c@mx.google.com>
Date:   Sun, 05 Sep 2021 21:16:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.14-9800-g9a811bf862bf
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 605 runs,
 31 regressions (v5.14-9800-g9a811bf862bf)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 605 runs, 31 regressions (v5.14-9800-g9a811bf8=
62bf)

Regressions Summary
-------------------

platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig   =
                 | 1          =

beagle-xm               | arm   | lab-baylibre    | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

beagle-xm               | arm   | lab-baylibre    | gcc-8    | multi_v7_def=
config           | 1          =

beagle-xm               | arm   | lab-baylibre    | gcc-8    | multi_v7_def=
config+ima       | 1          =

beagle-xm               | arm   | lab-baylibre    | gcc-8    | multi_v7_def=
config+crypto    | 1          =

beagle-xm               | arm   | lab-baylibre    | gcc-8    | omap2plus_de=
fconfig          | 1          =

hip07-d05               | arm64 | lab-collabora   | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

hip07-d05               | arm64 | lab-collabora   | gcc-8    | defconfig   =
                 | 1          =

imx6q-sabresd           | arm   | lab-nxp         | gcc-8    | imx_v6_v7_de=
fconfig          | 1          =

imx6ull-14x14-evk       | arm   | lab-nxp         | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

imx8mn-ddr4-evk         | arm64 | lab-nxp         | gcc-8    | defconfig+cr=
ypto             | 2          =

imx8mp-evk              | arm64 | lab-nxp         | gcc-8    | defconfig+cr=
ypto             | 1          =

imx8mp-evk              | arm64 | lab-nxp         | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

imx8mp-evk              | arm64 | lab-nxp         | gcc-8    | defconfig   =
                 | 1          =

qemu_arm-versatilepb    | arm   | lab-baylibre    | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-broonie     | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-cip         | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-collabora   | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-linaro-lkft | gcc-8    | versatile_de=
fconfig          | 1          =

rk3288-veyron-jaq       | arm   | lab-collabora   | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

rk3288-veyron-jaq       | arm   | lab-collabora   | gcc-8    | multi_v7_def=
config           | 1          =

rk3288-veyron-jaq       | arm   | lab-collabora   | gcc-8    | multi_v7_def=
c...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq       | arm   | lab-collabora   | gcc-8    | multi_v7_def=
config+ima       | 1          =

rk3288-veyron-jaq       | arm   | lab-collabora   | gcc-8    | multi_v7_def=
config+crypto    | 1          =

rk3399-gru-kevin        | arm64 | lab-collabora   | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =

rk3399-gru-kevin        | arm64 | lab-collabora   | gcc-8    | defconfig   =
                 | 2          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig+cr=
ypto             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.14-9800-g9a811bf862bf/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.14-9800-g9a811bf862bf
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9a811bf862bf4843cbfd00df9d409777c40bc76f =



Test Regressions
---------------- =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61355fb319ff7e67afd59669

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/=
baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/=
baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61355fb319ff7e67afd59=
66a
        failing since 61 days (last pass: v5.13-3495-gfbf137d9483a, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/613562709fa850dd09d59687

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613562709fa850dd09d59=
688
        failing since 61 days (last pass: v5.13-3495-gfbf137d9483a, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
beagle-xm               | arm   | lab-baylibre    | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61355c1519a69bcebad5968f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/base=
line-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/base=
line-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61355c1519a69bcebad59=
690
        failing since 55 days (last pass: v5.10-rc7-201-gc9b6935dc4f4, firs=
t fail: v5.14-rc1-225-g25a1eba130d1) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
beagle-xm               | arm   | lab-baylibre    | gcc-8    | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/61355c7f4f5b7b2a25d5969c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61355c7f4f5b7b2a25d59=
69d
        failing since 12 days (last pass: v5.14-rc6-152-g898ee1d3a2b1, firs=
t fail: v5.14-rc7-72-geeb46b4d4bd9) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
beagle-xm               | arm   | lab-baylibre    | gcc-8    | multi_v7_def=
config+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/61355e35cc991a8f6ad5966b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61355e35cc991a8f6ad59=
66c
        failing since 4 days (last pass: v5.14-1642-g50a532577e29, first fa=
il: v5.14-2864-gb16f07edf2d7) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
beagle-xm               | arm   | lab-baylibre    | gcc-8    | multi_v7_def=
config+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/61355e960f1061bac2d59688

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/multi_v7_defconfig+crypto/gcc-8/lab-baylibre/baseline-bea=
gle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/multi_v7_defconfig+crypto/gcc-8/lab-baylibre/baseline-bea=
gle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61355e960f1061bac2d59=
689
        failing since 2 days (last pass: v5.14-6828-g521f6987a116, first fa=
il: v5.14-8174-g2f453ff3ea7f) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
beagle-xm               | arm   | lab-baylibre    | gcc-8    | omap2plus_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61355f65fc32fae6f1d5969e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61355f65fc32fae6f1d59=
69f
        failing since 2 days (last pass: v5.14-6828-g521f6987a116, first fa=
il: v5.14-8174-g2f453ff3ea7f) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
hip07-d05               | arm64 | lab-collabora   | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/613563efc865eed3b2d5967c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora=
/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora=
/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613563efc865eed3b2d59=
67d
        failing since 61 days (last pass: v5.13-1843-g646572bd9313, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
hip07-d05               | arm64 | lab-collabora   | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/61356b3b55888e845bd59671

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61356b3b55888e845bd59=
672
        failing since 66 days (last pass: v5.13-rc7-277-gfd6ae26c403a, firs=
t fail: v5.13-2793-g5c4584a79cad) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx6q-sabresd           | arm   | lab-nxp         | gcc-8    | imx_v6_v7_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61355d5be39e79c068d59678

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61355d5be39e79c068d59=
679
        failing since 315 days (last pass: v5.9-13195-g0281c5220c40, first =
fail: v5.9-14860-gd56fc2efcc70) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx6ull-14x14-evk       | arm   | lab-nxp         | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61355f9f427f76b69dd59688

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-=
imx6ull-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-=
imx6ull-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61355f9f427f76b69dd59=
689
        new failure (last pass: v5.14-8174-g2f453ff3ea7f) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk         | arm64 | lab-nxp         | gcc-8    | defconfig+cr=
ypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/61355f0447333e6270d59692

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61355f0447333e6=
270d59699
        new failure (last pass: v5.14-8174-g2f453ff3ea7f)
        12 lines

    2021-09-06T00:21:01.609915  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   14.210337] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61355f0447333e6=
270d5969a
        new failure (last pass: v5.14-8174-g2f453ff3ea7f)
        2 lines

    2021-09-06T00:21:01.610763  at virtual address 0000000000000098
    2021-09-06T00:21:01.610869  kern  :alert : Mem abort info:
    2021-09-06T00:21:01.610970  kern  :alert :   ESR =3D 0x96000046
    2021-09-06T00:21:01.611070  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2021-09-06T00:21:01.611190  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-09-06T00:21:01.611481  kern  :alert :   EA<8>[   14.236266] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2021-09-06T00:21:01.611599   =3D 0, S1PTW =3D 0   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx8mp-evk              | arm64 | lab-nxp         | gcc-8    | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61355f50dea41d7946d59696

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61355f50dea41d7946d59=
697
        new failure (last pass: v5.14-8174-g2f453ff3ea7f) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx8mp-evk              | arm64 | lab-nxp         | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/613561d4b96c5bbd59d5967f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/basel=
ine-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/basel=
ine-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613561d4b96c5bbd59d59=
680
        new failure (last pass: v5.14-8174-g2f453ff3ea7f) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx8mp-evk              | arm64 | lab-nxp         | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/613565069f845b25bbd596b6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613565069f845b25bbd59=
6b7
        failing since 3 days (last pass: v5.14-619-gacb79da497df, first fai=
l: v5.14-6828-g521f6987a116) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-baylibre    | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61355ccf2cb4ea76cfd59672

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-=
versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-=
versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61355ccf2cb4ea76cfd59=
673
        failing since 293 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-broonie     | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/613561008d2bd96c81d5967f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-v=
ersatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-v=
ersatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613561008d2bd96c81d59=
680
        failing since 293 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-cip         | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/613559615ffb041ad4d5966e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versa=
tilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versa=
tilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613559615ffb041ad4d59=
66f
        failing since 293 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-collabora   | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6135590ba446ecfb8ad59686

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6135590ba446ecfb8ad59=
687
        failing since 293 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-linaro-lkft | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61355920488da2c4d8d59692

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61355920488da2c4d8d59=
693
        failing since 293 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3288-veyron-jaq       | arm   | lab-collabora   | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61355f0c1f754cb062d596b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61355f0c1f754cb062d59=
6b1
        failing since 3 days (last pass: v5.14-rc7-72-geeb46b4d4bd9, first =
fail: v5.14-6828-g521f6987a116) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3288-veyron-jaq       | arm   | lab-collabora   | gcc-8    | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/613567405ebc8cf82ad59692

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-ve=
yron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-ve=
yron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613567405ebc8cf82ad59=
693
        failing since 3 days (last pass: v5.14-rc7-111-g9541ebae8a1d, first=
 fail: v5.14-6828-g521f6987a116) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3288-veyron-jaq       | arm   | lab-collabora   | gcc-8    | multi_v7_def=
c...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61356b9024b9298a1ad5968d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-8/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61356b9024b9298a1ad59=
68e
        failing since 3 days (last pass: v5.14-rc7-111-g9541ebae8a1d, first=
 fail: v5.14-6828-g521f6987a116) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3288-veyron-jaq       | arm   | lab-collabora   | gcc-8    | multi_v7_def=
config+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/61356d94c31ea7cb17d59665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/multi_v7_defconfig+ima/gcc-8/lab-collabora/baseline-rk328=
8-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/multi_v7_defconfig+ima/gcc-8/lab-collabora/baseline-rk328=
8-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61356d94c31ea7cb17d59=
666
        failing since 3 days (last pass: v5.14-rc7-111-g9541ebae8a1d, first=
 fail: v5.14-6828-g521f6987a116) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3288-veyron-jaq       | arm   | lab-collabora   | gcc-8    | multi_v7_def=
config+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/61356ef5b85db056b3d59665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/multi_v7_defconfig+crypto/gcc-8/lab-collabora/baseline-rk=
3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm/multi_v7_defconfig+crypto/gcc-8/lab-collabora/baseline-rk=
3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61356ef5b85db056b3d59=
666
        failing since 3 days (last pass: v5.14-rc7-111-g9541ebae8a1d, first=
 fail: v5.14-6828-g521f6987a116) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3399-gru-kevin        | arm64 | lab-collabora   | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61355ebeb14c6b673cd59682

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora=
/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora=
/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/61355ebeb14c6b673cd59688
        failing since 55 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-09-06T00:20:05.184119  /lava-4453841/1/../bin/lava-test-case   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/61355ebeb14c6b673cd59689
        failing since 55 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-09-06T00:20:04.149421  /lava-4453841/1/../bin/lava-test-case
    2021-09-06T00:20:04.161475  <8>[   24.329158] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3399-gru-kevin        | arm64 | lab-collabora   | gcc-8    | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/61356a05ff6b5128b3d59667

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/61356a05ff6b5128b3d5966d
        failing since 55 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-09-06T01:07:51.764426  /lava-4453934/1/../bin/lava-test-case
    2021-09-06T01:07:51.776173  <8>[   25.401117] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/61356a05ff6b5128b3d5966e
        failing since 55 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-09-06T01:07:49.710079  <8>[   23.333804] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-09-06T01:07:50.730019  /lava-4453934/1/../bin/lava-test-case
    2021-09-06T01:07:50.742187  <8>[   24.367108] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61355e64f53a099730d59682

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm64/defconfig+crypto/gcc-8/lab-clabbe/baseline-sun50i-a64-b=
ananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-9800-=
g9a811bf862bf/arm64/defconfig+crypto/gcc-8/lab-clabbe/baseline-sun50i-a64-b=
ananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61355e64f53a099730d59=
683
        failing since 2 days (last pass: v5.14-6828-g521f6987a116, first fa=
il: v5.14-8174-g2f453ff3ea7f) =

 =20
