Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27EBC364EF5
	for <lists+linux-next@lfdr.de>; Tue, 20 Apr 2021 02:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbhDTAIl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Apr 2021 20:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbhDTAIl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Apr 2021 20:08:41 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE631C06174A
        for <linux-next@vger.kernel.org>; Mon, 19 Apr 2021 17:08:10 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id e9so1693865plj.2
        for <linux-next@vger.kernel.org>; Mon, 19 Apr 2021 17:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0kDpRJDmcEHYBHwKOuDaosQVqoJbkmuQiu6I747d6bU=;
        b=pY+yrlHPk5abf0gdO3fbAgXnz+M3mYg6zHTSLDtTmSrjiosCR2ML8434VN7xkwtMp7
         kcbQyhxK4cfW26wT9MPYa4U9BhaanvHqZADynZGAb8SRjOXLsFN4DgT/76/lEeaxQihl
         +A6H3gfuxfbqpHW2wj6WvPx5K8CTKHLDFngB1ic+Wsp9OzioobSQ+27HZAArmgdmdrNO
         MpAbXnbsNPUMyjmUJIlyrpiYLqMyDah4mD0TR/iBh3PMD7Nz3fNDiOfZhWPB1VzD6+C5
         Zp32dLo7mEnKoMq52e8qxrZydaE6tCQjAH8UUQBqoUvVl3eehqwDlWrKnpi0t8YA5Gla
         rnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0kDpRJDmcEHYBHwKOuDaosQVqoJbkmuQiu6I747d6bU=;
        b=HFEKXzELj3fNx7U05OD/T509wemuxooAbtlGq3L9S1dVBbPsW2yyW71x7d+4ssUmha
         dYM9FQ2NZRed3YBywjBZoZFI1B9HJvfdnzFSpmzRQe3Y25wrrqQZ8m9kIN+34hEdpGeZ
         3JoVQ/prqMxqvq0RfaC9DGjCIsNF8xxJsRGLSrSKBxYhfjIxByc56mewisVT8WY/Cimj
         mClD9os/xw9lXnJxQaOltfzb0mq6MTQtp8TZh2m3riKuX1Xbhy4yr22ic4qNUG3PVnI+
         DFnixgZtRQ9AREyreXUco5rN6BL/GrAg4LCoLswz/sO1IN2gOvgL2EiBPpY9bDUaROHt
         O1Vg==
X-Gm-Message-State: AOAM533n0iBd/si2aSdkkXR7WHiG8PABrmMSQt71nOAKDPXIazvpHftW
        3XpQ9JqSF07IOlB/pKfjAjle4NIXQiKW3pTy
X-Google-Smtp-Source: ABdhPJxzkDMP6maAjYeqkTu4OJLK/PrSfZxZ0Lc9tlxLN7wViS6CGNcsGdx58RZOR7CXJFBVJzK0SA==
X-Received: by 2002:a17:90b:2305:: with SMTP id mt5mr1847673pjb.198.1618877289756;
        Mon, 19 Apr 2021 17:08:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d7sm9377014pfv.197.2021.04.19.17.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 17:08:09 -0700 (PDT)
Message-ID: <607e1b69.1c69fb81.a470c.854c@mx.google.com>
Date:   Mon, 19 Apr 2021 17:08:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20210419
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 676 runs, 29 regressions (next-20210419)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 676 runs, 29 regressions (next-20210419)

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

bcm2837-rpi-3-b         | arm64 | lab-baylibre    | clang-10 | defconfig   =
                 | 2          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre    | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig   =
                 | 2          =

bcm2837-rpi-3-b-32      | arm   | lab-baylibre    | gcc-8    | bcm2835_defc=
onfig            | 1          =

hifive-unleashed-a00    | riscv | lab-baylibre    | gcc-8    | defconfig   =
                 | 1          =

hip07-d05               | arm64 | lab-collabora   | clang-10 | defconfig   =
                 | 1          =

hip07-d05               | arm64 | lab-collabora   | gcc-8    | defconfig   =
                 | 2          =

meson-gxl-s805x-p241    | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N...BIG_ENDIAN=3Dy | 1          =

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

r8a77960-ulcb           | arm64 | lab-baylibre    | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

r8a77960-ulcb           | arm64 | lab-baylibre    | gcc-8    | defconfig   =
                 | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210419/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210419
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      50b8b1d699ac313c0a07a3c185ffb23aecab8abb =



Test Regressions
---------------- =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora   | gcc-8    | bcm2835_defc=
onfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/607df4b0da8194a36d9b7795

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210419/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210419/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607df4b0da8194a36d9b7=
796
        failing since 21 days (last pass: next-20210324, first fail: next-2=
0210325) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora   | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/607def311f8e9b80bd9b77b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210419/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210419/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607def311f8e9b80bd9b7=
7b3
        failing since 54 days (last pass: next-20210223, first fail: next-2=
0210224) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | clang-10 | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/607de261ecc73945ea9b7795

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210419/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210419/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/607de261ecc7394=
5ea9b779b
        failing since 13 days (last pass: next-20210323, first fail: next-2=
0210406)
        11 lines

    2021-04-19 20:04:26.786000+00:00  kern  :alert : Unable to handle kerne=
