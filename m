Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62C2537A437
	for <lists+linux-next@lfdr.de>; Tue, 11 May 2021 12:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbhEKKEn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 May 2021 06:04:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbhEKKEn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 May 2021 06:04:43 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7CEEC061574
        for <linux-next@vger.kernel.org>; Tue, 11 May 2021 03:03:36 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id g24so11398699pji.4
        for <linux-next@vger.kernel.org>; Tue, 11 May 2021 03:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=FyS/QC4eGuuulgTcaanbqk7TAhLfgfhuB8rEOSsJCW8=;
        b=PqLJ79Hna2stEKcU2EWzL6vwL6QbdWyq85OuKCqAuhdHmrtO6pq7idIsABPATSRDoG
         ftKLtvIQfyFeUnt7sMQGUbjYa/yqRmFAagAlIQ++p/o4IrUmeviSgi/64AAV2kqkPQBn
         YO2Zj6V1BV2DmiFGxX5S3DnS047I3YrCJ3iEE4SAAI0FUVOTRno4eqoBxqBvh3pyxTey
         V9/XMrE6KWbe3fqSSxdei2GM2PG/KBhwi9DkdoIgve+U3qu49PhTj17oyLIE2owkC+9/
         dSdt4us0krHnh+gHYB2aJZtti1QdjGn3aTGmQPDN6/H4ApXDApdsWricR2/ghdukVSQi
         VGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=FyS/QC4eGuuulgTcaanbqk7TAhLfgfhuB8rEOSsJCW8=;
        b=oO/Xx6+I7NWzbr4k2CDE1lGSyq8LTT97umYSbnwkKliB8C6CLgvzvK4aPRz+KMFPnn
         6RjAZ358PWt6qfLnXmAwAYTpdX1Qtdlr198Krm1q7WP8EbTgoPxHh5wcbHd/A/gARzIN
         o34C1qeoUebpbL6m0LrPpaXmHItArEFqNoLqN7IftjfectoE3m1dRMNEupuy6+j8Mye5
         kzmvZEPlAFglQz4Zgn8Rmb0ycjheFywk83BgpNefSutIkF1DFjmBixRXYkNuCdiC1ftk
         7lWehqp7PHL8woEKl542aQXuGONAmulz/232SGCW/3PHKki83AN61DXV1y+dg9wVeWR4
         aGgw==
X-Gm-Message-State: AOAM533degLSKlAfCrqQkoIsT7aC+w6+k25My8egrvafYqCrjdSiQ60Y
        583q99SqDBk5rk8gGmWBre2H/yT9B02aQ2NG
X-Google-Smtp-Source: ABdhPJxqqI4A1g2D5l+fYRFMLsh/Lz0jw+6s7eo75JSApNTHCgbH7O7UaI0FA2QjpW7NZRzhUq8l6Q==
X-Received: by 2002:a17:902:9893:b029:ee:e8a8:688c with SMTP id s19-20020a1709029893b02900eee8a8688cmr29189447plp.84.1620727416113;
        Tue, 11 May 2021 03:03:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u1sm13404930pgh.80.2021.05.11.03.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 03:03:35 -0700 (PDT)
Message-ID: <609a5677.1c69fb81.e80e0.8e58@mx.google.com>
Date:   Tue, 11 May 2021 03:03:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.13-rc1-216-gaf09555f31c4b
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 331 runs,
 15 regressions (v5.13-rc1-216-gaf09555f31c4b)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 331 runs, 15 regressions (v5.13-rc1-216-gaf095=
55f31c4b)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora   | gcc-8    | bcm2835_defconf=
ig            | 1          =

bcm2836-rpi-2-b      | arm   | lab-collabora   | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 2          =

bcm2837-rpi-3-b-32   | arm   | lab-baylibre    | gcc-8    | bcm2835_defconf=
ig            | 1          =

imx6ul-pico-hobbit   | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
              | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

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
v5.13-rc1-216-gaf09555f31c4b/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.13-rc1-216-gaf09555f31c4b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      af09555f31c4b8008de193c596e49fd4f1a26e1a =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora   | gcc-8    | bcm2835_defconf=
ig            | 1          =


  Details:     https://kernelci.org/test/plan/id/609a29d86e4c36c19d6f552b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
