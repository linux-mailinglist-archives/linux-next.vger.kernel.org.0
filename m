Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D05754669E
	for <lists+linux-next@lfdr.de>; Fri, 10 Jun 2022 14:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245562AbiFJM1N (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jun 2022 08:27:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233151AbiFJM1M (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Jun 2022 08:27:12 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4022286803
        for <linux-next@vger.kernel.org>; Fri, 10 Jun 2022 05:27:08 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id u18so22678708plb.3
        for <linux-next@vger.kernel.org>; Fri, 10 Jun 2022 05:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=lmgd2F83ImETnLB3F/IxmuL0Pa8T6htAlQQ2MtrgmPY=;
        b=is3MsLRUPpkeUPgldxM+E8xs1x1yRGaq+xptdkpAKn8L8+B78BMY4zMvJilkCK0EXw
         nuQ0aBHTT5JFJkt8RNIWPg9IwAEKO+ML1qamckCA6+TasdtIlU9+eRf1rAo+YIjJdo0L
         hpwKctdXhKp6U3MR90IJPttuN3FDO8i5a+9V9DTpN59Zn0LFvDpnySD1rKQxCJgJBInH
         O+rSlpgO+0JxM27PdQB6M88Pm9cdBgkX0DtKnirkOUTbATJzDL5a9PklmnjY36nPQmQY
         7IHraLwFu4oonsBjbZGkKCn6jLeKZQ70e/jRTYy99wbtect13RZXAvDQNwdH/b0BhmmV
         ZOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=lmgd2F83ImETnLB3F/IxmuL0Pa8T6htAlQQ2MtrgmPY=;
        b=N6taUjopiBIMGQ6lMCedJcxcvpDGF+QwaZq5JHBsi8vy/VtXx82v0V/VRSJciHgLXc
         bovQRHlXGU+sKD4hnhCYp1sAIgISurBdiSZa4JAgATgwUGPPnIqi206VuNhQ99NPekjN
         AdIVpSA+hzCgWnHU1RfXIOyoQCnjSVzQLxWL8OL+M3Qf9NYhh8L75nwGUm5ATJu7ckCc
         r3h2e/o2zvplw5Vb1geVHjVWY6lb9V4Do3Vr2cD+frGPszmRROrmctLcHIaMN8dhu+Uf
         rnAFGNzDNJMGkydQsleG33zrhIwhpi3lyPmJxnNswjaMIV+AcCztyuB4YKhrpbjRbq1U
         5h+w==
X-Gm-Message-State: AOAM532ru0nZPEDImmuJXjxNMOVi6j8SKYYI5U0KkujUh8yKwqeTWynU
        YfB7SScyT3jIXk3jpTBvy4q5CWbQrLw7XFiyF0g=
X-Google-Smtp-Source: ABdhPJxST5t63pInfropMi3brfS+X61KsoTYKLMwwezzsfLtaVufsB6qsn9JyYllktjlWcpVo7DlPA==
X-Received: by 2002:a17:90a:cf0f:b0:1e2:e62b:fd3 with SMTP id h15-20020a17090acf0f00b001e2e62b0fd3mr8729534pju.107.1654864027852;
        Fri, 10 Jun 2022 05:27:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w10-20020aa7858a000000b0051bce5dc754sm16998957pfn.194.2022.06.10.05.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 05:27:07 -0700 (PDT)
Message-ID: <62a3389b.1c69fb81.4fd99.f187@mx.google.com>
Date:   Fri, 10 Jun 2022 05:27:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20220610
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 664 runs, 35 regressions (next-20220610)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 664 runs, 35 regressions (next-20220610)

Regressions Summary
-------------------

platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
at91-sama5d4_xplained       | arm   | lab-baylibre    | clang-15 | multi_v7=
_defconfig           | 1          =

at91-sama5d4_xplained       | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

at91-sama5d4_xplained       | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defconfig           | 1          =

imx6dl-udoo                 | arm   | lab-broonie     | gcc-10   | imx_v6_v=
7_defconfig          | 1          =

imx6qp-sabresd              | arm   | lab-nxp         | gcc-10   | imx_v6_v=
7_defconfig          | 1          =

imx6ul-pico-hobbit          | arm   | lab-pengutronix | gcc-10   | imx_v6_v=
7_defconfig          | 1          =

imx6ul-pico-hobbit          | arm   | lab-pengutronix | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

imx6ul-pico-hobbit          | arm   | lab-pengutronix | gcc-10   | multi_v7=
_defconfig           | 1          =

imx7ulp-evk                 | arm   | lab-nxp         | gcc-10   | imx_v6_v=
7_defconfig          | 1          =

jetson-tk1                  | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

mt8173-elm-hana             | arm64 | lab-collabora   | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

rk3399-gru-kevin            | arm64 | lab-collabora   | gcc-10   | defconfi=
g+arm64-chromebook   | 3          =

sun50i-a64-bananapi-m64     | arm64 | lab-clabbe      | clang-15 | defconfi=
g                    | 1          =

sun50i-a64-bananapi-m64     | arm64 | lab-clabbe      | gcc-10   | defconfi=
g+crypto             | 1          =

sun50i-a64-bananapi-m64     | arm64 | lab-clabbe      | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-pine64-plus      | arm64 | lab-broonie     | clang-15 | defconfi=
g                    | 1          =

sun50i-a64-pine64-plus      | arm64 | lab-broonie     | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-nanopi-neo-plus2  | arm64 | lab-clabbe      | clang-15 | defconfi=
g                    | 1          =

sun50i-h5-nanopi-neo-plus2  | arm64 | lab-clabbe      | gcc-10   | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =

sun50i-h5-nanopi-neo-plus2  | arm64 | lab-clabbe      | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-nanopi-neo-plus2  | arm64 | lab-clabbe      | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe      | gcc-10   | defconfi=
g                    | 1          =

sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe      | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe      | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64          | arm64 | lab-collabora   | gcc-10   | defconfi=
g+crypto             | 1          =

sun50i-h6-pine-h64          | arm64 | lab-collabora   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

sun8i-a33-olinuxino         | arm   | lab-clabbe      | gcc-10   | multi_v7=
_defconfig           | 1          =

sun8i-h2-plus-orangepi-zero | arm   | lab-baylibre    | clang-15 | multi_v7=
_defconfig           | 1          =

sun8i-h3-bananapi-m2-plus   | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

sun8i-h3-bananapi-m2-plus   | arm   | lab-baylibre    | gcc-10   | sunxi_de=
fconfig              | 1          =

sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe      | gcc-10   | multi_v7=
_defc...BIG_ENDIAN=3Dy | 1          =

sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe      | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe      | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220610/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220610
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6d0c806803170f120f8cb97b321de7bd89d3a791 =



Test Regressions
---------------- =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
at91-sama5d4_xplained       | arm   | lab-baylibre    | clang-15 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62a30763d7d06b7606a39bdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-15 (Debian clang version 15.0.0-++20220606071849+8daf2=
3d36400-1~exp1~20220606071935.278)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm/=
multi_v7_defconfig/clang-15/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm/=
multi_v7_defconfig/clang-15/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a30763d7d06b7606a39=
be0
        failing since 4 days (last pass: next-20220602, first fail: next-20=
220606) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
at91-sama5d4_xplained       | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62a300f1f4a317119fa39c02

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-at=
91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-at=
91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a300f1f4a317119fa39=
c03
        new failure (last pass: next-20220607) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
at91-sama5d4_xplained       | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62a302068eb80e7fa7a39c00

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a302068eb80e7fa7a39=
c01
        new failure (last pass: next-20220602) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
imx6dl-udoo                 | arm   | lab-broonie     | gcc-10   | imx_v6_v=
7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62a2fee7b1a176b93ea39bd1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a2fee7b1a176b93ea39=
bd2
        new failure (last pass: next-20220607) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
imx6qp-sabresd              | arm   | lab-nxp         | gcc-10   | imx_v6_v=
7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62a2ff39bdf0d1db25a39bef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6qp-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6qp-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a2ff39bdf0d1db25a39=
bf0
        new failure (last pass: next-20220601) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
imx6ul-pico-hobbit          | arm   | lab-pengutronix | gcc-10   | imx_v6_v=
7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62a2ff7bfb4e5c3fe8a39be5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a2ff7bfb4e5c3fe8a39=
be6
        failing since 31 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: next-20220509) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
imx6ul-pico-hobbit          | arm   | lab-pengutronix | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62a3011f1df1e5e8c9a39c22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a3011f1df1e5e8c9a39=
c23
        failing since 31 days (last pass: next-20211207, first fail: next-2=
0220509) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
imx6ul-pico-hobbit          | arm   | lab-pengutronix | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62a3032847e797460ea39bd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a3032847e797460ea39=
bd9
        failing since 31 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: next-20220509) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
