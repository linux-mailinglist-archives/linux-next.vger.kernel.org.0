Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E91C35FCD1
	for <lists+linux-next@lfdr.de>; Wed, 14 Apr 2021 22:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232859AbhDNUmm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Apr 2021 16:42:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230408AbhDNUmm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Apr 2021 16:42:42 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BADB5C061574
        for <linux-next@vger.kernel.org>; Wed, 14 Apr 2021 13:42:20 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id a12so14538678pfc.7
        for <linux-next@vger.kernel.org>; Wed, 14 Apr 2021 13:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9Pch6LdNkH/VHGxCLMMdtbv4IJcn2fwuCkh/syLxu/g=;
        b=uK5QeWjRvjz3VKh9UFmWiFGI7DpGMPBSmki3jYAr+hqf63uuG01kqC83dwW1qhnkiw
         qU0p3PJWlR3XHgTbnAMHq2GZQ/ppNePZc2bnesK9pTH/6Y+1KaoYof8JFCaNRI9McNlf
         5FjSQeRJ34L2clL14QNVzf/GSP3lfj8aQ+YdJV/uMMC1gMQWZG4cCl2AfcdeiaWQsgZi
         mKH/slWToNkN5saoIqWMby7MJKnId9TzPqy6awSVuajrhwgCzNS+ObzeY2Ld4W1LL8V9
         g6nvpXsuB0WA9AhknkZZ585LNlOrnBquJ2F1c2+Qphmuov/v9m9wkgy9j9vo8JCyZ73F
         Gl+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9Pch6LdNkH/VHGxCLMMdtbv4IJcn2fwuCkh/syLxu/g=;
        b=ZrkkD1bsM4K+lxPIKvXp7u2SPZ3z7YWIWKRJNbD34sO5QjRQ7+eESGJmViKwcK9MQ4
         UyTs9a3vjDdsTgcEzKp92rtCz6QZVdNZB9zEBC/TEjg4FLztL53wIm5yLQFSp5R3jeJP
         +/ZQsiTIo5DoR0YSvWSki6KF7TAwNmJgrZ25yQLWZLi/ACPW1FK34A88DkPKysqb4BTM
         okd8FtsGugJNVvI/cefpkqxpsvp0NhlOSo8LXrjvNRR9URWldOCEGqpAwLmcOFNZ/LOR
         g8WhCMeaAxU//JULe3R/D+f6XZiAuHQUzEvL8JE4/9QITMupW7dcdE1jFhtlM9KPoZnN
         nCDw==
X-Gm-Message-State: AOAM532/wNZoXNN4xtx76Vw7RQJsxTd13VIFafsb5hWGOQ7KcmYlNbW1
        LO1cHCZAiVUpy9XGy2CHOqaCwZpNGIvObRkT
X-Google-Smtp-Source: ABdhPJwA/C+RJsJHwFlel0QADgYgqi8ARIbYugEu95IEb68x35p+2osHFZ8sILmsyZ2lEZeMyWSYqw==
X-Received: by 2002:a63:cb42:: with SMTP id m2mr172610pgi.140.1618432939744;
        Wed, 14 Apr 2021 13:42:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g10sm246021pfj.137.2021.04.14.13.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 13:42:19 -0700 (PDT)
Message-ID: <607753ab.1c69fb81.1157a.10dd@mx.google.com>
Date:   Wed, 14 Apr 2021 13:42:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20210414
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 425 runs, 19 regressions (next-20210414)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 425 runs, 19 regressions (next-20210414)

Regressions Summary
-------------------

platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora   | gcc-8    | bcm2835_defc=
onfig            | 1          =

bcm2836-rpi-2-b         | arm   | lab-collabora   | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre    | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig   =
                 | 2          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =

bcm2837-rpi-3-b-32      | arm   | lab-baylibre    | gcc-8    | bcm2835_defc=
onfig            | 1          =

hifive-unleashed-a00    | riscv | lab-baylibre    | gcc-8    | defconfig   =
                 | 1          =

imx8mp-evk              | arm64 | lab-nxp         | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

imx8mp-evk              | arm64 | lab-nxp         | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

imx8mq-zii-ultra-zest   | arm64 | lab-pengutronix | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

mt8173-elm-hana         | arm64 | lab-collabora   | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =

mt8173-elm-hana         | arm64 | lab-collabora   | gcc-8    | defconfig   =
                 | 2          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210414/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210414
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1c8ce959b41a18b9657eaafd7a1215a8da67d3ab =



Test Regressions
---------------- =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora   | gcc-8    | bcm2835_defc=
onfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/607720fad767033909dac6b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210414/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210414/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607720fad767033909dac=
6b8
        failing since 16 days (last pass: next-20210324, first fail: next-2=
0210325) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora   | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60771e4f441a348d29dac6bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60771e4f441a348d29dac=
6be
        failing since 48 days (last pass: next-20210223, first fail: next-2=
0210224) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60771c80ba073177f5dac6db

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60771c80ba07317=
7f5dac6df
        failing since 8 days (last pass: next-20210323, first fail: next-20=
210406)
        11 lines

    2021-04-14 16:46:32.500000+00:00  kern  :alert : Mem abort info:
    2021-04-14 16:46:32.501000+00:00  kern  :aler[   21.559652] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1=
1>
    2021-04-14 16:46:32.502000+00:00  t :   ESR =3D 0x96000007
    2021-04-14 16:46:32.503000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-14 16:46:32.503000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-14 16:46:32.504000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D =
