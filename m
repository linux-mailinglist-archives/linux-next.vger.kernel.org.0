Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B547C3FBA51
	for <lists+linux-next@lfdr.de>; Mon, 30 Aug 2021 18:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237792AbhH3Qrw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Aug 2021 12:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237747AbhH3Qrv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Aug 2021 12:47:51 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F941C061575
        for <linux-next@vger.kernel.org>; Mon, 30 Aug 2021 09:46:58 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id w8so14004609pgf.5
        for <linux-next@vger.kernel.org>; Mon, 30 Aug 2021 09:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=dM1NHUObfwWMzCxWYlXeS409YbRt0SHbaVICjPV/WRo=;
        b=Od3vfdjdyqLbL7+vvlDnCAEGmVrOmEWK8c0EvixN09WP+fTTJiTSR/n9q9Jwy3jdr/
         yoVclBvUmYUbuo8NYXeqpR3mw5evyU+qImyAFOUcEESEDKETOt+/gyUeQNq5FG6slJWJ
         Vgy54ezpiV0uahOncR8V7eDBIofAtY9yPC6eTRkj/+QWn6z6lGAu8+ZzcUtW2BR7pXYA
         lZJVsLbye62orpKRtGnPCgE5QDkoYkIKwwyeDLgyQQinGluHQ4ZgVCd8B6qh777YHGQ/
         1STNWjnMlcwS/lGr6FRIEheiE6Fry1urLZqpt0dcnnVVuDvCQEIB+efsgRGwQWhior1/
         WLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=dM1NHUObfwWMzCxWYlXeS409YbRt0SHbaVICjPV/WRo=;
        b=UatrbChCsJXPOE51kXewVfLjbe4n11wfivkKUTAHUBYRjn6XrMSQR0VNnz59RKXGpL
         qYKJV1LqDwaGOYdS+vCztAlVZBiO4OhNwx7aaYtNe9aj/S4WHsQhGka9e5kcnclpr4OU
         Gx9mXQdURSkx45URmZ98u173HKALquR9n45o0XoRA/TsxKaSMpN/NaI1smCf3IB8pjnO
         Q55IZAGmsBuOqvaQl10rS3iy6jY5X4cMVraoyO43DIJiNbFx3jk+uCSD1RxzowkGOSXf
         aqfYXAu4EkCZkhUBufdhLZXl5TV0l+YrXfPX/ikY7LAnJBoMBm7ZsnifrNNyXIlmI+zZ
         yGLQ==
X-Gm-Message-State: AOAM531c/J9S9XcmbsLtZ7IdTxLGd+x8tv/Sf8X14YiyO0vQZEYOeZAS
        5UOZkSJwUFzkFJmr1lm6o6yT2fXQzhm0OGbl
X-Google-Smtp-Source: ABdhPJxzKTJ8BTqCkL0x8GN94p0Wv+eH0GfQie8WKc/vRwtFHIt2MJLz0G7Dl+zEj2gq1dTa9MwSpA==
X-Received: by 2002:a65:4486:: with SMTP id l6mr22381067pgq.145.1630342017188;
        Mon, 30 Aug 2021 09:46:57 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c12sm14300207pfl.56.2021.08.30.09.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 09:46:56 -0700 (PDT)
Message-ID: <612d0b80.1c69fb81.4f491.3d8b@mx.google.com>
Date:   Mon, 30 Aug 2021 09:46:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20210830
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
Subject: next/master baseline: 522 runs, 25 regressions (next-20210830)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 522 runs, 25 regressions (next-20210830)

Regressions Summary
-------------------

platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre | clang-12 | defconfig      =
              | 1          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre | gcc-8    | defconfig+CON..=
._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre | gcc-8    | defconfig      =
              | 1          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

beagle-xm               | arm   | lab-baylibre | clang-12 | multi_v7_defcon=
fig           | 1          =

beagle-xm               | arm   | lab-baylibre | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =

beagle-xm               | arm   | lab-baylibre | gcc-8    | multi_v7_defcon=
fig           | 1          =

beagle-xm               | arm   | lab-baylibre | gcc-8    | omap2plus_defco=
nfig          | 1          =

