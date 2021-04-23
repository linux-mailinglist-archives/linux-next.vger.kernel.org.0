Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40D03369990
	for <lists+linux-next@lfdr.de>; Fri, 23 Apr 2021 20:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbhDWS2X (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Apr 2021 14:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231400AbhDWS2X (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 23 Apr 2021 14:28:23 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0323C061574
        for <linux-next@vger.kernel.org>; Fri, 23 Apr 2021 11:27:45 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id em21-20020a17090b0155b029014e204a81e6so4868277pjb.1
        for <linux-next@vger.kernel.org>; Fri, 23 Apr 2021 11:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=oXp7EFPsjjiGhV03PhHBdv/ZKanRkL893bur00A1JMw=;
        b=JVPbqg/ykmVnrjFIN3Q8/Pf5kWwgxNLrcAM+L7RzeaRGxSQt7DrOJT0ypLgHprQIM5
         DGDTwitfQ6UGu8gZT64pbZUuVcFyQM4iFFeIds4au0yCohC5cDlGcl/6PwJ17+9rkmhV
         hZ4OuLGdjlvyQAcogg//2g+5DX6TXpr78MYdCZPHDfUdWsJJO5Qhl5ffpUICELZkseRp
         EN7TMrozf90eTuNwExhMSpdwh9iDum/qWnPJaO1OEH+KtxSxiRZBDEYCHn5aghBhgzZO
         VJGltf8RqAVSyzjGKtCJROAmxhwPO4Z5xaAZQWNOidvPGmE20rmdGYna2yN+4W34dHHC
         Uw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=oXp7EFPsjjiGhV03PhHBdv/ZKanRkL893bur00A1JMw=;
        b=PSVJat6NTOUt8e3haIg6w6cIzPPX/wCd+HTR69c9Po1RMsUzr5o4CYyBf1LKoE389t
         d5nUpTFkAhyyhpE4OGAea76e/6dIXmWLOHYYs/IFdmi2bVgwW0nXNBAOF/goVZOrgtwI
         eMq+7ZGni97b4aOSlBAyzUuIekI1BXGkAKxplW/ZA7yoTy+KFX5oOU936N95j6nsRbpn
         Ab4J+lwYFmfkF3h7Qrgt/x2iMEq5PJjyqOj5u7Ce4vhoLl/zwGGVkjkrqExLEc+IVwVw
         nrLEJWKR1uFypjulDRaZfP8CcnqbAvl2g/aFP+H0xjwrw2kbvoaqstxJjn7UE4dRSh9o
         ZBEQ==
X-Gm-Message-State: AOAM531ySWrKP0ZcqtJofSNTD6RmLaftusDdhPI1VOjFJAz1GBmTB2hj
        uKiHHZAcCDUvzud/fDBXTn4GYmjOW2VJBlpC
X-Google-Smtp-Source: ABdhPJz+67V9Jfd8NRWr3jG+xS65sJlW/+gNO9GrEJvg0qOL6roUEcTHoMo8DUKI5j0m1rVEHEhnEA==
X-Received: by 2002:a17:90a:730c:: with SMTP id m12mr7082444pjk.111.1619202464481;
        Fri, 23 Apr 2021 11:27:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id nh24sm5382778pjb.38.2021.04.23.11.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 11:27:43 -0700 (PDT)
Message-ID: <6083119f.1c69fb81.279b2.fcce@mx.google.com>
Date:   Fri, 23 Apr 2021 11:27:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20210423
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 614 runs, 39 regressions (next-20210423)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 614 runs, 39 regressions (next-20210423)

Regressions Summary
-------------------

platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora   | gcc-8    | bcm2835_defc=
onfig            | 1          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre    | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre    | clang-10 | defconfig   =
                 | 2          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig   =
                 | 2          =

bcm2837-rpi-3-b-32      | arm   | lab-baylibre    | gcc-8    | bcm2835_defc=
onfig            | 1          =

hifive-unleashed-a00    | riscv | lab-baylibre    | gcc-8    | defconfig   =
                 | 1          =

imx8mq-zii-ultra-zest   | arm64 | lab-pengutronix | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

imx8mq-zii-ultra-zest   | arm64 | lab-pengutronix | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

imx8mq-zii-ultra-zest   | arm64 | lab-pengutronix | gcc-8    | defconfig   =
                 | 1          =

kontron-sl28-var3-ads2  | arm64 | lab-kontron     | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2  | arm64 | lab-kontron     | clang-10 | defconfig   =
                 | 2          =

kontron-sl28-var3-ads2  | arm64 | lab-kontron     | clang-12 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2  | arm64 | lab-kontron     | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2  | arm64 | lab-kontron     | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2  | arm64 | lab-kontron     | gcc-8    | defconfig   =
                 | 2          =

meson-gxm-q200          | arm64 | lab-baylibre    | clang-10 | defconfig   =
                 | 1          =

mt8173-elm-hana         | arm64 | lab-collabora   | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =

qemu_arm-versatilepb    | arm   | lab-baylibre    | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-broonie     | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-cip         | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-collabora   | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-linaro-lkft | gcc-8    | versatile_de=
fconfig          | 1          =

r8a77950-salvator-x     | arm64 | lab-baylibre    | gcc-8    | defconfig   =
                 | 1          =

r8a77960-ulcb           | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210423/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210423
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e3d35712f85ac84fb06234848f6c043ab418cf8b =



Test Regressions
---------------- =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora   | gcc-8    | bcm2835_defc=
onfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6082d748be681e6bf09b7795

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210423/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210423/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6082d748be681e6bf09b7=
796
        failing since 25 days (last pass: next-20210324, first fail: next-2=
0210325) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6082d5f85d02d1b6e09b77c6

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6082d5f85d02d1b=
6e09b77ca
        failing since 16 days (last pass: next-20210323, first fail: next-2=
0210406)
        11 lines

    2021-04-23 14:12:59.552000+00:00  kern  :alert : Mem abort info:
    2021-04-23 14:12:59.554000+00:00  kern  :aler[   31.917276] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1=
1>
    2021-04-23 14:12:59.554000+00:00  t :   ESR =3D 0x96000007
    2021-04-23 14:12:59.555000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-23 14:12:59.556000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-23 14:12:59.556000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D =
0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6082d5f85d02d1b=
6e09b77cb
        failing since 16 days (last pass: next-20210323, first fail: next-2=
0210406)
        2 lines

    2021-04-23 14:12:59.560000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000007
    2021-04-23 14:12:59.561000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-23 14:12:59.596000+00:00  kern  :alert : user pgtable: 64k page=
s, 48-bit VAs, pgdp=3D000000000bfc1000
    2021-04-23 14:12:59.597000+00:00  kern  :alert : [0000000000000050] pgd=
=3D080000000c230003, p4d=3D080000000c230003, pud=3D080000000c230003[   31.9=
64367] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlin=
es MEASUREMENT=3D2>   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | clang-10 | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/6082d7100acce5a55a9b77dc

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6082d7100acce5a=
55a9b77e0
        failing since 17 days (last pass: next-20210323, first fail: next-2=
0210406)
        11 lines

    2021-04-23 14:17:29.547000+00:00  kern  :alert : Mem [   21.687246] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-23 14:17:29.548000+00:00  abort info:
    2021-04-23 14:17:29.549000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6082d7100acce5a=
55a9b77e1
        failing since 17 days (last pass: next-20210323, first fail: next-2=
0210406)
        2 lines

    2021-04-23 14:17:29.553000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-23 14:17:29.554000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-23 14:17:29.554000+00:00  kern  :alert : Data abort info:
    2021-04-23 14:17:29.555000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-23 14:17:29.589000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-23 14:17:29.590000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pg[   21.725735] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg R=
ESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-23 14:17:29.591000+00:00  dp=3D000000000723c000
    2021-04-23 14:17:29.592000+00:00  ker[   21.736543] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 128198_1.5.2.4.1>   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6082d453dadce5c3bb9b77d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6082d453dadce5c3bb9b7=
7d1
        new failure (last pass: next-20210422) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6082d4dff0737f051f9b77b1

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6082d4dff0737f0=
51f9b77b5
        failing since 16 days (last pass: next-20210323, first fail: next-2=
0210406)
        11 lines

    2021-04-23 14:08:11.404000+00:00  kern  :alert : Mem [   21.834829] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-23 14:08:11.405000+00:00  abort info:
    2021-04-23 14:08:11.405000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6082d4dff0737f0=
51f9b77b6
        failing since 16 days (last pass: next-20210323, first fail: next-2=
0210406)
        2 lines

    2021-04-23 14:08:11.410000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-23 14:08:11.410000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-23 14:08:11.411000+00:00  kern  :alert : Data abort info:
    2021-04-23 14:08:11.412000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-23 14:08:11.446000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-23 14:08:11.447000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000[   21.874025] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-23 14:08:11.448000+00:00  0003a500000
    2021-04-23 14:08:11.449000+00:00  kern  :aler[   21.884920] <LAVA_SIGNA=
L_ENDRUN 0_dmesg 128063_1.5.2.4.1>   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/6082d68431bec6761a9b77c6

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6082d68431bec67=
61a9b77ca
        failing since 3 days (last pass: next-20210416, first fail: next-20=
210419)
        11 lines

    2021-04-23 14:15:12.699000+00:00  kern  :alert : Mem [   21.712295] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-23 14:15:12.700000+00:00  abort info:
    2021-04-23 14:15:12.701000+00:00  kern  :alert :   ESR =3D 0x96000006
    2021-04-23 14:15:12.702000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-23 14:15:12.702000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-23 14:15:12.703000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-23 14:15:12.703000+00:00  kern  :alert : Data abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6082d68431bec67=
61a9b77cb
        failing since 3 days (last pass: next-20210416, first fail: next-20=
210419)
        2 lines

    2021-04-23 14:15:12.742000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-23 14:15:12.743000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pg[   21.751414] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg R=
ESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-23 14:15:12.744000+00:00  dp=3D000000003aa17000
    2021-04-23 14:15:12.745000+00:00  ker[   21.761855] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 128162_1.5.2.4.1>
    2021-04-23 14:15:12.745000+00:00  n  :alert : [0000000000000050] pgd=3D=
080000003aa18003, p4d=3D080000003aa18003, pud=3D080000003aa19003, pmd=3D000=
0000000000000
    2021-04-23 14:15:12.746000+00:00  kern  :emerg : Internal error: Oops: =
96000006 [#1] PREEMPT SMP   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b-32      | arm   | lab-baylibre    | gcc-8    | bcm2835_defc=
onfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6082d4cb1d4871c3879b77ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210423/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210423/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6082d4cb1d4871c3879b7=
7ac
        failing since 29 days (last pass: next-20210324, first fail: next-2=
0210325) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
hifive-unleashed-a00    | riscv | lab-baylibre    | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/6082d1e9f2b95167e29b77a1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210423/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210423/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6082d1e9f2b95167e29b7=
7a2
        failing since 30 days (last pass: next-20210312, first fail: next-2=
0210323) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx8mq-zii-ultra-zest   | arm64 | lab-pengutronix | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6082d435c5549c6a2f9b77d9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-pengutronix/baseline-imx8m=
q-zii-ultra-zest.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-pengutronix/baseline-imx8m=
q-zii-ultra-zest.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6082d435c5549c6a2f9b7=
7da
        new failure (last pass: next-20210416) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx8mq-zii-ultra-zest   | arm64 | lab-pengutronix | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6082d58ab4043fcac39b779d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-pengutronix/baseline-imx8mq=
-zii-ultra-zest.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-pengutronix/baseline-imx8mq=
-zii-ultra-zest.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6082d58ab4043fcac39b7=
79e
        failing since 8 days (last pass: next-20210302, first fail: next-20=
210414) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx8mq-zii-ultra-zest   | arm64 | lab-pengutronix | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/6082d98f20a989d6389b7795

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig/gcc-8/lab-pengutronix/baseline-imx8mq-zii-ultra-zest.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig/gcc-8/lab-pengutronix/baseline-imx8mq-zii-ultra-zest.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6082d98f20a989d6389b7=
796
        new failure (last pass: next-20210416) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2  | arm64 | lab-kontron     | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6082d57a59a3c206539b77b5

  Results:     98 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/6082d57a59a3c206539b77c0
        failing since 1 day (last pass: next-20210420, first fail: next-202=
10422)

    2021-04-23 14:10:57.817000+00:00  <8>[   13.875685] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-23 14:10:57.817000+00:00  /lava-16876/1/../bin/lava-test-case
    2021-04-23 14:10:57.818000+00:00  <8>[   13.892135] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-23 14:10:57.818000+00:00  /lava-16876/1/../bin/lava-test-case
    2021-04-23 14:10:57.818000+00:00  <8>[   13.908525] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-probed RESULT=3Dpass>
    2021-04-23 14:10:57.818000+00:00  /lava-16876/1/../bin/lava-test-case   =


  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/6082d57a59a3c206539b77c0
        failing since 1 day (last pass: next-20210420, first fail: next-202=
10422)

    2021-04-23 14:10:57.817000+00:00  <8>[   13.875685] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-23 14:10:57.817000+00:00  /lava-16876/1/../bin/lava-test-case
    2021-04-23 14:10:57.818000+00:00  <8>[   13.892135] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-23 14:10:57.818000+00:00  /lava-16876/1/../bin/lava-test-case
    2021-04-23 14:10:57.818000+00:00  <8>[   13.908525] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-probed RESULT=3Dpass>
    2021-04-23 14:10:57.818000+00:00  /lava-16876/1/../bin/lava-test-case   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2  | arm64 | lab-kontron     | clang-10 | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/6082d71e2c1a8259419b77ac

  Results:     98 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig/clang-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig/clang-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/6082d71e2c1a8259419b77b7
        failing since 1 day (last pass: next-20210420, first fail: next-202=
10422)

    2021-04-23 14:18:00.338000+00:00  <8>[   13.951357] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-23 14:18:00.339000+00:00  /lava-16882/1/../bin/lava-test-case
    2021-04-23 14:18:00.339000+00:00  <8>[   13.967576] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-23 14:18:00.339000+00:00  /lava-16882/1/../bin/lava-test-case
    2021-04-23 14:18:00.339000+00:00  <8>[   13.982951] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-probed RESULT=3Dpass>
    2021-04-23 14:18:00.340000+00:00  /lava-16882/1/../bin/lava-test-case   =


  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/6082d71e2c1a8259419b77b7
        failing since 1 day (last pass: next-20210420, first fail: next-202=
10422)

    2021-04-23 14:18:00.338000+00:00  <8>[   13.951357] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-23 14:18:00.339000+00:00  /lava-16882/1/../bin/lava-test-case
    2021-04-23 14:18:00.339000+00:00  <8>[   13.967576] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-23 14:18:00.339000+00:00  /lava-16882/1/../bin/lava-test-case
    2021-04-23 14:18:00.339000+00:00  <8>[   13.982951] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-probed RESULT=3Dpass>
    2021-04-23 14:18:00.340000+00:00  /lava-16882/1/../bin/lava-test-case   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2  | arm64 | lab-kontron     | clang-12 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6082d4278d433bb48f9b783d

  Results:     98 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.0-++20210304023004+4ed9f=
17e9390-1~exp1~20210304133725.54)
  Plain log:   https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/6082d4278d433bb48f9b7848
        failing since 1 day (last pass: next-20210420, first fail: next-202=
10422)

    2021-04-23 14:05:15.717000+00:00  <8>[   13.951760] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-23 14:05:15.717000+00:00  /lava-16875/1/../bin/lava-test-case
    2021-04-23 14:05:15.717000+00:00  <8>[   13.968684] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-23 14:05:15.717000+00:00  /lava-16875/1/../bin/lava-test-case
    2021-04-23 14:05:15.718000+00:00  <8>[   13.984590] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-probed RESULT=3Dpass>
    2021-04-23 14:05:15.718000+00:00  /lava-16875/1/../bin/lava-test-case   =


  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/6082d4278d433bb48f9b7848
        failing since 1 day (last pass: next-20210420, first fail: next-202=
10422)

    2021-04-23 14:05:15.717000+00:00  <8>[   13.951760] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-23 14:05:15.717000+00:00  /lava-16875/1/../bin/lava-test-case
    2021-04-23 14:05:15.717000+00:00  <8>[   13.968684] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-23 14:05:15.717000+00:00  /lava-16875/1/../bin/lava-test-case
    2021-04-23 14:05:15.718000+00:00  <8>[   13.984590] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-probed RESULT=3Dpass>
    2021-04-23 14:05:15.718000+00:00  /lava-16875/1/../bin/lava-test-case   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2  | arm64 | lab-kontron     | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6082d386b4086aba349b779a

  Results:     98 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/6082d386b4086aba349b77a5
        failing since 1 day (last pass: next-20210421, first fail: next-202=
10422)

    2021-04-23 14:02:38.192000+00:00  <8>[   13.879810] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-23 14:02:38.192000+00:00  /lava-16871/1/../bin/lava-test-case
    2021-04-23 14:02:38.192000+00:00  <8>[   13.896553] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-23 14:02:38.193000+00:00  /lava-16871/1/../bin/lava-test-case
    2021-04-23 14:02:38.193000+00:00  <8>[   13.913295] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-probed RESULT=3Dpass>
    2021-04-23 14:02:38.193000+00:00  /lava-16871/1/../bin/lava-test-case   =


  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/6082d386b4086aba349b77a5
        failing since 1 day (last pass: next-20210421, first fail: next-202=
10422)

    2021-04-23 14:02:38.192000+00:00  <8>[   13.879810] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-23 14:02:38.192000+00:00  /lava-16871/1/../bin/lava-test-case
    2021-04-23 14:02:38.192000+00:00  <8>[   13.896553] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-23 14:02:38.193000+00:00  /lava-16871/1/../bin/lava-test-case
    2021-04-23 14:02:38.193000+00:00  <8>[   13.913295] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-probed RESULT=3Dpass>
    2021-04-23 14:02:38.193000+00:00  /lava-16871/1/../bin/lava-test-case   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2  | arm64 | lab-kontron     | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6082d3d65366e331cb9b77ba

  Results:     98 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontron/baseline-kontron-sl=
28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontron/baseline-kontron-sl=
28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/6082d3d65366e331cb9b77c5
        failing since 1 day (last pass: next-20210421, first fail: next-202=
10422)

    2021-04-23 14:03:57.151000+00:00  <8>[   13.951112] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-23 14:03:57.151000+00:00  /lava-16872/1/../bin/lava-test-case
    2021-04-23 14:03:57.151000+00:00  <8>[   13.968362] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-23 14:03:57.151000+00:00  /lava-16872/1/../bin/lava-test-case
    2021-04-23 14:03:57.152000+00:00  <8>[   13.983898] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-probed RESULT=3Dpass>
    2021-04-23 14:03:57.152000+00:00  /lava-16872/1/../bin/lava-test-case   =


  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/6082d3d65366e331cb9b77c5
        failing since 1 day (last pass: next-20210421, first fail: next-202=
10422)

    2021-04-23 14:03:57.151000+00:00  <8>[   13.951112] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-23 14:03:57.151000+00:00  /lava-16872/1/../bin/lava-test-case
    2021-04-23 14:03:57.151000+00:00  <8>[   13.968362] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-23 14:03:57.151000+00:00  /lava-16872/1/../bin/lava-test-case
    2021-04-23 14:03:57.152000+00:00  <8>[   13.983898] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-probed RESULT=3Dpass>
    2021-04-23 14:03:57.152000+00:00  /lava-16872/1/../bin/lava-test-case   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2  | arm64 | lab-kontron     | gcc-8    | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/6082d6d0a3aa12ff199b77dc

  Results:     98 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/6082d6d0a3aa12ff199b77e7
        failing since 1 day (last pass: next-20210421, first fail: next-202=
10422)

    2021-04-23 14:16:24.356000+00:00  <8>[   13.951017] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-23 14:16:24.356000+00:00  /lava-16881/1/../bin/lava-test-case
    2021-04-23 14:16:24.357000+00:00  <8>[   13.967578] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-23 14:16:24.357000+00:00  /lava-16881/1/../bin/lava-test-case
    2021-04-23 14:16:24.357000+00:00  <8>[   13.983067] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-probed RESULT=3Dpass>
    2021-04-23 14:16:24.357000+00:00  /lava-16881/1/../bin/lava-test-case   =


  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/6082d6d0a3aa12ff199b77e7
        failing since 1 day (last pass: next-20210421, first fail: next-202=
10422)

    2021-04-23 14:16:24.356000+00:00  <8>[   13.951017] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-23 14:16:24.356000+00:00  /lava-16881/1/../bin/lava-test-case
    2021-04-23 14:16:24.357000+00:00  <8>[   13.967578] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-23 14:16:24.357000+00:00  /lava-16881/1/../bin/lava-test-case
    2021-04-23 14:16:24.357000+00:00  <8>[   13.983067] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-probed RESULT=3Dpass>
    2021-04-23 14:16:24.357000+00:00  /lava-16881/1/../bin/lava-test-case   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
meson-gxm-q200          | arm64 | lab-baylibre    | clang-10 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/6082d7e7b12960f8dd9b7797

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6082d7e7b12960f8dd9b7=
798
        new failure (last pass: next-20210408) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
mt8173-elm-hana         | arm64 | lab-collabora   | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6082d5b1a83ee4f5ca9b77b5

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-mt81=
73-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-mt81=
73-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/6082d5b2a83ee4f5ca9b77cd
        failing since 16 days (last pass: next-20210323, first fail: next-2=
0210406) =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/608=
2d5b2a83ee4f5ca9b77d3
        failing since 16 days (last pass: next-20210323, first fail: next-2=
0210406)

    2021-04-23 14:11:58.941000+00:00  <8>[   56.876513] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-baylibre    | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6082d18b5550f9d9449b77b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210423/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210423/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6082d18b5550f9d9449b7=
7b8
        failing since 156 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-broonie     | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6082d1745aef3f78959b77c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210423/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210423/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6082d1745aef3f78959b7=
7c6
        failing since 156 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-cip         | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6082d1825550f9d9449b779b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210423/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210423/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6082d1825550f9d9449b7=
79c
        failing since 156 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-collabora   | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6082d12185c1ff75539b77ad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210423/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210423/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6082d12185c1ff75539b7=
7ae
        failing since 156 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-linaro-lkft | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6082e28056d77b6c1e9b779d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210423/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210423/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6082e28056d77b6c1e9b7=
79e
        failing since 156 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
r8a77950-salvator-x     | arm64 | lab-baylibre    | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/6082d8b6d067dfef8a9b7808

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6082d8b6d067dfef8a9b7=
809
        new failure (last pass: next-20210422) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
r8a77960-ulcb           | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6082d4f47534290f909b77b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-r8a77960-=
ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-r8a77960-=
ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6082d4f47534290f909b7=
7b2
        new failure (last pass: next-20210419) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6082d79e6fc4ca5df89b7798

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6082d79e6fc4ca5df89b7=
799
        failing since 71 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6082d47e41ca6c12c79b77c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210423/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6082d47e41ca6c12c79b7=
7c4
        failing since 71 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =20
