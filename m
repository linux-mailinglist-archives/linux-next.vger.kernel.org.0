Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55882584466
	for <lists+linux-next@lfdr.de>; Thu, 28 Jul 2022 18:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231586AbiG1QwB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Jul 2022 12:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbiG1Qv6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Jul 2022 12:51:58 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 144AF70E46
        for <linux-next@vger.kernel.org>; Thu, 28 Jul 2022 09:51:55 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id e16so2390517pfm.11
        for <linux-next@vger.kernel.org>; Thu, 28 Jul 2022 09:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6tuFelb72vuxRM4JH7ilFWS3NkjVXzsQ+4h4xbleyhg=;
        b=coqiai2o1NDbWVPjecZdWhShdhnQiDBcXZBFs85Gby+0+DqDJRSO9ou2cTcCthSECQ
         OKnceETUnpNmAIfIzuqtCUz4QNohyZXuM9sx2jd8NrlY2lxbVt7HA+2Yj5Lotzf4yDAu
         CUpdqNEKxIjvh4CYGUekNHQWPSYh4VVoJZibdajEidCglIda6nmXCQjNn1SPXaAphEXc
         DgY45ETM0Gr0CSuYf5AU2+ABWlowJh0TcMGt0MUYsfTXFhhvaRGZ2udaQ5O+xZQP/655
         3/X9LJf6/5DT0i1a8mtXqJtrBw2o482gfulMuT7QVT2Tvui0Fc1AemAcXSOZn65gWnx/
         RuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6tuFelb72vuxRM4JH7ilFWS3NkjVXzsQ+4h4xbleyhg=;
        b=RrwQFhCCBlw74dv57zJYueVlq9TDBsRTFuTJEp412t7JEUbSIHK41SCjFWa0hCAJWA
         eBg8daygp+k46bg/XDgd1LpUzfXQx20u0ilGesErixCyH0qmU+nTgcnT7zVOGOcpUf+y
         ciMgHkxA4D9fSS4zPQ8fTOJW1LFOQ+FQTWcBTJH7GL9J6vK+++5LieGErX/o0auk1JM4
         FEo8hVBax7lnOJ0d/JX1mCpmDFzNbMdJh0YuSBYiJm29PwigkmBpo/qFcHWg5LagDkEO
         +eMvbxBpWnMbWRvpyuzPrZPDTT8ofCgNyga/alydhxm9OiGkEHhWLe10E07TR8SEJKw7
         eyiA==
X-Gm-Message-State: AJIora8Ukpv0lqCuUj2Zp9vNvxvXeEa8k4+51ca7Km21HDN4X5k8KA+M
        ARhaTodqHf+2ZAtFCRD3uWFHzX6WO/xuz5rh
X-Google-Smtp-Source: AGRyM1t1R+gEkJyUKmNkttmDmuj/jVS4Mi3weoNgJ6nX56HRptbh39VEyaNl+v+eJkCKlMU1HA2yTg==
X-Received: by 2002:a65:6b93:0:b0:41b:823d:416f with SMTP id d19-20020a656b93000000b0041b823d416fmr664530pgw.262.1659027114050;
        Thu, 28 Jul 2022 09:51:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x134-20020a62868c000000b0050dc7628178sm1019859pfd.82.2022.07.28.09.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 09:51:53 -0700 (PDT)
Message-ID: <62e2bea9.620a0220.812c7.167d@mx.google.com>
Date:   Thu, 28 Jul 2022 09:51:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20220728
Subject: next/master baseline: 343 runs, 22 regressions (next-20220728)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 343 runs, 22 regressions (next-20220728)

Regressions Summary
-------------------

platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
beaglebone-black   | arm   | lab-broonie     | clang-15 | multi_v7_defconfi=
g           | 1          =

beaglebone-black   | arm   | lab-cip         | clang-15 | multi_v7_defconfi=
g           | 1          =

beaglebone-black   | arm   | lab-broonie     | gcc-10   | multi_v7_defconfi=
g           | 1          =

beaglebone-black   | arm   | lab-broonie     | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =

beaglebone-black   | arm   | lab-broonie     | gcc-10   | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =

beaglebone-black   | arm   | lab-cip         | gcc-10   | multi_v7_defconfi=
g           | 1          =

beaglebone-black   | arm   | lab-cip         | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =

beaglebone-black   | arm   | lab-cip         | gcc-10   | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =

beaglebone-black   | arm   | lab-broonie     | gcc-10   | omap2plus_defconf=
ig          | 1          =

beaglebone-black   | arm   | lab-cip         | gcc-10   | omap2plus_defconf=
ig          | 1          =

imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =

imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defconfi=
g           | 1          =

imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =

imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =

imx7d-sdb          | arm   | lab-nxp         | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =

imx7ulp-evk        | arm   | lab-nxp         | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =

kontron-pitx-imx8m | arm64 | lab-kontron     | gcc-10   | defconfig+crypto =
            | 2          =

rk3399-roc-pc      | arm64 | lab-clabbe      | gcc-10   | defconfig        =
            | 1          =

rk3399-roc-pc      | arm64 | lab-clabbe      | gcc-10   | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =

rk3399-roc-pc      | arm64 | lab-clabbe      | gcc-10   | defconfig+ima    =
            | 1          =

rk3399-roc-pc      | arm64 | lab-clabbe      | gcc-10   | defconfig+crypto =
            | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220728/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220728
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7c5e07b73ff3011c9b82d4a3286a3362b951ad2b =



Test Regressions
---------------- =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
beaglebone-black   | arm   | lab-broonie     | clang-15 | multi_v7_defconfi=
g           | 1          =


  Details:     https://kernelci.org/test/plan/id/62e285bc784607bd1bdaf0cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-15 (Debian clang version 15.0.0-++20220719071818+5fc62=
1355110-1~exp1~20220719071918.324)
  Plain log:   https://storage.kernelci.org//next/master/next-20220728/arm/=
multi_v7_defconfig/clang-15/lab-broonie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220728/arm/=
multi_v7_defconfig/clang-15/lab-broonie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62e285bc784607bd1bdaf=
0ce
        failing since 42 days (last pass: next-20220610, first fail: next-2=
0220616) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
beaglebone-black   | arm   | lab-cip         | clang-15 | multi_v7_defconfi=
g           | 1          =


  Details:     https://kernelci.org/test/plan/id/62e28efd3ff4a94c0cdaf074

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-15 (Debian clang version 15.0.0-++20220719071818+5fc62=
1355110-1~exp1~20220719071918.324)
  Plain log:   https://storage.kernelci.org//next/master/next-20220728/arm/=
multi_v7_defconfig/clang-15/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220728/arm/=
multi_v7_defconfig/clang-15/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62e28efd3ff4a94c0cdaf=
075
        failing since 42 days (last pass: next-20220610, first fail: next-2=
0220616) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
beaglebone-black   | arm   | lab-broonie     | gcc-10   | multi_v7_defconfi=
g           | 1          =


  Details:     https://kernelci.org/test/plan/id/62e283a1680d3d1ceadaf071

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220728/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220728/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62e283a1680d3d1ceadaf=
072
        failing since 42 days (last pass: next-20220610, first fail: next-2=
0220616) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
beaglebone-black   | arm   | lab-broonie     | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62e284f4d8504cfba4daf064

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220728/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-bea=
glebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220728/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-bea=
glebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62e284f4d8504cfba4daf=
065
        failing since 42 days (last pass: next-20220610, first fail: next-2=
0220616) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
beaglebone-black   | arm   | lab-broonie     | gcc-10   | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62e2878816030361a9daf0c7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220728/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-beaglebone-bl=
ack.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220728/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-beaglebone-bl=
ack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62e2878816030361a9daf=
0c8
        failing since 42 days (last pass: next-20220602, first fail: next-2=
0220616) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
beaglebone-black   | arm   | lab-cip         | gcc-10   | multi_v7_defconfi=
g           | 1          =


  Details:     https://kernelci.org/test/plan/id/62e2881ef0e7b8f00fdaf07b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220728/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220728/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62e2881ef0e7b8f00fdaf=
