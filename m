Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B654234BB3
	for <lists+linux-next@lfdr.de>; Fri, 31 Jul 2020 21:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbgGaTnk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 31 Jul 2020 15:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgGaTnk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 31 Jul 2020 15:43:40 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8374C061574
        for <linux-next@vger.kernel.org>; Fri, 31 Jul 2020 12:43:39 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id t6so16565227pgq.1
        for <linux-next@vger.kernel.org>; Fri, 31 Jul 2020 12:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=aT9yBcK68dvdp0BQZwvzNCMeQ9v8Bzv0/XNNFbCIdMY=;
        b=zUBuWHnEQq4fAiV8gXo6ZBvI3Q/DQnkZ90xsqLctK5dYndnCv5goSCyxGH4UTdG90g
         Zj1suLFAB9eyXw1GYqan9wcCFfyJhfRXQ3Ny0iTmnYGCTXhKOMaVg2X5eNoSiAWzkeLP
         6XPkByJUL7kPN0cOviZxIfjjkkNFDKQ864nslTUFyAf0cslGEQt1BMUUFmXHis2izHNu
         OGFAUex0QLvOLL9KvjB/Nk+fK8qygxV9M+Qw2wwAXWBkouqyiw6OW8+4d/8vMbKcDfif
         7vBqnR0MelyPymRmRhfiJ6PVw1FIu5Ls5yUyQydfb5UfkIsZL1MzkFS6K0DmC1r1Epsq
         aDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=aT9yBcK68dvdp0BQZwvzNCMeQ9v8Bzv0/XNNFbCIdMY=;
        b=qhTZMsy68loS9Yzus2hpviW/bs7hbwLeJMXSgvwNAW/tfT1nA6zlf3zP/uEvo7l0Jv
         g6L+bCNMiWRojYDaZZk6wpXP1twlQKE0e+y3BcPOlVdPrUELuVA/Tys+lPnsBHqQu+zj
         EomaGU3Fb6h/2cz8D8utuqctC/q5D61gBOfb8r+qfOZ3cRujoIj6orGnklJwVcJs/w7V
         kcbXYg6CKRXqv93OLwx1XEkBcodtX8r6tgnXTfnXTvRg+EdAEKFsJjA9mgc02VDmr1tB
         7/bSPyT3yXsdy5HL7t/UZsz0/6eJ8F7p7e34R35SFLVXpAUjS0QD9QtbaYXh65fFd7oj
         lbbQ==
X-Gm-Message-State: AOAM530u9tbhtJEZp1eI2ymW20KQkRMI31sx06/q2WGLLdYfqU3K3vit
        4S+3deznXJSzDeUekedttQ/mgeLgWpA=
X-Google-Smtp-Source: ABdhPJwM/KHdFWRZUqLIKHpE6eR/3gbhZZKqsBlvj6WTDQtPtpAh6W4sZEQVqFDSf+OyJNUHFl67Zw==
X-Received: by 2002:aa7:9155:: with SMTP id 21mr4753470pfi.306.1596224618334;
        Fri, 31 Jul 2020 12:43:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i13sm9598762pjd.33.2020.07.31.12.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 12:43:37 -0700 (PDT)
Message-ID: <5f247469.1c69fb81.7fe4d.7ae9@mx.google.com>
Date:   Fri, 31 Jul 2020 12:43:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20200731
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 468 runs, 29 regressions (next-20200731)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 468 runs, 29 regressions (next-20200731)

Regressions Summary
-------------------

platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
at91-sama5d4_xplained     | arm   | lab-baylibre  | gcc-8    | sama5_defcon=
fig              | 0/1    =

bcm2837-rpi-3-b           | arm64 | lab-baylibre  | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 4/5    =

exynos5422-odroidxu3      | arm   | lab-collabora | clang-10 | multi_v7_def=
config           | 0/1    =

exynos5422-odroidxu3      | arm   | lab-collabora | gcc-8    | exynos_defco=
nfig             | 0/1    =

exynos5422-odroidxu3      | arm   | lab-collabora | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 0/1    =

exynos5422-odroidxu3      | arm   | lab-collabora | gcc-8    | multi_v7_def=
c...G_ARM_LPAE=3Dy | 0/1    =

exynos5422-odroidxu3      | arm   | lab-collabora | gcc-8    | multi_v7_def=
config           | 0/1    =

imx6q-var-dt6customboard  | arm   | lab-baylibre  | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 0/1    =

meson-gxbb-p200           | arm64 | lab-baylibre  | gcc-8    | defconfig+CO=
N...BIG_ENDIAN=3Dy | 0/1    =

mt8173-elm-hana           | arm64 | lab-collabora | clang-10 | defconfig   =
                 | 0/1    =

