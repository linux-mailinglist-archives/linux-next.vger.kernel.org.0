Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 738EF2D4799
	for <lists+linux-next@lfdr.de>; Wed,  9 Dec 2020 18:14:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730313AbgLIRMw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Dec 2020 12:12:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729835AbgLIRMw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Dec 2020 12:12:52 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91094C061793
        for <linux-next@vger.kernel.org>; Wed,  9 Dec 2020 09:12:11 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id d2so1429568pfq.5
        for <linux-next@vger.kernel.org>; Wed, 09 Dec 2020 09:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ciZqCQ1QUgdsg9mNzWz/I5i4qAYBD2OBsKkLEWxKgRk=;
        b=rFt2QMnt96guW6M6EpXYmnXvZ2ErAqaE8/By7Y7L+nOztFFhJuZeAHhVoKIAMdDYxs
         DYfDMVmy/g3zpYlwANbVZoy9fC1TtwyNgW6BIFZmo/FMt8hOAkeDsXkx23B4Zi8mdgHI
         Akng9WcceppMLX9R40ReBuNPj1FpK6k90J8XwyhHCyh6q8XBiQu1yt8gBYZxBjVKz797
         gdCC1RsiIjys5YN3AjeuZuNT61tU+gzsczQleFWPxZPUSzyG1Alm+HTcMKWQrQBdNPFn
         Fi5+bjyomK1d1pcO8CoL17YDqV+6dv15AoN+/f4k9o129FRBDnvgm37Sf1S6fP7bmhsj
         yuFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ciZqCQ1QUgdsg9mNzWz/I5i4qAYBD2OBsKkLEWxKgRk=;
        b=IO8wNWsk1pbjTF64yNO2IWhV1StpBCXxV/UstEQEo0GmLmKfe8FYkk7hQCprIjkUpf
         x/SZliTFpA0GWA2aAuQWCoK1Bpmvz9+hpR7v1c8Xo1nc1P5rOxBR4HNal8k2UCU1811y
         UKhSrDkoDknQURrWKKC5PpZu9/EXhg8ldrSOQxgQpQX1GE4b4kCmmrH4R2uZI1x+Z0ks
         U6qpCyDyiOAe6m3yGlG7FfNCDSWfoeoK3sGzDDBWomZiOgIXmxubzkAC+ENAIVPR1B52
         ix4QD7ShMAeRxc6Ngxe8utvL6aF8b3bd9QwBQZPiHqisB79mJhz55DU856qFT7js82u+
         yx7g==
X-Gm-Message-State: AOAM533NK+lsjj5451GAsrecMZcU0tuYo7bK9iLVewWIIK/vq06Cvsd9
        fcQo6Mwr5BsF8tQMQWBCKq1XSFwj83wzrQ==
X-Google-Smtp-Source: ABdhPJxOQCexmLDSv+gBJOZQ1TR/frVCq/WnJ1flxF4usKas5ixq32RF0+Rd1r/dGhVKQhDwYrdWyQ==
X-Received: by 2002:a63:4283:: with SMTP id p125mr2839869pga.26.1607533930018;
        Wed, 09 Dec 2020 09:12:10 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z20sm2598097pjq.16.2020.12.09.09.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 09:12:09 -0800 (PST)
Message-ID: <5fd10569.1c69fb81.7e0b3.4a95@mx.google.com>
Date:   Wed, 09 Dec 2020 09:12:09 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20201209
X-Kernelci-Report-Type: test
Subject: next/master baseline: 666 runs, 37 regressions (next-20201209)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 666 runs, 37 regressions (next-20201209)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | sama5_defc=
onfig              | 1          =

bcm2837-rpi-3-b-32           | arm   | lab-baylibre | gcc-8    | bcm2835_de=
fconfig            | 2          =

fsl-ls1088a-rdb              | arm64 | lab-nxp      | clang-10 | defconfig =
                   | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp      | clang-10 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp      | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp      | clang-11 | defconfig =
                   | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp      | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp      | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp      | gcc-8    | defconfig =
                   | 1          =

hifive-unleashed-a00         | riscv | lab-baylibre | gcc-8    | defconfig =
                   | 1          =

imx6q-sabresd                | arm   | lab-nxp      | gcc-8    | imx_v6_v7_=
defconfig          | 1          =

imx6q-var-dt6customboard     | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

imx8mp-evk                   | arm64 | lab-nxp      | clang-10 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-nxp      | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-nxp      | clang-11 | defconfig =
                   | 1          =

imx8mp-evk                   | arm64 | lab-nxp      | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-nxp      | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-nxp      | gcc-8    | defconfig =
                   | 1          =

meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre | clang-10 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

