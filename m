Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36B94371163
	for <lists+linux-next@lfdr.de>; Mon,  3 May 2021 07:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbhECGAt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 3 May 2021 02:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbhECGAs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 3 May 2021 02:00:48 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33B87C06174A
        for <linux-next@vger.kernel.org>; Sun,  2 May 2021 22:59:55 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id b14-20020a17090a6e0eb0290155c7f6a356so8153360pjk.0
        for <linux-next@vger.kernel.org>; Sun, 02 May 2021 22:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=xxTvn+mvxFmfsowUArtvnReTcgR0MD35sCMYTEd/MkQ=;
        b=SAJ0dfWr/q6cnw1U4rUlZpSI9Z2rUCj04ppwsFCs9RAChdE6rP5AGE9Wi2xgldxOTJ
         C7FOg/6ExBkqtVJWJFNDbdjp9vF7fAyqxDVCNfwO9P9sa9bIc9OHJm72Sn0F7rbYAzzc
         v77lLAMn9yEU9AyF30q5fNQGsS7j5ThRBB3ka0XDauzmquN8shVNfnIY2ZhW/zqPPPj3
         0kiOb7NNE7hIGJbPZDxlnuVQXRmVz7CpTncK2RS4cYgzhtL83YOmG6W0tOVaMN2wJxK6
         DybDJsNcl3sgfvHU2yHnWQzA/cpzGJ6LYP/WSKK2fkViWvsPSnqJrCCG/lVPXvL8N2vV
         Tusw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=xxTvn+mvxFmfsowUArtvnReTcgR0MD35sCMYTEd/MkQ=;
        b=eR2EWlJtdvnGqokjrJVMqtHoWORXiPU03rIAZ+OlWfy0L9YRs1RmG8ppyeYecaE1NH
         imty6H657bmBkmIIjX2P1jJtgMlBFuKQ+ENGrE6F6dhdddnC1fldd86c09YJ09HOj2wu
         5YGgE46Ll1HA5BHSFChjiojBBLjH/U/s3q93u8s5Yus9HtahXa03ywSYJwvVCMe8/5vR
         oP8BD8zblbvmk4TmJMLUOT35CmCm5GoWpQaaFH8+lifdoXAtnUY5z4SPPqBW88PwRZyt
         PStebc3UUqaJl4iUnMNVwEtk/A7X5f8bhsEOJxMz2E4tHMV9nVKd+dCtn9xaDxLMi+p/
         peXA==
X-Gm-Message-State: AOAM530LqZOqfbpgEJfH4sTxsYWgiCiOZ658j4WcKhxZ1QA7ttKnhGHE
        kj5ho4TaqAHlSPs/YVVHasce9vk5BR9EOuYh
X-Google-Smtp-Source: ABdhPJzYMY+sF57FWCAzmKGnyNrq6SJ3n+nmZaaTTmZQS2qeKOqJSSEPWUTu2ZAY2waaaGCkvI7+DQ==
X-Received: by 2002:a17:90b:2353:: with SMTP id ms19mr28446842pjb.118.1620021594339;
        Sun, 02 May 2021 22:59:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id gw7sm2276655pjb.57.2021.05.02.22.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 May 2021 22:59:53 -0700 (PDT)
Message-ID: <608f9159.1c69fb81.10a89.643d@mx.google.com>
Date:   Sun, 02 May 2021 22:59:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-13705-g6dbffe3729d93
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 320 runs,
 13 regressions (v5.12-13705-g6dbffe3729d93)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 320 runs, 13 regressions (v5.12-13705-g6dbffe3=
729d93)

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

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
              | 1          =

mt8173-elm-hana      | arm64 | lab-collabora   | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

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
v5.12-13705-g6dbffe3729d93/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.12-13705-g6dbffe3729d93
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6dbffe3729d9332bc280655046b21d29bac8a61c =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/608f5d1dfed0b834099b77ff

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-13705=
-g6dbffe3729d93/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-13705=
-g6dbffe3729d93/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/608f5d1dfed0b83=
4099b7803
        failing since 5 days (last pass: v5.12-121-g07bcd85dd158c, first fa=
il: v5.12-4702-ge27839dcc50b7)
        11 lines

    2021-05-03 02:16:47.031000+00:00  kern  :alert : Mem [   23.251449] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-05-03 02:16:47.031000+00:00  abort info:
    2021-05-03 02:16:47.032000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/608f5d1dfed0b83=
