Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B6BB3AB7AC
	for <lists+linux-next@lfdr.de>; Thu, 17 Jun 2021 17:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231661AbhFQPk6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Jun 2021 11:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231547AbhFQPk5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Jun 2021 11:40:57 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0087C061574
        for <linux-next@vger.kernel.org>; Thu, 17 Jun 2021 08:38:48 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id e33so5294872pgm.3
        for <linux-next@vger.kernel.org>; Thu, 17 Jun 2021 08:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Fy2VLrFvUW0dX6dmGLXWbdCo1ScDlq/gQCCxAmHLZyA=;
        b=M4fp0pglbkZPFqRFEF3o9k2qww0fbvdNpPGbyL0szXz1+T+MVNVOf5UfA1ZiMmilDy
         YFUN3Fyqg3dBzJ2MOI3HzWI1hjQ8Et23SgYMde2BhGlFTcJ5lVZk8AxVWW4aazsgr21g
         v829TT8hr9b548Z/9XpiOdazYlYA7Eu1MyJlhMcQsyFfKyDha4l4h+WxV4tQwDlHwgtH
         V5gbSad1a2ivPMTbgW01D4BvHu7E/NnmppvGfMLIFrGwus6Lup8zKqhlRGPdmm6AA5FZ
         LVBdu0Ejt/0C4Rbd4+Pv796kKHL8DYD2NT7ZTRNEsiQfskWZ4L8ey8tCgYrotgyVuUl2
         pIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Fy2VLrFvUW0dX6dmGLXWbdCo1ScDlq/gQCCxAmHLZyA=;
        b=MMoFtH/lWVfuPhEVtaioZFVprWdNzuEGdCfg/u+2Wt1UZ9nhrzA/FkYeYwTZD2bfiL
         okMiZ0VIhUBhLQgpjm0KxhDEYcV4You+uZP6bAX9sEbVXBT983XBZDhTD+fiqQnrIm1o
         K7yVVtlS9VvayAOiuyu6SSM3vM5BYJsx2ApPOYB7FjzqKxRBuFoRoOQDAP7KlK14kJJi
         JwYbFcyxJCQ9xp1pziW9PMfxA8GfXhgwDrczscrwPvxiLn9IZZWO1JM2sNJVPEAPZ1kT
         7/ekDP3WcfIg9ooDGBUVX2lNQ4ZrjOZIszEZcYn5bWpkBnjojA1oY8+rRp0httw/iMoq
         OQpg==
X-Gm-Message-State: AOAM5336zqxcaryO8qOGUM+5pt7X1hzKzk2YyZzBWHV15IyX3gJ4LzE7
        yQ4HuI7n6aIjSRJGYgK4Fgwc+Mmb6zUZtb0x
X-Google-Smtp-Source: ABdhPJwTJjwkAMa3VR3Y1Bnh6KzLHIHE8oDAZXWZBMomzzm1Uus+yYsbpz2upJzDvM23jYfkxzlD+g==
X-Received: by 2002:a63:ff1f:: with SMTP id k31mr5432081pgi.315.1623944328044;
        Thu, 17 Jun 2021 08:38:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t1sm5340447pfe.61.2021.06.17.08.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 08:38:47 -0700 (PDT)
Message-ID: <60cb6c87.1c69fb81.4637d.ebd3@mx.google.com>
Date:   Thu, 17 Jun 2021 08:38:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20210617
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 525 runs, 51 regressions (next-20210617)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 525 runs, 51 regressions (next-20210617)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora   | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre    | clang-10 | defconfig      =
              | 1          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre    | clang-10 | defconfig+CON..=
._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre    | clang-12 | defconfig      =
              | 1          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre    | clang-12 | defconfig+CON..=
._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
._64K_PAGES=3Dy | 1          =

hifive-unleashed-a00 | riscv | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =

imx6q-sabresd        | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =

imx6ul-14x14-evk     | arm   | lab-nxp         | clang-10 | multi_v7_defcon=
fig           | 1          =

imx6ul-14x14-evk     | arm   | lab-nxp         | clang-12 | multi_v7_defcon=
fig           | 1          =

imx6ul-14x14-evk     | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =

imx6ul-14x14-evk     | arm   | lab-nxp         | gcc-8    | multi_v7_defcon=
fig           | 1          =

imx6ul-14x14-evk     | arm   | lab-nxp         | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit   | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =

imx6ull-14x14-evk    | arm   | lab-nxp         | clang-12 | multi_v7_defcon=
fig           | 1          =

imx6ull-14x14-evk    | arm   | lab-nxp         | gcc-8    | multi_v7_defcon=
fig           | 1          =

imx6ull-14x14-evk    | arm   | lab-nxp         | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =

imx8mp-evk           | arm64 | lab-nxp         | clang-10 | defconfig      =
              | 1          =