mt8173-elm-hana           | arm64 | lab-collabora | gcc-8    | defconfig   =
                 | 0/1    =

mt8173-elm-hana           | arm64 | lab-collabora | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 0/1    =

omap4-panda               | arm   | lab-baylibre  | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 4/5    =

omap4-panda               | arm   | lab-baylibre  | gcc-8    | multi_v7_def=
config           | 4/5    =

omap4-panda               | arm   | lab-baylibre  | gcc-8    | omap2plus_de=
fconfig          | 0/1    =

rk3399-gru-kevin          | arm64 | lab-collabora | clang-10 | defconfig   =
                 | 84/88  =

rk3399-gru-kevin          | arm64 | lab-collabora | gcc-8    | defconfig   =
                 | 84/88  =

rk3399-gru-kevin          | arm64 | lab-collabora | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 84/88  =

sun50i-a64-bananapi-m64   | arm64 | lab-clabbe    | clang-10 | defconfig   =
                 | 0/1    =

sun50i-a64-pine64-plus    | arm64 | lab-baylibre  | clang-10 | defconfig   =
                 | 0/1    =

sun50i-a64-pine64-plus    | arm64 | lab-baylibre  | gcc-8    | defconfig   =
                 | 0/1    =

sun50i-a64-pine64-plus    | arm64 | lab-baylibre  | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 0/1    =

sun50i-a64-pine64-plus    | arm64 | lab-baylibre  | gcc-8    | defconfig+CO=
N...BIG_ENDIAN=3Dy | 0/1    =

sun7i-a20-cubieboard2     | arm   | lab-baylibre  | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2     | arm   | lab-baylibre  | gcc-8    | multi_v7_def=
config           | 0/1    =

sun7i-a20-cubieboard2     | arm   | lab-baylibre  | gcc-8    | sunxi_defcon=
fig              | 0/1    =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre  | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre  | gcc-8    | multi_v7_def=
config           | 0/1    =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre  | gcc-8    | sunxi_defcon=
fig              | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200731/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200731
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      01830e6c042e8eb6eb202e05d7df8057135b4c26 =



Test Regressions
---------------- =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
at91-sama5d4_xplained     | arm   | lab-baylibre  | gcc-8    | sama5_defcon=
fig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f243c1762106a8d0552c1c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f243c1762106a8d0552c=
1c9
      failing since 94 days (last pass: next-20200424, first fail: next-202=
00428) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
bcm2837-rpi-3-b           | arm64 | lab-baylibre  | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f243c40518681d47352c1b8

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f243c40518681d4=
7352c1bb
      failing since 2 days (last pass: next-20200727, first fail: next-2020=
0728)
      2 lines =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
exynos5422-odroidxu3      | arm   | lab-collabora | clang-10 | multi_v7_def=
config           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2446cf0a2dd8303f52c1b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2446cf0a2dd8303f52c=
1b1
      failing since 6 days (last pass: next-20200723, first fail: next-2020=
0724) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
exynos5422-odroidxu3      | arm   | lab-collabora | gcc-8    | exynos_defco=
nfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f243e5fc2a6410f3f52c1a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f243e5fc2a6410f3f52c=
1a8
      failing since 9 days (last pass: next-20200630, first fail: next-2020=
0721) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
exynos5422-odroidxu3      | arm   | lab-collabora | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2440f02ca73dc9fa52c1b6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2440f02ca73dc9fa52c=
1b7
      failing since 6 days (last pass: next-20200723, first fail: next-2020=
0724) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
exynos5422-odroidxu3      | arm   | lab-collabora | gcc-8    | multi_v7_def=
c...G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f24481288d8dab7bd52c1ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f24481288d8dab7bd52c=
1bb
      failing since 6 days (last pass: next-20200723, first fail: next-2020=
0724) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
exynos5422-odroidxu3      | arm   | lab-collabora | gcc-8    | multi_v7_def=
config           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f24495abd973b062e52c1ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f24495abd973b062e52c=
1bb
      failing since 6 days (last pass: next-20200723, first fail: next-2020=
0724) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
imx6q-var-dt6customboard  | arm   | lab-baylibre  | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f243f8db282e453ce52c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f243f8db282e453ce52c=
1a7
      failing since 25 days (last pass: next-20200703, first fail: next-202=
00706) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
meson-gxbb-p200           | arm64 | lab-baylibre  | gcc-8    | defconfig+CO=
N...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f243f53a26233b4ab52c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f243f53a26233b4ab52c=
1a7
      new failure (last pass: next-20200729) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
mt8173-elm-hana           | arm64 | lab-collabora | clang-10 | defconfig   =
                 | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f24418048999870c052c1bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f24418048999870c052c=
