Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D12A1552A61
	for <lists+linux-next@lfdr.de>; Tue, 21 Jun 2022 07:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344634AbiFUFCL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Jun 2022 01:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbiFUFCK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Jun 2022 01:02:10 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36F0820BEB
        for <linux-next@vger.kernel.org>; Mon, 20 Jun 2022 22:02:06 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d17so3064553pfq.9
        for <linux-next@vger.kernel.org>; Mon, 20 Jun 2022 22:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=EBVPutpo7cDCBy9cczt9p34gz3H3QF0t5mTLvU7K11Y=;
        b=yH7wqkYIFxA8jtD0rZiR/PSujH33L9Q5UP7YGGkAEs5qf8C1xlgcRcGfBWojMu24t1
         dHUvJzwV+sCgu9X3i+/SUMIaKMFzonY/TkY3HVT+iKJW5KdBYO10c9KzV9gustaN1V5U
         f9lua26HfjMKNhOkNpiK4nEsYNwF53vY+ONH9uhQpf4vbg/+fG5a3fUxkFr1FdesZZK5
         SI6p1wjqgLVWInI6EqiK32r7t1qb8l718aV+7aJVRHXa3SIzFABIuOYpjfmW6vt16xQG
         ADTWX+MzSajK2VGYBwWO4MWchTKHX3DYe7DRMAxkLmEHAhpKcp+zLobMwa4zDVEjloCM
         0QxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=EBVPutpo7cDCBy9cczt9p34gz3H3QF0t5mTLvU7K11Y=;
        b=XgfnnFj6B0bh+/G3vCe1PoiAYLrAN+X4Wa85W0by/P41jb1iDN7r4/2sIJbsEmlW7S
         KK/9QG58N+QFurxt8gBGzteNbGbgygwGU3idcHMiVib72bJEPyNPGR1bu6sqsY/A37xJ
         htB6D9PG4NT+IuPvK44uJP4+HU6iT0yoSmDP1E4LXxxDUGA45Dg2PRZ69mvKV706u1BP
         1eWCLC92ZRGclQAxnkWyH/KobkkCfJjxVdHc68I7Hn0m8kOxSxNiIYxbucX/GJaNX4d7
         Lo7Cm7gqHR03jKhR+Fe1R27iNHK9oYfxZhh7fCxyOlk2QpBwjT4cm7ir0ZQkIeQfNyIK
         CJGg==
X-Gm-Message-State: AJIora+XuaudLJmNIUK7r6otBu9IW+L1E5ibjt66VVjyjueJO/BikqbH
        RYhoBi9FQATIDl0+Fx9i27PjFD1LEr03b3Rh9XA=
X-Google-Smtp-Source: AGRyM1vItf7esN8TpLRT8VG2PD8F4DoExxKm7uZ9+LapJh4pEJjVCJy3pIGQaYt922pa4uTQd51xtg==
X-Received: by 2002:a63:d94b:0:b0:3fc:8486:2a6 with SMTP id e11-20020a63d94b000000b003fc848602a6mr24175698pgj.23.1655787724923;
        Mon, 20 Jun 2022 22:02:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b15-20020a63714f000000b0040ca587fe0fsm3653013pgn.63.2022.06.20.22.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 22:02:03 -0700 (PDT)
Message-ID: <62b150cb.1c69fb81.5d009.555d@mx.google.com>
Date:   Mon, 20 Jun 2022 22:02:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc3-342-g3bc66a8a3bd54
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 610 runs,
 60 regressions (v5.19-rc3-342-g3bc66a8a3bd54)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 610 runs, 60 regressions (v5.19-rc3-342-g3bc66=
a8a3bd54)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx8mn-ddr4-evk              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | tegra_d=
efconfig              | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+crypto             | 1          =

odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =

rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 2          =

rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 2          =

rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 2          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =

rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig                    | 1          =

rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+crypto             | 1          =

rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+ima                | 2          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+crypto             | 1          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+ima                | 1          =

sun50i-h6-pine-h64           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+crypto             | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+ima                | 1          =

sun8i-a33-olinuxino          | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =

sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =

sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.19-rc3-342-g3bc66a8a3bd54/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.19-rc3-342-g3bc66a8a3bd54
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3bc66a8a3bd54f5336b7494c4072fab4fc00d0ab =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b11dab38053b7f3ca39bf9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b11dab38053b7f3ca39=
bfa
        new failure (last pass: v5.19-rc2-431-gba1eaf33689d0) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62b1207c3daaee9459a39c2c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre=
/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre=
/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b1207c3daaee9459a39=
c2d
        new failure (last pass: v5.19-rc2-431-gba1eaf33689d0) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/62b11b8eb8ef82612ea39c06

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da=
850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da=
850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b11b8eb8ef826=
12ea39c0d
        failing since 148 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-06-21T01:13:48.156663  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-06-21T01:13:48.156912  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-06-21T01:13:48.159758  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-06-21T01:13:48.207407  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62b13a864dd90df2a9a39bd5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b13a864dd90df2a9a39=
bd6
        failing since 21 days (last pass: v5.16-rc4-241-g3e464b455df7, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b13b1236f1582872a39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/base=
line-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/base=
line-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b13b1236f1582872a39=
bd0
        failing since 21 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b13eaa00b6f6d42ba39be6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b13eaa00b6f6d42ba39=
be7
        failing since 21 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62b13f3674309a3d4ea39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-im=
x6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-im=
x6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b13f3674309a3d4ea39=
bce
        failing since 21 days (last pass: v5.16-rc4-241-g3e464b455df7, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62b14292e7167333c0a39be2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baselin=
e-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baselin=
e-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b14292e7167333c0a39=
be3
        failing since 21 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62b14742f701559582a39bd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutro=
nix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutro=
nix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b14742f701559582a39=
bd3
        failing since 21 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b12154d33f7d33d4a39bf5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-=
evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b12154d33f7d33d4a39=
bf6
        new failure (last pass: v5.19-rc2-431-gba1eaf33689d0) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b140558785474a16a39bd4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baselin=
e-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baselin=
e-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b140558785474a16a39=
bd5
        failing since 28 days (last pass: v5.18-rc7-251-g195d7f7a62c6, firs=
t fail: v5.18-155-gb82692513a38) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b141bd94997fc2bda39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b141bd94997fc2bda39=
bd0
        failing since 32 days (last pass: v5.18-rc7-165-g2424086909d29, fir=
st fail: v5.18-rc7-251-g195d7f7a62c6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62b144a1bd905d1d9aa39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetso=
n-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetso=
n-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b144a1bd905d1d9aa39=
bd0
        failing since 32 days (last pass: v5.18-rc7-165-g2424086909d29, fir=
st fail: v5.18-rc7-251-g195d7f7a62c6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b14787f08ec489dea39bde

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy=
/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy=
/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b14787f08ec489dea39=
bdf
        failing since 52 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fir=
st fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62b14d777f0747d3baa39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-j=
etson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-j=
etson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b14d777f0747d3baa39=
bce
        failing since 32 days (last pass: v5.18-rc7-165-g2424086909d29, fir=
st fail: v5.18-rc7-251-g195d7f7a62c6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | tegra_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/62b14a8b05e85fdb5ca39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-t=
k1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-t=
k1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b14a8b05e85fdb5ca39=
bd0
        failing since 15 days (last pass: v5.18-12139-gb5db4eaa8649, first =
fail: v5.18-14068-g9e633753407a5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62b1220db31e6e3950a39bee

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/62b=
1220db31e6e3950a39c01
        new failure (last pass: v5.19-rc2-431-gba1eaf33689d0)

    2022-06-21T01:42:16.896914  /lava-130195/1/../bin/lava-test-case
    2022-06-21T01:42:16.897311  <8>[   20.747251] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b12fb44480f99712a39bd1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b12fb44480f99712a39=
bd2
        new failure (last pass: v5.19-rc2-431-gba1eaf33689d0) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b12cc1bbfc2a65caa39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayl=
ibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayl=
ibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b12cc1bbfc2a65caa39=
bd0
        new failure (last pass: v5.19-rc2-431-gba1eaf33689d0) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62b1332aa7e322eeaea39bd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950=
-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950=
-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b1332aa7e322eeaea39=
bd9
        new failure (last pass: v5.19-rc1-331-g13bdc020d5006) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/62b11f133575d38c60a39be4

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock6=
4.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock6=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b11f133575d38=
c60a39beb
        new failure (last pass: v5.18-rc7-216-g98dca003a752b)
        2 lines

    2022-06-21T01:29:35.471825  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-06-21T01:29:35.475404  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-06-21T01:29:35.481044  [   69.063376] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-21T01:29:35.481348  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b11f133575d38=
c60a39bec
        new failure (last pass: v5.18-rc7-216-g98dca003a752b)
        12 lines

    2022-06-21T01:29:35.446736  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-06-21T01:29:35.447290  kern  :alert : Mem abort info:
    2022-06-21T01:29:35.447576  kern  :alert :   ESR =3D 0x0000000096000006
    2022-06-21T01:29:35.447881  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-06-21T01:29:35.448197  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-21T01:29:35.448451  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-21T01:29:35.448658  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-06-21T01:29:35.449021  kern  :alert : Data abort info:
    2022-06-21T01:29:35.449161  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-21T01:29:35.449554  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62b120cb1994d7b9f1a39bf8

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayl=
ibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayl=
ibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b120cb1994d7b=
9f1a39bff
        new failure (last pass: v5.18-rc7-216-g98dca003a752b)
        2 lines

    2022-06-21T01:36:52.302811  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-06-21T01:36:52.306339  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-06-21T01:36:52.310982  [   69.072297] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-21T01:36:52.311270  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b120cb1994d7b=
9f1a39c00
        new failure (last pass: v5.18-rc7-216-g98dca003a752b)
        12 lines

    2022-06-21T01:36:52.281529  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-06-21T01:36:52.282081  kern  :alert : Mem abort info:
    2022-06-21T01:36:52.282352  kern  :alert :   ESR =3D 0x0000000096000006
    2022-06-21T01:36:52.282702  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-06-21T01:36:52.282936  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-21T01:36:52.283090  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-21T01:36:52.283458  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-06-21T01:36:52.283965  kern  :alert : Data abort info:
    2022-06-21T01:36:52.284202  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-21T01:36:52.284641  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/62b1216d9d12f33c50a39bcd

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk332=
8-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk332=
8-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b1216d9d12f33=
c50a39bd4
        new failure (last pass: v5.18-rc7-251-g195d7f7a62c6)
        2 lines

    2022-06-21T01:39:34.743709  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-06-21T01:39:34.747288  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-06-21T01:39:34.754321  [   71.137478] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-21T01:39:34.754599  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b1216d9d12f33=
c50a39bd5
        new failure (last pass: v5.18-rc7-251-g195d7f7a62c6)
        12 lines

    2022-06-21T01:39:34.722883  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-06-21T01:39:34.723466  kern  :alert : Mem abort info:
    2022-06-21T01:39:34.723686  kern  :alert :   ESR =3D 0x0000000096000006
    2022-06-21T01:39:34.724101  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-06-21T01:39:34.724517  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-21T01:39:34.724719  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-21T01:39:34.725147  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-06-21T01:39:34.725485  kern  :alert : Data abort info:
    2022-06-21T01:39:34.725706  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-21T01:39:34.725972  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/62b12324af6e37d13ba39bff

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b12324af6e37d=
13ba39c06
        new failure (last pass: v5.18-rc7-216-g98dca003a752b)
        2 lines

    2022-06-21T01:46:54.411676  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-06-21T01:46:54.415242  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-06-21T01:46:54.421383  [   69.165344] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-21T01:46:54.421691  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b12324af6e37d=
13ba39c07
        new failure (last pass: v5.18-rc7-216-g98dca003a752b)
        12 lines

    2022-06-21T01:46:54.388104  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-06-21T01:46:54.388610  kern  :alert : Mem abort info:
    2022-06-21T01:46:54.388844  kern  :alert :   ESR =3D 0x0000000096000006
    2022-06-21T01:46:54.389123  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-06-21T01:46:54.389540  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-21T01:46:54.389734  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-21T01:46:54.389989  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-06-21T01:46:54.390511  kern  :alert : Data abort info:
    2022-06-21T01:46:54.390760  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-21T01:46:54.391197  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/62b11f183575d38c60a39c34

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62b11f183575d38c60a39c56
        failing since 112 days (last pass: v5.17-rc5-244-gd77a1b37f796, fir=
st fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-06-21T01:29:54.100358  /lava-6657500/1/../bin/lava-test-case
    2022-06-21T01:29:54.113485  <8>[   55.301523] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62b11f183575d38c60a39c79
        failing since 21 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-06-21T01:29:51.434684  <8>[   52.624630] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>
    2022-06-21T01:29:52.456165  /lava-6657500/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62b11f183575d38c60a39c7a
        failing since 21 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-06-21T01:29:51.421978  /lava-6657500/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62b11f183575d38c60a39c7b
        failing since 21 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-06-21T01:29:50.390108  /lava-6657500/1/../bin/lava-test-case
    2022-06-21T01:29:50.402453  <8>[   51.592246] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b11dfe7576a32b7da39bd7

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock=
-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock=
-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b11dfe7576a32=
b7da39bdf
        new failure (last pass: v5.19-rc2-431-gba1eaf33689d0)
        12 lines

    2022-06-21T01:24:56.805315  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-21T01:24:56.805750  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-06-21T01:24:56.806093  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000079ac9000
    2022-06-21T01:24:56.806429  kern  :alert : [0000000000000005] pgd=3D080=
0000079aca003, p4d=3D0800000079aca003, pud=3D0800000079acb003, pmd=3D000000=
0000000000
    2022-06-21T01:24:56.806765  <8>[   62.265693] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b11e1fc8859ac54da39bcd

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-coll=
abora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-coll=
abora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b11e1fc8859ac=
54da39bd5
        new failure (last pass: v5.19-rc2-431-gba1eaf33689d0)
        12 lines

    2022-06-21T01:25:28.824387  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-21T01:25:28.824488  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-06-21T01:25:28.824601  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000079b80000
    2022-06-21T01:25:28.824707  kern  :alert : [0000000000000005] pgd=3D080=
0000079b81003, p4d=3D0800000079b81003, pud=3D0800000079b82003, pmd=3D000000=
0000000000
    2022-06-21T01:25:28.824811  <8>[   61.733870] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-06-21T01:25:28.824915  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62b11e9fd88ee1ba1ba39bef

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-rk33=
99-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-rk33=
99-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b11e9fd88ee1b=
a1ba39bf7
        new failure (last pass: v5.19-rc2-431-gba1eaf33689d0)
        12 lines

    2022-06-21T01:27:53.347647  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-21T01:27:53.348237  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-06-21T01:27:53.348589  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000079938000
    2022-06-21T01:27:53.348939  kern  :alert : [0000000000000005] pgd=3D080=
000007993b003, p4d=3D080000007993b003, pud=3D080000007993c003, pmd=3D000000=
0000000000
    2022-06-21T01:27:53.349258  <8>[   62.250530] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-06-21T01:27:53.349565  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/62b11f24cb632f542ca39c4c

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-=
rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-=
rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b11f24cb632f5=
42ca39c53
        new failure (last pass: v5.19-rc1-331-g13bdc020d5006)
        2 lines

    2022-06-21T01:30:06.624830  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-06-21T01:30:06.625347  <8>[   57.985256] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-21T01:30:06.625704  + set +x
    2022-06-21T01:30:06.626033  <8>[   57.987663] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 6657515_1.5.2.4.1>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b11f24cb632f5=
42ca39c54
        new failure (last pass: v5.19-rc1-331-g13bdc020d5006)
        12 lines

    2022-06-21T01:30:06.583784  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-21T01:30:06.584224  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-06-21T01:30:06.584606  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000079bc1000
    2022-06-21T01:30:06.584941  kern  :alert : [0000000000000005] pgd=3D080=
0000079bc2003, p4d=3D0800000079bc2003, pud=3D0800000079bc3003, pmd=3D000000=
0000000000
    2022-06-21T01:30:06.585263  <8>[   57.963818] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-06-21T01:30:06.585574  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b11f727949934ab9a39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h5-li=
bretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h5-li=
bretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b11f727949934ab9a39=
bd0
        new failure (last pass: v5.19-rc2-431-gba1eaf33689d0) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62b121b62933fe4e4ba39bd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b121b62933fe4e4ba39=
bd3
        new failure (last pass: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b11ee52259554b1da39be0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-lib=
retech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-lib=
retech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b11ee52259554b1da39=
be1
        new failure (last pass: v5.19-rc2-431-gba1eaf33689d0) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62b11f494a5499f3c5a39be7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b11f494a5499f3c5a39=
be8
        new failure (last pass: v5.19-rc2-431-gba1eaf33689d0) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62b122760b3c046e96a39bfa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-=
orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-=
orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b122760b3c046e96a39=
bfb
        new failure (last pass: v5.19-rc1-331-g13bdc020d5006) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62b120b4db097361eda39bdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-sun50i-h=
6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-sun50i-h=
6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b120b4db097361eda39=
be0
        failing since 21 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b11edd6f2ae759cca39be6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-coll=
abora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-coll=
abora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b11edd6f2ae759cca39=
be7
        new failure (last pass: v5.19-rc2-431-gba1eaf33689d0) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62b11f49b9f4aba41fa39be8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b11f49b9f4aba41fa39=
be9
        new failure (last pass: v5.19-rc2-431-gba1eaf33689d0) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62b120356bcffba344a39bf6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b120356bcffba344a39=
bf7
        failing since 21 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a33-olinuxino          | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b11be6b47314a085a39c18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-clabbe/baseline-sun8i-a33-olinuxino.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-clabbe/baseline-sun8i-a33-olinuxino.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b11be6b47314a085a39=
c19
        new failure (last pass: v5.19-rc2-431-gba1eaf33689d0) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b11b9db8ef82612ea39cce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b11b9db8ef82612ea39=
ccf
        failing since 10 days (last pass: v5.18-14068-g9e633753407a5, first=
 fail: v5.19-rc1-331-g13bdc020d5006) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/62b1196d0b9a077e16a39bf4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t=
-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t=
-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b1196d0b9a077e16a39=
bf5
        new failure (last pass: v5.19-rc2-431-gba1eaf33689d0) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b131453331f2e12fa39bda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baselin=
e-sun8i-h2-plus-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baselin=
e-sun8i-h2-plus-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b131453331f2e12fa39=
bdb
        failing since 10 days (last pass: v5.19-rc1-144-g9b6181f62e678, fir=
st fail: v5.19-rc1-331-g13bdc020d5006) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b13311a7e322eeaea39bd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-baylibre/baseline-sun8i-h2-plus-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-baylibre/baseline-sun8i-h2-plus-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b13311a7e322eeaea39=
bd4
        new failure (last pass: v5.19-rc1-331-g13bdc020d5006) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62b135a6fc83b42655a39bea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-s=
un8i-h2-plus-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-s=
un8i-h2-plus-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b135a6fc83b42655a39=
beb
        failing since 3 days (last pass: v5.19-rc1-331-g13bdc020d5006, firs=
t fail: v5.19-rc2-431-gba1eaf33689d0) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/62b12c94097d69bcd6a39bdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2=
-plus-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2=
-plus-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b12c94097d69bcd6a39=
bdd
        new failure (last pass: v5.19-rc2-431-gba1eaf33689d0) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62b1502c6a718bdacba39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-s=
un8i-h2-plus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-s=
un8i-h2-plus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b1502c6a718bdacba39=
bce
        new failure (last pass: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b11eaed88ee1ba1ba39bfe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baselin=
e-sun8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baselin=
e-sun8i-h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b11eaed88ee1ba1ba39=
bff
        new failure (last pass: v5.19-rc1-331-g13bdc020d5006) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b11fff6bcffba344a39bd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-baylibre/baseline-sun8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-baylibre/baseline-sun8i-h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b11fff6bcffba344a39=
bd3
        new failure (last pass: v5.19-rc2-431-gba1eaf33689d0) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62b121b7d28dfaa892a39bdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-s=
un8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-s=
un8i-h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b121b7d28dfaa892a39=
be0
        new failure (last pass: v5.19-rc2-431-gba1eaf33689d0) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/62b11b38a144e57831a39bce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3=
-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3=
-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b11b38a144e57831a39=
bcf
        new failure (last pass: v5.19-rc2-431-gba1eaf33689d0) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b11becf7a870ef70a39bde

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b11becf7a870ef70a39=
bdf
        failing since 24 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-9954-g9e21d180a100) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b1250abba8c39870a39bda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc3-3=
42-g3bc66a8a3bd54/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b1250abba8c39870a39=
bdb
        failing since 10 days (last pass: v5.18-14068-g9e633753407a5, first=
 fail: v5.19-rc1-331-g13bdc020d5006) =

 =20
