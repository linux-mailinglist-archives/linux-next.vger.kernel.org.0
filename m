Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D37DE39C4CE
	for <lists+linux-next@lfdr.de>; Sat,  5 Jun 2021 03:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231132AbhFEBWp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Jun 2021 21:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbhFEBWn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Jun 2021 21:22:43 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F45BC061766
        for <linux-next@vger.kernel.org>; Fri,  4 Jun 2021 18:20:47 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id i22so6504600pju.0
        for <linux-next@vger.kernel.org>; Fri, 04 Jun 2021 18:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=OtIgmjN+b8dSCYv0MZLcCRTeYULouvOnRG/mTTFyRJY=;
        b=q+Ae3zITXQ/UMdIcL4QlUM7xDuu/7no9nDRGxq8pgOYCipGDuPRk8pNW7x/jm9HAYK
         N7dfvDtqMJ0PmVOefoP3hYta/asHnOz/VhCgsX0BRF7spmIVCclGWFptZtbE/+L7qBOO
         N2/aMBHrXmKcqf2s5/YfbigtyfNY0xeP9pDgZmLSdmaO1Sp9j1CMVZ5mzgdVzVw0d7cw
         +z+zIFyNBvneFOKEkvFP63vZglNloCmzPax70PK0vtopPSCnVrliK3X1VxDqk/ElKr/d
         he/oWjskjEa1lJM+7Ho1jQAqJvL10oEWIHLJBCue/PKaEXzOzRp7ZXH7wIFUktLgpbe3
         4m0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=OtIgmjN+b8dSCYv0MZLcCRTeYULouvOnRG/mTTFyRJY=;
        b=TfCfLCnLIk2cLEON/C1OxvEdTXOPqK4O1AN/2zWFpYWWugIOrRZ9mGyhyiqZGbSEry
         0gmy0PSsQuSWaeBzMP3Dk6aZcexr9K822Ud6H0AhoTEJrkxsVG/4NLHLAJW2OaTkUPNm
         lWbvrQzggNlhU+HUC+z4niUujEfHCMPIGHQ5SAJX3Vfb/AsrgR0BA5U8tJU8Z89b/CFV
         Kzc3U+hauV9H9bArtVhuUuuJqTSipEsyOtdGYBqUh2oKtgxPmvOjE+ED+PacuR8NMckg
         Ipp4BJpmLLAVrxO6J/uYEUNzN06DmFVrUyI4GHyNrE8khv7U31ve1LQ81aPoHNMuK5T5
         p8SA==
X-Gm-Message-State: AOAM532YiHkxP1WrDomIXDaUr8Di97JQBGl47K4MKXqgftpvhs72zVK3
        WymvVUgQyoxDfrUjxOI1MOUA+AhK02b1SHJw
X-Google-Smtp-Source: ABdhPJwdbEKyAOkXEm+Q3xZCuzLosJK/z1Vj0a/WVe1mHk/ReXqDv9YRW8gXBBU5x8o4YMfzGlns7g==
X-Received: by 2002:a17:90b:503:: with SMTP id r3mr7880775pjz.195.1622856045955;
        Fri, 04 Jun 2021 18:20:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s21sm2607428pfw.57.2021.06.04.18.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 18:20:45 -0700 (PDT)
Message-ID: <60bad16d.1c69fb81.b09dc.949c@mx.google.com>
Date:   Fri, 04 Jun 2021 18:20:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20210604
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 628 runs, 32 regressions (next-20210604)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 628 runs, 32 regressions (next-20210604)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora   | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre    | clang-12 | defconfig+CON..=
._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre    | clang-12 | defconfig      =
              | 1          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

hifive-unleashed-a00 | riscv | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =

hip07-d05            | arm64 | lab-collabora   | gcc-8    | defconfig      =
              | 2          =

imx6q-sabresd        | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =

imx8mp-evk           | arm64 | lab-nxp         | clang-12 | defconfig+CON..=
._64K_PAGES=3Dy | 1          =

imx8mp-evk           | arm64 | lab-nxp         | clang-12 | defconfig      =
              | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
              | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

meson-gxm-q200       | arm64 | lab-baylibre    | clang-12 | defconfig      =
              | 2          =

meson-gxm-q200       | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 2          =

meson-gxm-q200       | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
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

rk3399-gru-kevin     | arm64 | lab-collabora   | clang-12 | defconfig      =
              | 5          =

rk3399-gru-kevin     | arm64 | lab-collabora   | gcc-8    | defconfig      =
              | 2          =