imx8mp-evk           | arm64 | lab-nxp         | clang-10 | defconfig+CON..=
._64K_PAGES=3Dy | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
._64K_PAGES=3Dy | 1          =

qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig          | 1          =

r8a774c0-ek874       | arm64 | lab-cip         | clang-12 | defconfig+CON..=
._64K_PAGES=3Dy | 1          =

r8a77960-ulcb        | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

rk3328-rock64        | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
._64K_PAGES=3Dy | 1          =

rk3399-gru-kevin     | arm64 | lab-collabora   | clang-10 | defconfig+CON..=
._64K_PAGES=3Dy | 22         =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210617/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210617
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7d9c6b8147bdd76d7eb2cf6f74f84c6918ae0939 =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora   | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb345d0186f16c764132a2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb345d0186f16c76413=
2a3
        failing since 112 days (last pass: next-20210223, first fail: next-=
20210224) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | clang-10 | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb32274a5835c88f4132c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb32284a5835c88f413=
2c7
        new failure (last pass: next-20210616) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | clang-10 | defconfig+CON..=
._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb337bc8224f275f41329c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb337bc8224f275f413=
29d
        new failure (last pass: next-20210611) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | clang-12 | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb2cd6e05e5ec38041327b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb2cd6e05e5ec380413=
27c
        new failure (last pass: next-20210616) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | clang-12 | defconfig+CON..=
._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb34d00b7051959f4132a0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb34d00b7051959f413=
2a1
        new failure (last pass: next-20210616) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb2e2a7582b62441413271

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb2e2a7582b62441413=
272
        new failure (last pass: next-20210611) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb2f7f3d7b99653e413278

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb2f7f3d7b99653e413=
279
        new failure (last pass: next-20210616) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb30d3a0c629b2fb413281

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb30d3a0c629b2fb413=
282
        new failure (last pass: next-20210616) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb29240647f2e3ee41326e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb29240647f2e3ee413=
26f
        failing since 48 days (last pass: next-20210429, first fail: next-2=
0210430) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6q-sabresd        | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb2c2952dfd84aa6413280

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb2c2952dfd84aa6413=
281
        failing since 234 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6ul-14x14-evk     | arm   | lab-nxp         | clang-10 | multi_v7_defcon=
fig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb33bd99192067a5413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm/=
multi_v7_defconfig/clang-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm/=
multi_v7_defconfig/clang-10/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb33bd99192067a5413=
267
        failing since 2 days (last pass: next-20210611, first fail: next-20=
210615) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6ul-14x14-evk     | arm   | lab-nxp         | clang-12 | multi_v7_defcon=
fig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb3256f4ce6bf5dc413288

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm/=
multi_v7_defconfig/clang-12/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm/=
multi_v7_defconfig/clang-12/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb3256f4ce6bf5dc413=
289
        failing since 2 days (last pass: next-20210610, first fail: next-20=
210615) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6ul-14x14-evk     | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb2c3ffc295efe30413284

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb2c3ffc295efe30413=
285
        failing since 2 days (last pass: next-20210611, first fail: next-20=
210615) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6ul-14x14-evk     | arm   | lab-nxp         | gcc-8    | multi_v7_defcon=
fig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb2e9a897789a1f1413273

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb2e9a897789a1f1413=
274
        failing since 2 days (last pass: next-20210611, first fail: next-20=
210615) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6ul-14x14-evk     | arm   | lab-nxp         | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb307537220d19ee413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6ul-14x14-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6ul-14x14-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb307537220d19ee413=
267
        failing since 2 days (last pass: next-20210611, first fail: next-20=
210615) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6ul-pico-hobbit   | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb2b0df5356a548441327c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb2b0df5356a5484413=
27d
        new failure (last pass: next-20210616) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6ull-14x14-evk    | arm   | lab-nxp         | clang-12 | multi_v7_defcon=
