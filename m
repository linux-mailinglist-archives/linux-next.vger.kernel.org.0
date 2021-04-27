Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 071CA36C756
	for <lists+linux-next@lfdr.de>; Tue, 27 Apr 2021 15:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236866AbhD0Nyd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Apr 2021 09:54:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236746AbhD0Nyc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 27 Apr 2021 09:54:32 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0345C061574
        for <linux-next@vger.kernel.org>; Tue, 27 Apr 2021 06:53:48 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id t22so7124244pgu.0
        for <linux-next@vger.kernel.org>; Tue, 27 Apr 2021 06:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bgC8kT2CI5aTq2QJ/PYDbq870HFOxy8laLStH0a2ByA=;
        b=Irpd/+aYcS+jJ5uIOaNp3rEu8Hx9dSEjV3nLbW0XB183XtNLJv8h08YpbQPzdeDBFz
         +VJYRdm81MKNsGtb+WmzRp5n7XsU+dtK72viRi79eta+YdjJ8j80I3z2f/K+fELmqrNa
         gU4Ex6lkze8ML6eTTfCZw2Q/yEIn82yhCCSc97CWKvHyOIAZeF/oGcBtGNjZyj25BYzQ
         +5u5zOIJdIrAS0yuBNo8W34BPFt481qioKZh+Hv+nbJ+qu/sviir+7RFzXzPqYIP1PLU
         HIAt+KKW8ZCE3pjHAPpEp1A7TH/Mq9aiD5pFiIgdb8Y4ImvlNoWuMwsaS8CNYl21IfCU
         r1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bgC8kT2CI5aTq2QJ/PYDbq870HFOxy8laLStH0a2ByA=;
        b=bRF0hPRNOEVaQLhJm2FiRAbzmIcVabgKVzTRw4TYSVMdBZlWat+3IdmuDJw/iKjtvg
         xLx/w+nVa3ToSreRxhIO3wtM9fjlvVoS8iNFsUA4nDtLyu8fq0R0fhryGtjCkEtRAlIf
         y3QxwXgOEUcy9LcVHT6VkPdDEndjW9t7m2sTAQNUhYl8uffxR8RZ2INowg5s6/mi7aTe
         ku9WHxX/n7uPagtC3nIep7YlMzuPRInimGP2V8LLgoMQYw8+9OxgneIiol5z998EFBWN
         KuDgf4lHlcGSHorEUrSszhTv+s65avNHc65DWZXyYBiOzrdHAPPj/+57IDprWGR+IQL3
         ScDw==
X-Gm-Message-State: AOAM5311yY3N+ZB2Uvr5/st9DNUf8+DLhoUySLUK0o/FoSkB2nkJJHsZ
        PHkbyS2shhQhLzyVm5t0txdJzm3rSeJLbhCu
X-Google-Smtp-Source: ABdhPJwSSjWCY4FViWUGCSv9ouoA4Q67tvqJ/0mTqOa7bJ5xyUiHenCZKKD4xxW6gT4FA92zHbLjEg==
X-Received: by 2002:a65:4382:: with SMTP id m2mr21966579pgp.354.1619531627757;
        Tue, 27 Apr 2021 06:53:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b25sm2780949pfd.7.2021.04.27.06.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 06:53:47 -0700 (PDT)
Message-ID: <6088176b.1c69fb81.c5059.84b1@mx.google.com>
Date:   Tue, 27 Apr 2021 06:53:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20210427
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 612 runs, 15 regressions (next-20210427)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 612 runs, 15 regressions (next-20210427)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | clang-10 | defconfig      =
              | 2          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 2          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

bcm2837-rpi-3-b-32   | arm   | lab-baylibre    | gcc-8    | bcm2835_defconf=
ig            | 1          =

imx8mp-evk           | arm64 | lab-nxp         | clang-12 | defconfig      =
              | 1          =

meson-gxl-s805x-p241 | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905d-p230 | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =

r8a77950-salvator-x  | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210427/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210427
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c83540783e906ba43421bfcfd22d678fef4178d5 =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | clang-10 | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/6087debe82a44939ba9b77b3

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210427/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210427/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6087debe82a4493=
9ba9b77b7
        failing since 20 days (last pass: next-20210323, first fail: next-2=
0210406)
        11 lines

    2021-04-27 09:51:34.917000+00:00  kern  :alert : Mem [   21.611551] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-27 09:51:34.918000+00:00  abort info:
    2021-04-27 09:51:34.918000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6087debe82a4493=
