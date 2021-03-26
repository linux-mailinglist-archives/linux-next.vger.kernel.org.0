Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A77A934A932
	for <lists+linux-next@lfdr.de>; Fri, 26 Mar 2021 15:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbhCZOBY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Mar 2021 10:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230100AbhCZOBO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Mar 2021 10:01:14 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 815BBC0613AA
        for <linux-next@vger.kernel.org>; Fri, 26 Mar 2021 07:01:13 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id o2so950229plg.1
        for <linux-next@vger.kernel.org>; Fri, 26 Mar 2021 07:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=QAWH+DhMckpdov6ajoar7dRvMUCQlFK4Im56dAoutvg=;
        b=GtDPXPTH8//kl2wLaXSkCybK6g8u6hqVlL5v7rwylhaDoR+rv7KPqzTmc26yYlnlRT
         t88bWNMal7M7u/WPnejsoOJSm82yjv7xeqKIdHrkbHUwE/Gan6vHr23Zk6jXgyqKYgAE
         /jdN+25LnaycA4SumyBiKf6Oxb/FdLERiYIsRFLbNRU/kxiuYoC/flk44gLz9d5m6wDy
         8gpygFQIRaQQDA28t6o9OFyn6u58g4vRrjyQUHgsiOxyp64icZUF2WAlI3fuFMG3yZZN
         rEd1r7QA0XL0KmlcyWiBND9xwbJd/cTFcrqzDAkrR+B2ykFoO2ongqxfnwo3SOwWX+5h
         zx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=QAWH+DhMckpdov6ajoar7dRvMUCQlFK4Im56dAoutvg=;
        b=jg9P+p3CT2lvJE6JrtfbYaoaWC8OUzp87fLWqONrgyfZpjk0BP49Z27aupDgfrpEMn
         yYjzZBZqsl8CHLW9MgNh9n8nwSziVnq8R/+ksJPgivGZ0vzUti5VbnuWVsARMvJc6wbn
         mBh7un6pVkqPdaIo6ecRBAEgIKt4/VsaBilVT5Wcm+h05l5M5ylMv+qAbDENoMSn7jSP
         3X00tsljRpiOCODwUpM02u0ombBD96JkhMScLUYV03Mayl8pSyOI1lKXrdPg9jn4toe+
         7hBuOmewtB7s5FlQh9T77irpx22s/zVYWar+PN3zvcIFXTpqjXG0us5EHJ8X/UwX2ha1
         8tZQ==
X-Gm-Message-State: AOAM531H57Q8ls2/eqNWk4kz174k1kN/9J5bmFGDPg/CZRq4ZYJ4UREh
        jNP8fakL3he71yxZN3d3iRxqwOVuVcNzqg==
X-Google-Smtp-Source: ABdhPJyKr+yRmfu3QfMsb5kxLGaVKAzT9Wb3LQ2fbclwZQ2v3rwZAJtv1hhpHlD0o/cqCFNhP50U6g==
X-Received: by 2002:a17:902:8a89:b029:e7:1029:8a46 with SMTP id p9-20020a1709028a89b02900e710298a46mr14434742plo.33.1616767272190;
        Fri, 26 Mar 2021 07:01:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f14sm9800693pfk.92.2021.03.26.07.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:01:11 -0700 (PDT)
Message-ID: <605de927.1c69fb81.410ac.7b09@mx.google.com>
Date:   Fri, 26 Mar 2021 07:01:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20210326
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 326 runs, 36 regressions (next-20210326)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 326 runs, 36 regressions (next-20210326)

Regressions Summary
-------------------

platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
bcm2837-rpi-3-b-32           | arm  | lab-baylibre    | gcc-8    | bcm2835_=
defconfig            | 1          =

ox820-clouden...lug-series-3 | arm  | lab-baylibre    | gcc-8    | oxnas_v6=
_defconfig           | 1          =

qemu_arm-versatilepb         | arm  | lab-baylibre    | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_arm-versatilepb         | arm  | lab-broonie     | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_arm-versatilepb         | arm  | lab-cip         | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_arm-versatilepb         | arm  | lab-collabora   | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_arm-versatilepb         | arm  | lab-linaro-lkft | gcc-8    | versatil=
e_defconfig          | 1          =

