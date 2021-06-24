Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CFDC3B26CB
	for <lists+linux-next@lfdr.de>; Thu, 24 Jun 2021 07:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbhFXFbk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Jun 2021 01:31:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbhFXFbj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Jun 2021 01:31:39 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56A1BC061574
        for <linux-next@vger.kernel.org>; Wed, 23 Jun 2021 22:29:21 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id i4so2335717plt.12
        for <linux-next@vger.kernel.org>; Wed, 23 Jun 2021 22:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=DBr6QcEatgxBJ7b5Oq8EshthKG21nL54GFjS95f1aN4=;
        b=fxza2+UiwpQxC1Ok+oYOWTOb4bkRkJN1DGXg/RCfxA3x0pJ4TVajVOCC3Rf+vGW/55
         Yk5oW8EooGuN08APMWP0d6AHsaIyUXw9PzRExp/bugWfsqlNJcZd5jIaeZk88MqBQoAd
         Vv+E6ogkyypnCgdZYjpu/moZX9DR8WsYtCcWcj+3aK3eUtbhLACEla2pPQ+3BB6FPhx6
         4i8uGW4rXdH0UDohNIxXougo7TVzAJo96DvgWTyWKYX+UBo4E+3l2QAXcOwR+qzAQJSQ
         6MKB2nktLZ0RCeFdADVzu4AWfBS6Ria8qoy+Xzb+jQrZYSyWyUJDmAosoSvA+V7zXESr
         m1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=DBr6QcEatgxBJ7b5Oq8EshthKG21nL54GFjS95f1aN4=;
        b=lNKJxpmOTdaq8yRCR9BaqgJ2uEhG/6mAPxz2fBAOP3jcpKV000gvv7fAPIyDuZmw60
         nmRr/eB/CjU8WSrevvscUjvAaxusDOX7Seukd6hZHVUVZxb2V7nO+fgvi+VH5J3EVkVq
         VnovE7h7pAR7UNBcoH/vEgmLUcnlf5F2/Q31wtwk/R1EPcxSa8k6Zrv5t8k9Hr9hE4Lo
         GpMU9Y75ddng47xjwitf7IvCWA2MpPmaSMn2MOrUrLmznHh/8haoChPKAtowDag91t0e
         6sRumTH6IcW0PVWs2YoyG+NB5SpuNbHlhctLGgeiybG+gaxjmVfFOp4qyCRE+uDVRNES
         6CGA==
X-Gm-Message-State: AOAM530cAouxUQZGh7fQ9D8W1+i7Cg4s8adzkoJiw2KCCQmSnDJSaRWZ
        DMN8K8zt8wedq12ssAlAwwB0KhPw8kE4NMvD
X-Google-Smtp-Source: ABdhPJyOctkHKW9J4EgLcPisQbh0bvanD1IhnbGk9Z4DqDIsUi+7Oed9Bpq0mxHAtM+Zqn6vaPwMtw==
X-Received: by 2002:a17:90a:ce8b:: with SMTP id g11mr13359525pju.170.1624512560765;
        Wed, 23 Jun 2021 22:29:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 92sm7068871pjv.29.2021.06.23.22.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 22:29:20 -0700 (PDT)
Message-ID: <60d41830.1c69fb81.4721.3a08@mx.google.com>
Date:   Wed, 23 Jun 2021 22:29:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.13-rc7-204-gf41e09ab2272
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 160 runs,
 7 regressions (v5.13-rc7-204-gf41e09ab2272)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 160 runs, 7 regressions (v5.13-rc7-204-gf41e09=
ab2272)

Regressions Summary
-------------------

platform             | arch  | lab          | compiler | defconfig         =
           | regressions
---------------------+-------+--------------+----------+-------------------=
-----------+------------
bcm2837-rpi-3-b-32   | arm   | lab-baylibre | gcc-8    | bcm2835_defconfig =
           | 1          =

imx6q-sabresd        | arm   | lab-nxp      | gcc-8    | imx_v6_v7_defconfi=
g          | 1          =

