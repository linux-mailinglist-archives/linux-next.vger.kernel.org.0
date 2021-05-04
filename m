Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25F84372B32
	for <lists+linux-next@lfdr.de>; Tue,  4 May 2021 15:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbhEDNkJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 May 2021 09:40:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbhEDNkI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 May 2021 09:40:08 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC18C061574
        for <linux-next@vger.kernel.org>; Tue,  4 May 2021 06:39:13 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id k19so4468552pfu.5
        for <linux-next@vger.kernel.org>; Tue, 04 May 2021 06:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=cUvAfRFbqJqVJlQgu2TVsAY2zDD/jtqqop049sJGLQ4=;
        b=pkRgz2MFeB69/kA85RNo9EMMryqOv4Kx3ZaDbqZWiciOAtZmA13TSWxX+jQovyJyoZ
         SN/Uzgt1eaL8FLZivq0nhkuO8OjlJB8icYCkRkyjPJBrZClQTSZwiezwXUONVLICkBs/
         YnsGCSdg4p39IzE09sRtoFUZCpdGtsBcnEynl6Cad28xMDZdgRZkefdVjYQQF2KIU/Va
         p+39q8C2zMLRcwc6pvU/72dYcgHWCxvP9VrHKsdU8sFyS2qsCPcbI6an/GmD79Wto+0P
         /lS8w259TsFawEZmskq8tumBb/In1acJjAF4OE560wptBUAGvEXTtYTm7MMLL/RgOZqa
         oS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=cUvAfRFbqJqVJlQgu2TVsAY2zDD/jtqqop049sJGLQ4=;
        b=AtEGyk4POCwuRqyp0QOEuhe4fJWqSoaPb+rRN4BmM3M2AVJcjmfMXsUAuzQ+XTkukM
         rRLo09u16DSybw2gDyv6HW4vXX7XjWuHH0PjnE+negklqMx0tGJ/QbszWHXUIRCbYAWT
         oDEyChKoroeW6GvE0vZTia3vw3hbOxol2PTUUNVGXx4jHd1Ytf7fmJQ1I4F5WDrHB/GN
         Z+tujMyJDIPgOKKe1NCpv7xj46QJZfHsRP6yIzfQD+Rwa15ncXkxEVPUPWNrcLBQdu00
         WPEWyxwhnIthQgj8nwKy9JlhzY7KH2CBGwXUB6VHBGs+CK05jRtRbThji+Wv/ggSSRIt
         xRTw==
X-Gm-Message-State: AOAM531Dp28EGDb5hkW9E1SI2c7bp0vVYN9fXd/JzNsnLYp8kh+upr6i
        1EhPmZDjqXnQhalqtJK99ugC0RUmQsvzp5lW
X-Google-Smtp-Source: ABdhPJwQa6EEZcV6LFz26BL0ftXhCacDl+R+xUCNJIckjrQHJUymIZ2CSSzBupzthOitNcY/b6yrRA==
X-Received: by 2002:a62:3246:0:b029:224:6c6f:b3f2 with SMTP id y67-20020a6232460000b02902246c6fb3f2mr23527004pfy.68.1620135552549;
        Tue, 04 May 2021 06:39:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 206sm3453143pga.44.2021.05.04.06.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 06:39:12 -0700 (PDT)
Message-ID: <60914e80.1c69fb81.affb3.6804@mx.google.com>
Date:   Tue, 04 May 2021 06:39:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20210504
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 450 runs, 18 regressions (next-20210504)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 450 runs, 18 regressions (next-20210504)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2837-rpi-3-b              | arm64 | lab-baylibre    | clang-10 | defconf=
ig                    | 2          =

bcm2837-rpi-3-b              | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

bcm2837-rpi-3-b              | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 2          =

hifive-unleashed-a00         | riscv | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-8    | imx_v6_=
v7_defconfig          | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | clang-10 | defconf=
ig                    | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | clang-12 | defconf=
ig                    | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | clang-12 | defconf=
ig                    | 1          =

qemu_arm-versatilepb         | arm   | lab-baylibre    | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-broonie     | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-cip         | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-linaro-lkft | gcc-8    | versati=
le_defconfig          | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210504/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210504
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9a9aa07ae18be3b77ba132a6eff3a92c9b83e016 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2837-rpi-3-b              | arm64 | lab-baylibre    | clang-10 | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/60910cb23b4cc1725b843f35

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210504/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210504/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60910cb23b4cc17=
25b843f39
        failing since 27 days (last pass: next-20210323, first fail: next-2=
0210406)
        11 lines

    2021-05-04 08:58:03.017000+00:00  kern  :alert : Mem [   21.749851] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-05-04 08:58:03.018000+00:00  abort info:
    2021-05-04 08:58:03.018000+00:00  kern  :alert :   ESR =3D 0x96000006
    2021-05-04 08:58:03.019000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-05-04 08:58:03.020000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-05-04 08:58:03.020000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-05-04 08:58:03.021000+00:00  kern  :alert : Data abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60910cb23b4cc17=
25b843f3a
        failing since 27 days (last pass: next-20210323, first fail: next-2=
0210406)
        2 lines

    2021-05-04 08:58:03.060000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-05-04 08:58:03.061000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit[   21.788274] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3D=
fail UNITS=3Dlines MEASUREMENT=3D2>
    2021-05-04 08:58:03.061000+00:00   VAs, pgdp=3D000000000482c[   21.7989=
91] <LAVA_SIGNAL_ENDRUN 0_dmesg 185248_1.5.2.4.1>
    2021-05-04 08:58:03.062000+00:00  000
    2021-05-04 08:58:03.063000+00:00  kern  :alert : [0000000000000050] pgd=
