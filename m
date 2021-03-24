Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A35D5347122
	for <lists+linux-next@lfdr.de>; Wed, 24 Mar 2021 06:37:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235414AbhCXFgh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Mar 2021 01:36:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235421AbhCXFgW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Mar 2021 01:36:22 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 864F8C061763
        for <linux-next@vger.kernel.org>; Tue, 23 Mar 2021 22:36:22 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id w8so11142158pjf.4
        for <linux-next@vger.kernel.org>; Tue, 23 Mar 2021 22:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=BbXgPJ8gVpHQh9ctUbFiu/kLVRxLLLMzmg5z5GuFUMU=;
        b=1AA0mINsEKLFQAiNn2tvnwLmAZuMizdiBXsQ2YjsCwRJfHL4dMq9SVHzQkGdhPeOZe
         QMMjxN/4x/roImgP6eVJE0qicLXd/1UYq5muAWa2kOvTD2drQBBLr16iO39Hxy+H7LYd
         qFZTk3OyjpvsvX6ZVLHogzcnNqMM3vyMpvJ7NaEOe5qofkCh9sDF/BqD4XooU3Hyfqh9
         1Hnu5pQGLVwIuHgKDLayFIuBv3rAgjAAjNNO+MoiTa/+du1N5eaEOxf+L8RUPJQl/Rru
         pHSKXrZdooVDaSsJqapyQsvkf1DY1V6I+LMR8SrTx5QHd/QzRebCZPDfNURYa24smLEK
         AtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=BbXgPJ8gVpHQh9ctUbFiu/kLVRxLLLMzmg5z5GuFUMU=;
        b=N+RvXUjL3PWOcfIX3lwWxPLMxTIQDdZfY3px6DF4VdqAXivZd1hYX2S+zMglLUuVmi
         5dNmI72LxgsepqFs7dfknIzOIlymoycrgNiZF+qg/SdFoPCt39lzssOOt20o3QhW7A4R
         b6A3QUaIJmwCToHfYUAYvkihbUqrOz40k3KDUs2uM/RVCMwBbgBFAVouRu8eJUpHZR/H
         q0EvXk1/VwoUnLLsnFAdAEJLy0JoPX0spCN357mPuZGotF7oq0Sl15DEjJpbJFYrKULo
         6VNo41Rlu4euALjZ2UjX6/oEHCf6wOA/nvBhCmIBjsPB2ekAIqfr0F3qfdK+u3Txl8uB
         LQNg==
X-Gm-Message-State: AOAM5322gtn4dYvRJe3LVCtDSPb7vQKnIUUFfUf2fsB3v9dafudsj1QO
        9MAtZhnv6eCmQ0QU/FkDvR9NMDVdjjCZLA==
X-Google-Smtp-Source: ABdhPJw89B55D0qddYvmUL6xQaZy3QqoOqv3MVuEwgistcYbpJKrOsepo5sgxOiD9gCtM53UVG8IAg==
X-Received: by 2002:a17:902:56c:b029:e7:1052:a7c6 with SMTP id 99-20020a170902056cb02900e71052a7c6mr1035980plf.75.1616564181178;
        Tue, 23 Mar 2021 22:36:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g18sm972334pfb.178.2021.03.23.22.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 22:36:20 -0700 (PDT)
Message-ID: <605acfd4.1c69fb81.3951.3539@mx.google.com>
Date:   Tue, 23 Mar 2021 22:36:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.12-rc4-389-ga27dcf51dcf16
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 353 runs,
 9 regressions (v5.12-rc4-389-ga27dcf51dcf16)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 353 runs, 9 regressions (v5.12-rc4-389-ga27dcf=
51dcf16)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6sx-sdb           | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =

imx7d-sdb            | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
              | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.12-rc4-389-ga27dcf51dcf16/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.12-rc4-389-ga27dcf51dcf16
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a27dcf51dcf166bdd3ffd5ad6004e20e0aef72d3 =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6sx-sdb           | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/605a9c6f0112663294032cfe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-3=
89-ga27dcf51dcf16/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-3=
89-ga27dcf51dcf16/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605a9c6f0112663294032=
cff
        new failure (last pass: v5.12-rc4-316-g8d59c115a79a) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx7d-sdb            | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/605a9c8359af1a2fbf032cea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-3=
89-ga27dcf51dcf16/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx7d-sdb.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-3=
89-ga27dcf51dcf16/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx7d-sdb.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605a9c8359af1a2fbf032=
ceb
        new failure (last pass: v5.12-rc4-316-g8d59c115a79a) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/605a9b098348afc1c6032d05

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-3=
89-ga27dcf51dcf16/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-3=
89-ga27dcf51dcf16/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605a9b098348afc1c6032=
d06
        new failure (last pass: v5.12-rc4-316-g8d59c115a79a) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/605a9cab6017eb0418032cea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-3=
89-ga27dcf51dcf16/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/b=
aseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-3=
89-ga27dcf51dcf16/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/b=
aseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605a9cab6017eb0418032=
ceb
        new failure (last pass: v5.12-rc4-316-g8d59c115a79a) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/605a95d8aa3b218d9f032d15

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-3=
89-ga27dcf51dcf16/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-3=
89-ga27dcf51dcf16/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605a95d8aa3b218d9f032=
d16
        failing since 127 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/605a95e4c5262e2044032cf8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-3=
89-ga27dcf51dcf16/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-3=
89-ga27dcf51dcf16/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605a95e4c5262e2044032=
cf9
        failing since 127 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/605a95e368df6417fd032cfd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-3=
89-ga27dcf51dcf16/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-3=
89-ga27dcf51dcf16/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605a95e368df6417fd032=
cfe
        failing since 127 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/605a9572cd6e48fd3b032cf8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-3=
89-ga27dcf51dcf16/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-3=
89-ga27dcf51dcf16/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605a9572cd6e48fd3b032=
cf9
        failing since 127 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/605a958cfa918039b6032d04

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-3=
89-ga27dcf51dcf16/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-3=
89-ga27dcf51dcf16/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605a958cfa918039b6032=
d05
        failing since 127 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