l NULL pointer dereference at virtual address 0000000000000050
    2021-04-19 20:04:26.787000+00:00  kern  :alert : Mem [   21.610253] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-19 20:04:26.788000+00:00  abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/607de261ecc7394=
5ea9b779c
        failing since 13 days (last pass: next-20210323, first fail: next-2=
0210406)
        2 lines

    2021-04-19 20:04:26.792000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-19 20:04:26.793000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-19 20:04:26.794000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-19 20:04:26.794000+00:00  kern  :alert : Data abort info:
    2021-04-19 20:04:26.795000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-19 20:04:26.830000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-19 20:04:26.831000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pg[   21.649195] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg R=
ESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-19 20:04:26.832000+00:00  dp=3D000000000453d000
    2021-04-19 20:04:26.833000+00:00  ker[   21.660024] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 110894_1.5.2.4.1>   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/607de60ff7fdfd72bc9b77a3

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/607de60ff7fdfd7=
2bc9b77a9
        failing since 13 days (last pass: next-20210323, first fail: next-2=
0210406)
        11 lines

    2021-04-19 20:20:09.789000+00:00  kern  :alert : Mem abort info:
    2021-04-19 20:20:09.790000+00:00  kern  :alert :   ES[   21.826438] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-19 20:20:09.791000+00:00  R =3D 0x96000007
    2021-04-19 20:20:09.792000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-19 20:20:09.792000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-19 20:20:09.793000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D =
0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/607de60ff7fdfd7=
2bc9b77aa
        failing since 13 days (last pass: next-20210323, first fail: next-2=
0210406)
        2 lines

    2021-04-19 20:20:09.797000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000007
    2021-04-19 20:20:09.797000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-19 20:20:09.832000+00:00  kern  :alert : user pgtable: 64k page=
s, 48-bit VAs, pgdp=3D000000000c011e00
    2021-04-19 20:20:09.834000+00:00  kern  :alert : [0000000000000050] pgd=
=3D080000000d750003, p4d=3D080000000d750003, pud=3D080000000d750003, pmd=3D=
080000000d[   21.874776] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=
=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-19 20:20:09.834000+00:00  760003   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/607de121c4bdf6a6ef9b77c8

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210419/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210419/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/607de121c4bdf6a=
6ef9b77ce
        failing since 13 days (last pass: next-20210323, first fail: next-2=
0210406)
        11 lines

    2021-04-19 19:59:09.455000+00:00  kern  :alert : Mem [   21.767582] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-19 19:59:09.456000+00:00  abort info:
    2021-04-19 19:59:09.456000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/607de121c4bdf6a=
6ef9b77cf
        failing since 13 days (last pass: next-20210323, first fail: next-2=
0210406)
        2 lines

    2021-04-19 19:59:09.461000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-19 19:59:09.461000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-19 19:59:09.462000+00:00  kern  :alert : Data abort info:
    2021-04-19 19:59:09.462000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-19 19:59:09.496000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-19 19:59:09.498000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pg[   21.806861] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg R=
ESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-19 19:59:09.498000+00:00  dp=3D000000003a9c1000
    2021-04-19 19:59:09.499000+00:00  ker[   21.817247] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 110851_1.5.2.4.1>   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/607de2edf640bee35c9b77b1

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/607de2edf640bee=
35c9b77b7
        new failure (last pass: next-20210416)
        11 lines

    2021-04-19 20:06:49.245000+00:00  kern  :alert : Mem abort info:
    2021-04-19 20:06:49.246000+00:00  kern  :alert :   ES[   21.877861] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-19 20:06:49.247000+00:00  R =3D 0x96000007
    2021-04-19 20:06:49.247000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-19 20:06:49.248000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-19 20:06:49.249000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D =
0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/607de2edf640bee=
35c9b77b8
        new failure (last pass: next-20210416)
        2 lines

    2021-04-19 20:06:49.253000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000007
    2021-04-19 20:06:49.253000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-19 20:06:49.297000+00:00  kern  :alert : user pgtable: 64k page=
s, 48-bit VAs, pgdp=3D0000000002c90c00
    2021-04-19 20:06:49.298000+00:00  kern  :alert : [0000000000000050] pgd=
=3D080000000c9d0003, p4d=3D080000000c9d0003
    2021-04-19 20:06:49.299000+00:00  kern  :emerg : Internal erro[   21.92=
5386] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dline=
s MEASUREMENT=3D2>   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/607de582fcc883ca479b779b

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210419/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210419/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/607de582fcc883c=
a479b77a1
        new failure (last pass: next-20210416)
        11 lines

    2021-04-19 20:17:49.586000+00:00  kern  :alert : Mem abort in[   21.745=
472] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D11>
    2021-04-19 20:17:49.586000+00:00  fo:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/607de582fcc883c=
