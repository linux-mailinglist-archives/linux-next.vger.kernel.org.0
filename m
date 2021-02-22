Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78D1F3220D6
	for <lists+linux-next@lfdr.de>; Mon, 22 Feb 2021 21:34:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233015AbhBVUeE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Feb 2021 15:34:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233010AbhBVUeE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Feb 2021 15:34:04 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8E4DC06174A
        for <linux-next@vger.kernel.org>; Mon, 22 Feb 2021 12:33:23 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id w18so7315171pfu.9
        for <linux-next@vger.kernel.org>; Mon, 22 Feb 2021 12:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=htmdJX0D65GDp8iCV0sfjQ2ltNhiryR49Q/hQS96g+o=;
        b=Iysm19AAplLmb3CpYw+ZcooleyaH3SH3tImIFX9pcXqZhfjGjMAcIlXQzdOZqD3WUI
         OJ8x6fdCx+hHnTm0dsIPOODodauPyz4YOxV0heixXJUrgfPJGlSZpfX8iBI7i0+dms/b
         BLVveCv4me/r9gxUS4IJwL+3K/NW//++r4blgSU0a9J1wlcY3IBzUhYfR3CPKz3N7bko
         VufKQyeOLFBxHCpUdMq9ihqgQq8msd4339luAzuFBqS1jMEkFS6gmMkAy4phCB/1NWh5
         knAoQDjC+Wnk9v2eNDomSYUqzPBcLSBwXlgrBMPUmFoElBuNlUFdyuf8GMUNs9IIHaen
         lMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=htmdJX0D65GDp8iCV0sfjQ2ltNhiryR49Q/hQS96g+o=;
        b=aXYAff156pugwpGtt+qz7Tim19eVHgHHSUMiY2pMpzwp21DtTMaqwzKYhLtSDGnWy0
         d1Flr2XvfPtzLC9Iv31uNHFcwOyF8DhlQmts/gJd/ta5/akZAV4UkzflJ0QEayp8+mWI
         tTs89CRpAkWLOdsWIPWAYr3o/97PxMcSgUncaVZxp1eACm7SAiiqyxEo8Frru1BmFnDx
         ppiNrpKOdZCH5HD3RzZgeX918pC+NYiJS9EDLUE31MUBbBwVYaFtTcnKu4IE/0NgB8Bk
         3yUcTQ03Pz448iq1tGPM0Q3kSHm3hgv94gdcdYL+hRIHKV9SYC4EYtDRdMPJdrjoS2Tf
         AHrQ==
X-Gm-Message-State: AOAM533AdT3Td2o3SiBigASW8GH7FLaSjtcJ8Gv+v5uoZAtwDmF5oVd5
        4AFV8rAV97ZHPeMji/YRfagvKFlbQkUm6A==
X-Google-Smtp-Source: ABdhPJwprWNMUevK3nKeXMEHOHbpxySZoWuVhWe1zQnyt679l6jeJTrH/WzGp/AqpScFkz+4gf0MNQ==
X-Received: by 2002:a05:6a00:1507:b029:1e4:d81:5586 with SMTP id q7-20020a056a001507b02901e40d815586mr23599012pfu.53.1614026002563;
        Mon, 22 Feb 2021 12:33:22 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o188sm12855413pfb.102.2021.02.22.12.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 12:33:22 -0800 (PST)
Message-ID: <60341512.1c69fb81.23a18.aaa2@mx.google.com>
Date:   Mon, 22 Feb 2021 12:33:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20210222
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 402 runs, 38 regressions (next-20210222)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 402 runs, 38 regressions (next-20210222)

Regressions Summary
-------------------

platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre    | clang-10 | defconfig=
                    | 1          =

bcm2837-rpi-3-b            | arm64 | lab-baylibre    | gcc-8    | defconfig=
                    | 1          =

bcm2837-rpi-3-b-32         | arm   | lab-baylibre    | gcc-8    | bcm2835_d=
efconfig            | 1          =

hifive-unleashed-a00       | riscv | lab-baylibre    | clang-11 | defconfig=
+CONFIG_EFI=3Dn       | 1          =

hifive-unleashed-a00       | riscv | lab-baylibre    | gcc-8    | defconfig=
                    | 1          =

hip07-d05                  | arm64 | lab-collabora   | clang-10 | defconfig=
                    | 1          =

hip07-d05                  | arm64 | lab-collabora   | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

hip07-d05                  | arm64 | lab-collabora   | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

hip07-d05                  | arm64 | lab-collabora   | clang-11 | defconfig=
                    | 1          =