rk3288-rock2-square          | arm  | lab-collabora   | clang-10 | multi_v7=
_defconfig           | 1          =

rk3288-rock2-square          | arm  | lab-collabora   | clang-11 | multi_v7=
_defconfig           | 1          =

rk3288-rock2-square          | arm  | lab-collabora   | gcc-8    | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-rock2-square          | arm  | lab-collabora   | gcc-8    | multi_v7=
_defconfig           | 1          =

rk3288-rock2-square          | arm  | lab-collabora   | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

stm32mp157c-dk2              | arm  | lab-baylibre    | clang-10 | multi_v7=
_defconfig           | 1          =

stm32mp157c-dk2              | arm  | lab-baylibre    | clang-11 | multi_v7=
_defconfig           | 1          =

stm32mp157c-dk2              | arm  | lab-baylibre    | gcc-8    | multi_v7=
_defconfig           | 1          =

stm32mp157c-dk2              | arm  | lab-baylibre    | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm  | lab-baylibre    | clang-10 | multi_v7=
_defconfig           | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm  | lab-baylibre    | clang-11 | multi_v7=
_defconfig           | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm  | lab-baylibre    | gcc-8    | multi_v7=
_defconfig           | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm  | lab-baylibre    | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm  | lab-baylibre    | gcc-8    | sunxi_de=
fconfig              | 1          =

sun8i-h2-plus-orangepi-zero  | arm  | lab-baylibre    | clang-10 | multi_v7=
_defconfig           | 1          =

sun8i-h2-plus-orangepi-zero  | arm  | lab-baylibre    | clang-11 | multi_v7=
_defconfig           | 1          =

sun8i-h2-plus-orangepi-zero  | arm  | lab-baylibre    | gcc-8    | multi_v7=
_defconfig           | 1          =

sun8i-h2-plus-orangepi-zero  | arm  | lab-baylibre    | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

sun8i-h2-plus-orangepi-zero  | arm  | lab-baylibre    | gcc-8    | sunxi_de=
fconfig              | 1          =

sun8i-h3-bananapi-m2-plus    | arm  | lab-baylibre    | clang-10 | multi_v7=
_defconfig           | 1          =

sun8i-h3-bananapi-m2-plus    | arm  | lab-baylibre    | clang-11 | multi_v7=
_defconfig           | 1          =

sun8i-h3-bananapi-m2-plus    | arm  | lab-baylibre    | gcc-8    | multi_v7=
_defconfig           | 1          =

sun8i-h3-bananapi-m2-plus    | arm  | lab-baylibre    | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

sun8i-h3-bananapi-m2-plus    | arm  | lab-baylibre    | gcc-8    | sunxi_de=
fconfig              | 1          =

sun8i-h3-libretech-all-h3-cc | arm  | lab-baylibre    | clang-10 | multi_v7=
_defconfig           | 1          =

sun8i-h3-libretech-all-h3-cc | arm  | lab-baylibre    | clang-11 | multi_v7=
_defconfig           | 1          =

sun8i-h3-libretech-all-h3-cc | arm  | lab-baylibre    | gcc-8    | multi_v7=
_defconfig           | 1          =

sun8i-h3-libretech-all-h3-cc | arm  | lab-baylibre    | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

sun8i-h3-libretech-all-h3-cc | arm  | lab-baylibre    | gcc-8    | sunxi_de=
fconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210326/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210326
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      931294922e65a23e1aad6398b9ae02df74044679 =



Test Regressions
---------------- =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
bcm2837-rpi-3-b-32           | arm  | lab-baylibre    | gcc-8    | bcm2835_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/605dafce4d3f52ad9faf02b5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605dafce4d3f52ad9faf0=
2b6
        failing since 1 day (last pass: next-20210324, first fail: next-202=
10325) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
ox820-clouden...lug-series-3 | arm  | lab-baylibre    | gcc-8    | oxnas_v6=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/605db26e38f7285d40af02f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-=
series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-=
series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605db26e38f7285d40af0=
2f6
        failing since 1 day (last pass: next-20210324, first fail: next-202=
10325) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb         | arm  | lab-baylibre    | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/605dafe00e3c0d8f10af02bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605dafe00e3c0d8f10af0=
2bc
        failing since 128 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb         | arm  | lab-broonie     | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/605dafdf22374223adaf02bc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605dafdf22374223adaf0=
