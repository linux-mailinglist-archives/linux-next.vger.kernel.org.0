Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFC1F366004
	for <lists+linux-next@lfdr.de>; Tue, 20 Apr 2021 21:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233541AbhDTTIn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Apr 2021 15:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233509AbhDTTIn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Apr 2021 15:08:43 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A16D5C06174A
        for <linux-next@vger.kernel.org>; Tue, 20 Apr 2021 12:08:11 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id e8-20020a17090a7288b029014e51f5a6baso15875838pjg.2
        for <linux-next@vger.kernel.org>; Tue, 20 Apr 2021 12:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0szSiZHxEoTIjVa9zee+A6P28gBvP7WsnzuHb+gNNtg=;
        b=p2WjH6sOWN45LcbOLsgVlETzy9TTeg9NKo2muiefn7URjD5/Vu37pEcOge/Lhw1gth
         ODtjnhTCEWTSEtThElQ/IEtu7CozhmgAiHy0xve2O55piN+Mr9tvWg5ReToXgkL5PeMu
         1hENfs+UTVM7TkZEIBM6bdLMimmmDgRpxkZf2RHGULI3+AnEdn3ewhVvdAflJHecdxz5
         HhUQYC3yZMYEt9ok2ZEY7SMAWRxqVGu2x+n+tXD+1kRUKdfsm7jTipWMiMUWhFKRlkgA
         DGRr0HwUHfJhpfhoiEc1CzZ0dc6levkHmG2dwB/GWa+jyc/jfolurY8wZqEV6SfG8O0H
         /bzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0szSiZHxEoTIjVa9zee+A6P28gBvP7WsnzuHb+gNNtg=;
        b=EHWdyTFSYJdwZziU0CItB6uKAw41+ZwuOaqRLztKws+QyTaL0KZUD/PWX8zLC/FxLC
         SdfFDgnflra7sOpFVZ1KLnr7MTh0lexA6NqVPkpE8M3erpvekI/2I6782JELWo6jjZb7
         82uC1EJNCbJXjlOymJmT3nI6c5xRN2dChKdPOtVJuYqmGgrtgcG/1vrUtCacJvjfhQ1o
         eVb766omd1XFonqqXv/PirPs8I3xm3mDkAGghLXrhQEkKYa8+UJaPO6+AJsFJJNw7fpp
         ep2+OG17ZP2rsHLK+pbkFugaB6mJDjG1WUlO60WII4AHwy+7XRGhAM7Q79XL179NHBmo
         8/TQ==
X-Gm-Message-State: AOAM533V9feifaxNRnVvLn/zpX4hGKa5Zxn2HXDAWmmtbGu7wAJoNuHx
        zi/iDUxbgXtA80voXlHOry4qDzH9Ub8SsssK
X-Google-Smtp-Source: ABdhPJxgZbu+IrESQTtXKuRgLWOB7X0BPF5ZLuoxPFuZwB4YnoOEZ9qR4XFx1JshKOcL5AnTVd3Cdg==
X-Received: by 2002:a17:90a:6407:: with SMTP id g7mr6338595pjj.206.1618945690383;
        Tue, 20 Apr 2021 12:08:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id oa9sm2900754pjb.44.2021.04.20.12.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 12:08:09 -0700 (PDT)
Message-ID: <607f2699.1c69fb81.69fc4.8b8a@mx.google.com>
Date:   Tue, 20 Apr 2021 12:08:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20210420
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 697 runs, 26 regressions (next-20210420)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 697 runs, 26 regressions (next-20210420)

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

bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig   =
                 | 2          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =

bcm2837-rpi-3-b-32      | arm   | lab-baylibre    | gcc-8    | bcm2835_defc=
onfig            | 1          =

hip07-d05               | arm64 | lab-collabora   | clang-10 | defconfig   =
                 | 1          =

hip07-d05               | arm64 | lab-collabora   | gcc-8    | defconfig   =
                 | 2          =

meson-gxbb-p200         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
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

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210420/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210420
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      593ef1658ecf61d3619885bdbbcfffa3d1417891 =



Test Regressions
---------------- =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora   | gcc-8    | bcm2835_defc=
onfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/607f0d4a54d1989e0d9b77a3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210420/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210420/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607f0d4a54d1989e0d9b7=
7a4
        failing since 22 days (last pass: next-20210324, first fail: next-2=
0210325) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora   | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/607f00eb8751e0fb629b77af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210420/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210420/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607f00eb8751e0fb629b7=
7b0
        failing since 54 days (last pass: next-20210223, first fail: next-2=
0210224) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | clang-10 | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/607eedf3a91c57bc1a9b779e

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210420/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210420/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/607eedf4a91c57b=
c1a9b77a4
        failing since 14 days (last pass: next-20210323, first fail: next-2=
0210406)
        11 lines

    2021-04-20 15:05:58.727000+00:00  kern  :alert : Mem [   21.795233] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-20 15:05:58.728000+00:00  abort info:
    2021-04-20 15:05:58.729000+00:00  kern  :alert :   ESR =3D 0x96000006
    2021-04-20 15:05:58.729000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-20 15:05:58.730000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0=
   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/607eedf4a91c57b=
