Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9B1631ED2A
	for <lists+linux-next@lfdr.de>; Thu, 18 Feb 2021 18:22:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbhBRRUg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Feb 2021 12:20:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232578AbhBRPmM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Feb 2021 10:42:12 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED200C0613D6
        for <linux-next@vger.kernel.org>; Thu, 18 Feb 2021 07:41:25 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id m2so1374674pgq.5
        for <linux-next@vger.kernel.org>; Thu, 18 Feb 2021 07:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=fXJy81VUo9u6z2LFOUrMzjTRku+FTVmUp7Jma4ae+BQ=;
        b=xEa8M1O82emZHnm1aFJc+OTg9giW0tAtkkKdr3mBDTmgHjwhXNGdnIz7RMXW4Fm/VH
         dMSRp1BdKglydE532zIyWgpmGFINFQz8/S6XH76rEcyETvyhZ2zCcznbPt+4T0l3YBkJ
         KaQOcI6rK0J063sWfr0Ukoar/C50Ijd0jzpZGWs3/6v8ktpUedQzc0G7zqgHRbylYNHm
         n9/YlajGX4V/gAfOPGLjZy3Ahwn5dqg2iaOLv/YpjlWgfnn8v34169b3R+hVaT6SKA9E
         nwZoKlLbxTeJtbSZWlx3gZuc1cSPOeAz8GwqPzZu4U7rIj/rnoQjthRi8L5kjP5O7jpQ
         jNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=fXJy81VUo9u6z2LFOUrMzjTRku+FTVmUp7Jma4ae+BQ=;
        b=XV3Q+fzV7Lo0iIxpeTd1/KRv4sU6jRkriTqct6vWRzBZIBIwELlWKKtyh9zrwuY3mB
         mDCP07eafXnAyugK2oS+Wh7LiYvQWk8ak9+u5tYuuvEm+r8AncS+tALKZoX84QV9YNAy
         U1YpOlmfIiYBOBRU1dBzQXlZ55cu/CbUFyIuELbgq3GnsyaDW2ZVwjHbZi0bhiliPL+Z
         pNIFOy0hWxkj1RIEDQdzaeFJlhridHy+OXz9dcI0Y3Nzo6LNuOdd2zB8Q8lcDqsS6NYz
         kkqQJLXlT2RCv0vIpPAwzcBFSQE9MXKsbyUPUM9VexLe5rgJWVf9qKu5wJPN1AygjUeK
         66WQ==
X-Gm-Message-State: AOAM533mhW8lEfr9IOG8ZobeTvZBtda9weaSeUXjXDGqtfVBcmCxnqMt
        mj+sKY0TV1gjm2SKFup+kH8dzdTn5eqYpQ==
X-Google-Smtp-Source: ABdhPJyNAjAKngIZwvEnH2GE5W7zIGB9kexIjlFrLAbccWVWFKmvvor0IyyLKnjYIiNRz/rSRSXsgQ==
X-Received: by 2002:a63:786:: with SMTP id 128mr4053519pgh.408.1613662884294;
        Thu, 18 Feb 2021 07:41:24 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ms24sm5743139pjb.18.2021.02.18.07.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 07:41:23 -0800 (PST)
Message-ID: <602e8aa3.1c69fb81.1e54f.c981@mx.google.com>
Date:   Thu, 18 Feb 2021 07:41:23 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20210218
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 492 runs, 41 regressions (next-20210218)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 492 runs, 41 regressions (next-20210218)

Regressions Summary
-------------------

platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
am57xx-beagle-x15          | arm   | lab-linaro-lkft | gcc-8    | multi_v7_=
defconfig           | 1          =

bcm2836-rpi-2-b            | arm   | lab-collabora   | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b            | arm64 | lab-baylibre    | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b            | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

beaglebone-black           | arm   | lab-collabora   | gcc-8    | multi_v7_=
defconfig           | 1          =

hifive-unleashed-a00       | riscv | lab-baylibre    | clang-11 | defconfig=
+CONFIG_EFI=3Dn       | 1          =

hifive-unleashed-a00       | riscv | lab-baylibre    | gcc-8    | defconfig=
                    | 1          =

imx6sll-evk                | arm   | lab-nxp         | clang-10 | multi_v7_=
defconfig           | 1          =

imx6sll-evk                | arm   | lab-nxp         | clang-11 | multi_v7_=
defconfig           | 1          =

imx6sll-evk                | arm   | lab-nxp         | gcc-8    | imx_v6_v7=
_defconfig          | 1          =