2bd
        failing since 128 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb         | arm  | lab-cip         | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/605dafee5e304c2230af02b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605dafee5e304c2230af0=
2b3
        failing since 128 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb         | arm  | lab-collabora   | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/605daf7f25e858da03af02d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605daf7f25e858da03af0=
2d2
        failing since 128 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb         | arm  | lab-linaro-lkft | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/605db4e2cabf2ce95baf02ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605db4e2cabf2ce95baf0=
2bb
        failing since 128 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm  | lab-collabora   | clang-10 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/605dc486cec521b095af02b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605dc486cec521b095af0=
2b9
        failing since 1 day (last pass: next-20210323, first fail: next-202=
10325) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm  | lab-collabora   | clang-11 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/605db6c6130ad99458af02c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/clang-11/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/clang-11/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605db6c6130ad99458af0=
2c3
        new failure (last pass: next-20210324) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm  | lab-collabora   | gcc-8    | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/605db3f17347861a79af02c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605db3f17347861a79af0=
2c7
        failing since 1 day (last pass: next-20210324, first fail: next-202=
10325) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm  | lab-collabora   | gcc-8    | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/605db96e2293458fefaf02cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605db96e2293458fefaf0=
2d0
        new failure (last pass: next-20210324) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm  | lab-collabora   | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/605dc040b756897897af030f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-rock2=
-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-rock2=
-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605dc040b756897897af0=
310
        failing since 1 day (last pass: next-20210324, first fail: next-202=
10325) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
stm32mp157c-dk2              | arm  | lab-baylibre    | clang-10 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/605db8c36caea23305af02b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-stm32mp157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-stm32mp157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605db8c36caea23305af0=
2b9
        failing since 1 day (last pass: next-20210323, first fail: next-202=
10325) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
stm32mp157c-dk2              | arm  | lab-baylibre    | clang-11 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/605db4c631ee21807caf02ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-stm32mp157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-stm32mp157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605db4c631ee21807caf0=
2af
        new failure (last pass: next-20210324) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
stm32mp157c-dk2              | arm  | lab-baylibre    | gcc-8    | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/605db61b7333785f29af02dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-stm32mp157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-stm32mp157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605db61b7333785f29af0=
2dd
        new failure (last pass: next-20210324) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
stm32mp157c-dk2              | arm  | lab-baylibre    | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/605db76fcd21ba3094af02ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-stm32mp157c-d=
k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-stm32mp157c-d=
k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605db76fcd21ba3094af0=
2af
        failing since 1 day (last pass: next-20210324, first fail: next-202=
10325) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm  | lab-baylibre    | clang-10 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/605db9551b4c50c9f4af02b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-a=
ll-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-a=
ll-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605db9551b4c50c9f4af0=
2b2
        failing since 1 day (last pass: next-20210323, first fail: next-202=
10325) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm  | lab-baylibre    | clang-11 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/605db5098fe15cbf5daf02ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-sun8i-h2-plus-libretech-a=
ll-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-sun8i-h2-plus-libretech-a=
ll-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605db5098fe15cbf5daf0=
2af
        new failure (last pass: next-20210324) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm  | lab-baylibre    | gcc-8    | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/605db68523770d868eaf02ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-=
h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-=
h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605db68523770d868eaf0=
2af
        new failure (last pass: next-20210324) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm  | lab-baylibre    | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/605db7edbbe7d506d4af02af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun8i-h2-plus=
-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun8i-h2-plus=
-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605db7edbbe7d506d4af0=
2b0
        failing since 1 day (last pass: next-20210324, first fail: next-202=
10325) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm  | lab-baylibre    | gcc-8    | sunxi_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/605db15c3dca33818eaf02c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3-=
cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3-=
cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605db15c3dca33818eaf0=
2c6
        failing since 1 day (last pass: next-20210324, first fail: next-202=
10325) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
sun8i-h2-plus-orangepi-zero  | arm  | lab-baylibre    | clang-10 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/605dba2d6ec8630ae1af02ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-ze=
ro.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-ze=
ro.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605dba2d6ec8630ae1af0=
2cb
        failing since 1 day (last pass: next-20210323, first fail: next-202=
10325) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
sun8i-h2-plus-orangepi-zero  | arm  | lab-baylibre    | clang-11 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/605db52d670f20f005af02c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-sun8i-h2-plus-orangepi-ze=
ro.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-sun8i-h2-plus-orangepi-ze=
ro.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605db52d670f20f005af0=
2c6
        new failure (last pass: next-20210324) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