fsl-ls1088a-rdb         | arm64 | lab-nxp      | gcc-8    | defconfig+CON..=
._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb         | arm64 | lab-nxp      | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

hifive-unleashed-a00    | riscv | lab-baylibre | gcc-8    | defconfig      =
              | 1          =

imx6q-sabresd           | arm   | lab-nxp      | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =

imx8mn-ddr4-evk         | arm64 | lab-nxp      | gcc-8    | defconfig+ima  =
              | 2          =

imx8mp-evk              | arm64 | lab-nxp      | clang-12 | defconfig      =
              | 1          =

imx8mp-evk              | arm64 | lab-nxp      | gcc-8    | defconfig+ima  =
              | 1          =

imx8mp-evk              | arm64 | lab-nxp      | gcc-8    | defconfig+CON..=
._64K_PAGES=3Dy | 1          =

imx8mp-evk              | arm64 | lab-nxp      | gcc-8    | defconfig      =
              | 1          =

qemu_arm-versatilepb    | arm   | lab-baylibre | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-broonie  | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-cip      | gcc-8    | versatile_defco=
nfig          | 1          =

rk3328-rock64           | arm64 | lab-baylibre | gcc-8    | defconfig+CON..=
._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | clang-12 | defconfig      =
              | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-8    | defconfig+ima  =
              | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-8    | defconfig+CON..=
._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210830/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210830
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      93717cde744f9d26aa1b4561f7d9ba2a230459eb =



Test Regressions
---------------- =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre | clang-12 | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/612cd07a4d209683cb8e2d18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612cd07a4d209683cb8e2=
d19
        failing since 74 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre | gcc-8    | defconfig+CON..=
._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/612cd322397f0322e48e2c88

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612cd322397f0322e48e2=
c89
        failing since 74 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/612cd4764b6569033f8e2c8e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612cd4764b6569033f8e2=
c8f
        failing since 74 days (last pass: next-20210611, first fail: next-2=
0210617) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/612cd5ca1109ab10448e2cb3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612cd5ca1109ab10448e2=
cb4
        failing since 74 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
beagle-xm               | arm   | lab-baylibre | clang-12 | multi_v7_defcon=
fig           | 1          =


  Details:     https://kernelci.org/test/plan/id/612ccf469c06f871648e2c9f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210830/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210830/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612ccf469c06f871648e2=
ca0
        failing since 6 days (last pass: next-20210820, first fail: next-20=
210823) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
beagle-xm               | arm   | lab-baylibre | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/612ccecd55b2e9921e8e2c77

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210830/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210830/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612ccecd55b2e9921e8e2=
c78
        failing since 34 days (last pass: next-20210723, first fail: next-2=
0210726) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
beagle-xm               | arm   | lab-baylibre | gcc-8    | multi_v7_defcon=
fig           | 1          =


  Details:     https://kernelci.org/test/plan/id/612cd17586d0156f938e2c77

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210830/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210830/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612cd17586d0156f938e2=
c78
        failing since 6 days (last pass: next-20210820, first fail: next-20=
210823) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
beagle-xm               | arm   | lab-baylibre | gcc-8    | omap2plus_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/612cd01fe697f7e2ce8e2c77

  Results:     2 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210830/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210830/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/612cd01fe697f7e=
2ce8e2c7b
        new failure (last pass: next-20210827)
        17 lines

    2021-08-30T12:32:23.075025  <8>[   49.222259] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-08-30T12:32:23.112727  kern  :alert : 8<--- cut here ---
    2021-08-30T12:32:23.120399  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c05a9470
    2021-08-30T12:32:23.122791  kern  :alert : pgd =3D 0cb39aa9
    2021-08-30T12:32:23.126758  kern  :alert : [c05a9470] *pgd=3D8040840e(b=
ad)   =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
fsl-ls1088a-rdb         | arm64 | lab-nxp      | gcc-8    | defconfig+CON..=
._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/612cdb695f88d4afad8e2c80

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612cdb695f88d4afad8e2=
c81
        failing since 283 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