0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60771c80ba07317=
7f5dac6e0
        failing since 8 days (last pass: next-20210323, first fail: next-20=
210406)
        2 lines

    2021-04-14 16:46:32.508000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000007
    2021-04-14 16:46:32.509000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-14 16:46:32.553000+00:00  kern  :alert : user pgtable: 64k page=
s, 48-bit VAs, pgdp=3D0000000002811200
    2021-04-14 16:46:32.554000+00:00  kern  :alert : [0000000000000050] pgd=
=3D080000000c110003
    2021-04-14 16:46:32.555000+00:00  kern  :emerg : Internal error: Oops: =
96000[   21.606790] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfai=
l UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-14 16:46:32.555000+00:00  007 [#1] PREEMPT[   21.616763] <LAVA_=
SIGNAL_ENDRUN 0_dmesg 96530_1.5.2.4.1>
    2021-04-14 16:46:32.556000+00:00   SMP
    2021-04-14 16:46:32.557000+00:00  kern  :emerg : Code: b1006268 540000c=
0 b140051f 54000088 (39414268) =

    2021-04-14 16:46:32.557000+00:00  + set +x   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/6077154ea48183b945dac6de

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210414/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210414/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6077154ea48183b=
945dac6e2
        failing since 8 days (last pass: next-20210323, first fail: next-20=
210406)
        11 lines

    2021-04-14 16:15:53.727000+00:00  kern  :alert : Mem [   21.558089] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-14 16:15:53.727000+00:00  abort info:
    2021-04-14 16:15:53.728000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6077154ea48183b=
945dac6e3
        failing since 8 days (last pass: next-20210323, first fail: next-20=
210406)
        2 lines

    2021-04-14 16:15:53.732000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-14 16:15:53.733000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-14 16:15:53.733000+00:00  kern  :alert : Data abort info:
    2021-04-14 16:15:53.734000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-14 16:15:53.769000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-14 16:15:53.771000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000[   21.597136] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-14 16:15:53.771000+00:00  0003a88e000   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60771d7032bb2b7e29dac6b2

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60771d7032bb2b7=
e29dac6b6
        failing since 8 days (last pass: next-20210323, first fail: next-20=
210406)
        11 lines

    2021-04-14 16:50:35.020000+00:00  kern  :alert : Mem abort in[   21.568=
909] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D11>
    2021-04-14 16:50:35.021000+00:00  fo:
    2021-04-14 16:50:35.021000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60771d7032bb2b7=
e29dac6b7
        failing since 8 days (last pass: next-20210323, first fail: next-20=
210406)
        2 lines

    2021-04-14 16:50:35.025000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-14 16:50:35.026000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-14 16:50:35.026000+00:00  kern  :alert : Data abort info:
    2021-04-14 16:50:35.027000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-14 16:50:35.063000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-14 16:50:35.064000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D000000003a994000
    2021-04-14 16:50:35.065000+00:00  ker[   21.609619] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b-32      | arm   | lab-baylibre    | gcc-8    | bcm2835_defc=
onfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/607718e75ac1649658dac6b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210414/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210414/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607718e75ac1649658dac=
6b2
        failing since 20 days (last pass: next-20210324, first fail: next-2=
0210325) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
hifive-unleashed-a00    | riscv | lab-baylibre    | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/607718b88258484dbddac6bc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210414/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210414/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607718b88258484dbddac=
6bd
        failing since 22 days (last pass: next-20210312, first fail: next-2=
0210323) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx8mp-evk              | arm64 | lab-nxp         | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60771ee4b80dc9c59edac6b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60771ee4b80dc9c59edac=
6b3
        new failure (last pass: next-20210413) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx8mp-evk              | arm64 | lab-nxp         | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607721a11d02dc5114dac6c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607721a11d02dc5114dac=
6c3
        new failure (last pass: next-20210413) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx8mq-zii-ultra-zest   | arm64 | lab-pengutronix | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60771f768b4403eb13dac6c1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-pengutronix/baseline-imx8mq=
-zii-ultra-zest.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-pengutronix/baseline-imx8mq=
-zii-ultra-zest.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60771f768b4403eb13dac=
6c2
        new failure (last pass: next-20210302) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
mt8173-elm-hana         | arm64 | lab-collabora   | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60771c80741a9742bcdac6b1

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-mt81=
73-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-mt81=
73-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60771c80741a9742bcdac6c9
        failing since 8 days (last pass: next-20210323, first fail: next-20=
210406)

    2021-04-14 16:46:52.072000+00:00  /lava-3525343/1/../bin/lava-test-case
    2021-04-14 16:46:52.081000+00:00  <8>[   57.302974] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/607=
71c80741a9742bcdac6cf
        failing since 8 days (last pass: next-20210323, first fail: next-20=
210406)

    2021-04-14 16:46:53.183000+00:00  /lava-3525343/1/../bin/lava-test-case=
   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
mt8173-elm-hana         | arm64 | lab-collabora   | gcc-8    | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/607715a6630b504f30dac6b6

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210414/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210414/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/607715a6630b504f30dac6ce
        failing since 8 days (last pass: next-20210323, first fail: next-20=
210406) =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/607=
715a6630b504f30dac6d4
        failing since 8 days (last pass: next-20210323, first fail: next-20=
210406)

    2021-04-14 16:17:29.108000+00:00  <8>[   59.157568] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60771da2595f30f34bdac6b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60771da2595f30f34bdac=
6b8
        failing since 62 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607721121d5e66b5c9dac6b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607721121d5e66b5c9dac=
6b2
        failing since 62 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =20