=3D080000000482f003, p4d=3D080000000482f003, pud=3D0800000007203003, pmd=3D=
0000000000000000
    2021-05-04 08:58:03.063000+00:00  kern  :emerg : Internal error: Oops: =
96000006 [#1] PREEMPT SMP   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2837-rpi-3-b              | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60910afa67247def8a843f29

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210504/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210504/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60910afa67247de=
f8a843f2d
        failing since 27 days (last pass: next-20210323, first fail: next-2=
0210406)
        11 lines

    2021-05-04 08:50:43.853000+00:00  kern  :alert : Mem [   21.723401] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-05-04 08:50:43.854000+00:00  abort info:
    2021-05-04 08:50:43.854000+00:00  kern  :alert :   ESR =3D 0x96000006
    2021-05-04 08:50:43.855000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-05-04 08:50:43.855000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-05-04 08:50:43.856000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-05-04 08:50:43.856000+00:00  kern  :alert : Data abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60910afa67247de=
f8a843f2e
        failing since 27 days (last pass: next-20210323, first fail: next-2=
0210406)
        2 lines

    2021-05-04 08:50:43.896000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-05-04 08:50:43.896000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pg[   21.762306] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg R=
ESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-05-04 08:50:43.897000+00:00  dp=3D0000000006fb4000
    2021-05-04 08:50:43.898000+00:00  ker[   21.772812] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 185082_1.5.2.4.1>
    2021-05-04 08:50:43.898000+00:00  n  :alert : [0000000000000050] pgd=3D=
0800000006f57003, p4d=3D0800000006f57003, pud=3D080000003a5a1003
    2021-05-04 08:50:43.898000+00:00  kern  :emerg : Internal error: Oops: =
96000006 [#1] PREEMPT SMP   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2837-rpi-3-b              | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/60910c26b6233ad3b2843f1e

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210504/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210504/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60910c26b6233ad=
3b2843f22
        failing since 14 days (last pass: next-20210416, first fail: next-2=
0210419)
        11 lines

    2021-05-04 08:55:44.228000+00:00  kern  :alert : Mem [   21.723077] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-05-04 08:55:44.229000+00:00  abort info:
    2021-05-04 08:55:44.230000+00:00  kern  :alert :   ESR =3D 0x96000006
    2021-05-04 08:55:44.230000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-05-04 08:55:44.231000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-05-04 08:55:44.231000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-05-04 08:55:44.232000+00:00  kern  :alert : Data abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60910c26b6233ad=
3b2843f23
        failing since 14 days (last pass: next-20210416, first fail: next-2=
0210419)
        2 lines

    2021-05-04 08:55:44.271000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-05-04 08:55:44.272000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pg[   21.761987] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg R=
ESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-05-04 08:55:44.273000+00:00  dp=3D000000003a454000
    2021-05-04 08:55:44.273000+00:00  ker[   21.772400] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 185203_1.5.2.4.1>
    2021-05-04 08:55:44.274000+00:00  n  :alert : [0000000000000050] pgd=3D=
080000003a455003, p4d=3D080000003a455003, pud=3D080000000505c003, pmd=3D000=
0000000000000
    2021-05-04 08:55:44.274000+00:00  kern  :emerg : Internal error: Oops: =
96000006 [#1] PREEMPT SMP   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/609109d93b7af628f6843f1a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210504/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210504/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609109da3b7af628f6843=
f1b
        failing since 4 days (last pass: next-20210429, first fail: next-20=
210430) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-8    | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60912ac2ce9b4fdd43843f7c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210504/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210504/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60912ac2ce9b4fdd43843=
f7d
        new failure (last pass: next-20210503) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6091114e1b42b4887a843f1a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210504/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210504/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6091114e1b42b4887a843=
f1b
        new failure (last pass: next-20210430) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/609113d080cdc82dc2843f32

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210430092629+0cbbf=
06b6256-1~exp1~20210430073336.82)
  Plain log:   https://storage.kernelci.org//next/master/next-20210504/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210504/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609113d080cdc82dc2843=
f33
        failing since 4 days (last pass: next-20210429, first fail: next-20=
210430) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6091159b32a8e0e157843f1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210504/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210504/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6091159b32a8e0e157843=
f1c
        new failure (last pass: next-20210430) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60911c998aec882bee843f19

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210430092629+0cbbf=
06b6256-1~exp1~20210430073336.82)
  Plain log:   https://storage.kernelci.org//next/master/next-20210504/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210504/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60911c998aec882bee843=
f1a
        new failure (last pass: next-20210430) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-baylibre    | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60910bf3284f1ff109843f24

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210504/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210504/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60910bf3284f1ff109843=
f25
        failing since 167 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-broonie     | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60910c23b6233ad3b2843f18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210504/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210504/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60910c23b6233ad3b2843=
f19
        failing since 167 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-cip         | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60910c061a9535f2e4843f1a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210504/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210504/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60910c061a9535f2e4843=
f1b
        failing since 167 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-linaro-lkft | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60910bb7bc735f098e843f17

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210504/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210504/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60910bb7bc735f098e843=
f18
        failing since 167 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60910d230646ea6c58843f23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210504/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210504/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60910d230646ea6c58843=
f24
        new failure (last pass: next-20210503) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/609112ab19b9ccbfdf843f1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210504/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210504/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609112ab19b9ccbfdf843=
f1c
        failing since 82 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =20