hip07-d05                  | arm64 | lab-collabora   | gcc-8    | defconfig=
                    | 1          =

imx8mp-evk                 | arm64 | lab-nxp         | clang-10 | defconfig=
                    | 1          =

imx8mp-evk                 | arm64 | lab-nxp         | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                 | arm64 | lab-nxp         | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                 | arm64 | lab-nxp         | gcc-8    | defconfig=
                    | 1          =

imx8mq-zii-ultra-zest      | arm64 | lab-pengutronix | clang-10 | defconfig=
                    | 1          =

imx8mq-zii-ultra-zest      | arm64 | lab-pengutronix | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

imx8mq-zii-ultra-zest      | arm64 | lab-pengutronix | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

imx8mq-zii-ultra-zest      | arm64 | lab-pengutronix | clang-11 | defconfig=
                    | 1          =

imx8mq-zii-ultra-zest      | arm64 | lab-pengutronix | gcc-8    | defconfig=
                    | 1          =

meson-gxm-q200             | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

meson-sm1-khadas-vim3l     | arm64 | lab-baylibre    | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-khadas-vim3l     | arm64 | lab-baylibre    | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610           | arm64 | lab-baylibre    | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610           | arm64 | lab-baylibre    | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

r8a77950-salvator-x        | arm64 | lab-baylibre    | clang-10 | defconfig=
                    | 1          =

r8a77950-salvator-x        | arm64 | lab-baylibre    | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

r8a77950-salvator-x        | arm64 | lab-baylibre    | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

r8a77950-salvator-x        | arm64 | lab-baylibre    | clang-11 | defconfig=
                    | 1          =

r8a77950-salvator-x        | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

r8a77950-salvator-x        | arm64 | lab-baylibre    | gcc-8    | defconfig=
                    | 1          =

r8a77960-ulcb              | arm64 | lab-baylibre    | clang-10 | defconfig=
                    | 1          =

r8a77960-ulcb              | arm64 | lab-baylibre    | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

r8a77960-ulcb              | arm64 | lab-baylibre    | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

r8a77960-ulcb              | arm64 | lab-baylibre    | clang-11 | defconfig=
                    | 1          =

r8a77960-ulcb              | arm64 | lab-baylibre    | gcc-8    | defconfig=
                    | 1          =

sun50i-a64-bananapi-m64    | arm64 | lab-clabbe      | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64    | arm64 | lab-clabbe      | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64-model-b | arm64 | lab-baylibre    | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210222/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210222
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      37dfbfbdca66834bc0f64ec9b35e09ac6c8898da =