meson-gxbb-nanopi-k2 | arm64 | lab-baylibre | gcc-8    | defconfig+CON...BI=
G_ENDIAN=3Dy | 1          =

meson-gxbb-p200      | arm64 | lab-baylibre | gcc-8    | defconfig         =
           | 1          =

qemu_arm-versatilepb | arm   | lab-baylibre | gcc-8    | versatile_defconfi=
g          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie  | gcc-8    | versatile_defconfi=
g          | 1          =

qemu_arm-versatilepb | arm   | lab-cip      | gcc-8    | versatile_defconfi=
g          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.13-rc7-204-gf41e09ab2272/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.13-rc7-204-gf41e09ab2272
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f41e09ab2272cb46f5ba8ace43a6228efeaae40f =



Test Regressions
---------------- =



platform             | arch  | lab          | compiler | defconfig         =
           | regressions
---------------------+-------+--------------+----------+-------------------=
-----------+------------
bcm2837-rpi-3-b-32   | arm   | lab-baylibre | gcc-8    | bcm2835_defconfig =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/60d3dcfa539a2ee14d41328c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
04-gf41e09ab2272/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
04-gf41e09ab2272/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d3dcfa539a2ee14d413=
28d
        new failure (last pass: v5.13-rc7-180-g67b894d4fc9d) =

 =



platform             | arch  | lab          | compiler | defconfig         =
           | regressions
---------------------+-------+--------------+----------+-------------------=
-----------+------------
imx6q-sabresd        | arm   | lab-nxp      | gcc-8    | imx_v6_v7_defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/60d3de736a9c9760f4413272

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
04-gf41e09ab2272/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
04-gf41e09ab2272/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d3de736a9c9760f4413=
273
        failing since 241 days (last pass: v5.9-13195-g0281c5220c40, first =
fail: v5.9-14860-gd56fc2efcc70) =

 =



platform             | arch  | lab          | compiler | defconfig         =
           | regressions
---------------------+-------+--------------+----------+-------------------=
-----------+------------
meson-gxbb-nanopi-k2 | arm64 | lab-baylibre | gcc-8    | defconfig+CON...BI=
G_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d3e351308ccc7dc5413275

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
04-gf41e09ab2272/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
04-gf41e09ab2272/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60d3e351308ccc7=
dc5413279
        new failure (last pass: v5.13-rc7-180-g67b894d4fc9d)
        4 lines =

 =



platform             | arch  | lab          | compiler | defconfig         =
           | regressions
---------------------+-------+--------------+----------+-------------------=
-----------+------------
meson-gxbb-p200      | arm64 | lab-baylibre | gcc-8    | defconfig         =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/60d3ee9018b8bcb924413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
04-gf41e09ab2272/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxbb-p20=
0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
04-gf41e09ab2272/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxbb-p20=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d3ee9018b8bcb924413=
267
        new failure (last pass: v5.13-rc7-180-g67b894d4fc9d) =

 =



platform             | arch  | lab          | compiler | defconfig         =
           | regressions
---------------------+-------+--------------+----------+-------------------=
-----------+------------
qemu_arm-versatilepb | arm   | lab-baylibre | gcc-8    | versatile_defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/60d3e0f7982a1a88cc413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
04-gf41e09ab2272/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
04-gf41e09ab2272/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d3e0f7982a1a88cc413=
267
        failing since 219 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab          | compiler | defconfig         =
           | regressions
---------------------+-------+--------------+----------+-------------------=
-----------+------------
qemu_arm-versatilepb | arm   | lab-broonie  | gcc-8    | versatile_defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/60d3ea3e67ac4dec814132b5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
04-gf41e09ab2272/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
04-gf41e09ab2272/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d3ea3e67ac4dec81413=
2b6
        failing since 219 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab          | compiler | defconfig         =
           | regressions
---------------------+-------+--------------+----------+-------------------=
-----------+------------
qemu_arm-versatilepb | arm   | lab-cip      | gcc-8    | versatile_defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/60d3ddc6d019b7a4cf413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
04-gf41e09ab2272/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
04-gf41e09ab2272/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d3ddc6d019b7a4cf413=
267
        failing since 219 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