imx6sll-evk                | arm   | lab-nxp         | gcc-8    | multi_v7_=
defconfig           | 1          =

imx6sll-evk                | arm   | lab-nxp         | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

imx8mp-evk                 | arm64 | lab-nxp         | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                 | arm64 | lab-nxp         | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                 | arm64 | lab-nxp         | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                 | arm64 | lab-nxp         | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-khadas-vim3l     | arm64 | lab-baylibre    | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-khadas-vim3l     | arm64 | lab-baylibre    | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610           | arm64 | lab-baylibre    | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610           | arm64 | lab-baylibre    | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson8b-odroidc1           | arm   | lab-baylibre    | clang-10 | multi_v7_=
defconfig           | 1          =

meson8b-odroidc1           | arm   | lab-baylibre    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

mt8173-elm-hana            | arm64 | lab-collabora   | clang-10 | defconfig=
                    | 2          =

r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip         | clang-10 | defconfig=
                    | 1          =

r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip         | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip         | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip         | clang-11 | defconfig=
                    | 1          =

r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip         | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip         | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874             | arm64 | lab-cip         | clang-10 | defconfig=
                    | 1          =

r8a774c0-ek874             | arm64 | lab-cip         | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874             | arm64 | lab-cip         | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874             | arm64 | lab-cip         | clang-11 | defconfig=
                    | 1          =

r8a774c0-ek874             | arm64 | lab-cip         | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

r8a774c0-ek874             | arm64 | lab-cip         | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64    | arm64 | lab-clabbe      | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64    | arm64 | lab-clabbe      | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64    | arm64 | lab-clabbe      | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64-model-b | arm64 | lab-baylibre    | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64-model-b | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210218/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210218
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ff90dfd2579b2c7bc1f0baa0cb99c918c6c1ec64 =