a479b77a2
        new failure (last pass: next-20210416)
        2 lines

    2021-04-19 20:17:49.589000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-19 20:17:49.589000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-19 20:17:49.590000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-19 20:17:49.590000+00:00  kern  :alert : Data abort info:
    2021-04-19 20:17:49.591000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-19 20:17:49.628000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-19 20:17:49.629000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D0000000000d10000
    2021-04-19 20:17:49.630000+00:00  kern  :aler[   21.786454] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-19 20:17:49.630000+00:00  t : [0000000000000050] p[   21.797378=
] <LAVA_SIGNAL_ENDRUN 0_dmesg 111023_1.5.2.4.1>   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b-32      | arm   | lab-baylibre    | gcc-8    | bcm2835_defc=
onfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/607de47e8aebc6b4679b77dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210419/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210419/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607de47e8aebc6b4679b7=
7de
        failing since 25 days (last pass: next-20210324, first fail: next-2=
0210325) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
hifive-unleashed-a00    | riscv | lab-baylibre    | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/607de2d09b966feefc9b779c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210419/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210419/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607de2d09b966feefc9b7=
79d
        failing since 27 days (last pass: next-20210312, first fail: next-2=
0210323) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
hip07-d05               | arm64 | lab-collabora   | clang-10 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/607de8fd8624e0ac219b77c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210419/arm6=
4/defconfig/clang-10/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210419/arm6=
4/defconfig/clang-10/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607de8fd8624e0ac219b7=
7ca
        failing since 6 days (last pass: next-20210409, first fail: next-20=
210412) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
hip07-d05               | arm64 | lab-collabora   | gcc-8    | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/607e10ce9deb1026fe9b77c8

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210419/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210419/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/607e10ce9deb102=
6fe9b77ce
        new failure (last pass: next-20210416)
        11 lines

    2021-04-19 23:22:37.174000+00:00  uest at virtual address fffffbfffe800=
0e4
    2021-04-19 23:22:37.174000+00:00  kern  :alert : Mem abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/607e10ce9deb102=
6fe9b77cf
        new failure (last pass: next-20210416)
        2 lines

    2021-04-19 23:22:37.185000+00:00  kern  :a[   22.399194] <LAVA_SIGNAL_T=
ESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-19 23:22:37.186000+00:00  lert :   EC =3D 0x25: DABT (current E=
L[   22.410284] <LAVA_SIGNAL_ENDRUN 0_dmesg 3548755_1.5.2.3.1>
    2021-04-19 23:22:37.186000+00:00  ), IL =3D 32 bits   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
meson-gxl-s805x-p241    | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607de0169c33b093f39b77d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210419/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210419/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607de0169c33b093f39b7=
7d6
        new failure (last pass: next-20210416) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
mt8173-elm-hana         | arm64 | lab-collabora   | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/607de6003dc259ed059b77a1

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-mt81=
73-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-mt81=
73-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/607de6003dc259ed059b77b5
        failing since 13 days (last pass: next-20210323, first fail: next-2=
0210406)

    2021-04-19 20:20:11.947000+00:00  <8>[   55.735744] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/607=
de6003dc259ed059b77bb
        failing since 13 days (last pass: next-20210323, first fail: next-2=
0210406)

    2021-04-19 20:20:13.061000+00:00  <8>[   56.849492] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-baylibre    | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/607ddf81e1fa79cc149b77d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210419/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210419/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607ddf81e1fa79cc149b7=
7d2
        failing since 152 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-broonie     | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/607ddf81b31656e84a9b77a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210419/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210419/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607ddf81b31656e84a9b7=
7a8
        failing since 152 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-cip         | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/607ddf812a77a92ff69b77f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210419/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210419/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607ddf812a77a92ff69b7=
7fa
        failing since 152 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-collabora   | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/607ddf809c25db04039b77c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210419/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210419/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607ddf809c25db04039b7=
7c9
        failing since 152 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-linaro-lkft | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/607deee4001f85d6fd9b77b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210419/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210419/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607deee4001f85d6fd9b7=
7b3
        failing since 152 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
r8a77960-ulcb           | arm64 | lab-baylibre    | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607de60ec9dba6409a9b77cc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607de60ec9dba6409a9b7=
7cd
        new failure (last pass: next-20210323) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
r8a77960-ulcb           | arm64 | lab-baylibre    | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/607de55ae56cc4b7459b7808

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210419/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210419/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607de55ae56cc4b7459b7=
809
        new failure (last pass: next-20210416) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607de763153a5dc94c9b77a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607de763153a5dc94c9b7=
7a7
        failing since 68 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607de3e0db690e2df69b77ad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607de3e0db690e2df69b7=
7ae
        failing since 68 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =20