9ba9b77b8
        failing since 20 days (last pass: next-20210323, first fail: next-2=
0210406)
        2 lines

    2021-04-27 09:51:34.923000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-27 09:51:34.923000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-27 09:51:34.924000+00:00  kern  :alert : Data abort info:
    2021-04-27 09:51:34.925000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-27 09:51:34.959000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-27 09:51:34.959000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000[   21.651225] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-27 09:51:34.960000+00:00  000071f4000   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/6087d5c15d93e546729b77b0

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210427/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210427/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6087d5c15d93e54=
6729b77b4
        failing since 7 days (last pass: next-20210416, first fail: next-20=
210419)
        11 lines

    2021-04-27 09:13:16.925000+00:00  kern  :alert : Mem [   21.740627] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-27 09:13:16.925000+00:00  abort info:
    2021-04-27 09:13:16.926000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6087d5c15d93e54=
6729b77b5
        failing since 7 days (last pass: next-20210416, first fail: next-20=
210419)
        2 lines

    2021-04-27 09:13:16.930000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-27 09:13:16.931000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-27 09:13:16.932000+00:00  kern  :alert : Data abort info:
    2021-04-27 09:13:16.932000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-27 09:13:16.967000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-27 09:13:16.968000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pg[   21.779465] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg R=
ESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-27 09:13:16.969000+00:00  dp=3D00000000073db000
    2021-04-27 09:13:16.970000+00:00  ker[   21.789987] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 142740_1.5.2.4.1>   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6087da9a6c3cdbeea09b77b8

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210427/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210427/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6087da9a6c3cdbe=
ea09b77bc
        failing since 20 days (last pass: next-20210323, first fail: next-2=
0210406)
        11 lines

    2021-04-27 09:33:56.081000+00:00  kern  :alert : Unable to handle kerne=
l NULL pointer dereference at virtual address 0000000000000050
    2021-04-27 09:33:56.082000+00:00  kern  :alert : Mem [   21.698314] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-27 09:33:56.083000+00:00  abort info:
    2021-04-27 09:33:56.083000+00:00  kern  :alert :   ESR =3D 0x96000006
    2021-04-27 09:33:56.084000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-27 09:33:56.084000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-27 09:33:56.085000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-27 09:33:56.085000+00:00  kern  :alert : Data abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6087da9a6c3cdbe=
ea09b77bd
        failing since 20 days (last pass: next-20210323, first fail: next-2=
0210406)
        2 lines

    2021-04-27 09:33:56.125000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-27 09:33:56.126000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000[   21.737260] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-27 09:33:56.127000+00:00  0003a847000
    2021-04-27 09:33:56.127000+00:00  kern  :aler[   21.748392] <LAVA_SIGNA=
L_ENDRUN 0_dmesg 142901_1.5.2.4.1>
    2021-04-27 09:33:56.127000+00:00  t : [0000000000000050] pgd=3D08000000=
043ae003, p4d=3D08000000043ae003, pud=3D0800000007313003, pmd=3D00000000000=
00000
    2021-04-27 09:33:56.128000+00:00  kern  :emerg : Internal error: Oops: =
96000006 [#1] PREEMPT SMP   =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b-32   | arm   | lab-baylibre    | gcc-8    | bcm2835_defconf=
ig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6087d5842eb816a0d19b77a5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210427/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210427/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6087d5842eb816a0d19b7=
7a6
        failing since 32 days (last pass: next-20210324, first fail: next-2=
0210325) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | clang-12 | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/6087d8fc25e2cd93e49b77aa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.0-++20210304023004+4ed9f=
17e9390-1~exp1~20210304133725.54)
  Plain log:   https://storage.kernelci.org//next/master/next-20210427/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210427/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6087d8fc25e2cd93e49b7=
7ab
        failing since 3 days (last pass: next-20210419, first fail: next-20=
210420) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
meson-gxl-s805x-p241 | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6087db48b2939d9b7a9b77e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210427/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210427/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6087db48b2939d9b7a9b7=
7e1
        new failure (last pass: next-20210422) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
meson-gxl-s905d-p230 | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6087dd3c87df4d7d289b77ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210427/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210427/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6087dd3c87df4d7d289b7=
7ad
        new failure (last pass: next-20210426) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6087d6e8fa17a065f39b77c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210427/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210427/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6087d6e8fa17a065f39b7=
7c5
        failing since 160 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6087d93163e70aea679b77c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210427/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210427/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6087d93163e70aea679b7=
7c9
        failing since 160 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6087d762d043c1030e9b779e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210427/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210427/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6087d762d043c1030e9b7=
79f
        failing since 160 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6087e76c31a7da43929b77a0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210427/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210427/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6087e76c31a7da43929b7=
7a1
        failing since 160 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
r8a77950-salvator-x  | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/6087d73b47ad4c6d889b77a5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210427/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210427/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6087d73b47ad4c6d889b7=
7a6
        new failure (last pass: next-20210426) =

 =20
