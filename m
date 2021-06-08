Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85F393A04EC
	for <lists+linux-next@lfdr.de>; Tue,  8 Jun 2021 22:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234663AbhFHUFN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Jun 2021 16:05:13 -0400
Received: from mail-pl1-f177.google.com ([209.85.214.177]:41532 "EHLO
        mail-pl1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235152AbhFHUEK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Jun 2021 16:04:10 -0400
Received: by mail-pl1-f177.google.com with SMTP id o12so7910563plk.8
        for <linux-next@vger.kernel.org>; Tue, 08 Jun 2021 13:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=r7CowuwZxS0yIe4X/VJNYmGdswu8bcLj8wco68bd/vA=;
        b=NlOY5ztiUHCsiz+5liERdkI2wZd9mZ5a2BsUH/eApghkFtrGxCNqmxV8BznHOaoyBe
         aFENUHlp0oB2ZejnNXia0Z+cB6YWh9jFFbN2ySJUtbcQX/wTQw2fFH78eojT7vVsa7MP
         623mJVPfMo9FBMegwLmraH+IY2Jb+T4aCXPyJ5x2WAO763v1oLcJyqU89jyc4fm6PH7P
         u/dbrFH3KNgRjBWmXBg0++/8bPpHyu9HYRekrIuncXgqY/1uJSpchyW10987evaeFs7E
         zA0irlc0Z7RJKs4M/scnNKkCKtLgzydfqknLXfSpk6RHWiiBl5WYVReneVTLY3or1U5Y
         pZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=r7CowuwZxS0yIe4X/VJNYmGdswu8bcLj8wco68bd/vA=;
        b=T/JjFZY5JbvbKD6JDoc+VCftqMXIX/IB9KfVjxeyKOjMA6It4DdzvncCML15ZhTF6q
         XquumVH9LPNA2XZpWr2c5MpVsfomaVtRgQbnvbLZd2Piy2IZdl2vaHnBDZmjcbWoQudz
         3U7dElDq5cYMEMVZYlbEGtnytLhFGXJ/PEftF8ddB1t5tNfNLcArtjKON1jO1S6nyDi9
         chgrd4ZVvOmelLAbwqAAchxoGyQaukCdlbkAgriWUBzm325TpvhpRAwXUxLNhPvGnYT3
         cO3V6aSwE7WRM1vHXO4E7teQ7RlVNx8e/6osiNEAMtsUcpsToli8Ov1FUBMsIOBv0lcb
         2luQ==
X-Gm-Message-State: AOAM533S42pRWBWC6cgR1PaoDUP4b5fAZz8I4bC2/ZbB4ajLsPRmO/vV
        wmcpWb7/41lOEBWwBiZDRJFp6cvl8xfX4KhT
X-Google-Smtp-Source: ABdhPJyhmzmSFWVXBpFOHkKyEaQZUogy59WWbhJWOAZYzUCTcXhiuUo4AwEIRRkTf0NO3dRiIK5ibA==
X-Received: by 2002:a17:902:bd87:b029:ee:e0ae:cf0a with SMTP id q7-20020a170902bd87b02900eee0aecf0amr1401005pls.1.1623182464652;
        Tue, 08 Jun 2021 13:01:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x20sm5185994pfh.112.2021.06.08.13.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 13:01:04 -0700 (PDT)
Message-ID: <60bfcc80.1c69fb81.e5621.fa71@mx.google.com>
Date:   Tue, 08 Jun 2021 13:01:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20210608
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 682 runs, 29 regressions (next-20210608)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 682 runs, 29 regressions (next-20210608)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =

hifive-unleashed-a00 | riscv | lab-baylibre  | gcc-8    | defconfig        =
            | 1          =

hip07-d05            | arm64 | lab-collabora | clang-10 | defconfig+CON..._=
64K_PAGES=3Dy | 1          =

hip07-d05            | arm64 | lab-collabora | clang-10 | defconfig        =
            | 1          =

hip07-d05            | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =

imx6q-sabresd        | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defconf=
ig          | 1          =

imx8mp-evk           | arm64 | lab-nxp       | clang-10 | defconfig+CON..._=
64K_PAGES=3Dy | 1          =

imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =

meson-gxm-q200       | arm64 | lab-baylibre  | clang-12 | defconfig        =
            | 2          =

meson-gxm-q200       | arm64 | lab-baylibre  | gcc-8    | defconfig        =
            | 2          =

meson-gxm-q200       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =

qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =

rk3399-gru-kevin     | arm64 | lab-collabora | clang-10 | defconfig+CON..._=
64K_PAGES=3Dy | 2          =

rk3399-gru-kevin     | arm64 | lab-collabora | clang-12 | defconfig        =
            | 5          =

rk3399-gru-kevin     | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =

rk3399-gru-kevin     | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210608/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210608
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ab5803bc555fe68b9b0d37b9a850d3ec601b938a =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60bf8ef5522adde99d0c0e12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210608/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210608/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60bf8ef5522adde99d0c0=
e13
        failing since 103 days (last pass: next-20210223, first fail: next-=
20210224) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre  | gcc-8    | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/60bf89c92fbb1cf3d40c0e1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210608/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210608/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60bf89c92fbb1cf3d40c0=
e1c
        failing since 39 days (last pass: next-20210429, first fail: next-2=
0210430) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
hip07-d05            | arm64 | lab-collabora | clang-10 | defconfig+CON..._=
64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60bfb678ff0b52e9540c0e04

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210608/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-hip0=
7-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210608/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-hip0=
7-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60bfb678ff0b52e9540c0=
e05
        failing since 56 days (last pass: next-20210409, first fail: next-2=
0210412) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
hip07-d05            | arm64 | lab-collabora | clang-10 | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/60bfc5dcf0dfcf99a30c0e1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210608/arm6=
4/defconfig/clang-10/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210608/arm6=
4/defconfig/clang-10/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60bfc5dcf0dfcf99a30c0=
e1d
        failing since 56 days (last pass: next-20210409, first fail: next-2=
0210412) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
hip07-d05            | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/60bf8af6d42c939e080c0e08

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210608/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210608/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60bf8af6d42c939=
e080c0e0c
        failing since 49 days (last pass: next-20210416, first fail: next-2=
0210419)
        11 lines

    2021-06-08 15:21:00.619000+00:00  uest at virtual address fffffbfffe800=
0e4
    2021-06-08 15:21:00.619000+00:00  kern  :alert : Mem abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60bf8af6d42c939=
e080c0e0d
        failing since 49 days (last pass: next-20210416, first fail: next-2=
0210419)
        2 lines

    2021-06-08 15:21:00.628000+00:00  kern[   22.575174] <LAVA_SIGNAL_TESTC=
ASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-06-08 15:21:00.628000+00:00    :alert :   EC =3D 0x25: DABT (curre=
n[   22.586327] <LAVA_SIGNAL_ENDRUN 0_dmesg 3981609_1.5.2.3.1>
    2021-06-08 15:21:00.628000+00:00  t EL), IL =3D 32 bits   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx6q-sabresd        | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60bf8e7a095ce72b850c0dfe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210608/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210608/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60bf8e7a095ce72b850c0=
dff
        failing since 225 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx8mp-evk           | arm64 | lab-nxp       | clang-10 | defconfig+CON..._=
64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60bf967d070519f89f0c0df8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210608/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210608/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60bf967d070519f89f0c0=
df9
        failing since 1 day (last pass: next-20210603, first fail: next-202=
10607) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx8mp-evk           | arm64 | lab-nxp       | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60bf8c8f457502f2cd0c0ead

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210608/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210608/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60bf8c8f457502f2cd0c0=
eae
        new failure (last pass: next-20210607) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
meson-gxm-q200       | arm64 | lab-baylibre  | clang-12 | defconfig        =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/60bf92b7cf702c0f800c0e00

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210525082610+328a6=
ec95532-1~exp1~20210525063323.98)
  Plain log:   https://storage.kernelci.org//next/master/next-20210608/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210608/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60bf92b7cf702c0=
