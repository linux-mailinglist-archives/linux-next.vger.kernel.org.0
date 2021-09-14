Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0929740A6BD
	for <lists+linux-next@lfdr.de>; Tue, 14 Sep 2021 08:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239936AbhINGfq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Sep 2021 02:35:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232880AbhINGfp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Sep 2021 02:35:45 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3861C061574
        for <linux-next@vger.kernel.org>; Mon, 13 Sep 2021 23:34:28 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id w19so6820323pfn.12
        for <linux-next@vger.kernel.org>; Mon, 13 Sep 2021 23:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6AwoAbKMO7bwCMP7+ubvJ+rZb0yM0/Kr+KNT7+bVVto=;
        b=1SqK8dziUFFJdHx4HB6zhJgBBi32b8q9OH/4lcS8HhDBHiVmkxJ1+Wqcyo6Ae9G51c
         U9rR5jxizD2AHYlrLR6NEZvph/cUQ8M4EQRNFOGGwxPD25XXPWe7TXpEIB4MBzQqwlpr
         qsaXVa4NotMRdGv0nyEr4FVMl6Godc4uK2EeLjFNMnou5Y/xi5CCRaYHEorChVeO0EGW
         PZSRhurdYAzTBV+GSSFgrWoL5ZF/ZPsChER4B16xw5XV9ShMqUrs1dakmNawC5ipHPmq
         lu/Vfes/cVdKsYsURG9uxd0LegT37SlAw87w0jrlOH4vYh4fpdBcMcgPufrpdzBtu+iH
         3oHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6AwoAbKMO7bwCMP7+ubvJ+rZb0yM0/Kr+KNT7+bVVto=;
        b=YVTGOUaY07qB1TCnD8a+LaVJkm5hy6++gLwJWZK/8/oElmPhxj+eUVNHbo2hmtQriM
         VaCFLuDN//Qbkce4dsE15coMVhLPBqtPPm/BEYKkWutZWkrVs9+rYYcmqn8eIIDc9Er+
         TQqZ15cg87nU0xMpQtFRKPi92C9/E3w+kNQElbWg5Vpa4AWT5rFbA1qsV1PTcmOyNuX9
         VfAFj65eGR1lfw2T1cb3PhoQ+mhI5MIUFaBWsmWHou7yr+lUVbw8HElh02iwkvb/hWWf
         yrA8b2M54iM0vtDTDUZGQQx+yLlTym5ZT2zg9WNoHupDP/88eS6hOuCrz71uiYp6FQn3
         m8PQ==
X-Gm-Message-State: AOAM533L64CiI+Lut47+4DIz88PuKdvTrBO5RNLTH2B43ZO1tEwpgVxQ
        ESB77GRS4ImlIfcTbK9sruQZeZzYYcco2mza
X-Google-Smtp-Source: ABdhPJyvP4WEDSXMuMOaUqYdaM2foPWq77/6GjubyjnhOLIN5O+n28GnMb/vmuIUo+RUhhjXQiONBw==
X-Received: by 2002:a65:47cd:: with SMTP id f13mr14375471pgs.439.1631601267995;
        Mon, 13 Sep 2021 23:34:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h7sm8984762pfe.125.2021.09.13.23.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 23:34:27 -0700 (PDT)
Message-ID: <61404273.1c69fb81.5eec3.9e89@mx.google.com>
Date:   Mon, 13 Sep 2021 23:34:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.15-rc1-148-g00d39c2c1e6d
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 386 runs,
 17 regressions (v5.15-rc1-148-g00d39c2c1e6d)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 386 runs, 17 regressions (v5.15-rc1-148-g00d39=
c2c1e6d)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b              | arm64 | lab-baylibre  | gcc-8    | defconfig=
                    | 1          =

beagle-xm                    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig+crypto    | 1          =

beagle-xm                    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 1          =

beagle-xm                    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig+ima       | 1          =

imx6q-sabresd                | arm   | lab-nxp       | gcc-8    | imx_v6_v7=
_defconfig          | 1          =

imx8mn-ddr4-evk              | arm64 | lab-nxp       | gcc-8    | defconfig=
                    | 2          =

imx8mp-evk                   | arm64 | lab-nxp       | gcc-8    | defconfig=
                    | 1          =

imx8mp-evk                   | arm64 | lab-nxp       | gcc-8    | defconfig=
+crypto             | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-8    | defconfig=
+ima                | 1          =

qemu_arm-versatilepb         | arm   | lab-baylibre  | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-cip       | gcc-8    | versatile=
_defconfig          | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-8    | defconfig=
                    | 2          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
                    | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