1bc
      failing since 6 days (last pass: next-20200723, first fail: next-2020=
0724) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
mt8173-elm-hana           | arm64 | lab-collabora | gcc-8    | defconfig   =
                 | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f243cceecca952ddd52c1c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f243cceecca952ddd52c=
1c7
      failing since 3 days (last pass: next-20200724, first fail: next-2020=
0727) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
mt8173-elm-hana           | arm64 | lab-collabora | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f243e1d66b66dc50252c1c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-mt8173-e=
lm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-mt8173-e=
lm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f243e1d66b66dc50252c=
1c4
      failing since 3 days (last pass: next-20200724, first fail: next-2020=
0727) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
omap4-panda               | arm   | lab-baylibre  | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f243e50d1b88ed51c52c1f7

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap4-panda.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap4-panda.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f243e50d1b88ed=
51c52c1fb
      failing since 16 days (last pass: next-20200710, first fail: next-202=
00715)
      60 lines =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
omap4-panda               | arm   | lab-baylibre  | gcc-8    | multi_v7_def=
config           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f244118492463381a52c23e

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f2441184924633=
81a52c242
      failing since 17 days (last pass: next-20200713, first fail: next-202=
00714)
      60 lines =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
omap4-panda               | arm   | lab-baylibre  | gcc-8    | omap2plus_de=
fconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f24409151a5edf13552c1ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f24409151a5edf13552c=
1af
      failing since 15 days (last pass: next-20200706, first fail: next-202=
00716) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
rk3399-gru-kevin          | arm64 | lab-collabora | clang-10 | defconfig   =
                 | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f244105492463381a52c1be

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f244105492463381a52c1fe
      failing since 1 day (last pass: next-20200728, first fail: next-20200=
729) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
rk3399-gru-kevin          | arm64 | lab-collabora | gcc-8    | defconfig   =
                 | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f243bf4c7af89abfb52c25b

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f243bf4c7af89abfb52c29b
      new failure (last pass: next-20200728) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
rk3399-gru-kevin          | arm64 | lab-collabora | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f243c63407d5d987552c1a6

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f243c63407d5d987552c1e6
      failing since 1 day (last pass: next-20200728, first fail: next-20200=
729) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
sun50i-a64-bananapi-m64   | arm64 | lab-clabbe    | clang-10 | defconfig   =
                 | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f24416f48999870c052c1b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm6=
4/defconfig/clang-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm6=
4/defconfig/clang-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f24416f48999870c052c=
1b1
      new failure (last pass: next-20200729) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
sun50i-a64-pine64-plus    | arm64 | lab-baylibre  | clang-10 | defconfig   =
                 | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2442760a3493573e52c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2442760a3493573e52c=
1a7
      failing since 13 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
sun50i-a64-pine64-plus    | arm64 | lab-baylibre  | gcc-8    | defconfig   =
                 | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f243d6dffeddf390852c1b3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f243d6dffeddf390852c=
1b4
      failing since 13 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
sun50i-a64-pine64-plus    | arm64 | lab-baylibre  | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f243f2fdb78723dbc52c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f243f2fdb78723dbc52c=
1a7
      failing since 13 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
sun50i-a64-pine64-plus    | arm64 | lab-baylibre  | gcc-8    | defconfig+CO=
N...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2440c1661ad7c05252c1af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2440c1661ad7c05252c=
1b0
      failing since 13 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
sun7i-a20-cubieboard2     | arm   | lab-baylibre  | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f243ee54c8b9787fa52c1db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f243ee54c8b9787fa52c=
1dc
      failing since 13 days (last pass: next-20200715, first fail: next-202=
00717) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
sun7i-a20-cubieboard2     | arm   | lab-baylibre  | gcc-8    | multi_v7_def=
config           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2441c8c744b36e7a52c1cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2441c8c744b36e7a52c=
1cc
      failing since 13 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
sun7i-a20-cubieboard2     | arm   | lab-baylibre  | gcc-8    | sunxi_defcon=
fig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f243c3d1eb98c861452c1ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f243c3d1eb98c861452c=
1ad
      failing since 11 days (last pass: next-20200717, first fail: next-202=
00720) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre  | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f243f3bdb78723dbc52c1ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-oli=
nuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-oli=
nuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f243f3bdb78723dbc52c=
1ac
      failing since 13 days (last pass: next-20200715, first fail: next-202=
00717) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre  | gcc-8    | multi_v7_def=
config           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f24428d0a3493573e52c1ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f24428d0a3493573e52c=
1ac
      failing since 13 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre  | gcc-8    | sunxi_defcon=
fig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f243d5effeddf390852c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200731/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200731/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f243d5effeddf390852c=
1a7
      failing since 13 days (last pass: next-20200716, first fail: next-202=
00717) =20