meson-gxm-q200               | arm64 | lab-baylibre | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 2          =

meson-gxm-q200               | arm64 | lab-baylibre | clang-11 | defconfig =
                   | 2          =

meson-gxm-q200               | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

meson-gxm-q200               | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 2          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre | gcc-8    | oxnas_v6_d=
efconfig           | 1          =

qemu_arm-versatilepb         | arm   | lab-baylibre | gcc-8    | versatile_=
defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-broonie  | gcc-8    | versatile_=
defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-cip      | gcc-8    | versatile_=
defconfig          | 1          =

sun50i-h6-pine-h64-model-b   | arm64 | lab-baylibre | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64-model-b   | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
201209/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20201209
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2f1d5c77f13fe64497c2e2601605f7d7ec4da9b1 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | sama5_defc=
onfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0cd5c62cffc486bc94cc2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0cd5c62cffc486bc94=
cc3
        failing since 21 days (last pass: next-20201106, first fail: next-2=
0201117) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
bcm2837-rpi-3-b-32           | arm   | lab-baylibre | gcc-8    | bcm2835_de=
fconfig            | 2          =


  Details:     https://kernelci.org/test/plan/id/5fd0cbfbfd19a09499c94cba

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fd0cbfbfd19a09=
499c94cbe
        new failure (last pass: next-20201208)
        4 lines

    2020-12-09 13:06:49.718000+00:00  kern  :alert : Unable to handle kerne=
l NULL pointer dereference at virtual address 00000000
    2020-12-09 13:06:49.719000+00:00  kern  :alert : pgd =3D 91eca6cf
    2020-12-09 13:06:49.720000+00:00  kern  :alert : [00000000] *pgd=3D0423=
0835, *pte=3D00000000, *ppte=3D00000000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fd0cbfbfd19a09=
499c94cbf
        new failure (last pass: next-20201208)
        42 lines

    2020-12-09 13:06:49.723000+00:00  kern  :emerg : Process udevd (pid: 10=
6, stack limit =3D 0x9b4675de)
    2020-12-09 13:06:49.724000+00:00  kern  :emerg : Stack: (0xc424ddb8 to =
0xc424e000)
    2020-12-09 13:06:49.761000+00:00  kern  :emerg : dda0:                 =
                                      00000026 c11290f4
    2020-12-09 13:06:49.762000+00:00  kern  :emerg : ddc0: c424ddec c424ddd=
0 c0279a88 c0279b10 c424de60 00000000 c4279540 00000000
    2020-12-09 13:06:49.762000+00:00  kern  :emerg : dde0: c424de5c c424ddf=
0 c0270398 c0279ac0 c424df50 00001000 00000000 c424de68
    2020-12-09 13:06:49.763000+00:00  kern  :emerg : de00: 00000000 c2d7519=
8 00000041 00000000 c4270360 00000000 c424de4c c424de28
    2020-12-09 13:06:49.764000+00:00  kern  :emerg : de20: c0253a9c c424de2=
4 c424de24 c5e45911 c416c000 c424df58 c0f04248 c424df18
    2020-12-09 13:06:49.804000+00:00  kern  :emerg : de40: 00000001 ffffff9=
c bedc7028 00000142 c424df14 c424de60 c0270acc c027005c
    2020-12-09 13:06:49.806000+00:00  kern  :emerg : de60: c22ab850 c2d7519=
8 507d57f0 0000000e c152101f c0253cec c14cf0d0 c1802088
    2020-12-09 13:06:49.806000+00:00  kern  :emerg : de80: c4270360 0000010=
9 00000002 0000004a 00000026 00000000 00000000 00000000 =

    ... (31 line(s) more)  =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp      | clang-10 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0d5d9f124f55d04c94cdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig/clang-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig/clang-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0d5d9f124f55d04c94=
cdc
        failing since 19 days (last pass: next-20201119, first fail: next-2=
0201120) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp      | clang-10 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0d94e8bc7a96276c94ccf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-fsl-ls1088=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-fsl-ls1088=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0d94e8bc7a96276c94=
cd0
        failing since 19 days (last pass: next-20201119, first fail: next-2=
0201120) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp      | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0cde8bd6f7adcf9c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201126115834+12c4c=
6cd770-1~exp1~20201126110448.134)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-fsl-ls1088=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-fsl-ls1088=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0cde8bd6f7adcf9c94=
cba
        failing since 19 days (last pass: next-20201119, first fail: next-2=
0201120) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp      | clang-11 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0d7a67fadb25d42c94cce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201126115834+12c4c=
6cd770-1~exp1~20201126110448.134)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig/clang-11/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig/clang-11/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0d7a67fadb25d42c94=
ccf
        failing since 19 days (last pass: next-20201119, first fail: next-2=
0201120) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp      | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0cc18d292c6195ec94cc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0cc18d292c6195ec94=
cca
        failing since 19 days (last pass: next-20201119, first fail: next-2=
0201120) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp      | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0d1850fc294dae4c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0d1850fc294dae4c94=
cba
        failing since 19 days (last pass: next-20201119, first fail: next-2=
0201120) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp      | gcc-8    | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0d393f1f34c572dc94cea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0d393f1f34c572dc94=
ceb
        failing since 19 days (last pass: next-20201119, first fail: next-2=
0201120) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre | gcc-8    | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0ce269c2fbd5560c94cdd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0ce269c2fbd5560c94=
cde
        new failure (last pass: next-20201208) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx6q-sabresd                | arm   | lab-nxp      | gcc-8    | imx_v6_v7_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0cdcea33f8a70e3c94cd9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0cdcea33f8a70e3c94=
