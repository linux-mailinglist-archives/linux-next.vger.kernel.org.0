Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 417F92DCFCB
	for <lists+linux-next@lfdr.de>; Thu, 17 Dec 2020 11:53:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726160AbgLQKxT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Dec 2020 05:53:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgLQKxT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Dec 2020 05:53:19 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27DCEC061794
        for <linux-next@vger.kernel.org>; Thu, 17 Dec 2020 02:52:39 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id m5so3894701pjv.5
        for <linux-next@vger.kernel.org>; Thu, 17 Dec 2020 02:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=wDQxNmro4KPqWxdtxbUExVBrw6dwyNRSmmxC7AD6wFc=;
        b=EdnGK6eWj6c+GUd5aH3rrXD6YDY7RT4Wg4wZFgWebS+y5tUnCQNpWbW/+4hh900Mf4
         W7AG8HQKPLD4TcbZUqlSbSyXPzFKlFdumtnsq/WhN9aBMFncwMq3MoWf9PaNNnnZilbK
         5DawamgnV+3TD1PAL+YmcAsQtcqOrlq9skXafPI46a3WCesqZt4u/O4Eo4Xg0+2rwgLn
         Xj+/msWbdQpoU+7CuEzSC00CwaOvblk73LHlvNwgAp4r9TnbfGhCcezcfUhoUP6axXhU
         wCdcD5hH55xBbPLhndyaR3JmYUX268nNFaZkiiTN7dOtCtnhp85S0PSBo4SPVMfqEplS
         zsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=wDQxNmro4KPqWxdtxbUExVBrw6dwyNRSmmxC7AD6wFc=;
        b=R+h0yUSqpipviK0nKHWJ9GRJDsQ5Mbi2R1tQAD8oTDDf7yXs4Dl0P1Y2iwon8+sJfJ
         j22advLqt27+Xeyr4ElaNbQRFSmsLgh9kFoUrhTEhGMObpOgFt6JXHUFsdzmK68vzw13
         fOpRZ1mQIHo23wtJ7CzPiwzN1o8IwBDKbqJ1RbrvJuRYGPCH9YUHAGxm5x4ZpePT1hX/
         rPBk9W9ceClBHlxyBdyORGdmcpTIFwPrevC9MCKcDF9LpaBwAm4Gmsw7Gzj/tnC9wPrk
         p9Io+ZA7BX5F9Dlb26FuqnjcZLETMYIBbZg3SkMd9oBHn411FEzcSxROC0i/Ru8HRlc9
         Lv3g==
X-Gm-Message-State: AOAM530qfMEWlOiXW3UsmSPLfOWq98jtLwx07ySdUGU24WiUKCGI2xOD
        s0irL/3yevCyZXb5YXUMyKStHwBl5jyMdQ==
X-Google-Smtp-Source: ABdhPJzLAusNdzr92FLEdEXZt3DtlM91a9hMXCZkBdPqf7J0jb0oCDtGLf1dPf2Ym6OpO0qe1ntwBQ==
X-Received: by 2002:a17:902:900a:b029:d7:d966:1a44 with SMTP id a10-20020a170902900ab02900d7d9661a44mr10725267plp.8.1608202358085;
        Thu, 17 Dec 2020 02:52:38 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w18sm5491747pfj.120.2020.12.17.02.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 02:52:37 -0800 (PST)
Message-ID: <5fdb3875.1c69fb81.16c64.de3c@mx.google.com>
Date:   Thu, 17 Dec 2020 02:52:37 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20201217
X-Kernelci-Report-Type: test
Subject: next/master baseline: 285 runs, 19 regressions (next-20201217)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 285 runs, 19 regressions (next-20201217)

Regressions Summary
-------------------

platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
imx6sx-sdb                   | arm  | lab-nxp         | clang-10 | multi_v7=
_defconfig           | 1          =

imx6sx-sdb                   | arm  | lab-nxp         | clang-11 | multi_v7=
_defconfig           | 1          =

imx6sx-sdb                   | arm  | lab-nxp         | gcc-8    | imx_v6_v=
7_defconfig          | 1          =

imx6sx-sdb                   | arm  | lab-nxp         | gcc-8    | multi_v7=
_defconfig           | 1          =

imx6ul-pico-hobbit           | arm  | lab-pengutronix | gcc-8    | imx_v6_v=
7_defconfig          | 1          =

ox820-clouden...lug-series-3 | arm  | lab-baylibre    | gcc-8    | oxnas_v6=
_defconfig           | 1          =

qemu_arm-versatilepb         | arm  | lab-baylibre    | gcc-8    | versatil=
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

rk3288-veyron-jaq            | arm  | lab-collabora   | clang-10 | multi_v7=
_defconfig           | 1          =

rk3288-veyron-jaq            | arm  | lab-collabora   | clang-11 | multi_v7=
_defconfig           | 1          =

rk3288-veyron-jaq            | arm  | lab-collabora   | gcc-8    | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm  | lab-collabora   | gcc-8    | multi_v7=
_defconfig           | 1          =

tegra124-nyan-big            | arm  | lab-collabora   | gcc-8    | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
201217/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20201217
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      90cc8cf2d1ab87d708ebc311ac104ccbbefad9fc =