rk3399-gru-kevin     | arm64 | lab-collabora   | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210604/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210604
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ccc252d2e818f6a479441119ad453c3ce7c7c461 =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora   | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ba9909dccf8094660c0e51

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210604/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210604/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ba9909dccf8094660c0=
e52
        failing since 100 days (last pass: next-20210223, first fail: next-=
20210224) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | clang-12 | defconfig+CON..=
._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ba8f446475b07afe0c0e33

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210525082610+328a6=
ec95532-1~exp1~20210525063323.98)
  Plain log:   https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ba8f446475b07afe0c0=
e34
        new failure (last pass: next-20210601) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | clang-12 | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/60ba91ec4b1f3437840c0e70

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210525082610+328a6=
ec95532-1~exp1~20210525063323.98)
  Plain log:   https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ba91ec4b1f3437840c0=
e71
        failing since 1 day (last pass: next-20210528, first fail: next-202=
10603) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/60ba8c379406980e220c0df7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ba8c379406980e220c0=
df8
        new failure (last pass: next-20210603) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ba90986fa9611de90c0e35

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ba90986fa9611de90c0=
e36
        new failure (last pass: next-20210603) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/60ba879bbba0df994a0c0dfd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210604/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210604/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ba879bbba0df994a0c0=
dfe
        failing since 35 days (last pass: next-20210429, first fail: next-2=
0210430) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
hip07-d05            | arm64 | lab-collabora   | gcc-8    | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/60ba96b517453ade240c0e14

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60ba96b517453ad=
e240c0e18
        failing since 45 days (last pass: next-20210416, first fail: next-2=
0210419)
        11 lines

    2021-06-04 21:09:56.267000+00:00  uest at virtual address fffffbfffe800=
0e4
    2021-06-04 21:09:56.267000+00:00  kern  :alert : Mem abort info:
    2021-06-04 21:09:56.268000+00:00  kern  :alert :   ESR =3D 0x96000006
    2021-06-04 21:09:56.268000+00:00  kern [   22.471994] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60ba96b517453ad=
e240c0e19
        failing since 45 days (last pass: next-20210416, first fail: next-2=
0210419)
        2 lines =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6q-sabresd        | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ba8e4dbafc9c2aba0c0e15

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210604/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210604/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ba8e4dbafc9c2aba0c0=
e16
        failing since 221 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | clang-12 | defconfig+CON..=
._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ba9262daaf2293d30c0e84

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210525082610+328a6=
ec95532-1~exp1~20210525063323.98)
  Plain log:   https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ba9262daaf2293d30c0=
e85
        new failure (last pass: next-20210601) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | clang-12 | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/60ba967e17453ade240c0df7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210525082610+328a6=
ec95532-1~exp1~20210525063323.98)
  Plain log:   https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ba967e17453ade240c0=
df8
        failing since 1 day (last pass: next-20210528, first fail: next-202=
10603) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/60ba90a64d098e57790c0df7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ba90a64d098e57790c0=
df8
        new failure (last pass: next-20210603) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ba9467ef6c005e0d0c0dfe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ba9467ef6c005e0d0c0=
dff
        new failure (last pass: next-20210603) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
meson-gxm-q200       | arm64 | lab-baylibre    | clang-12 | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/60ba91ad7fbadb5a1f0c0dfc

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210525082610+328a6=
ec95532-1~exp1~20210525063323.98)
  Plain log:   https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60ba91ad7fbadb5=
a1f0c0e00
        new failure (last pass: next-20210603)
        7 lines

    2021-06-04 20:48:32.738000+00:00  kern  :alert : Mem abort info:
    2021-06-04 20:48:32.738000+00:00  kern  <8>[   15.750058] <LAVA_SIGNAL_=
TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D7>
    2021-06-04 20:48:32.739000+00:00  :alert :   ESR =3D 0x86000004
    2021-06-04 20:48:32.739000+00:00  kern  :alert :   EC =3D 0x21: IABT (c=
urrent EL), IL =3D 32 bits
    2021-06-04 20:48:32.739000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-06-04 20:48:32.739000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-06-04 20:48:32.739000+00:00  kern  :alert : [ffdf8000102b8e80] add=
ress between user and kernel address ranges   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60ba91ad7fbadb5=
a1f0c0e01
        new failure (last pass: next-20210603)
        2 lines

    2021-06-04 20:48:32.775000+00:00  ops: 86000004 [#1<8>[   15.790898] <L=
AVA_SIGNAL_ENDRUN 0_dmesg 414124_1.5.2.4.1>
    2021-06-04 20:48:32.775000+00:00  ] PREEMPT SMP
    2021-06-04 20:48:32.775000+00:00  kern  :emerg : Code: bad PC value
    2021-06-04 20:48:32.776000+00:00  + set +x
    2021-06-04 20:48:32.879000+00:00  / # #   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