imx7ulp-evk                 | arm   | lab-nxp         | gcc-10   | imx_v6_v=
7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62a2ff382363a31a59a39bda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a2ff382363a31a59a39=
bdb
        new failure (last pass: next-20220601) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
jetson-tk1                  | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62a300319493b37f98a39c16

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a300319493b37f98a39=
c17
        failing since 59 days (last pass: next-20220401, first fail: next-2=
0220411) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
mt8173-elm-hana             | arm64 | lab-collabora   | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62a2ffa4461828cd67a39bfa

  Results:     19 PASS, 11 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/62a2ffa4461828cd67a39c0f
        new failure (last pass: next-20220601)

    2022-06-10T08:23:45.054615  /lava-6581066/1/../bin/lava-test-case
    2022-06-10T08:23:45.066672  <8>[   43.015482] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
rk3399-gru-kevin            | arm64 | lab-collabora   | gcc-10   | defconfi=
g+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/62a3021be37b90e902a39bde

  Results:     84 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62a3021be37b90e902a39c23
        failing since 44 days (last pass: next-20220421, first fail: next-2=
0220426)

    2022-06-10T08:34:18.035420  /lava-6581088/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62a3021be37b90e902a39c24
        failing since 44 days (last pass: next-20220421, first fail: next-2=
0220426)

    2022-06-10T08:34:16.008088  <8>[   49.751431] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>
    2022-06-10T08:34:17.010768  /lava-6581088/1/../bin/lava-test-case
    2022-06-10T08:34:17.027899  <8>[   50.771917] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62a3021be37b90e902a39c25
        failing since 44 days (last pass: next-20220421, first fail: next-2=
0220426)

    2022-06-10T08:34:14.976031  <8>[   48.719305] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dpass>
    2022-06-10T08:34:15.160027  <4>[   48.903025] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-06-10T08:34:15.991466  /lava-6581088/1/../bin/lava-test-case   =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun50i-a64-bananapi-m64     | arm64 | lab-clabbe      | clang-15 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62a30658bf91b8074fa39be1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-15 (Debian clang version 15.0.0-++20220606071849+8daf2=
3d36400-1~exp1~20220606071935.278)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig/clang-15/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig/clang-15/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a30658bf91b8074fa39=
be2
        failing since 4 days (last pass: next-20220603, first fail: next-20=
220606) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun50i-a64-bananapi-m64     | arm64 | lab-clabbe      | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62a3033747e797460ea39bfd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a3033747e797460ea39=
bfe
        failing since 6 days (last pass: next-20220602, first fail: next-20=
220603) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun50i-a64-bananapi-m64     | arm64 | lab-clabbe      | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62a309a0efd35a8f6ea39be0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a309a0efd35a8f6ea39=
be1
        failing since 6 days (last pass: next-20220602, first fail: next-20=
220603) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus      | arm64 | lab-broonie     | clang-15 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62a3048b062c62ff96a39bec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-15 (Debian clang version 15.0.0-++20220606071849+8daf2=
3d36400-1~exp1~20220606071935.278)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig/clang-15/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig/clang-15/lab-broonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a3048b062c62ff96a39=
bed
        failing since 3 days (last pass: next-20220523, first fail: next-20=
220607) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus      | arm64 | lab-broonie     | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62a307fad7ae7966e4a39be5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-sun50i-a=
64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-sun50i-a=
64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a307fad7ae7966e4a39=
be6
        failing since 3 days (last pass: next-20220527, first fail: next-20=
220607) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun50i-h5-nanopi-neo-plus2  | arm64 | lab-clabbe      | clang-15 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62a304a5062c62ff96a39c76

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-15 (Debian clang version 15.0.0-++20220606071849+8daf2=
3d36400-1~exp1~20220606071935.278)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig/clang-15/lab-clabbe/baseline-sun50i-h5-nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig/clang-15/lab-clabbe/baseline-sun50i-h5-nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a304a5062c62ff96a39=
c77
        failing since 4 days (last pass: next-20220603, first fail: next-20=
220606) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun50i-h5-nanopi-neo-plus2  | arm64 | lab-clabbe      | gcc-10   | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62a3065dbf91b8074fa39bed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h5-=
nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h5-=
nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a3065dbf91b8074fa39=
bee
        failing since 6 days (last pass: next-20220602, first fail: next-20=
220603) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun50i-h5-nanopi-neo-plus2  | arm64 | lab-clabbe      | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62a307c64562241cdaa39bd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h5=
-nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h5=
-nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a307c64562241cdaa39=
bd9
        failing since 9 days (last pass: next-20220531, first fail: next-20=
220601) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun50i-h5-nanopi-neo-plus2  | arm64 | lab-clabbe      | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62a3091a32dab5844aa39be0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h5-=
nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h5-=
nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a3091a32dab5844aa39=
be1
        failing since 4 days (last pass: next-20220603, first fail: next-20=
220606) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe      | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62a30d8932438fbc66a39bdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a30d8932438fbc66a39=
bdd
        failing since 4 days (last pass: next-20220602, first fail: next-20=
220606) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe      | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62a3115d0a6a995a6da39bd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6=
-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6=
-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a3115d0a6a995a6da39=
bd3
        failing since 9 days (last pass: next-20220526, first fail: next-20=
220601) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe      | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62a312b1f6811cd477a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a312b1f6811cd477a39=
bce
        failing since 4 days (last pass: next-20220603, first fail: next-20=
220606) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64          | arm64 | lab-collabora   | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62a3021f3c867e71e5a39be4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a3021f3c867e71e5a39=
be5
        failing since 4 days (last pass: next-20220603, first fail: next-20=
220606) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64          | arm64 | lab-collabora   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62a304e4e6c7fc53dda39be4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a304e4e6c7fc53dda39=
be5
        failing since 6 days (last pass: next-20220602, first fail: next-20=
220603) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun8i-a33-olinuxino         | arm   | lab-clabbe      | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62a313015dcbb63a13a39bd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a33-olinuxino.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a33-olinuxino.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a313015dcbb63a13a39=
bd3
        new failure (last pass: next-20220603) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun8i-h2-plus-orangepi-zero | arm   | lab-baylibre    | clang-15 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62a30931ab674acf9fa39be2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-15 (Debian clang version 15.0.0-++20220606071849+8daf2=
3d36400-1~exp1~20220606071935.278)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm/=
multi_v7_defconfig/clang-15/lab-baylibre/baseline-sun8i-h2-plus-orangepi-ze=
ro.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm/=
multi_v7_defconfig/clang-15/lab-baylibre/baseline-sun8i-h2-plus-orangepi-ze=
ro.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a30931ab674acf9fa39=
be3
        new failure (last pass: next-20220606) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun8i-h3-bananapi-m2-plus   | arm   | lab-baylibre    | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62a301e4b32c82f998a39bfa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n8i-h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a301e4b32c82f998a39=
bfb
        failing since 3 days (last pass: next-20220606, first fail: next-20=
220607) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun8i-h3-bananapi-m2-plus   | arm   | lab-baylibre    | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/62a2fe57620dd925e5a39bd9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a2fe57620dd925e5a39=
bda
        failing since 3 days (last pass: next-20220602, first fail: next-20=
220607) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe      | gcc-10   | multi_v7=
_defc...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62a301cf5dd27ed141a39bdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm/=
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-clabbe/baseline-sun=
8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm/=
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-clabbe/baseline-sun=
8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armeb/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a301cf5dd27ed141a39=
be0
        new failure (last pass: next-20220606) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe      | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62a31789d5e2672443a39bd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun8=
i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun8=
i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a31789d5e2672443a39=
bd3
        failing since 4 days (last pass: next-20220603, first fail: next-20=
220606) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe      | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/62a2fed7d265bd502ba39bf9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220610/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220610/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62a2fed7d265bd502ba39=
bfa
        failing since 3 days (last pass: next-20220603, first fail: next-20=
220607) =

 =20
