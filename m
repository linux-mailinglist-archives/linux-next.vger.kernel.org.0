Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA5D368342
	for <lists+linux-next@lfdr.de>; Thu, 22 Apr 2021 17:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236502AbhDVP0E (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Apr 2021 11:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236459AbhDVP0E (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Apr 2021 11:26:04 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 684DAC06174A
        for <linux-next@vger.kernel.org>; Thu, 22 Apr 2021 08:25:28 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id w10so33091655pgh.5
        for <linux-next@vger.kernel.org>; Thu, 22 Apr 2021 08:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=95ZKafF+AZ/LPduttuRCdx8V4piqFc6G0Yw00NsIEAM=;
        b=MB0EvGRd53+FFE9FdPjozfYE1OnAz3mpxOu7CJKX+qW2vKZ/y8349liauGX6vHYhNH
         pyJiMztV8UBjyFr53XHmmIS9Xf5Zhjf6hxAUWgVhyUQ3jlseytun9Uh7rtVfsxpHNNT1
         itFVGQ2JTaUPX39PUbZL+dpPxMhJiutbOadA9lBCO3KNHG6Rja2kSWYd7mDb5O2flqxy
         T6FBGdbzvmX7MgS1u604OCoOeWGuKy66ZWJ0aPwpV9j4SZJnkVPlPdUm8R8F5Pzs5R+N
         E3P1Bq87iqUKkc6tXi6GV9/h5bXyIsuq2uqVWZ5sRhIFC1LfK4ey1ov9Ilt8Q4E5rg9S
         Bs2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=95ZKafF+AZ/LPduttuRCdx8V4piqFc6G0Yw00NsIEAM=;
        b=I+7jEegWuCoVEexjPeFWRNn4EM+Yjssj/kIf3CUa7pP63SPG5XqS1i/ieWpbZn/CrR
         MaVT95T8j4/qRm1HhDnboa3bSQHgtdvBoxa69QZzrPZPMXYZeCEUi94fGlY6791uqJ0M
         ss5U54yZp3tq5vmgKrisBLjtiRCE6Fko4mCHbN46Y5pQvAEPPglamIXQIAgW3ms14TLk
         JlhuABlW/E3RHzi3m81WndsgTjfIoPiOc31fGXQQT5tSx33svQ7XTLyTR9KE+HGi/nCp
         QBIO5LCfP4crGyn9fch5ZDzclurUFJe/3dS+nnDybx2YBSijCTjG9eVaGHz2FBWUQRmu
         Traw==
X-Gm-Message-State: AOAM533P2pIn0OKxLFYxsQd/uERkCIKuqVrbwbzB174DmebhljRB6LTR
        XFNQs1aqzkf3D68bkfcPgJ+wqre6G2LIYwyGouc=
X-Google-Smtp-Source: ABdhPJwYWHCoCwMT/AJ3ZqWn4DKFT4MszI4hXJX2ObhEKTT6LAMPSOYB5MkFeehVCh0Kxc3T8gYTGA==
X-Received: by 2002:a65:538d:: with SMTP id x13mr4180196pgq.108.1619105127045;
        Thu, 22 Apr 2021 08:25:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q6sm2397550pfs.33.2021.04.22.08.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 08:25:26 -0700 (PDT)
Message-ID: <60819566.1c69fb81.db404.6e00@mx.google.com>
Date:   Thu, 22 Apr 2021 08:25:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20210422
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 681 runs, 37 regressions (next-20210422)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 681 runs, 37 regressions (next-20210422)

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
N..._64K_PAGES=3Dy | 2          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig   =
                 | 2          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =

bcm2837-rpi-3-b-32      | arm   | lab-baylibre    | gcc-8    | bcm2835_defc=
onfig            | 1          =

beaglebone-black        | arm   | lab-cip         | clang-12 | multi_v7_def=
config           | 1          =

kontron-sl28-var3-ads2  | arm64 | lab-kontron     | clang-10 | defconfig   =
                 | 2          =

kontron-sl28-var3-ads2  | arm64 | lab-kontron     | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2  | arm64 | lab-kontron     | clang-12 | defconfig   =
                 | 2          =

kontron-sl28-var3-ads2  | arm64 | lab-kontron     | clang-12 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2  | arm64 | lab-kontron     | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2  | arm64 | lab-kontron     | gcc-8    | defconfig   =
                 | 2          =

kontron-sl28-var3-ads2  | arm64 | lab-kontron     | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =

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
210422/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210422
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c457d9676496f5a895509f9c510278beaaffc829 =



Test Regressions
---------------- =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora   | gcc-8    | bcm2835_defc=
onfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/60815a01fdea6079749b77c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210422/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210422/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60815a01fdea6079749b7=
7c5
        failing since 24 days (last pass: next-20210324, first fail: next-2=
0210325) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora   | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60816226af235284d99b77be

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210422/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210422/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60816226af235284d99b7=
7bf
        failing since 56 days (last pass: next-20210223, first fail: next-2=
0210224) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | clang-10 | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/6081580d2be69fbf2a9b77f3

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6081580e2be69fb=
f2a9b77f7
        failing since 15 days (last pass: next-20210323, first fail: next-2=
0210406)
        11 lines

    2021-04-22 11:03:21.193000+00:00  kern  :alert : Mem [   21.738263] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-22 11:03:21.194000+00:00  abort info:
    2021-04-22 11:03:21.195000+00:00  kern  :alert :   ESR =3D 0x96000006
    2021-04-22 11:03:21.195000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-22 11:03:21.196000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0=
   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6081580e2be69fb=
f2a9b77f8
        failing since 15 days (last pass: next-20210323, first fail: next-2=
0210406)
        2 lines

    2021-04-22 11:03:21.200000+00:00  kern  :alert : Data abort info:
    2021-04-22 11:03:21.201000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-22 11:03:21.236000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-22 11:03:21.237000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pg[   21.777086] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg R=
ESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-22 11:03:21.238000+00:00  dp=3D0000000006d1a000
    2021-04-22 11:03:21.239000+00:00  ker[   21.787930] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 122305_1.5.2.4.1>
    2021-04-22 11:03:21.239000+00:00  n  :alert : [0000000000000050] pgd=3D=
0800000006cbb003, p4d=3D0800000006cbb003, pud=3D0800000006dda003, pmd=3D000=
0000000000000   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60815c4612bbcc5a399b7812

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60815c4612bbcc5=
a399b7816
        failing since 15 days (last pass: next-20210323, first fail: next-2=
0210406)
        11 lines

    2021-04-22 11:21:20.137000+00:00  kern  :alert : Mem abort info:
    2021-04-22 11:21:20.139000+00:00  kern  :alert :   ES[   21.829764] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-22 11:21:20.140000+00:00  R =3D 0x96000007
    2021-04-22 11:21:20.140000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-22 11:21:20.141000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-22 11:21:20.142000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-22 11:21:20.142000+00:00  kern  :alert : Data abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60815c4612bbcc5=
a399b7817
        failing since 15 days (last pass: next-20210323, first fail: next-2=
0210406)
        2 lines

    2021-04-22 11:21:20.146000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-22 11:21:20.180000+00:00  kern  :alert : user pgtable: 64k page=
s, 48-bit VAs, pgdp=3D0000000002822000
    2021-04-22 11:21:20.181000+00:00  kern  :alert : [0000000000000050] pgd=
=3D080000000d960003, p4d=3D080000000d960003, pud=3D080000000d960003, pmd=3D=
080000000d970003, [   21.878221] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg=
 RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-22 11:21:20.182000+00:00  pte=3D000000000000[   21.888543] <LAV=
A_SIGNAL_ENDRUN 0_dmesg 122510_1.5.2.4.1>
    2021-04-22 11:21:20.183000+00:00  0000   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/608158c23ad9136bb59b7828

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/608158c23ad9136=
bb59b782c
        failing since 2 days (last pass: next-20210416, first fail: next-20=
210419)
        11 lines

    2021-04-22 11:06:25.045000+00:00  kern  :alert : Mem abort info:
    2021-04-22 11:06:25.047000+00:00  kern  :aler[   21.927389] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1=
1>
    2021-04-22 11:06:25.048000+00:00  t :   ESR =3D 0x96000007
    2021-04-22 11:06:25.049000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-22 11:06:25.049000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-22 11:06:25.050000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-22 11:06:25.050000+00:00  kern  :alert : Data abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/608158c23ad9136=
bb59b782d
        failing since 2 days (last pass: next-20210416, first fail: next-20=
210419)
        2 lines

    2021-04-22 11:06:25.055000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-22 11:06:25.098000+00:00  kern  :alert : user pgtable: 64k page=
s, 48-bit VAs, pgdp=3D0000000002a80800
    2021-04-22 11:06:25.100000+00:00  kern  :alert : [0000000000000050] pgd=
=3D080000000cfb0003, p4d=3D080000000cfb0003, pud=3D080000000cfb0003[   21.9=
74759] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlin=
es MEASUREMENT=3D2>
    2021-04-22 11:06:25.101000+00:00     =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/60815a7a56f3f04d209b779b

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60815a7a56f3f04=
d209b779f
        failing since 2 days (last pass: next-20210416, first fail: next-20=
210419)
        11 lines

    2021-04-22 11:13:41.771000+00:00  kern  :alert : Mem [   21.702418] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-22 11:13:41.772000+00:00  abort info:
    2021-04-22 11:13:41.773000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60815a7a56f3f04=
d209b77a0
        failing since 2 days (last pass: next-20210416, first fail: next-20=
210419)
        2 lines

    2021-04-22 11:13:41.777000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-22 11:13:41.778000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-22 11:13:41.778000+00:00  kern  :alert : Data abort info:
    2021-04-22 11:13:41.779000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-22 11:13:41.814000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-22 11:13:41.815000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000[   21.741955] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-22 11:13:41.816000+00:00  0003a8cb000
    2021-04-22 11:13:41.816000+00:00  kern  :aler[   21.752706] <LAVA_SIGNA=
L_ENDRUN 0_dmesg 122412_1.5.2.4.1>   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60815b06259f2bdb059b77a3

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60815b06259f2bd=
b059b77a7
        failing since 15 days (last pass: next-20210323, first fail: next-2=
0210406)
        11 lines

    2021-04-22 11:16:01.976000+00:00  kern  :alert : Mem [   21.705854] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-22 11:16:01.977000+00:00  abort info:
    2021-04-22 11:16:01.978000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60815b06259f2bd=
b059b77a8
        failing since 15 days (last pass: next-20210323, first fail: next-2=
0210406)
        2 lines

    2021-04-22 11:16:01.982000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-22 11:16:01.983000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-22 11:16:01.984000+00:00  kern  :alert : Data abort info:
    2021-04-22 11:16:01.985000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-22 11:16:02.019000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-22 11:16:02.020000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000[   21.745061] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-22 11:16:02.021000+00:00  0003aa11000   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b-32      | arm   | lab-baylibre    | gcc-8    | bcm2835_defc=
onfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/60815731c72dd41e139b77c0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210422/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210422/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60815731c72dd41e139b7=
7c1
        failing since 28 days (last pass: next-20210324, first fail: next-2=
0210325) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
beaglebone-black        | arm   | lab-cip         | clang-12 | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/60815cc0de70a284cd9b77a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.0-++20210304023004+4ed9f=
17e9390-1~exp1~20210304133725.54)
  Plain log:   https://storage.kernelci.org//next/master/next-20210422/arm/=
multi_v7_defconfig/clang-12/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210422/arm/=
multi_v7_defconfig/clang-12/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60815cc0de70a284cd9b7=
7a7
        new failure (last pass: next-20210420) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2  | arm64 | lab-kontron     | clang-10 | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/6081586cf1f763d3cc9b77bc

  Results:     98 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig/clang-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig/clang-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/6081586df1f763d3cc9b77c7
        new failure (last pass: next-20210420)

    2021-04-22 11:05:08.584000+00:00  <8>[   13.972267] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-22 11:05:08.584000+00:00  /lava-16593/1/../bin/lava-test-case
    2021-04-22 11:05:08.584000+00:00  <8>[   13.989564] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-22 11:05:08.584000+00:00  /lava-16593/1/../bin/lava-test-case
    2021-04-22 11:05:08.584000+00:00  <8>[   14.004840] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-probed RESULT=3Dpass>
    2021-04-22 11:05:08.585000+00:00  /lava-16593/1/../bin/lava-test-case   =


  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/6081586df1f763d3cc9b77c7
        new failure (last pass: next-20210420)

    2021-04-22 11:05:08.584000+00:00  <8>[   13.972267] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-22 11:05:08.584000+00:00  /lava-16593/1/../bin/lava-test-case
    2021-04-22 11:05:08.584000+00:00  <8>[   13.989564] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-22 11:05:08.584000+00:00  /lava-16593/1/../bin/lava-test-case
    2021-04-22 11:05:08.584000+00:00  <8>[   14.004840] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-probed RESULT=3Dpass>
    2021-04-22 11:05:08.585000+00:00  /lava-16593/1/../bin/lava-test-case   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2  | arm64 | lab-kontron     | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60815c1942420b25a59b77b6

  Results:     98 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/60815c1942420b25a59b77c1
        new failure (last pass: next-20210420) =


  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/60815c1942420b25a59b77c1
        new failure (last pass: next-20210420) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2  | arm64 | lab-kontron     | clang-12 | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/608159d5dab7f9215c9b77a1

  Results:     98 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.0-++20210304023004+4ed9f=
17e9390-1~exp1~20210304133725.54)
  Plain log:   https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig/clang-12/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig/clang-12/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/608159d5dab7f9215c9b77ac
        new failure (last pass: next-20210420)

    2021-04-22 11:11:09.235000+00:00  <8>[   13.869098] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-22 11:11:09.235000+00:00  /lava-16598/1/../bin/lava-test-case
    2021-04-22 11:11:09.235000+00:00  <8>[   13.885323] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-22 11:11:09.235000+00:00  /lava-16598/1/../bin/lava-test-case
    2021-04-22 11:11:09.236000+00:00  <8>[   13.900652] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-probed RESULT=3Dpass>
    2021-04-22 11:11:09.236000+00:00  /lava-16598/1/../bin/lava-test-case   =


  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/608159d5dab7f9215c9b77ac
        new failure (last pass: next-20210420)

    2021-04-22 11:11:09.235000+00:00  <8>[   13.869098] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-22 11:11:09.235000+00:00  /lava-16598/1/../bin/lava-test-case
    2021-04-22 11:11:09.235000+00:00  <8>[   13.885323] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-22 11:11:09.235000+00:00  /lava-16598/1/../bin/lava-test-case
    2021-04-22 11:11:09.236000+00:00  <8>[   13.900652] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-probed RESULT=3Dpass>
    2021-04-22 11:11:09.236000+00:00  /lava-16598/1/../bin/lava-test-case   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2  | arm64 | lab-kontron     | clang-12 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60815b8d8aa5afe66f9b77b5

  Results:     98 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.0-++20210304023004+4ed9f=