cda
        failing since 44 days (last pass: next-20201023, first fail: next-2=
0201026) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx6q-var-dt6customboard     | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0d1b93a13224161c94cd9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0d1b93a13224161c94=
cda
        failing since 0 day (last pass: next-20201204, first fail: next-202=
01208) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx8mp-evk                   | arm64 | lab-nxp      | clang-10 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0d8e4ed2f1c4c3cc94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0d8e4ed2f1c4c3cc94=
cba
        failing since 0 day (last pass: next-20201207, first fail: next-202=
01208) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx8mp-evk                   | arm64 | lab-nxp      | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0cd7e319d2f81cfc94cbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201126115834+12c4c=
6cd770-1~exp1~20201126110448.134)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0cd7e319d2f81cfc94=
cbe
        new failure (last pass: next-20201208) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx8mp-evk                   | arm64 | lab-nxp      | clang-11 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0d6f3d68f3c3923c94cc7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201126115834+12c4c=
6cd770-1~exp1~20201126110448.134)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig/clang-11/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig/clang-11/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0d6f3d68f3c3923c94=
cc8
        failing since 0 day (last pass: next-20201207, first fail: next-202=
01208) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx8mp-evk                   | arm64 | lab-nxp      | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0cbc8650df83e72c94ccb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0cbc8650df83e72c94=
ccc
        new failure (last pass: next-20201208) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx8mp-evk                   | arm64 | lab-nxp      | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0d148943d63627bc94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0d148943d63627bc94=
cba
        new failure (last pass: next-20201208) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx8mp-evk                   | arm64 | lab-nxp      | gcc-8    | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0d38e87c20ba73ec94ce0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0d38e87c20ba73ec94=
ce1
        failing since 0 day (last pass: next-20201207, first fail: next-202=
01208) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre | clang-10 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0d4949971cd95d1c94cc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0d4949971cd95d1c94=
cc7
        new failure (last pass: next-20201208) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0ca52dc1ec1e977c94cd7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-gx=
l-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-gx=
l-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0ca52dc1ec1e977c94=
cd8
        new failure (last pass: next-20201208) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0caddb4e8cbf34ec94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0caddb4e8cbf34ec94=
cba
        new failure (last pass: next-20201208) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0cf8a71d8b60c97c94ccb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0cf8a71d8b60c97c94=
ccc
        new failure (last pass: next-20201208) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-gxm-q200               | arm64 | lab-baylibre | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/5fd0cbdb650df83e72c94ce8

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201126115834+12c4c=
6cd770-1~exp1~20201126110448.134)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fd0cbdb650df83=
e72c94cec
        new failure (last pass: next-20201208)
        20 lines

    2020-12-09 13:06:29.333000+00:00  kern  :alert :   ESR =3D 0x96000004
    2020-12-09 13:06:29.334000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-12-09 13:06:29.334000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-12-09 13:06:29.334000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-12-09 13:06:29.334000+00:00  kern  :alert : Data abort info:
    2020-12-09 13:06:29.334000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000004
    2020-12-09 13:06:29.334000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-12-09 13:06:29.334000+00:00  kern  :alert : [ffdf00000cde8cd8] add=
ress between user and kernel address ranges
    2020-12-09 13:06:29.376000+00:00  kern  :alert : Unable to handle kerne=
