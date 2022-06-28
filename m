Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97B3F55D094
	for <lists+linux-next@lfdr.de>; Tue, 28 Jun 2022 15:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243998AbiF1Gti (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Jun 2022 02:49:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243262AbiF1Gth (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Jun 2022 02:49:37 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 975352611A
        for <linux-next@vger.kernel.org>; Mon, 27 Jun 2022 23:49:31 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id d14so11657793pjs.3
        for <linux-next@vger.kernel.org>; Mon, 27 Jun 2022 23:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=l/BCyhFoLj0GuKKUDGUjudkmYweKK2EKxOtvq6MBXbs=;
        b=A+eFICD45nTV4lj0fFWf9te+gEIC1hQdIbyu40siQknRbiQkwnZjRCc/CcMSnO8CXH
         ASj8C/OyH92BZ3eOBiiKnUIC76K6Eb/BArMem4q7OE4bdYXG+hy5DKjx5+bMSCWMLUGm
         6idLo7HpjrPUPDJhF/2Vx1+eZov48NIKr6RNPwAHPARCvnpgk0966gJfRyqHC1lde2Uf
         mtEsb0SzXPpSVtqNeEvMkFn9LNa77qpYCEjqUXc+ZUY1jN/mkljNy5nPSfmo5zGwoRZ+
         bzKfmtH42jDsFMDII51IrLTjJFJyXMSzIXWEqrB82MPXcp2T+MYLObWSmlh7dtjbhFMX
         IjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=l/BCyhFoLj0GuKKUDGUjudkmYweKK2EKxOtvq6MBXbs=;
        b=kwva2HtqYIdrAzF/bBdyQMWf1ar44R7+HESmSkhAG5iuYBPx3MQFDd7fRm8Mz9TqDo
         rarzBX+XZarZ/oatnpVVWiQTIFs6SMF8UbRAmuBnb6JXwCfHCmxMzQ7gj7uB+mP5er0H
         knzabBG1lzLq6hmlRmiX3007ICLRWoloUGUqXd40rQlykvRJgHC9TVARMFTE+nq18dMa
         fI3nbqLsRYmN8idCcDGYDUkMr9UKIl2BmN1sp4S6x/MePZKOIZXttDQQuoj41KlKrHBu
         /rb/qR1gjxasB5MU/rfDsJxv0qNzNMkUAUvTHA3N4fwB1YE0HZISyFt9HMNtABsvggnI
         IllQ==
X-Gm-Message-State: AJIora+sF3oBpOMOSa+nWGbYdtKTaB25CDlalikinqEaaWcwxFjNgEFz
        e0kQNUux1J/bf1OsQqPPOJ9ux8lry15uVXo0
X-Google-Smtp-Source: AGRyM1tLlk8/700WZc+Yrdeem+u/x6Vf+fpdxOnvkLUAl1QOHcfUkAz7nMCNPIMFrwa1KuvUqbII+g==
X-Received: by 2002:a17:90a:68cf:b0:1ee:db09:739b with SMTP id q15-20020a17090a68cf00b001eedb09739bmr10411912pjj.179.1656398970462;
        Mon, 27 Jun 2022 23:49:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u12-20020a056a00098c00b00525184bad5csm8608815pfg.63.2022.06.27.23.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 23:49:29 -0700 (PDT)
Message-ID: <62baa479.1c69fb81.20b3f.c23b@mx.google.com>
Date:   Mon, 27 Jun 2022 23:49:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc4-221-g426ccb4c911a
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 564 runs,
 29 regressions (v5.19-rc4-221-g426ccb4c911a)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 564 runs, 29 regressions (v5.19-rc4-221-g426cc=
b4c911a)

Regressions Summary
-------------------

platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx6ul-pico-hobbit      | arm   | lab-pengutronix | gcc-10   | imx_v6_v7_de=
fconfig          | 1          =

imx6ul-pico-hobbit      | arm   | lab-pengutronix | gcc-10   | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit      | arm   | lab-pengutronix | gcc-10   | multi_v7_def=
config+ima       | 1          =

imx6ul-pico-hobbit      | arm   | lab-pengutronix | gcc-10   | multi_v7_def=
config           | 1          =

imx6ul-pico-hobbit      | arm   | lab-pengutronix | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

jetson-tk1              | arm   | lab-baylibre    | gcc-10   | multi_v7_def=
c...G_ARM_LPAE=3Dy | 1          =

jetson-tk1              | arm   | lab-baylibre    | gcc-10   | multi_v7_def=
config           | 1          =

jetson-tk1              | arm   | lab-baylibre    | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

jetson-tk1              | arm   | lab-baylibre    | gcc-10   | tegra_defcon=
fig              | 1          =

meson-gxbb-p200         | arm64 | lab-baylibre    | gcc-10   | defconfig+cr=
ypto             | 1          =

odroid-xu3              | arm   | lab-collabora   | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

rk3328-rock64           | arm64 | lab-baylibre    | gcc-10   | defconfig+im=
a                | 2          =

rk3328-rock64           | arm64 | lab-baylibre    | gcc-10   | defconfig+cr=
ypto             | 2          =

rk3328-rock64           | arm64 | lab-baylibre    | gcc-10   | defconfig   =
                 | 2          =

rk3328-rock64           | arm64 | lab-baylibre    | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =

rk3399-gru-kevin        | arm64 | lab-collabora   | gcc-10   | defconfig+ar=
m64-chromebook   | 4          =

rk3399-rock-pi-4b       | arm64 | lab-collabora   | gcc-10   | defconfig+im=
a                | 2          =

rk3399-rock-pi-4b       | arm64 | lab-collabora   | gcc-10   | defconfig+cr=
ypto             | 1          =

rk3399-rock-pi-4b       | arm64 | lab-collabora   | gcc-10   | defconfig   =
                 | 1          =

rk3399-rock-pi-4b       | arm64 | lab-collabora   | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.19-rc4-221-g426ccb4c911a/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.19-rc4-221-g426ccb4c911a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      426ccb4c911a392f6cb9799fa341e6c5e2a851f5 =



Test Regressions
---------------- =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx6ul-pico-hobbit      | arm   | lab-pengutronix | gcc-10   | imx_v6_v7_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62ba7d8eaf03f9d12aa39bce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-im=
x6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-im=
x6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ba7d8eaf03f9d12aa39=
bcf
        failing since 28 days (last pass: v5.16-rc4-241-g3e464b455df7, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx6ul-pico-hobbit      | arm   | lab-pengutronix | gcc-10   | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62ba7b4ab98c974dcca39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutron=
ix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutron=
ix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ba7b4ab98c974dcca39=
bce
        failing since 28 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx6ul-pico-hobbit      | arm   | lab-pengutronix | gcc-10   | multi_v7_def=
config+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62ba845a194e86a718a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ba845a194e86a718a39=
bce
        failing since 28 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx6ul-pico-hobbit      | arm   | lab-pengutronix | gcc-10   | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/62ba84e64e050025caa39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ba84e64e050025caa39=
bce
        failing since 2 days (last pass: v5.19-rc3-373-gd317111b3b1ae, firs=
t fail: v5.19-rc3-470-g4fc9c7cb4051) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx6ul-pico-hobbit      | arm   | lab-pengutronix | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ba88422aed91d103a39bdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ba88422aed91d103a39=
be0
        failing since 28 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
jetson-tk1              | arm   | lab-baylibre    | gcc-10   | multi_v7_def=
c...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ba977c6f1b189b45a39bce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ba977c6f1b189b45a39=
bcf
        failing since 59 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fir=
st fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
jetson-tk1              | arm   | lab-baylibre    | gcc-10   | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/62ba9a9cd746360e80a39bda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson=
-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson=
-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ba9a9cd746360e80a39=
bdb
        failing since 39 days (last pass: v5.18-rc7-165-g2424086909d29, fir=
st fail: v5.18-rc7-251-g195d7f7a62c6) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
jetson-tk1              | arm   | lab-baylibre    | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ba9eac062f914a1aa39bd9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ba9eac062f914a1aa39=
bda
        failing since 39 days (last pass: v5.18-rc7-165-g2424086909d29, fir=
st fail: v5.18-rc7-251-g195d7f7a62c6) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
jetson-tk1              | arm   | lab-baylibre    | gcc-10   | tegra_defcon=
fig              | 1          =


  Details:     https://kernelci.org/test/plan/id/62ba92e003e3ae798fa39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk=
1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk=
1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ba92e003e3ae798fa39=
bce
        new failure (last pass: v5.19-rc3-470-g4fc9c7cb4051) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
meson-gxbb-p200         | arm64 | lab-baylibre    | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62ba79507cb672c240a39bff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ba79507cb672c240a39=
c00
        new failure (last pass: v5.19-rc3-470-g4fc9c7cb4051) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
odroid-xu3              | arm   | lab-collabora   | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ba8dc87f6b354050a39bd1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ba8dc87f6b354050a39=
bd2
        new failure (last pass: v5.19-rc3-470-g4fc9c7cb4051) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3328-rock64           | arm64 | lab-baylibre    | gcc-10   | defconfig+im=
a                | 2          =


  Details:     https://kernelci.org/test/plan/id/62ba6b3be4fc79d42ba39bed

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-ro=
ck64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-ro=
ck64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62ba6b3be4fc79d=
42ba39bf0
        failing since 7 days (last pass: v5.18-rc7-216-g98dca003a752b, firs=
t fail: v5.19-rc3-342-g3bc66a8a3bd54)
        2 lines

    2022-06-28T02:44:56.652275  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-06-28T02:44:56.655884  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-06-28T02:44:56.662117  [   71.304141] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-28T02:44:56.662431  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62ba6b3be4fc79d=
42ba39bf1
        failing since 7 days (last pass: v5.18-rc7-216-g98dca003a752b, firs=
t fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-06-28T02:44:56.629668  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-06-28T02:44:56.630179  kern  :alert : Mem abort info:
    2022-06-28T02:44:56.630359  kern  :alert :   ESR =3D 0x0000000096000006
    2022-06-28T02:44:56.630853  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-06-28T02:44:56.631242  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-28T02:44:56.631411  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-28T02:44:56.631773  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-06-28T02:44:56.632152  kern  :alert : Data abort info:
    2022-06-28T02:44:56.632324  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-28T02:44:56.632681  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3328-rock64           | arm64 | lab-baylibre    | gcc-10   | defconfig+cr=
ypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/62ba6d94bb4707b805a39bfd

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328=
-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328=
-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62ba6d94bb4707b=
805a39c00
        failing since 7 days (last pass: v5.18-rc7-251-g195d7f7a62c6, first=
 fail: v5.19-rc3-342-g3bc66a8a3bd54)
        2 lines

    2022-06-28T02:54:59.960843  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-06-28T02:54:59.964397  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-06-28T02:54:59.973266  [   71.206576] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-28T02:54:59.973569  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62ba6d94bb4707b=
805a39c01
        failing since 7 days (last pass: v5.18-rc7-251-g195d7f7a62c6, first=
 fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-06-28T02:54:59.939577  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-06-28T02:54:59.940099  kern  :alert : Mem abort info:
    2022-06-28T02:54:59.940283  kern  :alert :   ESR =3D 0x0000000096000006
    2022-06-28T02:54:59.940679  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-06-28T02:54:59.941142  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-28T02:54:59.941387  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-28T02:54:59.941840  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-06-28T02:54:59.942288  kern  :alert : Data abort info:
    2022-06-28T02:54:59.942485  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-28T02:54:59.942716  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3328-rock64           | arm64 | lab-baylibre    | gcc-10   | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/62ba7028f07251c942a39c0c

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62ba7028f07251c=
942a39c0f
        failing since 7 days (last pass: v5.18-rc7-216-g98dca003a752b, firs=
t fail: v5.19-rc3-342-g3bc66a8a3bd54)
        2 lines

    2022-06-28T03:05:52.751929  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-06-28T03:05:52.755471  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-06-28T03:05:52.760067  [   69.143421] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-28T03:05:52.760335  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62ba7028f07251c=
942a39c10
        failing since 7 days (last pass: v5.18-rc7-216-g98dca003a752b, firs=
t fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-06-28T03:05:52.731064  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-06-28T03:05:52.731541  kern  :alert : Mem abort info:
    2022-06-28T03:05:52.731748  kern  :alert :   ESR =3D 0x0000000096000006
    2022-06-28T03:05:52.732171  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-06-28T03:05:52.732614  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-28T03:05:52.732898  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-28T03:05:52.733179  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-06-28T03:05:52.733450  kern  :alert : Data abort info:
    2022-06-28T03:05:52.733698  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-28T03:05:52.733960  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3328-rock64           | arm64 | lab-baylibre    | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62ba70b41c22e491d2a39bcf

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62ba70b41c22e49=
1d2a39bd2
        failing since 7 days (last pass: v5.18-rc7-216-g98dca003a752b, firs=
t fail: v5.19-rc3-342-g3bc66a8a3bd54)
        2 lines

    2022-06-28T03:08:15.473479  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-06-28T03:08:15.476080  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-06-28T03:08:15.482425  [   71.188963] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-28T03:08:15.482727  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62ba70b41c22e49=
1d2a39bd3
        failing since 7 days (last pass: v5.18-rc7-216-g98dca003a752b, firs=
t fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-06-28T03:08:15.452573  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-06-28T03:08:15.453148  kern  :alert : Mem abort info:
    2022-06-28T03:08:15.453398  kern  :alert :   ESR =3D 0x0000000096000006
    2022-06-28T03:08:15.453729  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-06-28T03:08:15.454109  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-28T03:08:15.454275  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-28T03:08:15.454624  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-06-28T03:08:15.455062  kern  :alert : Data abort info:
    2022-06-28T03:08:15.455243  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-28T03:08:15.455596  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3399-gru-kevin        | arm64 | lab-collabora   | gcc-10   | defconfig+ar=
m64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/62ba735671e564a65ea39bf9

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62ba735671e564a65ea39c1f
        failing since 120 days (last pass: v5.17-rc5-244-gd77a1b37f796, fir=
st fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-06-28T03:19:39.701608  /lava-6693841/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62ba735671e564a65ea39c42
        failing since 28 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-06-28T03:19:36.459538  <8>[   51.780230] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>
    2022-06-28T03:19:37.490308  /lava-6693841/1/../bin/lava-test-case
    2022-06-28T03:19:37.502035  <8>[   52.824124] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62ba735671e564a65ea39c43
        failing since 28 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-06-28T03:19:35.413435  <8>[   50.734952] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>
    2022-06-28T03:19:36.446424  /lava-6693841/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62ba735671e564a65ea39c44
        failing since 28 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-06-28T03:19:34.358770  <8>[   49.680750] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dpass>
    2022-06-28T03:19:35.401015  /lava-6693841/1/../bin/lava-test-case   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3399-rock-pi-4b       | arm64 | lab-collabora   | gcc-10   | defconfig+im=
a                | 2          =


  Details:     https://kernelci.org/test/plan/id/62ba6b47c074dbcaa0a39bd0

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-r=
ock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-r=
ock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62ba6b47c074dbc=
aa0a39bd3
        failing since 7 days (last pass: v5.19-rc1-331-g13bdc020d5006, firs=
t fail: v5.19-rc3-342-g3bc66a8a3bd54)
        2 lines

    2022-06-28T02:45:16.075788  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-06-28T02:45:16.076320  <8>[   59.604975] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-28T02:45:16.076670  + set +x
    2022-06-28T02:45:16.076994  <8>[   59.606954] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 6693555_1.5.2.4.1>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62ba6b47c074dbc=
aa0a39bd4
        failing since 7 days (last pass: v5.19-rc1-331-g13bdc020d5006, firs=
t fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-06-28T02:45:16.031522  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-28T02:45:16.032059  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-06-28T02:45:16.032409  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000799c3000
    2022-06-28T02:45:16.032731  kern  :alert : [0000000000000005] pgd=3D080=
00000799c5003, p4d=3D08000000799c5003, pud=3D08000000799c6003, pmd=3D000000=
0000000000
    2022-06-28T02:45:16.033046  <8>[   59.585187] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-06-28T02:45:16.033355  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3399-rock-pi-4b       | arm64 | lab-collabora   | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62ba6d9dc1a586bf31a39bd4

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-rk339=
9-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-rk339=
9-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62ba6d9dc1a586b=
f31a39bd8
        failing since 7 days (last pass: v5.19-rc2-431-gba1eaf33689d0, firs=
t fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-06-28T02:55:11.676063  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-28T02:55:11.676169  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-06-28T02:55:11.676244  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000799ec000
    2022-06-28T02:55:11.676364  kern  :alert : [0000000000000005] pgd=3D080=
00000799ed003, p4d=3D08000000799ed003, pud=3D08000000799ee003, pmd=3D000000=
0000000000
    2022-06-28T02:55:11.676459  <8>[   59.914711] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-06-28T02:55:11.676553  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3399-rock-pi-4b       | arm64 | lab-collabora   | gcc-10   | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/62ba6e198b8e490b33a39bec

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-=
pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-=
pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62ba6e198b8e490=
b33a39bf0
        failing since 7 days (last pass: v5.19-rc2-431-gba1eaf33689d0, firs=
t fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-06-28T02:57:20.776082  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-28T02:57:20.776166  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-06-28T02:57:20.776233  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000079903000
    2022-06-28T02:57:20.776294  kern  :alert : [0000000000000005] pgd=3D080=
0000079904003, p4d=3D0800000079904003, pud=3D0800000079905003, pmd=3D000000=
0000000000
    2022-06-28T02:57:20.776355  <8>[   57.227640] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3399-rock-pi-4b       | arm64 | lab-collabora   | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ba6ed780528c7b9ba39bed

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-colla=
bora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-colla=
bora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62ba6ed780528c7=
b9ba39bf1
        failing since 7 days (last pass: v5.19-rc2-431-gba1eaf33689d0, firs=
t fail: v5.19-rc3-342-g3bc66a8a3bd54)
        12 lines

    2022-06-28T03:00:31.338869  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-28T03:00:31.339441  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-06-28T03:00:31.339791  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000079861000
    2022-06-28T03:00:31.340118  kern  :alert : [0000000000000005] pgd=3D080=
0000079862003, p4d=3D0800000079862003, pud=3D080000007985c003, pmd=3D000000=
0000000000
    2022-06-28T03:00:31.340439  <8>[   61.917430] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62ba6eea67874472f0a39c3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-a=
64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc4-2=
21-g426ccb4c911a/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-a=
64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ba6eea67874472f0a39=
c3e
        new failure (last pass: v5.19-rc3-470-g4fc9c7cb4051) =

 =20