17e9390-1~exp1~20210304133725.54)
  Plain log:   https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/60815b8d8aa5afe66f9b77c0
        new failure (last pass: next-20210420)

    2021-04-22 11:18:28.725000+00:00  <8>[   13.963190] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-22 11:18:28.725000+00:00  /lava-16606/1/../bin/lava-test-case
    2021-04-22 11:18:28.725000+00:00  <8>[   13.980196] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-22 11:18:28.725000+00:00  /lava-16606/1/../bin/lava-test-case
    2021-04-22 11:18:28.725000+00:00  <8>[   13.996922] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-probed RESULT=3Dpass>
    2021-04-22 11:18:28.726000+00:00  /lava-16606/1/../bin/lava-test-case   =


  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/60815b8d8aa5afe66f9b77c0
        new failure (last pass: next-20210420)

    2021-04-22 11:18:28.725000+00:00  <8>[   13.963190] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-22 11:18:28.725000+00:00  /lava-16606/1/../bin/lava-test-case
    2021-04-22 11:18:28.725000+00:00  <8>[   13.980196] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-22 11:18:28.725000+00:00  /lava-16606/1/../bin/lava-test-case
    2021-04-22 11:18:28.725000+00:00  <8>[   13.996922] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-probed RESULT=3Dpass>
    2021-04-22 11:18:28.726000+00:00  /lava-16606/1/../bin/lava-test-case   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2  | arm64 | lab-kontron     | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/608158d15cf45f7fca9b77cb

  Results:     98 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/608158d15cf45f7fca9b77d6
        new failure (last pass: next-20210421)

    2021-04-22 11:06:46.652000+00:00  <8>[   13.856101] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-22 11:06:46.652000+00:00  /lava-16595/1/../bin/lava-test-case
    2021-04-22 11:06:46.652000+00:00  <8>[   13.872947] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-22 11:06:46.653000+00:00  /lava-16595/1/../bin/lava-test-case
    2021-04-22 11:06:46.653000+00:00  <8>[   13.889544] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-probed RESULT=3Dpass>
    2021-04-22 11:06:46.653000+00:00  /lava-16595/1/../bin/lava-test-case   =


  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/608158d15cf45f7fca9b77d6
        new failure (last pass: next-20210421)

    2021-04-22 11:06:46.652000+00:00  <8>[   13.856101] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-22 11:06:46.652000+00:00  /lava-16595/1/../bin/lava-test-case
    2021-04-22 11:06:46.652000+00:00  <8>[   13.872947] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-22 11:06:46.653000+00:00  /lava-16595/1/../bin/lava-test-case
    2021-04-22 11:06:46.653000+00:00  <8>[   13.889544] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-probed RESULT=3Dpass>
    2021-04-22 11:06:46.653000+00:00  /lava-16595/1/../bin/lava-test-case   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2  | arm64 | lab-kontron     | gcc-8    | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/60815ac5d4a08bd20a9b77ad

  Results:     98 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/60815ac5d4a08bd20a9b77b8
        new failure (last pass: next-20210421)

    2021-04-22 11:15:11.844000+00:00  <8>[   13.906920] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-22 11:15:11.845000+00:00  /lava-16601/1/../bin/lava-test-case
    2021-04-22 11:15:11.845000+00:00  <8>[   13.923452] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-22 11:15:11.845000+00:00  /lava-16601/1/../bin/lava-test-case
    2021-04-22 11:15:11.845000+00:00  <8>[   13.938930] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-probed RESULT=3Dpass>
    2021-04-22 11:15:11.845000+00:00  /lava-16601/1/../bin/lava-test-case   =


  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/60815ac5d4a08bd20a9b77b8
        new failure (last pass: next-20210421)

    2021-04-22 11:15:11.844000+00:00  <8>[   13.906920] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-22 11:15:11.845000+00:00  /lava-16601/1/../bin/lava-test-case
    2021-04-22 11:15:11.845000+00:00  <8>[   13.923452] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-22 11:15:11.845000+00:00  /lava-16601/1/../bin/lava-test-case
    2021-04-22 11:15:11.845000+00:00  <8>[   13.938930] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-probed RESULT=3Dpass>
    2021-04-22 11:15:11.845000+00:00  /lava-16601/1/../bin/lava-test-case   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2  | arm64 | lab-kontron     | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60815b29c6096ff7819b77d8

  Results:     98 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontron/baseline-kontron-sl=