fig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb32686c55b2fba141328b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm/=
multi_v7_defconfig/clang-12/lab-nxp/baseline-imx6ull-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm/=
multi_v7_defconfig/clang-12/lab-nxp/baseline-imx6ull-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb32686c55b2fba1413=
28c
        failing since 2 days (last pass: next-20210610, first fail: next-20=
210615) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6ull-14x14-evk    | arm   | lab-nxp         | gcc-8    | multi_v7_defcon=
fig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb2e6f2949681d57413274

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6ull-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6ull-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb2e6f2949681d57413=
275
        failing since 2 days (last pass: next-20210611, first fail: next-20=
210615) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6ull-14x14-evk    | arm   | lab-nxp         | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb3011dd9d49f5fc413284

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6ull-14x14-evk.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6ull-14x14-evk.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb3011dd9d49f5fc413=
285
        failing since 2 days (last pass: next-20210611, first fail: next-20=
210615) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | clang-10 | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb35128f7c45937f413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb35128f7c45937f413=
267
        failing since 5 days (last pass: next-20210610, first fail: next-20=
210611) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | clang-10 | defconfig+CON..=
._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb36cab4b5bd379f413282

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb36cab4b5bd379f413=
283
        failing since 5 days (last pass: next-20210609, first fail: next-20=
210611) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb318e4d8a6b7ca9413269

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb318e4d8a6b7ca9413=
26a
        failing since 0 day (last pass: next-20210615, first fail: next-202=
10616) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb33304ff405cb8741327c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb33304ff405cb87413=
27d
        new failure (last pass: next-20210616) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb29af3a843066fb413275

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb29af3a843066fb413=
276
        failing since 211 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb297b988e6eaf1c413292

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb297b988e6eaf1c413=
293
        failing since 211 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb3033dd9d49f5fc413294

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb3033dd9d49f5fc413=
295
        failing since 211 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
r8a774c0-ek874       | arm64 | lab-cip         | clang-12 | defconfig+CON..=
._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb35830de5b48e6d413273

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-cip/baseline-r8a774c0-e=
k874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-cip/baseline-r8a774c0-e=
k874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb35830de5b48e6d413=
274
        new failure (last pass: next-20210616) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
r8a77960-ulcb        | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb2edf2fddda46ca41327f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-r8a77960-=
ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-r8a77960-=
ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb2edf2fddda46ca413=
280
        new failure (last pass: next-20210616) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
rk3328-rock64        | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60cb2cf87f8f3e138341327c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cb2cf87f8f3e1383413=
27d
        failing since 2 days (last pass: next-20210611, first fail: next-20=
210615) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
rk3399-gru-kevin     | arm64 | lab-collabora   | clang-10 | defconfig+CON..=
._64K_PAGES=3Dy | 22         =


  Details:     https://kernelci.org/test/plan/id/60cb36e06bf2275f3f41328a

  Results:     65 PASS, 25 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-rk33=
99-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210617/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-rk33=
99-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-debugfs-probed: https://kernelci.org/test/case/=
id/60cb36e06bf2275f3f413293
        new failure (last pass: next-20210611)

    2021-06-17T11:49:21.616561  <8>[   18.794011] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-debugfs-driver-present RESULT=3Dpass>
    2021-06-17T11:49:22.630740  /lava-4045133/1/../bin/lava-test-case
    2021-06-17T11:49:22.643142  <8>[   19.822784] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-debugfs-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-debugfs-attr-console_log: https://kernelci.org/=
test/case/id/60cb36e06bf2275f3f413294
        new failure (last pass: next-20210611)

    2021-06-17T11:49:23.657311  /lava-4045133/1/../bin/lava-test-case
    2021-06-17T11:49:23.669960  <8>[   20.849341] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-debugfs-attr-console_log RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-debugfs-attr-pdinfo: https://kernelci.org/test/=
case/id/60cb36e06bf2275f3f413295
        new failure (last pass: next-20210611)

    2021-06-17T11:49:24.685452  /lava-4045133/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-dev-probed: https://kernelci.org/test/case/id/6=
0cb36e06bf2275f3f413297
        new failure (last pass: next-20210611)

    2021-06-17T11:49:25.737848  /lava-4045133/1/../bin/lava-test-case
    2021-06-17T11:49:25.749306  <8>[   22.929859] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-dev-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-i2c-tunnel-probed: https://kernelci.org/test/ca=
se/id/60cb36e06bf2275f3f413299
        new failure (last pass: next-20210611)

    2021-06-17T11:49:26.790918  /lava-4045133/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
60cb36e06bf2275f3f41329b
        new failure (last pass: next-20210611)

    2021-06-17T11:49:27.843330  /lava-4045133/1/../bin/lava-test-case
    2021-06-17T11:49:27.855261  <8>[   25.035132] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-keyb-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-pwm-driver-present: https://kernelci.org/test/c=
ase/id/60cb36e06bf2275f3f41329d
        new failure (last pass: next-20210611)

    2021-06-17T11:49:27.880747  <8>[   25.058117] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-lightbar-driver-present RESULT=3Dpass>
    2021-06-17T11:49:28.894731  /lava-4045133/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-pwm-probed: https://kernelci.org/test/case/id/6=
0cb36e06bf2275f3f41329e
        new failure (last pass: next-20210611)

    2021-06-17T11:49:28.909157  <8>[   26.086990] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-pwm-driver-present RESULT=3Dfail>
    2021-06-17T11:49:29.923579  /lava-4045133/1/../bin/lava-test-case
    2021-06-17T11:49:29.935636  <8>[   27.116063] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-pwm-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-rtc-probed: https://kernelci.org/test/case/id/6=
