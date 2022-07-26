Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01B4558185A
	for <lists+linux-next@lfdr.de>; Tue, 26 Jul 2022 19:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239187AbiGZR2H (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jul 2022 13:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239077AbiGZR2H (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Jul 2022 13:28:07 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 589612B270
        for <linux-next@vger.kernel.org>; Tue, 26 Jul 2022 10:28:05 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id e132so13706136pgc.5
        for <linux-next@vger.kernel.org>; Tue, 26 Jul 2022 10:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jQk82xZQ8vvABQahe41s/pUxTom8qqKx1SAJWQD4s/k=;
        b=BgtpoKwReTPw2qe2UjQJA8CeCiVuq6BdCGtE6a0elvqHNQZWRIsxmFaFUkyxQFxW3X
         MM8pSE6u6OA3rt8Vn1Fe+51LwqapIT341DPS+D/f4aLdCstMsM/pvCtVF3faH87iZWLi
         9c+//Tlwwh6hiO7dwqFsyFgAjpbZooLE3XNfpy0bBWZL5JFHJmjAfE81VVxfNtujWAv4
         uUXKYT96tx22AXF2b7Nejsk5K7WqjmaMWsAxr5k3p2Y+N7jljc62wG4AX5c/bShVUNpA
         F8Br6tFaqKNr4A294ZffBCQZ9UOcibBvg8dN8doGkWOUDBbjPo+QoDKVi+I8APukak1s
         0uzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jQk82xZQ8vvABQahe41s/pUxTom8qqKx1SAJWQD4s/k=;
        b=5Pdq2nvp4zOY+T5gfiDNu0udKLuJePmQE8SktEcGqb7adJstt/K+jLMmt1N/GRZ0Xx
         Q3keAk4icALTBMNjTUF1igxXXKyu0UFZ/Bur05gG8CL3SQTLc6Ru5aljrZTWdXgYi55h
         Xr/1IQL3D33IwB9xCJjaQc7+F6fRo84BhtdbWffZGc0OfZ3cn6IT06f2U/c3qXVLGgDY
         cEZG17L1hCUlD39bRv2x1MlmwT9kzxWUoAz2VxzIeotXyvWO4jpABZLMIeIy1bPjKoMm
         QuUKDW2H2yoHtO9PQQTKCmFwHyeWJL5DHUV4eusKLLlCIUa3EJ6w5wkAS1mVT+4aOHMT
         I07Q==
X-Gm-Message-State: AJIora/AaGiYV6zvrVNW+r6PoDkGgRnD6tSUYKMpPhcUtD46Pv84NTcL
        8+jZvlk71eEy6D5DDl6wztbC/D8J0X1Z7DJj
X-Google-Smtp-Source: AGRyM1sDX8z3DHihw+xKNu+wGMYZbN6uITHK3Ebv83KQXLBL96NDqfYuukCVmNgj+BkJ/3yw3QZU6A==
X-Received: by 2002:a63:1208:0:b0:411:9b47:f6cc with SMTP id h8-20020a631208000000b004119b47f6ccmr15554138pgl.79.1658856484483;
        Tue, 26 Jul 2022 10:28:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p3-20020a1709028a8300b0016d62ba5665sm6644850plo.254.2022.07.26.10.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 10:28:04 -0700 (PDT)
Message-ID: <62e02424.1c69fb81.e1573.a8d9@mx.google.com>
Date:   Tue, 26 Jul 2022 10:28:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc8-159-ge79a32d56d08
Subject: next/pending-fixes baseline: 527 runs,
 9 regressions (v5.19-rc8-159-ge79a32d56d08)
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

next/pending-fixes baseline: 527 runs, 9 regressions (v5.19-rc8-159-ge79a32=
d56d08)

Regressions Summary
-------------------

platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx6ul-pico-hobbit      | arm   | lab-pengutronix | gcc-10   | multi_v7_def=
config+ima       | 1          =

imx6ul-pico-hobbit      | arm   | lab-pengutronix | gcc-10   | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit      | arm   | lab-pengutronix | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

imx6ul-pico-hobbit      | arm   | lab-pengutronix | gcc-10   | multi_v7_def=
config           | 1          =

imx8mn-ddr4-evk         | arm64 | lab-nxp         | gcc-10   | defconfig+cr=
ypto             | 1          =

jetson-tk1              | arm   | lab-baylibre    | gcc-10   | multi_v7_def=
c...G_ARM_LPAE=3Dy | 1          =

kontron-bl-imx8mm       | arm64 | lab-kontron     | gcc-10   | defconfig+im=
a                | 1          =

odroid-xu3              | arm   | lab-collabora   | gcc-10   | multi_v7_def=
c...G_ARM_LPAE=3Dy | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-10   | defconfig   =
                 | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.19-rc8-159-ge79a32d56d08/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.19-rc8-159-ge79a32d56d08
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e79a32d56d082b9f74ef1da8b2c9abdaa3032b33 =



Test Regressions
---------------- =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx6ul-pico-hobbit      | arm   | lab-pengutronix | gcc-10   | multi_v7_def=
config+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62e0025150a04a7223daf07a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc8-1=
59-ge79a32d56d08/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc8-1=
59-ge79a32d56d08/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62e0025150a04a7223daf=
07b
        failing since 56 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx6ul-pico-hobbit      | arm   | lab-pengutronix | gcc-10   | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62e0046d14edc1b0e0daf074

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc8-1=
59-ge79a32d56d08/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutron=
ix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc8-1=
59-ge79a32d56d08/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutron=
ix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62e0046d14edc1b0e0daf=
075
        failing since 56 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx6ul-pico-hobbit      | arm   | lab-pengutronix | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62e007ddb9b91ffd8adaf070

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc8-1=
59-ge79a32d56d08/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc8-1=
59-ge79a32d56d08/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62e007ddb9b91ffd8adaf=
071
        failing since 56 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx6ul-pico-hobbit      | arm   | lab-pengutronix | gcc-10   | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/62e008691722168fb3daf05a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc8-1=
59-ge79a32d56d08/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc8-1=
59-ge79a32d56d08/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62e008691722168fb3daf=
05b
        failing since 31 days (last pass: v5.19-rc3-373-gd317111b3b1ae, fir=
st fail: v5.19-rc3-470-g4fc9c7cb4051) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk         | arm64 | lab-nxp         | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62dfefbcfc9b2dd3afdaf056

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc8-1=
59-ge79a32d56d08/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc8-1=
59-ge79a32d56d08/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62dfefbcfc9b2dd3afdaf=
057
        new failure (last pass: v5.19-rc7-214-g7bc501036b62c) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
jetson-tk1              | arm   | lab-baylibre    | gcc-10   | multi_v7_def=
c...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62e005d3f141d16112daf0af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc8-1=
59-ge79a32d56d08/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc8-1=
59-ge79a32d56d08/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62e005d3f141d16112daf=
0b0
        failing since 87 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fir=
st fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
kontron-bl-imx8mm       | arm64 | lab-kontron     | gcc-10   | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/62dfed2ccbf5e08ff9daf084

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc8-1=
59-ge79a32d56d08/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-bl=
-imx8mm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc8-1=
59-ge79a32d56d08/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-bl=
-imx8mm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62dfed2ccbf5e08ff9daf=
085
        new failure (last pass: v5.19-rc7-273-gae7d06669281) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
odroid-xu3              | arm   | lab-collabora   | gcc-10   | multi_v7_def=
c...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62e00e4fcbbd671113daf071

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc8-1=
59-ge79a32d56d08/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc8-1=
59-ge79a32d56d08/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62e00e4fcbbd671113daf=
072
        new failure (last pass: v5.19-rc7-273-gae7d06669281) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-10   | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/62dfed5b3a8b48925ddaf086

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc8-1=
59-ge79a32d56d08/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-bana=
napi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc8-1=
59-ge79a32d56d08/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-bana=
napi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62dfed5b3a8b48925ddaf=
087
        new failure (last pass: v5.19-rc7-260-gaab2277715b66) =

 =20