16-gaf09555f31c4b/arm/bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm283=
6-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
16-gaf09555f31c4b/arm/bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm283=
6-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a29d86e4c36c19d6f5=
52c
        failing since 12 days (last pass: v5.12-121-g07bcd85dd158c, first f=
ail: v5.12-4702-ge27839dcc50b7) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora   | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/609a2c90d2206d54406f5488

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
16-gaf09555f31c4b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora=
/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
16-gaf09555f31c4b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora=
/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a2c90d2206d54406f5=
489
        failing since 95 days (last pass: v5.11-rc6-256-gf889022827dc, firs=
t fail: v5.11-rc6-298-g490f4659faae) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/609a2205464e73f2e36f548d

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
16-gaf09555f31c4b/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3=
-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
16-gaf09555f31c4b/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3=
-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/609a2205464e73f=
2e36f5491
        failing since 13 days (last pass: v5.12-121-g07bcd85dd158c, first f=
ail: v5.12-4702-ge27839dcc50b7)
        11 lines

    2021-05-11 06:19:30.108000+00:00  kern  :alert : Mem [   21.781394] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-05-11 06:19:30.109000+00:00  abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/609a2205464e73f=
2e36f5492
        failing since 13 days (last pass: v5.12-121-g07bcd85dd158c, first f=
ail: v5.12-4702-ge27839dcc50b7)
        2 lines

    2021-05-11 06:19:30.113000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-05-11 06:19:30.114000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-05-11 06:19:30.114000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-05-11 06:19:30.115000+00:00  kern  :alert : Data abort info:
    2021-05-11 06:19:30.115000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-05-11 06:19:30.151000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-05-11 06:19:30.153000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000[   21.820551] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-05-11 06:19:30.154000+00:00  0003a8d3000
    2021-05-11 06:19:30.155000+00:00  kern  :aler[   21.831342] <LAVA_SIGNA=
L_ENDRUN 0_dmesg 309651_1.5.2.4.1>
    2021-05-11 06:19:30.156000+00:00  t : [0000000000000050] pgd=3D08000000=
3a8d4003, p4d=3D080000003a8d4003, pud=3D080000003a8d5003, pmd=3D00000000000=
00000 =

    ... (1 line(s) more)  =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b-32   | arm   | lab-baylibre    | gcc-8    | bcm2835_defconf=
ig            | 1          =


  Details:     https://kernelci.org/test/plan/id/609a1facdf5cb0ee2f6f567f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
16-gaf09555f31c4b/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837=
-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
16-gaf09555f31c4b/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837=
-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a1facdf5cb0ee2f6f5=
680
        failing since 13 days (last pass: v5.12-121-g07bcd85dd158c, first f=
ail: v5.12-4702-ge27839dcc50b7) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6ul-pico-hobbit   | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609a210aa54a0635936f5473

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
16-gaf09555f31c4b/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-im=
x6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
16-gaf09555f31c4b/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-im=
x6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a210aa54a0635936f5=
474
        new failure (last pass: v5.13-rc1-87-g1da19d8b4599) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/609a241d7e0bb641046f5467

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
16-gaf09555f31c4b/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
16-gaf09555f31c4b/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a241d7e0bb641046f5=
468
        failing since 0 day (last pass: v5.12-14769-gf2b8e46e5bad, first fa=
il: v5.13-rc1-87-g1da19d8b4599) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/609a270ec7763eff186f546b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
16-gaf09555f31c4b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/b=
aseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
16-gaf09555f31c4b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/b=
aseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a270ec7763eff186f5=
46c
        new failure (last pass: v5.13-rc1-87-g1da19d8b4599) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
mt8173-elm-hana      | arm64 | lab-collabora   | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/609a251042622231be6f548c

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
16-gaf09555f31c4b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-colla=
bora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
16-gaf09555f31c4b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-colla=
bora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/609a251042622231be6f54a4
        failing since 13 days (last pass: v5.12-121-g07bcd85dd158c, first f=
ail: v5.12-4702-ge27839dcc50b7)

    2021-05-11 06:32:44.206000+00:00  <8>[   55.774778] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/609=
a251042622231be6f54aa
        failing since 13 days (last pass: v5.12-121-g07bcd85dd158c, first f=
ail: v5.12-4702-ge27839dcc50b7) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609a202b2e5108be576f5479

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
16-gaf09555f31c4b/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
16-gaf09555f31c4b/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a202b2e5108be576f5=
47a
        failing since 175 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609a20160a21a329876f5480

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
16-gaf09555f31c4b/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
16-gaf09555f31c4b/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a20160a21a329876f5=
481
        failing since 175 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609a204806b1492f9c6f549d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
16-gaf09555f31c4b/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
16-gaf09555f31c4b/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a204806b1492f9c6f5=
49e
        failing since 175 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609a1fc3517717466c6f5546

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
16-gaf09555f31c4b/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
16-gaf09555f31c4b/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a1fc3517717466c6f5=
547
        failing since 175 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609a1fd177a0494dc16f5467

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
16-gaf09555f31c4b/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc1-2=
16-gaf09555f31c4b/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a1fd177a0494dc16f5=
468
        failing since 175 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
