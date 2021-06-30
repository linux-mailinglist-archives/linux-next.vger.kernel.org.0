Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7C13B7CFF
	for <lists+linux-next@lfdr.de>; Wed, 30 Jun 2021 07:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbhF3F0l (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Jun 2021 01:26:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhF3F0l (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Jun 2021 01:26:41 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F4B6C061766
        for <linux-next@vger.kernel.org>; Tue, 29 Jun 2021 22:24:12 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id c15so784985pls.13
        for <linux-next@vger.kernel.org>; Tue, 29 Jun 2021 22:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=EumJc1vkNUFSBbUmu4fbrnxWH3w1cW4kQPPAcW/yhKc=;
        b=p9hpnSbwd9RVu73+snNO2eYuj8AZRamAwe8ryzbT3J8ifLQNWnEiyQee+3Rwn8Yi5d
         du28dSJwRRxv4eMSzXxDD5GdGvXG+1zgpcqphGlLjGy9KQQ3pVY1Kmo+pqhGNKume3Du
         n/0QRPu/XPfSqnDaazDD9o8nyzizfNmMabbJgvZyRVtrhcsZ4s39bWu2zDvXkXAdfdes
         UGme8fRajFz9mZ9Kdk29Y4JVg+xA9waDMGGPyfh4m0j4H2BPkT8hJaEXAtMFTWewSYG8
         ucAQotIaxziLVjq8lVwh641jzn3SZTWDOVDOIWohWy8ryrC3BUhNwzJ2ujD8g432HnBo
         Hezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=EumJc1vkNUFSBbUmu4fbrnxWH3w1cW4kQPPAcW/yhKc=;
        b=jlqoEf898ZsD3qD4/QQbSK58bQud9DvE/jm7e1uXvMNibR1lu5bNHkNkTtQppR8Vjc
         wJdERB4879vCViAMnXO6yEwXcUBauUaiSbL21x1HC9EKzUPRGmqeHNSHlU2uisZpiFCo
         9o/8qShtPx6JABGHR+ETthGmNnkID7+3V6DdGy8z38ZKJr+H7L7a1JBuiLZNtQeKjs/Z
         kv6GVIHA0LoIwvEO/RmtwsxAaEBdBGZIwxvmMH9lvoQA1i5vVVKt2iMrF/V9eOjBf8O6
         zPgblpw8SvJHW8dH0zNY1flkQdF+QuHWsje8LfGLSj3FoIwbreRutPcld93bEp5Ad6LV
         f2XA==
X-Gm-Message-State: AOAM530Wv9fsNNgct2DlPbT+WdEUGRg0sCQwXIVPK67QZ+K2xvg4XfqU
        jBN63v1zKp3O4Es4Z2lOK1AVVUWakOzHauDR
X-Google-Smtp-Source: ABdhPJzcNb94QmY5dhqsQtdEUzT5sduo44DgqDk+1Tsl5QxvOIsK8eXbywdH8OzD8QFVb5UbLQqNnQ==
X-Received: by 2002:a17:90a:e10a:: with SMTP id c10mr2569512pjz.163.1625030651353;
        Tue, 29 Jun 2021 22:24:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t3sm19712005pfl.44.2021.06.29.22.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 22:24:11 -0700 (PDT)
Message-ID: <60dbfffb.1c69fb81.6a124.ae6e@mx.google.com>
Date:   Tue, 29 Jun 2021 22:24:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.13-2793-g5c4584a79cad
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 226 runs,
 7 regressions (v5.13-2793-g5c4584a79cad)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 226 runs, 7 regressions (v5.13-2793-g5c4584a79=
cad)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora   | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =

imx6q-sabresd        | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
              | 1          =

qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.13-2793-g5c4584a79cad/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.13-2793-g5c4584a79cad
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5c4584a79cad1940ee3ca4eb68f88cbc3fdce433 =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora   | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60dbed8def7edd2e2923bbc2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-2793-=
g5c4584a79cad/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-2793-=
g5c4584a79cad/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dbed8def7edd2e2923b=
bc3
        failing since 145 days (last pass: v5.11-rc6-256-gf889022827dc, fir=
st fail: v5.11-rc6-298-g490f4659faae) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6q-sabresd        | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60dbcac5f128c7e1d523bbcb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-2793-=
g5c4584a79cad/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-2793-=
g5c4584a79cad/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dbcac5f128c7e1d523b=
bcc
        failing since 247 days (last pass: v5.9-13195-g0281c5220c40, first =
fail: v5.9-14860-gd56fc2efcc70) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/60dbc8e600b320cc3323bbe5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-2793-=
g5c4584a79cad/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-2793-=
g5c4584a79cad/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dbc8e600b320cc3323b=
be6
        failing since 9 days (last pass: v5.13-rc6-296-g227cd20c3337, first=
 fail: v5.13-rc7-108-ga39bc0c7697f) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60dbc881a597803a8a23bbd5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-2793-=
g5c4584a79cad/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-=
versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-2793-=
g5c4584a79cad/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-=
versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dbc881a597803a8a23b=
bd6
        failing since 225 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60dbcf9064c7e8d8a723bbc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-2793-=
g5c4584a79cad/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-v=
ersatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-2793-=
g5c4584a79cad/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-v=
ersatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dbcf9064c7e8d8a723b=
bc9
        failing since 225 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60dbc851cd9785603b23bbd5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-2793-=
g5c4584a79cad/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versa=
tilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-2793-=
g5c4584a79cad/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versa=
tilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dbc851cd9785603b23b=
bd6
        failing since 225 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60dbe351262b6a803023bbf7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-2793-=
g5c4584a79cad/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-2793-=
g5c4584a79cad/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dbe351262b6a803023b=
bf8
        failing since 225 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
