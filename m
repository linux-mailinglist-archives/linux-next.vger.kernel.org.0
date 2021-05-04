Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99EF2372AF0
	for <lists+linux-next@lfdr.de>; Tue,  4 May 2021 15:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbhEDN1N (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 May 2021 09:27:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230413AbhEDN1L (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 May 2021 09:27:11 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51524C061574
        for <linux-next@vger.kernel.org>; Tue,  4 May 2021 06:26:17 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id m11so7383319pfc.11
        for <linux-next@vger.kernel.org>; Tue, 04 May 2021 06:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=52Ds0WM2XvT3Mwbq9wfogbfL9bUugLY9BA2LIzUahsI=;
        b=BR6w0A5X/M1KlSHivxuszGdfT3aaqZZzhoFvYsXcyatiaIc/UGB7tyGeK6iD52fl5Z
         vCXF7GDmAWB023IKADVMavixvznSpoUNhQrfdlG3PJVIqtMAnA9UaLGIBfKC+QJPkG0t
         YZjl6CfZA8vqfA02sTf2CdatXNnqeO+vFw5+T3Ld6VGSVTDcW8BS9TjWx/WYxzklb5AP
         kNZ4Z4vIwxiz0eJKS5quu4Kh/Xe8yGjDqwBmGYildfB3BEmIn0alsOmGCnN/rcEe55cy
         Fhe/AOFpf+zjMx+cW1my8qPfMHGpbvzjG6MJ7XrV/Ps9vfu3TE3ZKpfHGNVy8YENrsTp
         7oaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=52Ds0WM2XvT3Mwbq9wfogbfL9bUugLY9BA2LIzUahsI=;
        b=O77Q37pwDlo9LogC4APj8++sXWgTYEzlmwNkh9PAki93rE7znit6iT8D2WxBI9nVHb
         bVcP/AYsZFXE9Vw4IynBLH0D83/xooN8U6N4PUbaekeuEMnn89OMluy798URT/lBLiND
         ZGjZl0qzkn3s8hqHwlES9ql+CH32PPYMmGz0Jw+mnJtCFttjiP+FWlN8WDt0mXIAGmwQ
         GBJmiUZf9fIKVi7u8XBSlPxILWI6KNioYiKzkNnL45yV8oWkzQB3oI0WiqeH4x/S4CON
         OIFBfcvl15e5t7fQ2AAwIvZTmLm/m1QIRnAa2xR3H5ARYBVZ2d9CD8sIh0hOd1i8mi+U
         RNMQ==
X-Gm-Message-State: AOAM533MI9iPEWyHDv/HAHsGE4zNQZ2zqRA2ROoDHm0YLkFLiY1d3VAH
        IQxWm5oGSQwplR9vBufZGIRZ1I9H9uUkGnJv
X-Google-Smtp-Source: ABdhPJwRiCMEBbpZoGJEXWH73/Oo0uLrQM4exIZWEANMponD1oT2EGPT6CDGIkMQIjrpAL51wgJ5bw==
X-Received: by 2002:a63:e514:: with SMTP id r20mr23611138pgh.423.1620134776474;
        Tue, 04 May 2021 06:26:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h9sm3394979pgl.67.2021.05.04.06.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 06:26:15 -0700 (PDT)
Message-ID: <60914b77.1c69fb81.a226.6675@mx.google.com>
Date:   Tue, 04 May 2021 06:26:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-13817-gacfd309800c1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 251 runs,
 13 regressions (v5.12-13817-gacfd309800c1)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 251 runs, 13 regressions (v5.12-13817-gacfd309=
800c1)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 2          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
              | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

meson-gxbb-p200      | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =

mt8173-elm-hana      | arm64 | lab-collabora   | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.12-13817-gacfd309800c1/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.12-13817-gacfd309800c1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      acfd309800c1ce9ef8b00a0a44adaf040b705365 =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/609106d5bbe9fdc5ba843f17

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-13817=
-gacfd309800c1/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-13817=
-gacfd309800c1/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/609106d5bbe9fdc=
5ba843f1b
        failing since 6 days (last pass: v5.12-121-g07bcd85dd158c, first fa=
il: v5.12-4702-ge27839dcc50b7)
        11 lines

    2021-05-04 08:33:04.805000+00:00  kern  :alert : Mem abort in[   23.197=
423] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D11>
    2021-05-04 08:33:04.806000+00:00  fo:
    2021-05-04 08:33:04.808000+00:00  kern  :alert :   ESR =3D 0x96000006
    2021-05-04 08:33:04.809000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-05-04 08:33:04.811000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0=
   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/609106d5bbe9fdc=
5ba843f1c
        failing since 6 days (last pass: v5.12-121-g07bcd85dd158c, first fa=
il: v5.12-4702-ge27839dcc50b7)
        2 lines

    2021-05-04 08:33:04.816000+00:00  kern  :alert : Data abort info:
    2021-05-04 08:33:04.817000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-05-04 08:33:04.856000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-05-04 08:33:04.859000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D000000003a040000
    2021-05-04 08:33:04.860000+00:00  ker[   23.238070] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-05-04 08:33:04.861000+00:00  n  :alert : [00000000000[   23.248608=
] <LAVA_SIGNAL_ENDRUN 0_dmesg 184446_1.5.2.4.1>
    2021-05-04 08:33:04.862000+00:00  00050] pgd=3D080000003a03c003, p4d=3D=
080000003a03c003
    2021-05-04 08:33:04.863000+00:00  kern  :emerg : Internal error: Oops: =
96000006 [#1] PREEMPT SMP   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/609107750ad0ab992c843f17

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-13817=
-gacfd309800c1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-13817=
-gacfd309800c1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/609107750ad0ab9=
92c843f1b
        failing since 6 days (last pass: v5.12-121-g07bcd85dd158c, first fa=
il: v5.12-4702-ge27839dcc50b7)
        11 lines

    2021-05-04 08:35:44.275000+00:00  kern  :alert : Unable to handle kerne=
l NULL pointer dereference at virtual address 0000000000000050
    2021-05-04 08:35:44.276000+00:00  kern  :alert : Mem [   23.187916] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-05-04 08:35:44.277000+00:00  abort info:
    2021-05-04 08:35:44.278000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/609107750ad0ab9=
92c843f1c
        failing since 6 days (last pass: v5.12-121-g07bcd85dd158c, first fa=
il: v5.12-4702-ge27839dcc50b7)
        2 lines

    2021-05-04 08:35:44.282000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-05-04 08:35:44.283000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-05-04 08:35:44.283000+00:00  kern  :alert : Data abort info:
    2021-05-04 08:35:44.284000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-05-04 08:35:44.328000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-05-04 08:35:44.329000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000[   23.227033] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-05-04 08:35:44.330000+00:00  0003a04e000   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/60910c71fca9c4b280843f18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-13817=
-gacfd309800c1/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-13817=
-gacfd309800c1/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60910c71fca9c4b280843=
f19
        failing since 4 days (last pass: v5.12-7972-g8db459ff530f, first fa=
il: v5.12-11879-g660c9aba2ae7) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60910e048fba2aa4b7843f4c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-13817=
-gacfd309800c1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/base=
line-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-13817=
-gacfd309800c1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/base=
line-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60910e048fba2aa4b7843=
f4d
        failing since 1 day (last pass: v5.12-11879-g660c9aba2ae7, first fa=
il: v5.12-13705-g6dbffe3729d93) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
meson-gxbb-p200      | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/60910caab4d1c4d701843f19

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-13817=
-gacfd309800c1/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxbb-p200.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-13817=
-gacfd309800c1/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxbb-p200.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60910cabb4d1c4d701843=
f1a
        new failure (last pass: v5.12-13705-g6dbffe3729d93) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
mt8173-elm-hana      | arm64 | lab-collabora   | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/609107820ad0ab992c843f2c

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-13817=
-gacfd309800c1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabor=
a/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-13817=
-gacfd309800c1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabor=
a/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/609107820ad0ab992c843f44
        failing since 6 days (last pass: v5.12-121-g07bcd85dd158c, first fa=
il: v5.12-4702-ge27839dcc50b7)

    2021-05-04 08:36:00.678000+00:00  <8>[   56.302872] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/609=
107820ad0ab992c843f4a
        failing since 6 days (last pass: v5.12-121-g07bcd85dd158c, first fa=
il: v5.12-4702-ge27839dcc50b7)

    2021-05-04 08:36:01.789000+00:00  <8>[   57.414637] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609102a501f9515991843f17

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-13817=
-gacfd309800c1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-13817=
-gacfd309800c1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609102a501f9515991843=
f18
        failing since 169 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609102c015c4186570843f19

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-13817=
-gacfd309800c1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-=
versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-13817=
-gacfd309800c1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-=
versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609102c015c4186570843=
f1a
        failing since 169 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609102ca0099f5817d843f1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-13817=
-gacfd309800c1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vers=
atilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-13817=
-gacfd309800c1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vers=
atilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609102ca0099f5817d843=
f1e
        failing since 169 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6091026b82a2722803843f18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-13817=
-gacfd309800c1/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-13817=
-gacfd309800c1/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6091026b82a2722803843=
f19
        failing since 169 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
