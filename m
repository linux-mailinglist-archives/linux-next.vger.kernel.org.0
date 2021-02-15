Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC73831C326
	for <lists+linux-next@lfdr.de>; Mon, 15 Feb 2021 21:44:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbhBOUob (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Feb 2021 15:44:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbhBOUoa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Feb 2021 15:44:30 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F30BC061574
        for <linux-next@vger.kernel.org>; Mon, 15 Feb 2021 12:43:50 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id b8so4319821plh.12
        for <linux-next@vger.kernel.org>; Mon, 15 Feb 2021 12:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=KfuJmkXVaXxBTr8NmUfQQRfO3G3TGOR52vUHb9AQKgo=;
        b=v8yHE4MpiA8/sDlgaWhc2pU1oPfeVH5FCjlZnlIimbdRxYJM+k+9aiQzBV+buUktxc
         LX8ilgzo9nDJBt/Ph9Y4dlWb+T4JsCouvu47YPbhW6KOgByBlciVaYXm5JIuZj285AHm
         nK0ed8N9KFjwK48kMp+NwZzGR04mCgW5sXuqIwZ0qmt+92i1Yb4U5kr0E5UECGEvGW34
         vu8Ag+QEnLEul+eepLaPf+kTYf7vGK+CgtVDrJ3d83tpRrEO3BNummOIJ+Y1wh4IaTat
         7w6AznTXGLWn8Dr41fFrETncwLGTuehkcNr27NlawuU7w2YX9uJ3HTSuokr+1+ZzE7Na
         G1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=KfuJmkXVaXxBTr8NmUfQQRfO3G3TGOR52vUHb9AQKgo=;
        b=W2rvbfBTkpDeUAWIA374M/UpmhvMDE04T5UVMM1Hr1Aud4yvGZoZY+UJYJhAH/R2A2
         rk4fFgXEUcgvhFi5i8yvuk+Yrwx46zTGH0gqlBZvdXOgmBpJQiQPSeCg5xm6dXyiNxMt
         e8mhGqTzfcNY7JI7wl7jOLRUYN8vjZRx6TXTJxZ5ryLLAfGUBTdA4oyAcz/AMjX9dBIV
         +RUYgFK0MzI8TZTfPwAxMkQ21dRU52BBRgUBOkO5IlNV5VBtCiun5NMwtGM4USOD4W8Y
         mfpXMPRGUUHsMHTbBscYZlpn0DNWdO4MxGXXJRQeabrW+U9Nk0Za/lh5GdXJ57MuQXbc
         nO6g==
X-Gm-Message-State: AOAM532mKnpjjECKl6476E5+O6MgxCW6JrepSRXdd2hdvc+C+ovHG396
        l93C/OYjbV9YrW8QkopztBzXj7YDCbiVyw==
X-Google-Smtp-Source: ABdhPJwnFb1A9gFtEiEadpoayPXmKgSJeksCsRf2ov7j0j/4XDw+tcf+qjZQ7QCUIalAT7SUv6YK5A==
X-Received: by 2002:a17:903:2093:b029:e3:790:81fe with SMTP id d19-20020a1709032093b02900e3079081femr17174080plc.39.1613421829055;
        Mon, 15 Feb 2021 12:43:49 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c9sm289933pjr.44.2021.02.15.12.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 12:43:48 -0800 (PST)
Message-ID: <602add04.1c69fb81.641c8.0dcc@mx.google.com>
Date:   Mon, 15 Feb 2021 12:43:48 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20210215
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 289 runs, 20 regressions (next-20210215)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 289 runs, 20 regressions (next-20210215)

Regressions Summary
-------------------

platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
hifive-unleashed-a00       | riscv  | lab-baylibre  | gcc-8    | defconfig =
                   | 1          =

hp-11A-G6-EE-grunt         | x86_64 | lab-collabora | gcc-8    | x86_64_def=
con...6-chromebook | 1          =

imx8mn-ddr4-evk            | arm64  | lab-baylibre  | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

meson-gxm-q200             | arm64  | lab-baylibre  | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 2          =

meson-sm1-khadas-vim3l     | arm64  | lab-baylibre  | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610           | arm64  | lab-baylibre  | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

meson8b-odroidc1           | arm    | lab-baylibre  | gcc-8    | multi_v7_d=
efconfig           | 1          =

mt8173-elm-hana            | arm64  | lab-collabora | clang-10 | defconfig =
                   | 2          =

r8a774a1-hihope-rzg2m-ex   | arm64  | lab-cip       | clang-10 | defconfig =
                   | 1          =

r8a774a1-hihope-rzg2m-ex   | arm64  | lab-cip       | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex   | arm64  | lab-cip       | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874             | arm64  | lab-cip       | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874             | arm64  | lab-cip       | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64    | arm64  | lab-clabbe    | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64    | arm64  | lab-clabbe    | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-orangepi-3       | arm64  | lab-clabbe    | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64-model-b | arm64  | lab-baylibre  | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64-model-b | arm64  | lab-baylibre  | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210215/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210215
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      52a0bcb60e40f30211cb5cbbb0f582ec4e91d896 =



Test Regressions
---------------- =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
hifive-unleashed-a00       | riscv  | lab-baylibre  | gcc-8    | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/602aa0c6df5c218447addcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210215/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210215/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602aa0c6df5c218447add=
cb2
        failing since 42 days (last pass: next-20201223, first fail: next-2=
0210104) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
hp-11A-G6-EE-grunt         | x86_64 | lab-collabora | gcc-8    | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/602aa3f071aec46761addccb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210215/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-hp-11A-G6-E=
E-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210215/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-hp-11A-G6-E=
E-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602aa3f071aec46761add=
ccc
        new failure (last pass: next-20210212) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
imx8mn-ddr4-evk            | arm64  | lab-baylibre  | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602aa93adf9171f949addd11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-imx8mn-d=
dr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-imx8mn-d=
dr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602aa93adf9171f949add=
d12
        new failure (last pass: next-20210212) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
meson-gxm-q200             | arm64  | lab-baylibre  | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/602aa70ee5caccf817addcb1

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-gx=
m-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-gx=
m-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/602aa70ee5caccf=
817addcb5
        new failure (last pass: next-20210212)
        10 lines

    2021-02-15 16:53:11.839000+00:00  kern  :alert : Mem abort info:
    2021-02-15 16:53:11.840000+00:00  kern  :alert :   ESR =3D 0x96000004
    2021-02-15 16:53:11.840000+00:00  ker<8>[   16.733711] <LAVA_SIGNAL_TES=
TCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D10>
    2021-02-15 16:53:11.840000+00:00  n  :alert :   EC =3D 0x25: DABT (curr=
ent EL), IL =3D 32 bits
    2021-02-15 16:53:11.840000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-02-15 16:53:11.840000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-02-15 16:53:11.840000+00:00  kern  :alert : Data abort info:
    2021-02-15 16:53:11.841000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000004
    2021-02-15 16:53:11.841000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0 =
  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/602aa70ee5caccf=
817addcb6
        new failure (last pass: next-20210212)
        2 lines

    2021-02-15 16:53:11.882000+00:00  kern  :emerg : Internal error: Oops: =
96000004 [#1] PREEMPT SMP
    2021-02-15 16:53:11.882000+00:00  kern  :emerg : Code: <8>[   16.778015=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D2>
    2021-02-15 16:53:11.882000+00:00  8b010f77 f861<8>[   16.786804] <LAVA_=
SIGNAL_ENDRUN 0_dmesg 726889_1.5.2.4.1>
    2021-02-15 16:53:11.882000+00:00  7b68 8b001a80 a94092e1 (f9400807) =

    2021-02-15 16:53:11.883000+00:00  + set +x
    2021-02-15 16:53:11.990000+00:00  / # #   =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
meson-sm1-khadas-vim3l     | arm64  | lab-baylibre  | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602aa8e26ce956a4a6addcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602aa8e26ce956a4a6add=
cb2
        failing since 4 days (last pass: next-20210210, first fail: next-20=
210211) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
meson-sm1-sei610           | arm64  | lab-baylibre  | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602aa87979215f0692addcde

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602aa87979215f0692add=
cdf
        failing since 4 days (last pass: next-20210209, first fail: next-20=
210211) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
meson8b-odroidc1           | arm    | lab-baylibre  | gcc-8    | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/602aa42eab6e072641addcc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210215/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-meson8b-odroidc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210215/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-meson8b-odroidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602aa42eab6e072641add=
cc4
        failing since 33 days (last pass: next-20210108, first fail: next-2=
0210113) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
mt8173-elm-hana            | arm64  | lab-collabora | clang-10 | defconfig =
                   | 2          =


  Details:     https://kernelci.org/test/plan/id/602aa269ecd9befc9baddccc

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/602aa269ecd9befc9baddce4
        failing since 35 days (last pass: next-20210108, first fail: next-2=
0210111)

    2021-02-15 16:33:03.172000+00:00  /lava-3228019/1/../bin/lava-test-case=
   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/602=
aa269ecd9befc9baddcea
        failing since 35 days (last pass: next-20210108, first fail: next-2=
0210111)

    2021-02-15 16:33:04.289000+00:00  <8>[   27.485055] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
r8a774a1-hihope-rzg2m-ex   | arm64  | lab-cip       | clang-10 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/602aa201abc56213d4addcc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602aa201abc56213d4add=
cc7
        failing since 35 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
r8a774a1-hihope-rzg2m-ex   | arm64  | lab-cip       | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602aa7edddbe963417addcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-r8a774a1-h=
ihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-r8a774a1-h=
ihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602aa7edddbe963417add=
cb2
        failing since 35 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
r8a774a1-hihope-rzg2m-ex   | arm64  | lab-cip       | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602aa7c1304397097aaddcc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hiho=
pe-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hiho=
pe-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602aa7c1304397097aadd=
cca
        failing since 35 days (last pass: next-20210107, first fail: next-2=
0210111) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
r8a774c0-ek874             | arm64  | lab-cip       | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602ad8b114a4f653e9addccf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-r8a774c0-e=
k874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-r8a774c0-e=
k874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602ad8b114a4f653e9add=
cd0
        failing since 35 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
r8a774c0-ek874             | arm64  | lab-cip       | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602ad78c005f3a35a4addcce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek87=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek87=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602ad78c005f3a35a4add=
ccf
        failing since 35 days (last pass: next-20210107, first fail: next-2=
0210111) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
sun50i-a64-bananapi-m64    | arm64  | lab-clabbe    | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602aa99053ad323f09addcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602aa99053ad323f09add=
cb2
        failing since 4 days (last pass: next-20210209, first fail: next-20=
210210) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
sun50i-a64-bananapi-m64    | arm64  | lab-clabbe    | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602aa812ddbe963417addd65

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602aa812ddbe963417add=
d66
        failing since 4 days (last pass: next-20210209, first fail: next-20=
210210) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
sun50i-h6-orangepi-3       | arm64  | lab-clabbe    | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602ad4a278c1a34acbaddccb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h6-=
orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h6-=
orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602ad4a278c1a34acbadd=
ccc
        failing since 96 days (last pass: next-20201110, first fail: next-2=
0201111) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
sun50i-h6-pine-h64-model-b | arm64  | lab-baylibre  | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602aadd1efb824e29caddcd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602aadd1efb824e29cadd=
cd3
        failing since 96 days (last pass: next-20201110, first fail: next-2=
0201111) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
sun50i-h6-pine-h64-model-b | arm64  | lab-baylibre  | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602aac4173803a8625addd16

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602aac4173803a8625add=
d17
        failing since 96 days (last pass: next-20201110, first fail: next-2=
0201111) =

 =20