f800c0e04
        new failure (last pass: next-20210607)
        10 lines =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60bf92b7cf702c0=
f800c0e05
        new failure (last pass: next-20210607)
        2 lines

    2021-06-08 15:54:18.357000+00:00  000004
    2021-06-08 15:54:18.357000+00:00  kern  :a<8>[   15.908862] <LAVA_SIGNA=
L_ENDRUN 0_dmesg 425197_1.5.2.4.1>
    2021-06-08 15:54:18.357000+00:00  lert :   CM =3D 0, WnR =3D 0
    2021-06-08 15:54:18.357000+00:00  kern  :alert : [0043800010e3c208] add=
ress between user and kernel address ranges
    2021-06-08 15:54:18.357000+00:00  kern  :emerg : Internal error: Oops: =
96000004 [#1] PREEMPT SMP
    2021-06-08 15:54:18.357000+00:00  kern  :emerg : Code: 90000008 910eb10=
8 361000a9 f9401669 (f9400529) =

    2021-06-08 15:54:18.358000+00:00  + set +x   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
meson-gxm-q200       | arm64 | lab-baylibre  | gcc-8    | defconfig        =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/60bf8b86c528987df10c0e02

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210608/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210608/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60bf8b86c528987=
df10c0e06
        new failure (last pass: next-20210607)
        11 lines

    2021-06-08 15:23:30.046000+00:00  kern  :alert : Mem abort info:
    2021-06-08 15:23:30.046000+00:00  kern  <8>[   45.097754] <LAVA_SIGNAL_=
TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D11>
    2021-06-08 15:23:30.046000+00:00  :alert :   ESR =3D 0x96000047
    2021-06-08 15:23:30.046000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-06-08 15:23:30.046000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-06-08 15:23:30.047000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-06-08 15:23:30.047000+00:00  kern  :alert : Data abort info:
    2021-06-08 15:23:30.047000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000047   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60bf8b86c528987=
df10c0e07
        new failure (last pass: next-20210607)
        2 lines

    2021-06-08 15:23:30.088000+00:00  t :   CM =3D 0, WnR <8>[   45.136761]=
 <LAVA_SIGNAL_ENDRUN 0_dmesg 424875_1.5.2.4.1>
    2021-06-08 15:23:30.089000+00:00  =3D 1
    2021-06-08 15:23:30.089000+00:00  kern  :alert : swapper pgtable: 4k pa=
ges, 48-bit VAs, pgdp=3D00000000026ce000
    2021-06-08 15:23:30.089000+00:00  kern  :alert : [ffff800009021000] pgd=
=3D100000007ffff003, p4d=3D100000007ffff003, pud=3D100000007fffe003, pmd=3D=
1000000009438003, pte=3D0000000000000000
    2021-06-08 15:23:30.089000+00:00  kern  :emerg : Internal error: Oops: =
96000047 [#1] PREEMPT SMP
    2021-06-08 15:23:30.089000+00:00  kern  :emerg : Code: a9022468 a942242=
8 a9032c6a a9432c2a (a984346c) =

    2021-06-08 15:23:30.089000+00:00  + set +x   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
meson-gxm-q200       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60bf8d51f68bb417f20c0e40

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210608/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210608/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60bf8d51f68bb417f20c0=
e41
        new failure (last pass: next-20210607) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60bf87a9c0698966970c0e1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210608/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210608/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60bf87a9c0698966970c0=
e1c
        failing since 202 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60bf87bea1a388e3000c0e08

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210608/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210608/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60bf87bea1a388e3000c0=
e09
        failing since 202 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60bf879d562b5945d40c0e13

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210608/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210608/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60bf879d562b5945d40c0=
e14
        failing since 202 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60bf875aa5b9af4bb90c0e04

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210608/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210608/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60bf875aa5b9af4bb90c0=
e05
        failing since 202 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
rk3399-gru-kevin     | arm64 | lab-collabora | clang-10 | defconfig+CON..._=
64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60bf9d1baed70f38940c0e0f

  Results:     85 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210608/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-rk33=
99-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210608/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-rk33=
99-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/60bf9d1caed70f38940c0e67
        failing since 1 day (last pass: next-20210603, first fail: next-202=
10607)

    2021-06-08 16:38:45.629000+00:00  /lava-3982101/1/../bin/lava-test-case=
   =


  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/60bf9d1caed70f38940c0e68
        failing since 1 day (last pass: next-20210603, first fail: next-202=
10607)

    2021-06-08 16:38:46.665000+00:00  /lava-3982101/1/../bin/lava-test-case
    2021-06-08 16:38:46.678000+00:00  <8>[   28.166993] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
rk3399-gru-kevin     | arm64 | lab-collabora | clang-12 | defconfig        =
            | 5          =


  Details:     https://kernelci.org/test/plan/id/60bf9b6134a26bc3050c0e01

  Results:     85 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210525082610+328a6=
ec95532-1~exp1~20210525063323.98)
  Plain log:   https://storage.kernelci.org//next/master/next-20210608/arm6=
4/defconfig/clang-12/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210608/arm6=
4/defconfig/clang-12/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/60bf9b6134a26bc3050c0e19
        failing since 4 days (last pass: next-20210528, first fail: next-20=
210603)

    2021-06-08 16:31:18.211000+00:00  <8>[   21.851467] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/60bf9b6134a26bc3050c0e1a
        failing since 4 days (last pass: next-20210528, first fail: next-20=
210603)

    2021-06-08 16:31:19.238000+00:00  <8>[   22.878661] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/60bf9b6134a26bc3050c0e1b
        failing since 4 days (last pass: next-20210528, first fail: next-20=
210603)

    2021-06-08 16:31:20.265000+00:00  <8>[   23.905802] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/60bf9b6234a26bc3050c0e59
        failing since 3 days (last pass: next-20210603, first fail: next-20=
210604)

    2021-06-08 16:31:22.747000+00:00  /lava-3982052/1/../bin/lava-test-case
    2021-06-08 16:31:22.758000+00:00  <8>[   26.399002] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/60bf9b6234a26bc3050c0e5a
        failing since 3 days (last pass: next-20210603, first fail: next-20=
210604) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
rk3399-gru-kevin     | arm64 | lab-collabora | gcc-8    | defconfig        =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/60bf8bca5458412ca80c0e1e

  Results:     85 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210608/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210608/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/60bf8bca5458412ca80c0e76
        failing since 3 days (last pass: next-20210603, first fail: next-20=
210604)

    2021-06-08 15:24:53.172000+00:00  <8>[   26.741614] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/60bf8bca5458412ca80c0e77
        failing since 3 days (last pass: next-20210603, first fail: next-20=
210604)

    2021-06-08 15:24:54.206000+00:00  <8>[   27.776514] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
rk3399-gru-kevin     | arm64 | lab-collabora | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60bf8f0ef3843e61ac0c0e31

  Results:     85 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210608/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210608/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/60bf8f0ef3843e61ac0c0e89
        failing since 3 days (last pass: next-20210603, first fail: next-20=
210604)

    2021-06-08 15:38:49.480000+00:00  /lava-3981700/1/../bin/lava-test-case
    2021-06-08 15:38:49.492000+00:00  <8>[   26.879731] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/60bf8f0ef3843e61ac0c0e8a
        failing since 3 days (last pass: next-20210603, first fail: next-20=
210604) =

 =20
