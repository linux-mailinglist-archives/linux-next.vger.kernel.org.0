Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE0FA36F4B6
	for <lists+linux-next@lfdr.de>; Fri, 30 Apr 2021 06:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbhD3EBQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Apr 2021 00:01:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhD3EBO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 30 Apr 2021 00:01:14 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 277ABC06174A
        for <linux-next@vger.kernel.org>; Thu, 29 Apr 2021 21:00:27 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id z6-20020a17090a1706b0290155e8a752d8so1004338pjd.4
        for <linux-next@vger.kernel.org>; Thu, 29 Apr 2021 21:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=m6E2BkJYmYC03AIEDyCD+OM+DpDlHRBUw6uuxLTQQBo=;
        b=QcUbLvbJ1W/iBMcmjSSD1+x4liUprbKdTipg0TGCaA30WBt8OiDRU/PIJNvM3TLvN8
         NpS2bJgrRoueOh+08QJM4q4A6OT6RvwW6l8OjCfusYmdkDSvoVRSK/gZFxAbiUEE7p1l
         k7sGISPSwfbtcQi7uBeVumIuEcVmi6XMVt/FDGPaUNFt0dPVNNPigDMFQBWcpVTRsWwC
         DZmmZo8KYW6v0OFCPyq7J54J64b3Kw92f8HqsvQmrDn5+mHqK91PzDkfN82srwsaHCH6
         TDgLXlkCJ0Je3ojP1RVxdFudLDf+FdYnlNIYqa/TXpr7RoFPPD5UlKBtCglvYTtiNVrt
         7wOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=m6E2BkJYmYC03AIEDyCD+OM+DpDlHRBUw6uuxLTQQBo=;
        b=ghMZSSkV5yzAmUB3eMVgJCuKLEYwKAg6+OUDMxXP+FKPF1QS/2vDjGd5BArM6ISuAb
         q3XIqO/4G0YAkiLTmyF0MgpMhxJ0EjRwvFuL41YPt5t+fGeuadJHZSiyB3h3kWTDiVob
         FsNuDSuQIf8tpwT2Bt3reaE9WYF6NoecumBUV786qIUPmBptGNfEg7Olhh3hraSZ7cNd
         S89H7P1OnwgUORNb23FjE+q3+jTsIztoqMnE5HKYDQYFjg6zYGh+orenxTudlgYVM7e6
         uSldZ5kmRvaVtVJvjunmyNPhoLXslkQ1JyEZFWnq5NAEq7Qkk3RGxANUkhLEuCX2ngZW
         m/hQ==
X-Gm-Message-State: AOAM531wk3JLEtkxeEqslcLp5uIfj9odyDXeE1lA6yrkRxV0jQBKslol
        2p88amsF7x21Qupwfe7kI5Rbzlpq+XfqUC1e
X-Google-Smtp-Source: ABdhPJw8xiL3zENcQJFkdfkWzgR7YSEpsqR2XRCyCt0gcsIeXUXbsUOa1HtqFW9TFKSm4RHlPhQAxQ==
X-Received: by 2002:a17:90b:3689:: with SMTP id mj9mr3363093pjb.154.1619755226193;
        Thu, 29 Apr 2021 21:00:26 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s19sm651847pfh.18.2021.04.29.21.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 21:00:25 -0700 (PDT)
Message-ID: <608b80d9.1c69fb81.79aa6.1f0e@mx.google.com>
Date:   Thu, 29 Apr 2021 21:00:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-11879-g660c9aba2ae7
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 334 runs,
 13 regressions (v5.12-11879-g660c9aba2ae7)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 334 runs, 13 regressions (v5.12-11879-g660c9ab=
a2ae7)

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

r8a77950-salvator-x  | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.BIG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.12-11879-g660c9aba2ae7/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.12-11879-g660c9aba2ae7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      660c9aba2ae7bf0085f7f8d821a2fb253d19f926 =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/608b4a6b9784a313c39b7808

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-11879=
-g660c9aba2ae7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-11879=
-g660c9aba2ae7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/608b4a6b9784a31=
3c39b780e
        failing since 2 days (last pass: v5.12-121-g07bcd85dd158c, first fa=
il: v5.12-4702-ge27839dcc50b7)
        11 lines

    2021-04-30 00:07:53.637000+00:00  kern  :alert : Mem [   23.214085] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-30 00:07:53.638000+00:00  abort info:
    2021-04-30 00:07:53.638000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/608b4a6b9784a31=