4099b7804
        failing since 5 days (last pass: v5.12-121-g07bcd85dd158c, first fa=
il: v5.12-4702-ge27839dcc50b7)
        2 lines

    2021-05-03 02:16:47.036000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-05-03 02:16:47.037000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-05-03 02:16:47.037000+00:00  kern  :alert : Data abort info:
    2021-05-03 02:16:47.038000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-05-03 02:16:47.083000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-05-03 02:16:47.084000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000[   23.290854] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-05-03 02:16:47.085000+00:00  0003a1cb000   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/608f5e352091f05c6b9b7795

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-13705=
-g6dbffe3729d93/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-13705=
-g6dbffe3729d93/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/608f5e352091f05=
c6b9b7799
        failing since 5 days (last pass: v5.12-121-g07bcd85dd158c, first fa=
il: v5.12-4702-ge27839dcc50b7)
        11 lines

    2021-05-03 02:21:22.633000+00:00  kern  :alert : Mem [   23.178576] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-05-03 02:21:22.634000+00:00  abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/608f5e352091f05=
c6b9b779a
        failing since 5 days (last pass: v5.12-121-g07bcd85dd158c, first fa=
il: v5.12-4702-ge27839dcc50b7)
        2 lines

    2021-05-03 02:21:22.638000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-05-03 02:21:22.639000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-05-03 02:21:22.640000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-05-03 02:21:22.640000+00:00  kern  :alert : Data abort info:
    2021-05-03 02:21:22.641000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-05-03 02:21:22.676000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-05-03 02:21:22.677000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000[   23.218056] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-05-03 02:21:22.678000+00:00  0003a064000
    2021-05-03 02:21:22.679000+00:00  kern  :aler[   23.228824] <LAVA_SIGNA=
L_ENDRUN 0_dmesg 166743_1.5.2.4.1>   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/608f5f1f377b17c5fd9b77b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-13705=
-g6dbffe3729d93/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/bas=
eline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-13705=
-g6dbffe3729d93/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/bas=
eline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608f5f1f377b17c5fd9b7=
7b2
        new failure (last pass: v5.12-11879-g660c9aba2ae7) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/608f60b961356e24939b77a0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-13705=
-g6dbffe3729d93/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-13705=
-g6dbffe3729d93/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608f60b961356e24939b7=
7a1
        failing since 3 days (last pass: v5.12-7972-g8db459ff530f, first fa=
il: v5.12-11879-g660c9aba2ae7) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
mt8173-elm-hana      | arm64 | lab-collabora   | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/608f5d2762161547cb9b7796

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-13705=
-g6dbffe3729d93/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-13705=
-g6dbffe3729d93/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/608f5d2762161547cb9b77ae
        failing since 5 days (last pass: v5.12-121-g07bcd85dd158c, first fa=
il: v5.12-4702-ge27839dcc50b7)

    2021-05-03 02:17:07.220000+00:00  <8>[   56.279223] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/608=
f5d2762161547cb9b77b4
        failing since 5 days (last pass: v5.12-121-g07bcd85dd158c, first fa=
il: v5.12-4702-ge27839dcc50b7)

    2021-05-03 02:17:08.332000+00:00  <8>[   57.392235] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/608f539059a51bf3499b779d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-13705=
-g6dbffe3729d93/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-13705=
-g6dbffe3729d93/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608f539059a51bf3499b7=
79e
        failing since 167 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/608f53a1c943c3c2df9b7799

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-13705=
-g6dbffe3729d93/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-13705=
-g6dbffe3729d93/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608f53a1c943c3c2df9b7=
79a
        failing since 167 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/608f538698914a641a9b7796

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-13705=
-g6dbffe3729d93/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ver=
satilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-13705=
-g6dbffe3729d93/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ver=
satilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608f538698914a641a9b7=
797
        failing since 167 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/608f533d5a3a3f10b59b77c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-13705=
-g6dbffe3729d93/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-13705=
-g6dbffe3729d93/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608f533d5a3a3f10b59b7=
7c3
        failing since 167 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/608f54bd6648c0388e9b77a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-13705=
-g6dbffe3729d93/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-13705=
-g6dbffe3729d93/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608f54bd6648c0388e9b7=
7a5
        failing since 167 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