c1a9b77a5
        failing since 14 days (last pass: next-20210323, first fail: next-2=
0210406)
        2 lines

    2021-04-20 15:05:58.734000+00:00  kern  :alert : Data abort info:
    2021-04-20 15:05:58.735000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-20 15:05:58.779000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-20 15:05:58.780000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pg[   21.833922] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg R=
ESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-20 15:05:58.781000+00:00  dp=3D00000000070f7000
    2021-04-20 15:05:58.782000+00:00  ker[   21.844383] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 115263_1.5.2.4.1>
    2021-04-20 15:05:58.783000+00:00  n  :alert : [0000000000000050] pgd=3D=
08000000070f8003   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/607eef055ba1fb418b9b77af

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210420/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210420/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/607eef055ba1fb4=
18b9b77b5
        failing since 14 days (last pass: next-20210323, first fail: next-2=
0210406)
        11 lines

    2021-04-20 15:10:39.884000+00:00  kern  :alert : Mem abort info:
    2021-04-20 15:10:39.893000+00:00  kern  :aler[   21.781604] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1=
1>
    2021-04-20 15:10:39.894000+00:00  t :   ESR =3D 0x96000007
    2021-04-20 15:10:39.895000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-20 15:10:39.895000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-20 15:10:39.896000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-20 15:10:39.897000+00:00  kern  :alert : Data abort info:
    2021-04-20 15:10:39.897000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000007
    2021-04-20 15:10:39.897000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0 =
  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/607eef055ba1fb4=
18b9b77b6
        failing since 14 days (last pass: next-20210323, first fail: next-2=
0210406)
        2 lines

    2021-04-20 15:10:39.939000+00:00  kern  :alert : [0000000000000050] pgd=
=3D080000000c530003, p4d=3D080000000c530003
    2021-04-20 15:10:39.940000+00:00  kern  :emerg : Inter[   21.829168] <L=
AVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUR=
EMENT=3D2>   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/607eea2c9cdc08e8aa9b77ab

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210420/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210420/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/607eea2c9cdc08e=
8aa9b77b1
        failing since 0 day (last pass: next-20210416, first fail: next-202=
10419)
        11 lines

    2021-04-20 14:50:00.243000+00:00  kern  :alert : Mem abort in[   21.675=
853] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D11>
    2021-04-20 14:50:00.244000+00:00  fo:
    2021-04-20 14:50:00.245000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/607eea2c9cdc08e=
8aa9b77b2
        failing since 0 day (last pass: next-20210416, first fail: next-202=
10419)
        2 lines

    2021-04-20 14:50:00.249000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-20 14:50:00.249000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-20 14:50:00.250000+00:00  kern  :alert : Data abort info:
    2021-04-20 14:50:00.250000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-20 14:50:00.285000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-20 14:50:00.287000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000000073d7[   21.715913] <LAVA_SIGNAL_TESTCASE TEST=