3c39b780f
        failing since 2 days (last pass: v5.12-121-g07bcd85dd158c, first fa=
il: v5.12-4702-ge27839dcc50b7)
        2 lines

    2021-04-30 00:07:53.642000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-30 00:07:53.643000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-30 00:07:53.643000+00:00  kern  :alert : Data abort info:
    2021-04-30 00:07:53.644000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-30 00:07:53.689000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-30 00:07:53.690000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000[   23.253294] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-30 00:07:53.691000+00:00  0003ab89000   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/608b4b824494edaa389b77df

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-11879=
-g660c9aba2ae7/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-11879=
-g660c9aba2ae7/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/608b4b824494eda=
a389b77e5
        failing since 2 days (last pass: v5.12-121-g07bcd85dd158c, first fa=
il: v5.12-4702-ge27839dcc50b7)
        11 lines

    2021-04-30 00:12:30.836000+00:00  kern  :alert : Mem [   23.200295] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-30 00:12:30.837000+00:00  abort info:
    2021-04-30 00:12:30.838000+00:00  kern  :alert :   ESR =3D 0x96000006
    2021-04-30 00:12:30.838000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-30 00:12:30.839000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0=
   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/608b4b824494eda=
a389b77e6
        failing since 2 days (last pass: v5.12-121-g07bcd85dd158c, first fa=
il: v5.12-4702-ge27839dcc50b7)
        2 lines

    2021-04-30 00:12:30.843000+00:00  kern  :alert : Data abort info:
    2021-04-30 00:12:30.843000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-30 00:12:30.889000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-30 00:12:30.890000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000[   23.239604] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-30 00:12:30.891000+00:00  000007f8000
    2021-04-30 00:12:30.891000+00:00  kern  :aler[   23.250602] <LAVA_SIGNA=
L_ENDRUN 0_dmesg 158974_1.5.2.4.1>   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/608b4c74866cd881669b77a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-11879=
-g660c9aba2ae7/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-11879=
-g660c9aba2ae7/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608b4c74866cd881669b7=
7a7
        new failure (last pass: v5.12-7972-g8db459ff530f) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
mt8173-elm-hana      | arm64 | lab-collabora   | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/608b4a6e4d6e17ddce9b77a1

  Results:     17 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-11879=
-g660c9aba2ae7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabor=
a/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-11879=
-g660c9aba2ae7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabor=
a/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/608b4a6e4d6e17ddce9b77b4
        failing since 2 days (last pass: v5.12-121-g07bcd85dd158c, first fa=
il: v5.12-4702-ge27839dcc50b7)

    2021-04-30 00:08:09.689000+00:00  <8>[   58.198430] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/608=
b4a6e4d6e17ddce9b77b9
        failing since 2 days (last pass: v5.12-121-g07bcd85dd158c, first fa=
il: v5.12-4702-ge27839dcc50b7) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/608b47e589d2d748ae9b7797

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-11879=
-g660c9aba2ae7/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-11879=
-g660c9aba2ae7/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608b47e589d2d748ae9b7=
798
        failing since 164 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/608b47db256c7b9ce59b77d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-11879=
-g660c9aba2ae7/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-=
versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-11879=
-g660c9aba2ae7/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-=
versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608b47db256c7b9ce59b7=
7d1
        failing since 164 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/608b47d10ccdf9fdf49b77b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-11879=
-g660c9aba2ae7/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vers=
atilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-11879=
-g660c9aba2ae7/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vers=
atilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608b47d10ccdf9fdf49b7=
7b1
        failing since 164 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/608b47cb0ccdf9fdf49b77ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-11879=
-g660c9aba2ae7/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-11879=
-g660c9aba2ae7/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608b47cb0ccdf9fdf49b7=
7ac
        failing since 164 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/608b4790923a9624469b7798

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-11879=
-g660c9aba2ae7/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-11879=
-g660c9aba2ae7/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608b4790923a9624469b7=
799
        failing since 164 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
r8a77950-salvator-x  | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/608b492961104909c29b77a3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-11879=
-g660c9aba2ae7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-11879=
-g660c9aba2ae7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608b492961104909c29b7=
7a4
        new failure (last pass: v5.12-7972-g8db459ff530f) =

 =20