28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontron/baseline-kontron-sl=
28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/60815b29c6096ff7819b77e3
        new failure (last pass: next-20210421)

    2021-04-22 11:16:47.851000+00:00  <8>[   13.850148] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-22 11:16:47.851000+00:00  /lava-16604/1/../bin/lava-test-case
    2021-04-22 11:16:47.852000+00:00  <8>[   13.868052] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-22 11:16:47.852000+00:00  /lava-16604/1/../bin/lava-test-case
    2021-04-22 11:16:47.852000+00:00  <8>[   13.883618] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-probed RESULT=3Dpass>
    2021-04-22 11:16:47.852000+00:00  /lava-16604/1/../bin/lava-test-case   =


  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/60815b29c6096ff7819b77e3
        new failure (last pass: next-20210421)

    2021-04-22 11:16:47.851000+00:00  <8>[   13.850148] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>
    2021-04-22 11:16:47.851000+00:00  /lava-16604/1/../bin/lava-test-case
    2021-04-22 11:16:47.852000+00:00  <8>[   13.868052] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-driver-present RESULT=3Dpass>
    2021-04-22 11:16:47.852000+00:00  /lava-16604/1/../bin/lava-test-case
    2021-04-22 11:16:47.852000+00:00  <8>[   13.883618] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dspi-nor-probed RESULT=3Dpass>
    2021-04-22 11:16:47.852000+00:00  /lava-16604/1/../bin/lava-test-case   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