+crypto             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.15-rc1-148-g00d39c2c1e6d/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.15-rc1-148-g00d39c2c1e6d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      00d39c2c1e6da5cff982f3cd08d7fef432e76a72 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6140097d9a9774a72899a2eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6140097d9a9774a72899a=
2ec
        failing since 221 days (last pass: v5.11-rc6-256-gf889022827dc, fir=
st fail: v5.11-rc6-298-g490f4659faae) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2837-rpi-3-b              | arm64 | lab-baylibre  | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61400a11c41e57456a99a2ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61400a11c41e57456a99a=
2ee
        failing since 69 days (last pass: v5.13-3495-gfbf137d9483a, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/61400bc3bf1b984a0699a3b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm/multi_v7_defconfig+crypto/gcc-8/lab-baylibre/baseline-=
beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm/multi_v7_defconfig+crypto/gcc-8/lab-baylibre/baseline-=
beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61400bc3bf1b984a0699a=
3ba
        new failure (last pass: v5.14-11292-g7436a05fa7a4) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61400c4e114da27be199a2f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-=
xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-=
xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61400c4e114da27be199a=
2f8
        failing since 4 days (last pass: v5.14-10568-g1006eb19726f, first f=
ail: v5.14-10891-g7e703ab62392) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/61400dde73025b56f899a32b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-bea=
gle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-bea=
gle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61400dde73025b56f899a=
32c
        failing since 5 days (last pass: v5.14-10251-gfd7f1d781c08, first f=
ail: v5.14-10568-g1006eb19726f) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-sabresd                | arm   | lab-nxp       | gcc-8    | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614009a4f37eb5538699a2db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614009a4f37eb5538699a=
2dc
        failing since 323 days (last pass: v5.9-13195-g0281c5220c40, first =
fail: v5.9-14860-gd56fc2efcc70) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-nxp       | gcc-8    | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/61400a469587f94e9399a2da

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61400a469587f94=
e9399a2e1
        new failure (last pass: v5.14-11292-g7436a05fa7a4)
        12 lines

    2021-09-14T02:34:15.709995  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   14.947055] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2021-09-14T02:34:15.710243  0098   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61400a469587f94=
e9399a2e2
        new failure (last pass: v5.14-11292-g7436a05fa7a4)
        2 lines

    2021-09-14T02:34:15.710951  kern  :alert : Mem abort info:
    2021-09-14T02:34:15.711060  kern  :alert :   ESR =3D 0x96000046
    2021-09-14T02:34:15.711168  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2021-09-14T02:34:15.711262  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-09-14T02:34:15.711548  kern  :alert :   EA<8>[   14.973112] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2021-09-14T02:34:15.711645   =3D 0, S1PTW =3D 0   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-nxp       | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61400fc6ee2db7848499a2e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61400fc6ee2db7848499a=
2e7
        failing since 12 days (last pass: v5.14-619-gacb79da497df, first fa=
il: v5.14-6828-g521f6987a116) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-nxp       | gcc-8    | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6140115642459f40ec99a2e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6140115642459f40ec99a=
2e6
        failing since 4 days (last pass: v5.14-10568-g1006eb19726f, first f=
ail: v5.14-10891-g7e703ab62392) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-8    | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61400cb291193ae63599a307

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm64/defconfig+ima/gcc-8/lab-baylibre/baseline-meson-g12b=
-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm64/defconfig+ima/gcc-8/lab-baylibre/baseline-meson-g12b=
-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61400cb291193ae63599a=
308
        new failure (last pass: v5.14-10891-g7e703ab62392) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb         | arm   | lab-baylibre  | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61400a579134cf783d99a412

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61400a579134cf783d99a=
413
        failing since 301 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb         | arm   | lab-cip       | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61400a8ba9b92a4c4599a2e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61400a8ba9b92a4c4599a=
2e3
        failing since 301 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-8    | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/61400b3d976f807a2699a340

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/61400b3d976f807a2699a346
        failing since 63 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-09-14T02:38:40.145321  /lava-4517380/1/../bin/lava-test-case
    2021-09-14T02:38:40.157643  <8>[   25.332335] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/61400b3d976f807a2699a347
        failing since 63 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-09-14T02:38:39.111339  /lava-4517380/1/../bin/lava-test-case
    2021-09-14T02:38:39.123216  <8>[   24.297469] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61400a3f751925ff8499a334

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banan=
api-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banan=
api-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61400a3f751925ff8499a=
335
        failing since 5 days (last pass: v5.14-9872-gea617cdef108, first fa=
il: v5.14-10568-g1006eb19726f) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61400ba8f3a0415c9f99a319

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm64/defconfig+crypto/gcc-8/lab-clabbe/baseline-sun50i-a6=
4-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-1=
48-g00d39c2c1e6d/arm64/defconfig+crypto/gcc-8/lab-clabbe/baseline-sun50i-a6=
4-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61400ba8f3a0415c9f99a=
31a
        new failure (last pass: v5.14-10891-g7e703ab62392) =

 =20