_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-20 14:50:00.287000+00:00  000
    2021-04-20 14:50:00.288000+00:00  kern  :alert : [000[   21.726350] <LA=
VA_SIGNAL_ENDRUN 0_dmesg 115142_1.5.2.4.1>   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/607eee7a944b1022779b7810

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210420/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210420/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/607eee7b944b102=
2779b7816
        failing since 0 day (last pass: next-20210416, first fail: next-202=
10419)
        11 lines

    2021-04-20 15:08:22.110000+00:00  kern  :alert : Mem abort info:
    2021-04-20 15:08:22.112000+00:00  kern  :aler[   21.832469] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1=
1>
    2021-04-20 15:08:22.113000+00:00  t :   ESR =3D 0x96000007
    2021-04-20 15:08:22.113000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-20 15:08:22.114000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-20 15:08:22.115000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-20 15:08:22.115000+00:00  kern  :alert : Data abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/607eee7b944b102=
2779b7817
        failing since 0 day (last pass: next-20210416, first fail: next-202=
10419)
        2 lines

    2021-04-20 15:08:22.119000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-20 15:08:22.153000+00:00  kern  :alert : user pgtable: 64k page=
s, 48-bit VAs, pgdp=3D0000000002a81200
    2021-04-20 15:08:22.155000+00:00  kern  :alert : [0000000000000050] pgd=
=3D080000000d9a0003, p4d=3D080000000d9a0003, pud=3D[   21.878517] <LAVA_SIG=
NAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D2>   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/607eefa51e14bdb66e9b7797

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210420/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210420/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/607eefa51e14bdb=
66e9b779d
        failing since 14 days (last pass: next-20210323, first fail: next-2=
0210406)
        11 lines

    2021-04-20 15:13:23.744000+00:00  kern  :alert : Mem [   21.771619] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-20 15:13:23.745000+00:00  abort info:
    2021-04-20 15:13:23.746000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/607eefa51e14bdb=
66e9b779e
        failing since 14 days (last pass: next-20210323, first fail: next-2=
0210406)
        2 lines

    2021-04-20 15:13:23.750000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-20 15:13:23.751000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-20 15:13:23.751000+00:00  kern  :alert : Data abort info:
    2021-04-20 15:13:23.752000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-20 15:13:23.786000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-20 15:13:23.788000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pg[   21.810567] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg R=
ESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-20 15:13:23.789000+00:00  dp=3D0000000000da7000
    2021-04-20 15:13:23.789000+00:00  ker[   21.820987] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 115354_1.5.2.4.1>   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b-32      | arm   | lab-baylibre    | gcc-8    | bcm2835_defc=
onfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/607eeb817365550d309b77cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210420/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210420/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607eeb817365550d309b7=
7d0
        failing since 26 days (last pass: next-20210324, first fail: next-2=
0210325) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
hip07-d05               | arm64 | lab-collabora   | clang-10 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/607f1ced79f828f2239b77c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210420/arm6=
4/defconfig/clang-10/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210420/arm6=
4/defconfig/clang-10/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607f1ced79f828f2239b7=
7c4
        failing since 7 days (last pass: next-20210409, first fail: next-20=
210412) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
hip07-d05               | arm64 | lab-collabora   | gcc-8    | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/607f0b84495407b7889b77a8

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210420/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210420/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/607f0b84495407b=
7889b77ae
        failing since 0 day (last pass: next-20210416, first fail: next-202=
10419)
        11 lines

    2021-04-20 17:12:15.426000+00:00  uest at virtual address fffffbfffe800=
0e4
    2021-04-20 17:12:15.426000+00:00  kern  :alert : Mem abort info:
    2021-04-20 17:12:15.426000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/607f0b84495407b=
7889b77af
        failing since 0 day (last pass: next-20210416, first fail: next-202=
10419)
        2 lines

    2021-04-20 17:12:15.444000+00:00    :alert :   EC =3D 0x25: DABT (curre=
n[   22.456057] <LAVA_SIGNAL_ENDRUN 0_dmesg 3554617_1.5.2.3.1>
    2021-04-20 17:12:15.444000+00:00  t EL), IL =3D 32 bits   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
meson-gxbb-p200         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607ef4039d6effc3299b779f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210420/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210420/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607ef4039d6effc3299b7=
7a0
        new failure (last pass: next-20210419) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
mt8173-elm-hana         | arm64 | lab-collabora   | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/607eeef9d76a3f577b9b77a2

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210420/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-mt81=
73-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210420/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-mt81=
73-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/607eeef9d76a3f577b9b77b6
        failing since 14 days (last pass: next-20210323, first fail: next-2=
0210406)

    2021-04-20 15:10:38.985000+00:00  <8>[   55.814034] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/607=
eeef9d76a3f577b9b77bc
        failing since 14 days (last pass: next-20210323, first fail: next-2=
0210406) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-baylibre    | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/607ee643b61ad5f8c59b7795

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210420/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210420/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607ee643b61ad5f8c59b7=
796
        failing since 153 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-broonie     | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/607ee6411a557c70769b7799

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210420/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210420/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607ee6411a557c70769b7=
79a
        failing since 153 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-cip         | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/607ee675b61ad5f8c59b77bf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210420/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210420/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607ee675b61ad5f8c59b7=
7c0
        failing since 153 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-collabora   | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/607ee5ee6a37fdf7709b779d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210420/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210420/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607ee5ee6a37fdf7709b7=
79e
        failing since 153 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-linaro-lkft | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/607ee5f550895615689b781e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210420/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210420/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607ee5f550895615689b7=
81f
        failing since 153 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607ef09e710bb9869f9b7796

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210420/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210420/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607ef09e710bb9869f9b7=
797
        failing since 68 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/607eef36126343968f9b77b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210420/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210420/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607eef36126343968f9b7=
7b5
        failing since 68 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =20