Test Regressions
---------------- =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
am57xx-beagle-x15          | arm   | lab-linaro-lkft | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/602e4eabc527cf297daddcce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm/=
multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm/=
multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e4eabc527cf297dadd=
ccf
        failing since 5 days (last pass: next-20210209, first fail: next-20=
210210) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora   | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/602e5d265f1fb66509addd23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e5d265f1fb66509add=
d24
        failing since 0 day (last pass: next-20210212, first fail: next-202=
10215) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre    | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602e4f29cc2382f438addcd8

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/602e4f29cc2382f4=
38addcdb
        new failure (last pass: next-20210217)
        4 lines

    2021-02-18 11:24:56.893000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2021-02-18 11:24:56.894000+00:00  (user:khilman) is already connected
    2021-02-18 11:25:12.015000+00:00  =00
    2021-02-18 11:25:12.016000+00:00  =

    2021-02-18 11:25:12.016000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2021-02-18 11:25:12.016000+00:00  =

    2021-02-18 11:25:12.016000+00:00  DRAM:  948 MiB
    2021-02-18 11:25:12.031000+00:00  RPI 3 Model B (0xa02082)
    2021-02-18 11:25:12.119000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2021-02-18 11:25:12.151000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (395 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602e4d99e6e0c42dcbaddce4

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/602e4d99e6e0c42d=
cbaddce7
        new failure (last pass: next-20210217)
        2 lines

    2021-02-18 11:18:28.977000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2021-02-18 11:18:28.978000+00:00  (user:khilman) is already connected
    2021-02-18 11:18:44.158000+00:00  =00
    2021-02-18 11:18:44.159000+00:00  =

    2021-02-18 11:18:44.159000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2021-02-18 11:18:44.159000+00:00  =

    2021-02-18 11:18:44.159000+00:00  DRAM:  948 MiB
    2021-02-18 11:18:44.175000+00:00  RPI 3 Model B (0xa02082)
    2021-02-18 11:18:44.262000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2021-02-18 11:18:44.294000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (395 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
beaglebone-black           | arm   | lab-collabora   | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/602e50f7fcef9e53a4addcdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e50f7fcef9e53a4add=
ce0
        new failure (last pass: next-20210215) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
hifive-unleashed-a00       | riscv | lab-baylibre    | clang-11 | defconfig=
+CONFIG_EFI=3Dn       | 1          =


  Details:     https://kernelci.org/test/plan/id/602e4ca2010bd9986faddcc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_EFI=3Dn
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/risc=
v/defconfig+CONFIG_EFI=3Dn/clang-11/lab-baylibre/baseline-hifive-unleashed-=
a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/risc=
v/defconfig+CONFIG_EFI=3Dn/clang-11/lab-baylibre/baseline-hifive-unleashed-=
a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e4ca2010bd9986fadd=
cc4
        failing since 44 days (last pass: next-20201223, first fail: next-2=
0210104) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
hifive-unleashed-a00       | riscv | lab-baylibre    | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/602e4a4a727d222322addcb5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e4a4a727d222322add=
cb6
        failing since 44 days (last pass: next-20201223, first fail: next-2=
0210104) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6sll-evk                | arm   | lab-nxp         | clang-10 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/602e5395c32f790f9aaddcb2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm/=
multi_v7_defconfig/clang-10/lab-nxp/baseline-imx6sll-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm/=
multi_v7_defconfig/clang-10/lab-nxp/baseline-imx6sll-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e5395c32f790f9aadd=
cb3
        failing since 35 days (last pass: next-20210108, first fail: next-2=
0210114) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6sll-evk                | arm   | lab-nxp         | clang-11 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/602e5214579c30e5f2addcb5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm/=
multi_v7_defconfig/clang-11/lab-nxp/baseline-imx6sll-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm/=
multi_v7_defconfig/clang-11/lab-nxp/baseline-imx6sll-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e5214579c30e5f2add=
cb6
        failing since 38 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6sll-evk                | arm   | lab-nxp         | gcc-8    | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/602e4c131548280b61addd18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sll-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sll-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e4c131548280b61add=
d19
        failing since 38 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6sll-evk                | arm   | lab-nxp         | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/602e4eaf6551334d58addcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sll-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sll-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e4eaf6551334d58add=
cb2
        failing since 38 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6sll-evk                | arm   | lab-nxp         | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/602e5052c3d63f53a1addcc7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6sll-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6sll-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e5052c3d63f53a1add=
cc8
        failing since 38 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mp-evk                 | arm64 | lab-nxp         | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602e56d4603930b00baddcba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e56d4603930b00badd=
cbb
        failing since 0 day (last pass: next-20210211, first fail: next-202=
10217) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mp-evk                 | arm64 | lab-nxp         | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602e52b08d4c34a913addd01

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e52b08d4c34a913add=
d02
        new failure (last pass: next-20210217) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mp-evk                 | arm64 | lab-nxp         | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602e4f26cc2382f438addcd5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e4f26cc2382f438add=
cd6
        failing since 0 day (last pass: next-20210211, first fail: next-202=
10217) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mp-evk                 | arm64 | lab-nxp         | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602e51148e697d9acdaddcc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e51148e697d9acdadd=
cc4
        new failure (last pass: next-20210217) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-sm1-khadas-vim3l     | arm64 | lab-baylibre    | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602e53c259ec5ff06daddcc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e53c259ec5ff06dadd=
cc7
        failing since 6 days (last pass: next-20210210, first fail: next-20=
210211) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-sm1-khadas-vim3l     | arm64 | lab-baylibre    | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602e4fb5539705a588addcc1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e4fb5539705a588add=
cc2
        failing since 6 days (last pass: next-20210210, first fail: next-20=
210211) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-sm1-sei610           | arm64 | lab-baylibre    | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602e534d1efb5bb9d7addce3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e534d1efb5bb9d7add=
ce4
        failing since 6 days (last pass: next-20210210, first fail: next-20=
210211) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-sm1-sei610           | arm64 | lab-baylibre    | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602e4fc9121cc8364daddcbc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e4fc9121cc8364dadd=
cbd
        failing since 6 days (last pass: next-20210209, first fail: next-20=
210211) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson8b-odroidc1           | arm   | lab-baylibre    | clang-10 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/602e5101726dcd0bb2addcc2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-meson8b-odroidc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-meson8b-odroidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e5101726dcd0bb2add=
cc3
        failing since 34 days (last pass: next-20210107, first fail: next-2=
0210115) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson8b-odroidc1           | arm   | lab-baylibre    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/602e4f6556a69d8857addcc7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-meson8b-odroi=
dc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-meson8b-odroi=
dc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e4f6556a69d8857add=
cc8
        failing since 38 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
mt8173-elm-hana            | arm64 | lab-collabora   | clang-10 | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/602e512ab9a48bb19eaddcca

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/602e512ab9a48bb19eaddce2
        failing since 38 days (last pass: next-20210108, first fail: next-2=
0210111)

    2021-02-18 11:36:06.206000+00:00  <8>[   26.415888] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>
    2021-02-18 11:36:06.206000+00:00  /lava-3239975/1/../bin/lava-test-case
    2021-02-18 11:36:06.207000+00:00  <8>[   26.433018] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmediatek-mt8173-pinctrl-driver-present RESULT=3Dpass>
    2021-02-18 11:36:06.207000+00:00  /lava-3239975/1/../bin/lava-test-case
    2021-02-18 11:36:06.208000+00:00  <8>[   26.451879] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmediatek-mt8173-pinctrl-probed RESULT=3Dpass>
    2021-02-18 11:36:06.209000+00:00  /lava-3239975/1/../bin/lava-test-case
    2021-02-18 11:36:06.209000+00:00  <8>[   26.469586] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmt6577-uart-driver-present RESULT=3Dpass>
    2021-02-18 11:36:06.210000+00:00  /lava-3239975/1/../bin/lava-test-case
    2021-02-18 11:36:06.210000+00:00  <8>[   26.487606] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmt6577-uart-probed RESULT=3Dpass>
    2021-02-18 11:36:06.211000+00:00  /lava-3239975/1/../bin/lava-test-case =

    ... (1 line(s) more)  =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/602=
e512ab9a48bb19eaddce8
        failing since 38 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip         | clang-10 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/602e517f6426e030bbaddcc7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e517f6426e030bbadd=
cc8
        failing since 38 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip         | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602e5325d26234906eaddce6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774a1-h=
ihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774a1-h=
ihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e5325d26234906eadd=
ce7
        failing since 38 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip         | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602e4f738ba2cb2445addcc0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-r8a774a1-h=
ihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-r8a774a1-h=
ihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e4f738ba2cb2445add=
cc1
        failing since 38 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip         | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/602e4f966e7213adc5addd10

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e4f966e7213adc5add=
d11
        failing since 38 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip         | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602e4e2bd3916457b2addcf2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hihop=
e-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hihop=
e-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e4e2bd3916457b2add=
cf3
        failing since 38 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip         | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602e4e46afb52f0774addcb8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hiho=
pe-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hiho=
pe-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e4e46afb52f0774add=
cb9
        failing since 38 days (last pass: next-20210107, first fail: next-2=
0210111) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a774c0-ek874             | arm64 | lab-cip         | clang-10 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/602e52ced29632200aaddcbb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e52ced29632200aadd=
cbc
        failing since 38 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a774c0-ek874             | arm64 | lab-cip         | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602e53f4890999a7b7addcd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774c0-e=
k874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774c0-e=
k874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e53f4890999a7b7add=
cd1
        failing since 38 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a774c0-ek874             | arm64 | lab-cip         | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602e507fd2ac5b9217addcbc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-r8a774c0-e=
k874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-r8a774c0-e=
k874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e507fd2ac5b9217add=
cbd
        failing since 38 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a774c0-ek874             | arm64 | lab-cip         | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/602e51a76f9043170aaddcc2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e51a76f9043170aadd=
cc3
        failing since 38 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a774c0-ek874             | arm64 | lab-cip         | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602e4e23d3916457b2addce3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek874=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek874=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e4e23d3916457b2add=
ce4
        failing since 38 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a774c0-ek874             | arm64 | lab-cip         | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602e4f531a48079992addce5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek87=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek87=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e4f531a48079992add=
ce6
        failing since 38 days (last pass: next-20210107, first fail: next-2=
0210111) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64    | arm64 | lab-clabbe      | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602e53ad5d405334aeaddcc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e53ad5d405334aeadd=
cc9
        failing since 7 days (last pass: next-20210209, first fail: next-20=
210210) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64    | arm64 | lab-clabbe      | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602e512bb9a48bb19eaddcea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e512bb9a48bb19eadd=
ceb
        failing since 7 days (last pass: next-20210209, first fail: next-20=
210210) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64    | arm64 | lab-clabbe      | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602e4fd7121cc8364daddce9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e4fd7121cc8364dadd=
cea
        failing since 7 days (last pass: next-20210209, first fail: next-20=
210210) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64-model-b | arm64 | lab-baylibre    | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602e535d4ad2af075aaddcd6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e535d4ad2af075aadd=
cd7
        failing since 98 days (last pass: next-20201110, first fail: next-2=
0201111) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64-model-b | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602e51b5f64937172caddcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602e51b5f64937172cadd=
cb2
        failing since 98 days (last pass: next-20201110, first fail: next-2=
0201111) =

 =20