l paging request at virtual address a7b0615d7d3dab72
    2020-12-09 13:06:29.376000+00:00  kern  :alert : Mem abort info: =

    ... (8 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fd0cbdb650df83=
e72c94ced
        new failure (last pass: next-20201208)
        4 lines

    2020-12-09 13:06:29.430000+00:00  kern  :emerg : Code: a940200b f940082=
a d5384113 f81c83a1 (f9406d6c) =

    2020-12-09 13:06:29.430000+00:00  kern  :emerg : Internal error: Oops: =
96000004 [#2] PREEMPT SMP
    2020-12-09 13:06:29.430000+00:00  kern  :emerg : Code: cb0803e8 9100210=
8 eb0800e9 9a8880eb (38401402)    =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-gxm-q200               | arm64 | lab-baylibre | clang-11 | defconfig =
                   | 2          =


  Details:     https://kernelci.org/test/plan/id/5fd0d24678bad76f67c94cb9

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201126115834+12c4c=
6cd770-1~exp1~20201126110448.134)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fd0d24678bad76=
f67c94cbd
        new failure (last pass: next-20201208)
        11 lines

    2020-12-09 13:33:52.360000+00:00  kern  :alert :   ESR =3D 0x96000006
    2020-12-09 13:33:52.360000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-12-09 13:33:52.360000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-12-09 13:33:52.360000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-12-09 13:33:52.360000+00:00  kern  :alert : Data abort info:
    2020-12-09 13:33:52.361000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2020-12-09 13:33:52.361000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-12-09 13:33:52.361000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D0000000007bb4000
    2020-12-09 13:33:52.413000+00:00  kern  :alert : [000000000000001b] pgd=
=3D0000000007cac003, p4d=3D0000000007cac003, pud=3D0000000007cad003, pmd=3D=
0000000000000000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fd0d24678bad76=
f67c94cbe
        new failure (last pass: next-20201208)
        2 lines

    2020-12-09 13:33:52.414000+00:00  kern  :emerg : Code: f9403408 5280030=
9 f9400d08 9ba922a8 (f9400508)    =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-gxm-q200               | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0ca1cdc07fc9241c94d00

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-gx=
m-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-gx=
m-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0ca1cdc07fc9241c94=
d01
        new failure (last pass: next-20201208) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-gxm-q200               | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/5fd0cafff94cea0b75c94cba

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fd0cafff94cea0=
b75c94cbe
        new failure (last pass: next-20201208)
        22 lines

    2020-12-09 13:02:42.580000+00:00  kern  :alert : Unable to handle kerne=
l paging request at virtual address ffff00200326f7af
    2020-12-09 13:02:42.580000+00:00  kern  :alert : Mem abort info:
    2020-12-09 13:02:42.621000+00:00  kern  :alert : Mem abort info:
    2020-12-09 13:02:42.621000+00:00  kern  :alert :   ESR =3D 0x96000005
    2020-12-09 13:02:42.621000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-12-09 13:02:42.621000+00:00  kern  :alert :   ESR =3D 0x96000004
    2020-12-09 13:02:42.622000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-12-09 13:02:42.622000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-12-09 13:02:42.622000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-12-09 13:02:42.622000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D =
0 =

    ... (11 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fd0cafff94cea0=
b75c94cbf
        new failure (last pass: next-20201208)
        4 lines

    2020-12-09 13:02:42.706000+00:00  kern  :emerg : Code: 911c62b5 9107231=
8 d280001c f2fbd5ba (f9400660) =

    2020-12-09 13:02:42.706000+00:00  kern  :emerg : Internal error: Oops: =
96000005 [#2] PREEMPT SMP
    2020-12-09 13:02:42.706000+00:00  kern  :emerg : Code: 321e0001 1a80102=
0 350000a3 f9401261 (39423c23)    =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre | gcc-8    | oxnas_v6_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0cc691b87b9fb04c94cd5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm/=
oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-=
series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm/=
oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-=
series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0cc691b87b9fb04c94=
cd6
        new failure (last pass: next-20201208) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb         | arm   | lab-baylibre | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0cb0f89045fee20c94ce0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0cb0f89045fee20c94=
ce1
        failing since 21 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb         | arm   | lab-broonie  | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0cb476cde52c37fc94ccf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0cb476cde52c37fc94=
cd0
        failing since 21 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb         | arm   | lab-cip      | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0cb1d9bace6f224c94cd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0cb1d9bace6f224c94=
cd9
        failing since 21 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun50i-h6-pine-h64-model-b   | arm64 | lab-baylibre | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0cdf793e571d3c0c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201126115834+12c4c=
6cd770-1~exp1~20201126110448.134)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0cdf793e571d3c0c94=
cba
        failing since 28 days (last pass: next-20201110, first fail: next-2=
0201111) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun50i-h6-pine-h64-model-b   | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0cc75b1e214e88ec94ceb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0cc75b1e214e88ec94=
cec
        failing since 28 days (last pass: next-20201110, first fail: next-2=
0201111) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd0ce2a66ed68ddc7c94cc4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201209/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201209/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd0ce2a66ed68ddc7c94=
cc5
        new failure (last pass: next-20201208) =

 =20