07c
        failing since 42 days (last pass: next-20220610, first fail: next-2=
0220616) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
beaglebone-black   | arm   | lab-cip         | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62e28d452b3ad1f064daf0cc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220728/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220728/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62e28d452b3ad1f064daf=
0cd
        failing since 42 days (last pass: next-20220610, first fail: next-2=
0220616) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
beaglebone-black   | arm   | lab-cip         | gcc-10   | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62e295dd0d05dee6a6daf084

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220728/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-beaglebone-black.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220728/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-beaglebone-black.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62e295dd0d05dee6a6daf=
085
        failing since 42 days (last pass: next-20220602, first fail: next-2=
0220616) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
beaglebone-black   | arm   | lab-broonie     | gcc-10   | omap2plus_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62e28376949777673adaf06f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220728/arm/=
omap2plus_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220728/arm/=
omap2plus_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62e28376949777673adaf=
070
        failing since 40 days (last pass: next-20220610, first fail: next-2=
0220617) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
beaglebone-black   | arm   | lab-cip         | gcc-10   | omap2plus_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62e282ce066a85a1afdaf056

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220728/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220728/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62e282ce066a85a1afdaf=
057
        failing since 40 days (last pass: next-20220610, first fail: next-2=
0220617) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62e295350017541c0bdaf06c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220728/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220728/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62e295350017541c0bdaf=
06d
        failing since 79 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: next-20220509) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defconfi=
g           | 1          =


  Details:     https://kernelci.org/test/plan/id/62e295c1698054724ddaf070

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220728/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220728/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62e295c1698054724ddaf=
071
        failing since 79 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: next-20220509) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62e297b63a89653ecadaf056

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220728/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220728/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62e297b63a89653ecadaf=
057
        failing since 79 days (last pass: next-20211207, first fail: next-2=
0220509) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62e29d1ab7b7f05883daf057

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220728/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6ul-pi=
co-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220728/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6ul-pi=
co-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62e29d1ab7b7f05883daf=
058
        failing since 79 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: next-20220509) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx7d-sdb          | arm   | lab-nxp         | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62e282e6066a85a1afdaf09d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220728/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220728/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62e282e6066a85a1afdaf=
09e
        failing since 9 days (last pass: next-20220707, first fail: next-20=
220718) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx7ulp-evk        | arm   | lab-nxp         | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62e288af1450ac9986daf07d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220728/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220728/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62e288af1450ac9986daf=
07e
        failing since 48 days (last pass: next-20220601, first fail: next-2=
0220610) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
kontron-pitx-imx8m | arm64 | lab-kontron     | gcc-10   | defconfig+crypto =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/62e28a956ac480df47daf07d

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220728/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220728/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/62e28a956ac480df47daf08b
        failing since 42 days (last pass: next-20220610, first fail: next-2=
0220616)

    2022-07-28T13:09:28.484959  /lava-146302/1/../bin/lava-test-case
    2022-07-28T13:09:28.485277  <8>[   19.387773] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-07-28T13:09:28.485446  /lava-146302/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/62e=
28a956ac480df47daf08d
        failing since 42 days (last pass: next-20220610, first fail: next-2=
0220616)

    2022-07-28T13:09:29.522356  /lava-146302/1/../bin/lava-test-case
    2022-07-28T13:09:29.522899  <8>[   20.431832] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-07-28T13:09:29.523066  /lava-146302/1/../bin/lava-test-case
    2022-07-28T13:09:29.523270  <8>[   20.451688] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>
    2022-07-28T13:09:29.523436  /lava-146302/1/../bin/lava-test-case
    2022-07-28T13:09:29.523597  <8>[   20.472001] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb0-probed RESULT=3Dpass>
    2022-07-28T13:09:29.523745  /lava-146302/1/../bin/lava-test-case   =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
rk3399-roc-pc      | arm64 | lab-clabbe      | gcc-10   | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/62e28648a62cb6ae49daf068

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220728/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220728/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62e28648a62cb6ae49daf=
069
        failing since 1 day (last pass: next-20220719, first fail: next-202=
20726) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
rk3399-roc-pc      | arm64 | lab-clabbe      | gcc-10   | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62e286ff197030dd9edaf063

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220728/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-rk3399-roc=
-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220728/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-rk3399-roc=
-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62e286ff197030dd9edaf=
064
        failing since 5 days (last pass: next-20220719, first fail: next-20=
220722) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
rk3399-roc-pc      | arm64 | lab-clabbe      | gcc-10   | defconfig+ima    =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/62e289f70fc633e61cdaf0a5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220728/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220728/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62e289f70fc633e61cdaf=
0a6
        failing since 21 days (last pass: next-20220705, first fail: next-2=
0220706) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
rk3399-roc-pc      | arm64 | lab-clabbe      | gcc-10   | defconfig+crypto =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/62e28a58fb433110c4daf087

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220728/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220728/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62e28a58fb433110c4daf=
088
        failing since 9 days (last pass: next-20220707, first fail: next-20=
220718) =

 =20