fsl-ls1088a-rdb         | arm64 | lab-nxp      | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/612ce0a1f7fb8b64778e2c80

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612ce0a1f7fb8b64778e2=
c81
        failing since 283 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
hifive-unleashed-a00    | riscv | lab-baylibre | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/612ccbab678113bc4a8e2ca1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210830/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210830/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612ccbab678113bc4a8e2=
ca2
        failing since 122 days (last pass: next-20210429, first fail: next-=
20210430) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
imx6q-sabresd           | arm   | lab-nxp      | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/612cd2e19ed30eeedc8e2cc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210830/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210830/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612cd2e19ed30eeedc8e2=
cc7
        failing since 308 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
imx8mn-ddr4-evk         | arm64 | lab-nxp      | gcc-8    | defconfig+ima  =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/612ccff4ba063d45bf8e2c8e

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/612ccff4ba063d4=
5bf8e2c95
        new failure (last pass: next-20210827)
        12 lines

    2021-08-30T12:32:10.697786  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   15.004741] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2021-08-30T12:32:10.697955  at virtual address 0000000000000098
    2021-08-30T12:32:10.698092  kern  :alert : Mem abort info:
    2021-08-30T12:32:10.698220  kern  :alert :   ESR =3D 0x96000046
    2021-08-30T12:32:10.698343  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2021-08-30T12:32:10.698448  kern  :alert :   SET =3D 0, FnV =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/612ccff4ba063d4=
5bf8e2c96
        new failure (last pass: next-20210827)
        2 lines

    2021-08-30T12:32:10.699182  kern  :alert :   EA<8>[   15.031260] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2021-08-30T12:32:10.699356   =3D 0, S1PTW =3D 0   =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
imx8mp-evk              | arm64 | lab-nxp      | clang-12 | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/612cd34f27fe702d548e2c77

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612cd34f27fe702d548e2=
c78
        new failure (last pass: next-20210824) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
imx8mp-evk              | arm64 | lab-nxp      | gcc-8    | defconfig+ima  =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/612cd575f215f5d4af8e2cb5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612cd575f215f5d4af8e2=
cb6
        new failure (last pass: next-20210826) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
imx8mp-evk              | arm64 | lab-nxp      | gcc-8    | defconfig+CON..=
._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/612cd744d65bb1df1d8e2c85

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612cd744d65bb1df1d8e2=
c86
        failing since 11 days (last pass: next-20210813, first fail: next-2=
0210819) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
imx8mp-evk              | arm64 | lab-nxp      | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/612cd93534534651fb8e2c88

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612cd93534534651fb8e2=
c89
        failing since 11 days (last pass: next-20210818, first fail: next-2=
0210819) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb    | arm   | lab-baylibre | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/612cca5866bd0c66478e2c86

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210830/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210830/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612cca5866bd0c66478e2=
c87
        failing since 285 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb    | arm   | lab-broonie  | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/612ccae5d19c0b32d18e2c7b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210830/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210830/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612ccae5d19c0b32d18e2=
c7c
        failing since 285 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb    | arm   | lab-cip      | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/612cca162a5586666e8e2c7a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210830/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210830/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612cca162a5586666e8e2=
c7b
        failing since 285 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
rk3328-rock64           | arm64 | lab-baylibre | gcc-8    | defconfig+CON..=
._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/612ccf7f29ff880f8c8e2c89

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612ccf7f29ff880f8c8e2=
c8a
        failing since 76 days (last pass: next-20210611, first fail: next-2=
0210615) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | clang-12 | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/612ccfccd3d82c64568e2c91

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig/clang-12/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig/clang-12/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612ccfccd3d82c64568e2=
c92
        new failure (last pass: next-20210827) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-8    | defconfig+ima  =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/612cd1353475bc04718e2c8c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612cd1353475bc04718e2=
c8d
        failing since 2 days (last pass: next-20210826, first fail: next-20=
210827) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-8    | defconfig+CON..=
._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/612cd29d873523155e8e2c84

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210830/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612cd29d873523155e8e2=
c85
        failing since 200 days (last pass: next-20210209, first fail: next-=
20210210) =

 =20