0cb36e06bf2275f3f4132a0
        new failure (last pass: next-20210611)

    2021-06-17T11:49:30.976897  /lava-4045133/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-driver-present: https://kernelci.org/te=
st/case/id/60cb36e06bf2275f3f4132a1
        new failure (last pass: next-20210611)

    2021-06-17T11:49:30.990591  <8>[   28.169625] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-rtc-probed RESULT=3Dfail>
    2021-06-17T11:49:32.005221  /lava-4045133/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensorhub-probed: https://kernelci.org/test/cas=
e/id/60cb36e06bf2275f3f4132a6
        new failure (last pass: next-20210611)

    2021-06-17T11:49:35.150891  <8>[   32.328591] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensorhub-driver-present RESULT=3Dpass>
    2021-06-17T11:49:36.167412  /lava-4045133/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sysfs-probed: https://kernelci.org/test/case/id=
/60cb36e06bf2275f3f4132a8
        new failure (last pass: next-20210611)

    2021-06-17T11:49:37.218792  /lava-4045133/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sysfs-attr-flashinfo: https://kernelci.org/test=
/case/id/60cb36e06bf2275f3f4132a9
        new failure (last pass: next-20210611)

    2021-06-17T11:49:37.232585  <8>[   34.411358] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sysfs-probed RESULT=3Dfail>
    2021-06-17T11:49:38.245123  /lava-4045133/1/../bin/lava-test-case
    2021-06-17T11:49:38.257857  <8>[   35.437567] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sysfs-attr-flashinfo RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sysfs-attr-kb_wake_angle: https://kernelci.org/=
test/case/id/60cb36e06bf2275f3f4132aa
        new failure (last pass: next-20210611)

    2021-06-17T11:49:39.272173  /lava-4045133/1/../bin/lava-test-case
    2021-06-17T11:49:39.285522  <8>[   36.464958] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sysfs-attr-kb_wake_angle RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sysfs-attr-version: https://kernelci.org/test/c=
ase/id/60cb36e06bf2275f3f4132ab
        new failure (last pass: next-20210611)

    2021-06-17T11:49:40.299293  /lava-4045133/1/../bin/lava-test-case
    2021-06-17T11:49:40.312101  <8>[   37.492023] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sysfs-attr-version RESULT=3Dfail>   =


  * baseline.bootrr.hdmi-audio-codec-driver-present: https://kernelci.org/t=
est/case/id/60cb36e06bf2275f3f4132ac
        new failure (last pass: next-20210611)

    2021-06-17T11:49:41.328034  /lava-4045133/1/../bin/lava-test-case   =


  * baseline.bootrr.hdmi-audio-codec-probed: https://kernelci.org/test/case=
/id/60cb36e06bf2275f3f4132ad
        new failure (last pass: next-20210611)

    2021-06-17T11:49:41.343622  <8>[   38.520903] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dhdmi-audio-codec-driver-present RESULT=3Dfail>
    2021-06-17T11:49:42.357311  /lava-4045133/1/../bin/lava-test-case   =


  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/6=
0cb36e06bf2275f3f4132bf
        new failure (last pass: next-20210611)

    2021-06-17T11:49:43.789707  /lava-4045133/1/../bin/lava-test-case
    2021-06-17T11:49:43.800893  <8>[   40.982173] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-dp-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-typec-phy0-probed: https://kernelci.org/test/c=
ase/id/60cb36e06bf2275f3f4132df
        new failure (last pass: next-20210611)

    2021-06-17T11:49:44.547064  <8>[   41.725099] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-typec-phy-driver-present RESULT=3Dpass>
    2021-06-17T11:49:45.562254  /lava-4045133/1/../bin/lava-test-case
    2021-06-17T11:49:45.574281  <8>[   42.754755] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-typec-phy0-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-typec-phy1-probed: https://kernelci.org/test/c=
ase/id/60cb36e06bf2275f3f4132e0
        new failure (last pass: next-20210611)

    2021-06-17T11:49:46.590533  /lava-4045133/1/../bin/lava-test-case
    2021-06-17T11:49:46.603293  <8>[   43.783167] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-typec-phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/60cb36e06bf2275f3f4132e2
        failing since 9 days (last pass: next-20210603, first fail: next-20=
210607)

    2021-06-17T11:49:47.644457  /lava-4045133/1/../bin/lava-test-case
    2021-06-17T11:49:47.656521  <8>[   44.837068] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/60cb36e06bf2275f3f4132e3
        failing since 9 days (last pass: next-20210603, first fail: next-20=
210607)

    2021-06-17T11:49:48.672590  /lava-4045133/1/../bin/lava-test-case
    2021-06-17T11:49:48.684962  <8>[   45.865562] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =

 =20