Test Regressions
---------------- =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
imx6sx-sdb                   | arm  | lab-nxp         | clang-10 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdb08a510c844fb7dc94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201217/arm/=
multi_v7_defconfig/clang-10/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201217/arm/=
multi_v7_defconfig/clang-10/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdb08a510c844fb7dc94=
cba
        failing since 0 day (last pass: next-20201211, first fail: next-202=
01216) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
imx6sx-sdb                   | arm  | lab-nxp         | clang-11 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdb06fe55ad7bf99cc94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201212122539+abeec=
5d081f-1~exp1~20201211233153.145)
  Plain log:   https://storage.kernelci.org//next/master/next-20201217/arm/=
multi_v7_defconfig/clang-11/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201217/arm/=
multi_v7_defconfig/clang-11/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdb06fe55ad7bf99cc94=
cba
        failing since 2 days (last pass: next-20201211, first fail: next-20=
201214) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
imx6sx-sdb                   | arm  | lab-nxp         | gcc-8    | imx_v6_v=
7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdb05814e6ab6cdb6c94cc5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201217/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201217/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdb05814e6ab6cdb6c94=
cc6
        failing since 2 days (last pass: next-20201211, first fail: next-20=
201214) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
imx6sx-sdb                   | arm  | lab-nxp         | gcc-8    | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdb0406c036121f0dc94ccf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201217/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201217/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdb0406c036121f0dc94=
cd0
        failing since 2 days (last pass: next-20201211, first fail: next-20=
201214) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
imx6ul-pico-hobbit           | arm  | lab-pengutronix | gcc-8    | imx_v6_v=
7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdb04a3ee07bd1dedc94ce0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201217/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201217/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdb04a3ee07bd1dedc94=
ce1
        new failure (last pass: next-20201216) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
ox820-clouden...lug-series-3 | arm  | lab-baylibre    | gcc-8    | oxnas_v6=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdaffdf1092ba9d93c94cc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201217/arm/=
oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-=
series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201217/arm/=
oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-=
series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdaffdf1092ba9d93c94=
cc4
        failing since 7 days (last pass: next-20201208, first fail: next-20=
201209) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb         | arm  | lab-baylibre    | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdb01bf8c3c70fc41c94cd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201217/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201217/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdb01bf8c3c70fc41c94=
cd3
        failing since 29 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb         | arm  | lab-cip         | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdb01d57241e48d2ec94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201217/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201217/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdb01d57241e48d2ec94=
cba
        failing since 29 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb         | arm  | lab-collabora   | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdb018065cd312580c94cc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201217/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201217/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdb018065cd312580c94=
cca
        failing since 29 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb         | arm  | lab-linaro-lkft | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdb35c32fccbd3917c94cdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201217/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201217/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdb35c32fccbd3917c94=
cdc
        failing since 29 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm  | lab-collabora   | clang-10 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdb0eaf4f7e151a24c94cbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201217/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201217/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdb0eaf4f7e151a24c94=
cbe
        new failure (last pass: next-20201208) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm  | lab-collabora   | clang-11 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdb0d62fb1871cd63c94cbc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201212122539+abeec=
5d081f-1~exp1~20201211233153.145)
  Plain log:   https://storage.kernelci.org//next/master/next-20201217/arm/=
multi_v7_defconfig/clang-11/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201217/arm/=
multi_v7_defconfig/clang-11/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdb0d62fb1871cd63c94=
cbd
        failing since 2 days (last pass: next-20201208, first fail: next-20=
201214) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm  | lab-collabora   | gcc-8    | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdb0535b6abebe16fc94ccc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201217/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201217/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdb0535b6abebe16fc94=
ccd
        new failure (last pass: next-20201208) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm  | lab-collabora   | gcc-8    | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdb0683d8d422d048c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201217/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201217/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdb0683d8d422d048c94=
cba
        failing since 2 days (last pass: next-20201208, first fail: next-20=
201214) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
rk3288-veyron-jaq            | arm  | lab-collabora   | clang-10 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdb182350ec3a7829c94cc1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201217/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201217/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdb182350ec3a7829c94=
cc2
        new failure (last pass: next-20201208) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
rk3288-veyron-jaq            | arm  | lab-collabora   | clang-11 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdb1053c4e73a6599c94cba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201212122539+abeec=
5d081f-1~exp1~20201211233153.145)
  Plain log:   https://storage.kernelci.org//next/master/next-20201217/arm/=
multi_v7_defconfig/clang-11/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201217/arm/=
multi_v7_defconfig/clang-11/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdb1053c4e73a6599c94=
cbb
        failing since 2 days (last pass: next-20201208, first fail: next-20=
201214) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
rk3288-veyron-jaq            | arm  | lab-collabora   | gcc-8    | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdb053396e59aa45ac94ce8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201217/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201217/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdb053396e59aa45ac94=
ce9
        new failure (last pass: next-20201208) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
rk3288-veyron-jaq            | arm  | lab-collabora   | gcc-8    | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdb0ad03146a32bdbc94ccd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201217/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201217/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdb0ad03146a32bdbc94=
cce
        failing since 2 days (last pass: next-20201208, first fail: next-20=
201214) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
tegra124-nyan-big            | arm  | lab-collabora   | gcc-8    | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdb03c719ff9ed1cdc94ccf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201217/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201217/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdb03c719ff9ed1cdc94=
cd0
        new failure (last pass: next-20201208) =

 =20
