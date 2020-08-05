Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D593923D005
	for <lists+linux-next@lfdr.de>; Wed,  5 Aug 2020 21:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbgHET1l (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 Aug 2020 15:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728475AbgHERMK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 5 Aug 2020 13:12:10 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD4CC0617A0
        for <linux-next@vger.kernel.org>; Wed,  5 Aug 2020 10:11:55 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id c6so4876061pje.1
        for <linux-next@vger.kernel.org>; Wed, 05 Aug 2020 10:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=eeCxy31ORu9ao3GGYPsCyOyo2mPAyi5IRCLH38RZYyo=;
        b=EyOwk6mcX/LivxE2BIc1Kq9LRNwNdT0btoUM/tn1gcI7hkXtUETUx5aDTokcxgZmBB
         jkdRn4RLo8HeW+JkcevXInZPrYkJxOTUhD5uD3Uvy2WzDwGvLmtl/AdYIYkC+QAlBlWG
         LcGNHB+wo67lADJrDSJM/oXOSzOd8TL03IqLBa09J9HDipVuALh2GzQ5RJDIPqHUncbE
         tfLr0vjtAXLj4uvkO0fvm8HIAOXxqG55EiT01y8Nd238oN2dObxepCL8yUGFtRctEdTR
         9DVv1ZoMnj7syphZPPFvsrKlV27DGrdMye5YZuGxtA08rjrf8VJFNBt+6iNo2dPvedho
         n/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=eeCxy31ORu9ao3GGYPsCyOyo2mPAyi5IRCLH38RZYyo=;
        b=LAGHWBMWExRzFwhM3p1Jjeho3jwEchV2w87r7T8inKnToTbcbpsti0gID3mLlpLr7P
         DaqcWa+MbpE/kDwSYPkn2TGvtJtLVnXSeUnI7Ywm3vVBfsDPtiW5Qjg7v2W12ZYrpm5c
         l9hm3fDRkRbKAwwu1ZmBJkQ8sn7A68S993Gamao1cKBKHWBWlD5MQkfSWLeLe8YqjtK/
         jDmR8ZfBpXQ8l0bUVbuVdtsFg0HpNE8AemfIuQ/FX9Jnuac2yM1axjNzfPz6oQwIEkSb
         oqz/cO7uSXj/8rcJy+ssucHP+DyMiRjitirLZO1gaCljF3rTUjbCLVDgj0sYwXJcLfmG
         2K0w==
X-Gm-Message-State: AOAM533Fg0tjxjQtZ12UiFCRIJKAKXcSwDeL8RSX3Sg+03fOUANMILkJ
        mG5w4XRfqeNCa9Qmx1lJ0HKbcRFDxv4=
X-Google-Smtp-Source: ABdhPJzfZVIAQy5m8K8U6lX8MjsW10DVNDcvkZflG9kNXX9mINI9XcpiulfGVvZ19ksh7XUI9xOuMQ==
X-Received: by 2002:a17:90b:3597:: with SMTP id mm23mr4127368pjb.3.1596647514297;
        Wed, 05 Aug 2020 10:11:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p19sm3565229pgj.74.2020.08.05.10.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 10:11:53 -0700 (PDT)
Message-ID: <5f2ae859.1c69fb81.45099.8432@mx.google.com>
Date:   Wed, 05 Aug 2020 10:11:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20200805
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 383 runs, 19 regressions (next-20200805)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 383 runs, 19 regressions (next-20200805)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =

exynos5422-odroidxu3  | arm   | lab-collabora | clang-10 | multi_v7_defconf=
ig           | 0/1    =

exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | exynos_defconfig=
             | 0/1    =

exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 0/1    =

exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =

exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
G_ARM_LPAE=3Dy | 0/1    =

mt8173-elm-hana       | arm64 | lab-collabora | clang-10 | defconfig       =
             | 0/1    =

mt8173-elm-hana       | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 0/1    =

mt8173-elm-hana       | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 0/1    =

omap3-beagle-xm       | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =

omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 4/5    =

omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =

omap4-panda           | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =

rk3399-gru-kevin      | arm64 | lab-collabora | clang-10 | defconfig       =
             | 84/88  =

rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 84/88  =

rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 84/88  =

sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-8    | multi_v7_defconf=
ig           | 0/1    =

sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-8    | sunxi_defconfig =
             | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200805/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200805
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d15fe4ec043588beee823781602ddb51d0bc84c8 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2aacf6b506e76edb52c1b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200805/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200805/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2aacf6b506e76edb52c=
1b1
      failing since 99 days (last pass: next-20200424, first fail: next-202=
00428) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | clang-10 | multi_v7_defconf=
ig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2ab8abd7ab7982d452c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200805/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200805/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2ab8abd7ab7982d452c=
1a7
      failing since 11 days (last pass: next-20200723, first fail: next-202=
00724) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | exynos_defconfig=
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2ab68f7aeefc39b052c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200805/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200805/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2ab68f7aeefc39b052c=
1a7
      failing since 14 days (last pass: next-20200630, first fail: next-202=
00721) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2aae158ee97b4e4052c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200805/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200805/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2aae158ee97b4e4052c=
1a7
      failing since 11 days (last pass: next-20200723, first fail: next-202=
00724) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2ab40d86082af4ad52c1ad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200805/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200805/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2ab40d86082af4ad52c=
1ae
      failing since 11 days (last pass: next-20200723, first fail: next-202=
00724) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2abdcf2802a2387d52c1c7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200805/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200805/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2abdcf2802a2387d52c=
1c8
      failing since 11 days (last pass: next-20200723, first fail: next-202=
00724) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
mt8173-elm-hana       | arm64 | lab-collabora | clang-10 | defconfig       =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2aadd1b212e9af5952c204

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200805/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200805/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2aadd1b212e9af5952c=
205
      failing since 11 days (last pass: next-20200723, first fail: next-202=
00724) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
mt8173-elm-hana       | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2aadb6b212e9af5952c1b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200805/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200805/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2aadb6b212e9af5952c=
1b9
      failing since 8 days (last pass: next-20200724, first fail: next-2020=
0727) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
mt8173-elm-hana       | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2aaf17a2d3c37d7c52c1b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200805/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-mt8173-e=
lm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200805/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-mt8173-e=
lm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2aaf17a2d3c37d7c52c=
1b1
      failing since 8 days (last pass: next-20200724, first fail: next-2020=
0727) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
omap3-beagle-xm       | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2aae96d190f497a052c1b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200805/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap3-beagle-=
xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200805/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap3-beagle-=
xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2aae96d190f497a052c=
1b1
      new failure (last pass: next-20200804) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f2aad5983c411d4d752c1c7

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200805/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200805/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f2aad5983c411d=
4d752c1cb
      failing since 21 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f2aaddef27d0a0b2552c1a6

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200805/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200805/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f2aaddef27d0a0=
b2552c1aa
      failing since 21 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
omap4-panda           | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2ab1f7d83023622552c1b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200805/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200805/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2ab1f7d83023622552c=
1b1
      failing since 14 days (last pass: next-20200706, first fail: next-202=
00721) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
rk3399-gru-kevin      | arm64 | lab-collabora | clang-10 | defconfig       =
             | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f2aaccd7c3b65d35352c1a7

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200805/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200805/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f2aaccd7c3b65d35352c1e7
      failing since 6 days (last pass: next-20200728, first fail: next-2020=
0729) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f2aaba3046fd0a5af52c1d5

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200805/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200805/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f2aaba3046fd0a5af52c215
      failing since 4 days (last pass: next-20200728, first fail: next-2020=
0731) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f2aad294e46834e8a52c1c5

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200805/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200805/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f2aad294e46834e8a52c205
      failing since 6 days (last pass: next-20200728, first fail: next-2020=
0729) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-8    | multi_v7_defconf=
ig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2aae1fac5dbfc44652c1b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200805/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200805/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2aae1fac5dbfc44652c=
1b1
      failing since 18 days (last pass: next-20200716, first fail: next-202=
00717) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2aaf658dca50df6152c1bf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200805/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200805/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2aaf658dca50df6152c=
1c0
      failing since 18 days (last pass: next-20200715, first fail: next-202=
00717) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-8    | sunxi_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2aaab78b436cac3252c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200805/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200805/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2aaab78b436cac3252c=
1a7
      failing since 15 days (last pass: next-20200717, first fail: next-202=
00720) =20