meson-gxm-q200       | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/60ba8bbc84e7fbc7610c0df9

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60ba8bbc84e7fbc=
7610c0dfd
        new failure (last pass: next-20210603)
        10 lines =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60ba8bbc84e7fbc=
7610c0dfe
        new failure (last pass: next-20210603)
        2 lines

    2021-06-04 20:23:16.237000+00:00  kern  :alert : Data abort info:
    2021-06-04 20:23:16.237000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000004
    2021-06-04 20:23:16.238000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-06-04 20:23:16.238000+00:00  kern  :alert : [ffdf0000078c7a90] add=
ress between user and kernel address ranges
    2021-06-04 20:23:16.238000+00:00  kern  :emerg : Internal error: Oops: =
96000004 [#1] PREEMPT SMP
    2021-06-04 20:23:16.238000+00:00  kern  :emerg : Code: 9287ff40 fa40002=
0 54000288 a9400<8>[   16.358422] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demer=
g RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
meson-gxm-q200       | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ba90596bf160253e0c0e09

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ba90596bf160253e0c0=
e0a
        new failure (last pass: next-20210603) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ba8c7a098fe2aa750c0df5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210604/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210604/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ba8c7a098fe2aa750c0=
df6
        failing since 198 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ba8f250753df86560c0e0c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210604/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210604/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ba8f250753df86560c0=
e0d
        failing since 198 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ba8c755f750e68c00c0e01

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210604/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210604/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ba8c755f750e68c00c0=
e02
        failing since 198 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ba8eb20cacee2da30c0e46

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210604/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210604/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ba8eb20cacee2da30c0=
e47
        failing since 198 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ba8c2627b9f6b4c60c0e10

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210604/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210604/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ba8c2627b9f6b4c60c0=
e11
        failing since 198 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
rk3399-gru-kevin     | arm64 | lab-collabora   | clang-12 | defconfig      =
              | 5          =


  Details:     https://kernelci.org/test/plan/id/60ba92dfcdedde7b260c0e3c

  Results:     85 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210525082610+328a6=
ec95532-1~exp1~20210525063323.98)
  Plain log:   https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig/clang-12/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig/clang-12/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/60ba92dfcdedde7b260c0e54
        failing since 1 day (last pass: next-20210528, first fail: next-202=
10603)

    2021-06-04 20:53:41.962000+00:00  /lava-3964317/1/../bin/lava-test-case=
   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/60ba92dfcdedde7b260c0e55
        failing since 1 day (last pass: next-20210528, first fail: next-202=
10603)

    2021-06-04 20:53:43+00:00  /lava-3964317/1/../bin/lava-test-case
    2021-06-04 20:53:43.012000+00:00  <8>[   22.869565] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/60ba92dfcdedde7b260c0e56
        failing since 1 day (last pass: next-20210528, first fail: next-202=
10603)

    2021-06-04 20:53:44.049000+00:00  <8>[   23.906519] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/60ba92dfcdedde7b260c0e94
        new failure (last pass: next-20210603)

    2021-06-04 20:53:46.920000+00:00  <8>[   26.778489] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/60ba92dfcdedde7b260c0e95
        new failure (last pass: next-20210603)

    2021-06-04 20:53:47.953000+00:00  <8>[   27.811252] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
rk3399-gru-kevin     | arm64 | lab-collabora   | gcc-8    | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/60ba8f935fbcbbc0550c0dfe

  Results:     85 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/60ba8f945fbcbbc0550c0e56
        new failure (last pass: next-20210603)

    2021-06-04 20:39:43.318000+00:00  <8>[   26.829563] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/60ba8f945fbcbbc0550c0e57
        new failure (last pass: next-20210603)

    2021-06-04 20:39:44.352000+00:00  <8>[   27.863447] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
rk3399-gru-kevin     | arm64 | lab-collabora   | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60ba9274973d870d820c0e00

  Results:     85 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210604/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/60ba9274973d870d820c0e58
        new failure (last pass: next-20210603)

    2021-06-04 20:51:59.697000+00:00  <8>[   26.889620] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/60ba9274973d870d820c0e59
        new failure (last pass: next-20210603)

    2021-06-04 20:52:00.730000+00:00  <8>[   27.922948] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =

 =20