Test Regressions
---------------- =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre    | clang-10 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6033d921356cbac3dfaddcfe

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6033d921356cbac3=
dfaddd01
        new failure (last pass: next-20210219)
        2 lines

    2021-02-22 16:15:07.632000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2021-02-22 16:15:07.633000+00:00  (user:khilman) is already connected
    2021-02-22 16:15:23.427000+00:00  =00
    2021-02-22 16:15:23.427000+00:00  =

    2021-02-22 16:15:23.427000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2021-02-22 16:15:23.427000+00:00  =

    2021-02-22 16:15:23.444000+00:00  DRAM:  948 MiB
    2021-02-22 16:15:23.460000+00:00  RPI 3 Model B (0xa02082)
    2021-02-22 16:15:23.545000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2021-02-22 16:15:23.577000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (392 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre    | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6033dc19ec081bf1e0addcbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033dc19ec081bf1e0add=
cbe
        new failure (last pass: next-20210219) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2837-rpi-3-b-32         | arm   | lab-baylibre    | gcc-8    | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6033d5e98fd823b6ccaddcc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033d5e98fd823b6ccadd=
cca
        new failure (last pass: next-20210219) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
hifive-unleashed-a00       | riscv | lab-baylibre    | clang-11 | defconfig=
+CONFIG_EFI=3Dn       | 1          =


  Details:     https://kernelci.org/test/plan/id/6033d62f20e2aa615caddd1a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_EFI=3Dn
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/risc=
v/defconfig+CONFIG_EFI=3Dn/clang-11/lab-baylibre/baseline-hifive-unleashed-=
a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/risc=
v/defconfig+CONFIG_EFI=3Dn/clang-11/lab-baylibre/baseline-hifive-unleashed-=
a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033d62f20e2aa615cadd=
d1b
        failing since 49 days (last pass: next-20201223, first fail: next-2=
0210104) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
hifive-unleashed-a00       | riscv | lab-baylibre    | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6033d7ab74511960eeaddd08

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033d7ab74511960eeadd=
d09
        failing since 49 days (last pass: next-20201223, first fail: next-2=
0210104) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
hip07-d05                  | arm64 | lab-collabora   | clang-10 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6033db0c0b3ffd912baddd16

  Results:     2 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/clang-10/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/clang-10/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6033db0c0b3ffd91=
2baddd19
        new failure (last pass: next-20210219)
        1 lines

    2021-02-22 16:22:01.625000+00:00  [SOL Session operational.  Use ~? for=
 help]
    2021-02-22 16:22:03.066000+00:00  [serdes_cs_hw_calibration_optionV2_ex=
ec]:Macro1 CS1 LC Vco Cal done!(LCVCOCALDONE) in 0ms
    2021-02-22 16:22:03.066000+00:00  [SerdesCsCalib]:Macro1 CS1 PLL lock s=
uccess!(0 ms)
    2021-02-22 16:22:05.384000+00:00  [serdes_init]:SerDes1 init success!
    2021-02-22 16:22:05.470000+00:00  Continue to dreset PCS
    2021-02-22 16:22:05.471000+00:00  Continue to dreset HLLC
    2021-02-22 16:22:06.474000+00:00  Continue to open PCS RX
    2021-02-22 16:22:06.539000+00:00  Wait for HLLC Training........OK
    2021-02-22 16:22:06.539000+00:00  Wait for HLLC1 Training........OK
    2021-02-22 16:22:06.539000+00:00  Wait for S1 HLLC Training........OK =

    ... (5338 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
hip07-d05                  | arm64 | lab-collabora   | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6033f5dffc66d96153addcb1

  Results:     2 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-hip0=
7-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-hip0=
7-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6033f5dffc66d961=
53addcb4
        new failure (last pass: next-20210219)
        1 lines

    2021-02-22 18:16:44.243000+00:00  [SOL Session operational.  Use ~? for=
 help]
    2021-02-22 18:16:45.615000+00:00  [serdes_cs_hw_calibration_optionV2_ex=
ec]:Macro1 CS1 LC Vco Cal done!(LCVCOCALDONE) in 0ms
    2021-02-22 18:16:45.616000+00:00  [SerdesCsCalib]:Macro1 CS1 PLL lock s=
uccess!(0 ms)
    2021-02-22 18:16:47.936000+00:00  [serdes_init]:SerDes1 init success!
    2021-02-22 18:16:48.024000+00:00  Continue to dreset PCS
    2021-02-22 18:16:48.024000+00:00  Continue to dreset HLLC
    2021-02-22 18:16:49.055000+00:00  Continue to open PCS RX
    2021-02-22 18:16:49.056000+00:00  Wait for HLLC Training........OK
    2021-02-22 18:16:49.056000+00:00  Wait for HLLC1 Training........OK
    2021-02-22 18:16:49.056000+00:00  Wait for S1 HLLC Training........OK =

    ... (5307 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
hip07-d05                  | arm64 | lab-collabora   | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6033e2448e1d5b190aadddab

  Results:     2 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-hip0=
7-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-hip0=
7-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6033e2448e1d5b19=
0aadddae
        new failure (last pass: next-20210219)
        1 lines

    2021-02-22 16:53:06.150000+00:00  [SOL Session operational.  Use ~? for=
 help]
    2021-02-22 16:53:07.602000+00:00  [serdes_cs_hw_calibration_optionV2_ex=
ec]:Macro1 CS1 LC Vco Cal done!(LCVCOCALDONE) in 0ms
    2021-02-22 16:53:07.603000+00:00  [SerdesCsCalib]:Macro1 CS1 PLL lock s=
uccess!(0 ms)
    2021-02-22 16:53:09.923000+00:00  [serdes_init]:SerDes1 init success!
    2021-02-22 16:53:09.992000+00:00  Continue to dreset PCS
    2021-02-22 16:53:09.992000+00:00  Continue to dreset HLLC
    2021-02-22 16:53:10.992000+00:00  Continue to open PCS RX
    2021-02-22 16:53:11.023000+00:00  Wait for HLLC Training........OK
    2021-02-22 16:53:11.023000+00:00  Wait for HLLC1 Training........OK
    2021-02-22 16:53:11.023000+00:00  Wait for S1 HLLC Training........OK =

    ... (5283 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
hip07-d05                  | arm64 | lab-collabora   | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6033e7f9650b90f2d1addcb2

  Results:     2 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/clang-11/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/clang-11/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6033e7f9650b90f2=
d1addcb5
        new failure (last pass: next-20210219)
        1 lines

    2021-02-22 17:17:09.396000+00:00  [SOL Session operational.  Use ~? for=
 help]
    2021-02-22 17:17:10.709000+00:00  [serdes_cs_hw_calibration_optionV2_ex=
ec]:Macro1 CS1 LC Vco Cal done!(LCVCOCALDONE) in 0ms
    2021-02-22 17:17:10.709000+00:00  [SerdesCsCalib]:Macro1 CS1 PLL lock s=
uccess!(0 ms)
    2021-02-22 17:17:13.040000+00:00  [serdes_init]:SerDes1 init success!
    2021-02-22 17:17:13.109000+00:00  Continue to dreset PCS
    2021-02-22 17:17:13.110000+00:00  Continue to dreset HLLC
    2021-02-22 17:17:14.113000+00:00  Continue to open PCS RX
    2021-02-22 17:17:14.149000+00:00  Wait for HLLC Training........OK
    2021-02-22 17:17:14.149000+00:00  Wait for HLLC1 Training........OK
    2021-02-22 17:17:14.150000+00:00  Wait for S1 HLLC Training........OK =

    ... (5324 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
hip07-d05                  | arm64 | lab-collabora   | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6033f1a8aa1bbe24f9addcc3

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6033f1a8aa1bbe24=
f9addcc6
        new failure (last pass: next-20210219)
        1 lines

    2021-02-22 17:58:28.493000+00:00  [SOL Session operational.  Use ~? for=
 help]
    2021-02-22 17:58:30.070000+00:00  [serdes_cs_hw_calibration_optionV2_ex=
ec]:Macro1 CS1 LC Vco Cal done!(LCVCOCALDONE) in 0ms
    2021-02-22 17:58:30.070000+00:00  [SerdesCsCalib]:Macro1 CS1 PLL lock s=
uccess!(0 ms)
    2021-02-22 17:58:32.390000+00:00  [serdes_init]:SerDes1 init success!
    2021-02-22 17:58:32.474000+00:00  Continue to dreset PCS
    2021-02-22 17:58:32.474000+00:00  Continue to dreset HLLC
    2021-02-22 17:58:33.480000+00:00  Continue to open PCS RX
    2021-02-22 17:58:33.522000+00:00  Wait for HLLC Training........OK
    2021-02-22 17:58:33.522000+00:00  Wait for HLLC1 Training........OK
    2021-02-22 17:58:33.522000+00:00  Wait for S1 HLLC Training........OK =

    ... (5310 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mp-evk                 | arm64 | lab-nxp         | clang-10 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6033da309bb7a9ff71addce5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033da309bb7a9ff71add=
ce6
        new failure (last pass: next-20210219) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mp-evk                 | arm64 | lab-nxp         | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6033e11183d44aab21addcc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033e11183d44aab21add=
cc7
        new failure (last pass: next-20210219) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mp-evk                 | arm64 | lab-nxp         | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6033dbd4604ea5fd4caddcc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033dbd4604ea5fd4cadd=
cc9
        new failure (last pass: next-20210219) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mp-evk                 | arm64 | lab-nxp         | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6033df82c3b4209b7daddcbe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033df82c3b4209b7dadd=
cbf
        new failure (last pass: next-20210219) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mq-zii-ultra-zest      | arm64 | lab-pengutronix | clang-10 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6033d9a04c15ed8f02addcb5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/clang-10/lab-pengutronix/baseline-imx8mq-zii-ultra-zest.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/clang-10/lab-pengutronix/baseline-imx8mq-zii-ultra-zest.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033d9a04c15ed8f02add=
cb6
        new failure (last pass: next-20210219) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mq-zii-ultra-zest      | arm64 | lab-pengutronix | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6033df7bc3b4209b7daddcba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-pengutronix/baseline-im=
x8mq-zii-ultra-zest.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-pengutronix/baseline-im=
x8mq-zii-ultra-zest.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033df7bc3b4209b7dadd=
cbb
        failing since 3 days (last pass: next-20210218, first fail: next-20=
210219) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mq-zii-ultra-zest      | arm64 | lab-pengutronix | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6033daecb14fe0e4f9addcd4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-pengutronix/baseline-im=
x8mq-zii-ultra-zest.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-pengutronix/baseline-im=
x8mq-zii-ultra-zest.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033daecb14fe0e4f9add=
cd5
        new failure (last pass: next-20210219) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mq-zii-ultra-zest      | arm64 | lab-pengutronix | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6033dc426532be79d6addcb8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/clang-11/lab-pengutronix/baseline-imx8mq-zii-ultra-zest.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/clang-11/lab-pengutronix/baseline-imx8mq-zii-ultra-zest.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033dc426532be79d6add=
cb9
        new failure (last pass: next-20210219) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mq-zii-ultra-zest      | arm64 | lab-pengutronix | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6033dd966f68202896addd31

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/gcc-8/lab-pengutronix/baseline-imx8mq-zii-ultra-zest.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/gcc-8/lab-pengutronix/baseline-imx8mq-zii-ultra-zest.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033dd966f68202896add=
d32
        new failure (last pass: next-20210219) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-gxm-q200             | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6033dc3e315cbcf146addcf9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033dc3e315cbcf146add=
cfa
        new failure (last pass: next-20210219) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-sm1-khadas-vim3l     | arm64 | lab-baylibre    | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6033dec21f811868e1addcc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033dec21f811868e1add=
cc9
        failing since 11 days (last pass: next-20210210, first fail: next-2=
0210211) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-sm1-khadas-vim3l     | arm64 | lab-baylibre    | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6033daa3a754334d35addcc0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033daa3a754334d35add=
cc1
        failing since 11 days (last pass: next-20210210, first fail: next-2=
0210211) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-sm1-sei610           | arm64 | lab-baylibre    | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6033ea401683805293addcb7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033ea401683805293add=
cb8
        failing since 11 days (last pass: next-20210210, first fail: next-2=
0210211) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-sm1-sei610           | arm64 | lab-baylibre    | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6033e7c0132a783979addcf7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033e7c0132a783979add=
cf8
        failing since 11 days (last pass: next-20210209, first fail: next-2=
0210211) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a77950-salvator-x        | arm64 | lab-baylibre    | clang-10 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6033d9b4961b9e9076addcb7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033d9b4961b9e9076add=
cb8
        new failure (last pass: next-20210219) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a77950-salvator-x        | arm64 | lab-baylibre    | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6033e455fa85f8bd29addd0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033e455fa85f8bd29add=
d0c
        new failure (last pass: next-20210219) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a77950-salvator-x        | arm64 | lab-baylibre    | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6033dc5c6532be79d6addd32

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-r8a77=
950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-r8a77=
950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033dc5c6532be79d6add=
d33
        new failure (last pass: next-20210219) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a77950-salvator-x        | arm64 | lab-baylibre    | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6033ddb07c90b434c9addd19

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033ddb07c90b434c9add=
d1a
        new failure (last pass: next-20210219) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a77950-salvator-x        | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6033d85feea1f081c0addce8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033d85feea1f081c0add=
ce9
        new failure (last pass: next-20210219) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a77950-salvator-x        | arm64 | lab-baylibre    | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6033e1c1db4d831b2baddd02

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033e1c1db4d831b2badd=
d03
        failing since 3 days (last pass: next-20210217, first fail: next-20=
210219) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a77960-ulcb              | arm64 | lab-baylibre    | clang-10 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6033d8a5666801b068addcb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033d8a5666801b068add=
cba
        new failure (last pass: next-20210219) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a77960-ulcb              | arm64 | lab-baylibre    | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6033dda67c90b434c9addcc5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033dda67c90b434c9add=
cc6
        new failure (last pass: next-20210219) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a77960-ulcb              | arm64 | lab-baylibre    | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6033d8f5bdb838b1d1addccc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-r8a77=
960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-r8a77=
960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033d8f5bdb838b1d1add=
ccd
        new failure (last pass: next-20210219) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a77960-ulcb              | arm64 | lab-baylibre    | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6033d9e694e19748cfaddcb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033d9e694e19748cfadd=
cba
        new failure (last pass: next-20210219) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a77960-ulcb              | arm64 | lab-baylibre    | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6033dafd53d7a6e0d6addcc5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033dafd53d7a6e0d6add=
cc6
        new failure (last pass: next-20210219) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64    | arm64 | lab-clabbe      | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6033defe4a439fe4deaddcc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033defe4a439fe4deadd=
cc7
        failing since 11 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64    | arm64 | lab-clabbe      | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6033da758633e9e18faddcdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033da758633e9e18fadd=
cdd
        failing since 11 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64-model-b | arm64 | lab-baylibre    | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6033dfefcc8f3bcaeaaddcdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033dfefcc8f3bcaeaadd=
cdc
        failing since 103 days (last pass: next-20201110, first fail: next-=
20201111) =

 =20