mt8173-elm-hana         | arm64 | lab-collabora   | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60815c3412bbcc5a399b77c2

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-mt81=
73-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-mt81=
73-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60815c3412bbcc5a399b77da
        failing since 15 days (last pass: next-20210323, first fail: next-2=
0210406)

    2021-04-22 11:21:20.797000+00:00  /lava-3565573/1/../bin/lava-test-case
    2021-04-22 11:21:20.805000+00:00  <8>[   55.758561] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/608=
15c3412bbcc5a399b77e0
        failing since 15 days (last pass: next-20210323, first fail: next-2=
0210406)

    2021-04-22 11:21:21.918000+00:00  <8>[   56.872201] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-baylibre    | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6081557572e490d68f9b77b5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210422/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210422/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6081557572e490d68f9b7=
7b6
        failing since 155 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-broonie     | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6081556101be07802c9b77c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210422/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210422/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6081556101be07802c9b7=
7c6
        failing since 155 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-cip         | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6081556472e490d68f9b7795

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210422/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210422/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6081556472e490d68f9b7=
796
        failing since 155 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-collabora   | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6081550354c90868339b77bf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210422/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210422/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6081550354c90868339b7=
7c0
        failing since 155 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-linaro-lkft | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/608160be037545f16b9b77af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210422/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210422/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608160be037545f16b9b7=
7b0
        failing since 155 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60815e37a365532f7f9b7807

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60815e37a365532f7f9b7=
808
        failing since 70 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/608159e95ad847f6dd9b77da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210422/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/608159e95ad847f6dd9b7=
7db
        failing since 70 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =20