sun8i-h2-plus-orangepi-zero  | arm  | lab-baylibre    | gcc-8    | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/605db721e1a0b4dfc3af02ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h2-plus-orangepi-zero.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h2-plus-orangepi-zero.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605db721e1a0b4dfc3af0=
2bb
        new failure (last pass: next-20210324) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
sun8i-h2-plus-orangepi-zero  | arm  | lab-baylibre    | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/605db89dcc213b8a3daf0322

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun8i-h2-plus=
-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun8i-h2-plus=
-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605db89dcc213b8a3daf0=
323
        failing since 1 day (last pass: next-20210324, first fail: next-202=
10325) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
sun8i-h2-plus-orangepi-zero  | arm  | lab-baylibre    | gcc-8    | sunxi_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/605db16cbff28f620faf02cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h2-plus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h2-plus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605db16cbff28f620faf0=
2cc
        failing since 1 day (last pass: next-20210324, first fail: next-202=
10325) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
sun8i-h3-bananapi-m2-plus    | arm  | lab-baylibre    | clang-10 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/605dbb14624247f804af02d4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605dbb14624247f804af0=
2d5
        failing since 1 day (last pass: next-20210323, first fail: next-202=
10325) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
sun8i-h3-bananapi-m2-plus    | arm  | lab-baylibre    | clang-11 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/605db4e7cabf2ce95baf02bf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605db4e7cabf2ce95baf0=
2c0
        new failure (last pass: next-20210324) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
sun8i-h3-bananapi-m2-plus    | arm  | lab-baylibre    | gcc-8    | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/605db6dbe1a0b4dfc3af02ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605db6dbe1a0b4dfc3af0=
2af
        new failure (last pass: next-20210324) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
sun8i-h3-bananapi-m2-plus    | arm  | lab-baylibre    | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/605db8f8893ba600baaf02c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun8i-h3-bana=
napi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun8i-h3-bana=
napi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605db8f8893ba600baaf0=
2c7
        failing since 1 day (last pass: next-20210324, first fail: next-202=
10325) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
sun8i-h3-bananapi-m2-plus    | arm  | lab-baylibre    | gcc-8    | sunxi_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/605db16381ee03de16af02e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605db16381ee03de16af0=
2ea
        failing since 1 day (last pass: next-20210324, first fail: next-202=
10325) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
sun8i-h3-libretech-all-h3-cc | arm  | lab-baylibre    | clang-10 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/605db6c884dd2a3d57af02ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605db6c884dd2a3d57af0=
2af
        failing since 1 day (last pass: next-20210323, first fail: next-202=
10325) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
sun8i-h3-libretech-all-h3-cc | arm  | lab-baylibre    | clang-11 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/605db4f5acd590bb0faf02c7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-sun8i-h3-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-sun8i-h3-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605db4f5acd590bb0faf0=
2c8
        new failure (last pass: next-20210324) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
sun8i-h3-libretech-all-h3-cc | arm  | lab-baylibre    | gcc-8    | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/605db54c5d84868266af02cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605db54c5d84868266af0=
2d0
        new failure (last pass: next-20210324) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
sun8i-h3-libretech-all-h3-cc | arm  | lab-baylibre    | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/605db6712ab3b17b38af02f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun8i-h3-libr=
etech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun8i-h3-libr=
etech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605db6712ab3b17b38af0=
2f1
        failing since 1 day (last pass: next-20210324, first fail: next-202=
10325) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
sun8i-h3-libretech-all-h3-cc | arm  | lab-baylibre    | gcc-8    | sunxi_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/605db1673dca33818eaf02db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210326/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210326/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605db1673dca33818eaf0=
2dc
        failing since 1 day (last pass: next-20210324, first fail: next-202=
10325) =

 =20
