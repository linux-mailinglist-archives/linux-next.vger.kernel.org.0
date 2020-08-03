Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F018923B04D
	for <lists+linux-next@lfdr.de>; Tue,  4 Aug 2020 00:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgHCWkk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 3 Aug 2020 18:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbgHCWkj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 3 Aug 2020 18:40:39 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C20C6C06174A
        for <linux-next@vger.kernel.org>; Mon,  3 Aug 2020 15:40:39 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id a79so3336270pfa.8
        for <linux-next@vger.kernel.org>; Mon, 03 Aug 2020 15:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=sKdb0XhBpUljdph+Rv8PEYVPwCKGMi2wn/Ud0OpugdM=;
        b=pVAi8WMbNqbxHmSswv8+Drds5I5N6IolEO8LTu2UtaSecB16qrHc9dddYhPjtDbnTx
         yR5SowQDcjHSiNobhp+Qi8EZJhL0Y3cppgLP5icRS33QuRUbPxp4UL2P4Bnvm5c4sJDp
         oDeyDuK3Fwj3ud+QJkHWY3Hjc5IGKfSVMDCRu5zImNGkjahpuQaZ7uX6VekzhHqVQO4K
         +GibZNNCA40nPd9hHUdU5o+lRt5z7DSyBclgvz3Sp2gDPGwXdJT7KHMs4WzUoiiTHJ3c
         T2zUcjpaTqGfpxU/T65GIhiMxgxu0prnRpv+VxGjgKCuEjNzAbb5aN+sQ4bIpXdzC7fX
         y+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=sKdb0XhBpUljdph+Rv8PEYVPwCKGMi2wn/Ud0OpugdM=;
        b=bQoCb2T4uh/3cj2I6BWXHepVNS1CzVMvZckFKdox4+ussjAFGyURV4MSuKwC2BeJ41
         MzzIAmXYKi5QFfIB8xn6RuJKQXFDrDiVAI9zDPYWO3BQfVim6Z2xtHb7gcNF91pwC/RZ
         vl9eU0DN1KjiOeEobUiRcrUQk4+fABjKgbD7Gcaa1TB96mwBA1VSP1yUEB0Z0n6ghb1b
         5ZjwTmkQmntkiOPbdBiKihhYSzoYtR8CyUia5vilaj0T9Ou62w0cTq69YOrwVZeeVheY
         Vnm41x7u68d9ABuUGXmGbwdPABNWj5jYVcw7wqwyMeTSA6+S9mo+h0e9r8m3Qcji2R4T
         SW+A==
X-Gm-Message-State: AOAM530lNFcDe6q17/itnM85fJ/NdEj2Z17W7ngaS+J9dBzeSGMjAW1D
        P29Q6p+ZFTIzdqnA4hZuIVDNSHj1WOs=
X-Google-Smtp-Source: ABdhPJzv+DMqQYtgJ33b6cIAoHCgOte7GRyPwxukI4xXJJWronbUrO96KWYUCf/XSLV5xTT2qZrhLg==
X-Received: by 2002:a63:33c9:: with SMTP id z192mr16813238pgz.173.1596494437568;
        Mon, 03 Aug 2020 15:40:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 127sm20690665pgf.5.2020.08.03.15.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 15:40:36 -0700 (PDT)
Message-ID: <5f289264.1c69fb81.80579.1653@mx.google.com>
Date:   Mon, 03 Aug 2020 15:40:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20200803
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 489 runs, 37 regressions (next-20200803)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 489 runs, 37 regressions (next-20200803)

Regressions Summary
-------------------

platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
at91-sama5d4_xplained     | arm    | lab-baylibre  | gcc-8    | sama5_defco=
nfig              | 0/1    =

bcm2837-rpi-3-b           | arm64  | lab-baylibre  | clang-10 | defconfig  =
                  | 4/5    =

bcm2837-rpi-3-b           | arm64  | lab-baylibre  | gcc-8    | defconfig  =
                  | 4/5    =

exynos5422-odroidxu3      | arm    | lab-collabora | clang-10 | multi_v7_de=
fconfig           | 0/1    =

exynos5422-odroidxu3      | arm    | lab-collabora | gcc-8    | exynos_defc=
onfig             | 0/1    =

exynos5422-odroidxu3      | arm    | lab-collabora | gcc-8    | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 0/1    =

exynos5422-odroidxu3      | arm    | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =

exynos5422-odroidxu3      | arm    | lab-collabora | gcc-8    | multi_v7_de=
fconfig           | 0/1    =

meson-gxl-s905d-p230      | arm64  | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 0/1    =

mt8173-elm-hana           | arm64  | lab-collabora | clang-10 | defconfig  =
                  | 0/1    =

mt8173-elm-hana           | arm64  | lab-collabora | gcc-8    | defconfig  =
                  | 0/1    =

mt8173-elm-hana           | arm64  | lab-collabora | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =

qemu_x86_64               | x86_64 | lab-baylibre  | clang-10 | x86_64_defc=
onfig             | 0/1    =

qemu_x86_64               | x86_64 | lab-baylibre  | clang-9  | x86_64_defc=
onfig             | 0/1    =

qemu_x86_64               | x86_64 | lab-baylibre  | gcc-8    | x86_64_defc=
onfig             | 0/1    =

qemu_x86_64-uefi          | x86_64 | lab-baylibre  | clang-10 | x86_64_defc=
onfig             | 0/1    =

qemu_x86_64-uefi          | x86_64 | lab-baylibre  | gcc-8    | x86_64_defc=
onfig             | 0/1    =

qemu_x86_64-uefi-mixed    | x86_64 | lab-baylibre  | clang-10 | x86_64_defc=
onfig             | 0/1    =

rk3399-gru-kevin          | arm64  | lab-collabora | clang-10 | defconfig  =
                  | 84/88  =

rk3399-gru-kevin          | arm64  | lab-collabora | gcc-8    | defconfig  =
                  | 84/88  =

rk3399-gru-kevin          | arm64  | lab-collabora | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 84/88  =

sun50i-a64-bananapi-m64   | arm64  | lab-clabbe    | clang-10 | defconfig  =
                  | 0/1    =

sun50i-a64-bananapi-m64   | arm64  | lab-clabbe    | gcc-8    | defconfig  =
                  | 0/1    =

sun50i-a64-bananapi-m64   | arm64  | lab-clabbe    | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =

sun50i-a64-pine64-plus    | arm64  | lab-baylibre  | clang-10 | defconfig  =
                  | 0/1    =

sun50i-a64-pine64-plus    | arm64  | lab-baylibre  | gcc-8    | defconfig  =
                  | 0/1    =

sun50i-a64-pine64-plus    | arm64  | lab-baylibre  | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =

sun50i-a64-pine64-plus    | arm64  | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 0/1    =

sun7i-a20-cubieboard2     | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2     | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 0/1    =

sun7i-a20-cubieboard2     | arm    | lab-clabbe    | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2     | arm    | lab-clabbe    | gcc-8    | multi_v7_de=
fconfig           | 0/1    =

sun7i-a20-cubieboard2     | arm    | lab-baylibre  | gcc-8    | sunxi_defco=
nfig              | 0/1    =

sun7i-a20-cubieboard2     | arm    | lab-clabbe    | gcc-8    | sunxi_defco=
nfig              | 0/1    =

sun7i-a20-olinuxino-lime2 | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-olinuxino-lime2 | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 0/1    =

sun7i-a20-olinuxino-lime2 | arm    | lab-baylibre  | gcc-8    | sunxi_defco=
nfig              | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200803/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200803
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      de44d2b59b0fc49b84d711d815dfc2ef0a272912 =



Test Regressions
---------------- =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
at91-sama5d4_xplained     | arm    | lab-baylibre  | gcc-8    | sama5_defco=
nfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f28593c3d74df495d52c1ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f28593c3d74df495d52c=
1bb
      failing since 97 days (last pass: next-20200424, first fail: next-202=
00428) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
bcm2837-rpi-3-b           | arm64  | lab-baylibre  | clang-10 | defconfig  =
                  | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f2859c499620558fa52c1bb

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f2859c499620558=
fa52c1be
      new failure (last pass: next-20200731)
      2 lines =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
bcm2837-rpi-3-b           | arm64  | lab-baylibre  | gcc-8    | defconfig  =
                  | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f2858d3b752dd7dee52c1bd

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f2858d3b752dd7d=
ee52c1c0
      new failure (last pass: next-20200731)
      1 lines =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
exynos5422-odroidxu3      | arm    | lab-collabora | clang-10 | multi_v7_de=
fconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f28683a75734d02ac52c1a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f28683a75734d02ac52c=
1a8
      failing since 9 days (last pass: next-20200723, first fail: next-2020=
0724) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
exynos5422-odroidxu3      | arm    | lab-collabora | gcc-8    | exynos_defc=
onfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f285af5cf5aafb1b352c1af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f285af5cf5aafb1b352c=
1b0
      failing since 12 days (last pass: next-20200630, first fail: next-202=
00721) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
exynos5422-odroidxu3      | arm    | lab-collabora | gcc-8    | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f285d769f103ccf5452c1bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f285d769f103ccf5452c=
1be
      failing since 9 days (last pass: next-20200723, first fail: next-2020=
0724) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
exynos5422-odroidxu3      | arm    | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f285eb8f5c852282752c1ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f285eb8f5c852282752c=
1ac
      failing since 9 days (last pass: next-20200723, first fail: next-2020=
0724) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
exynos5422-odroidxu3      | arm    | lab-collabora | gcc-8    | multi_v7_de=
fconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f285ffb71056fed0852c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f285ffb71056fed0852c=
1a7
      failing since 9 days (last pass: next-20200723, first fail: next-2020=
0724) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
meson-gxl-s905d-p230      | arm64  | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f285bfb0979d65e8352c1df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f285bfb0979d65e8352c=
1e0
      new failure (last pass: next-20200731) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
mt8173-elm-hana           | arm64  | lab-collabora | clang-10 | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f285abec636396f2852c1be

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f285abec636396f2852c=
1bf
      failing since 9 days (last pass: next-20200723, first fail: next-2020=
0724) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
mt8173-elm-hana           | arm64  | lab-collabora | gcc-8    | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f28596d17d1211d5252c1b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f28596d17d1211d5252c=
1b1
      failing since 7 days (last pass: next-20200724, first fail: next-2020=
0727) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
mt8173-elm-hana           | arm64  | lab-collabora | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f285abcc636396f2852c1b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-mt8173-e=
lm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-mt8173-e=
lm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f285abcc636396f2852c=
1ba
      failing since 7 days (last pass: next-20200724, first fail: next-2020=
0727) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
qemu_x86_64               | x86_64 | lab-baylibre  | clang-10 | x86_64_defc=
onfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f285b53dccc1e60ec52c1b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/x86_=
64/x86_64_defconfig/clang-10/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/x86_=
64/x86_64_defconfig/clang-10/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f285b53dccc1e60ec52c=
1b8
      new failure (last pass: next-20200729) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
qemu_x86_64               | x86_64 | lab-baylibre  | clang-9  | x86_64_defc=
onfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f285a8002ae3d854252c1cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-9 (clang version 9.0.1-+20191211082622+c1a0a213378-1~e=
xp1~20191211193200.102 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/x86_=
64/x86_64_defconfig/clang-9/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/x86_=
64/x86_64_defconfig/clang-9/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f285a8102ae3d854252c=
1d0
      new failure (last pass: next-20200729) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
qemu_x86_64               | x86_64 | lab-baylibre  | gcc-8    | x86_64_defc=
onfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f28595c1ddd0e2b0252c1c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f28595c1ddd0e2b0252c=
1c6
      new failure (last pass: next-20200731) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
qemu_x86_64-uefi          | x86_64 | lab-baylibre  | clang-10 | x86_64_defc=
onfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f285b5b830d2f01a652c1b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/x86_=
64/x86_64_defconfig/clang-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/x86_=
64/x86_64_defconfig/clang-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f285b5b830d2f01a652c=
1b1
      new failure (last pass: next-20200729) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
qemu_x86_64-uefi          | x86_64 | lab-baylibre  | gcc-8    | x86_64_defc=
onfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f285960a1ef20535f52c1c1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f285960a1ef20535f52c=
1c2
      new failure (last pass: next-20200731) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
qemu_x86_64-uefi-mixed    | x86_64 | lab-baylibre  | clang-10 | x86_64_defc=
onfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f285b58dccc1e60ec52c1cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/x86_=
64/x86_64_defconfig/clang-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/x86_=
64/x86_64_defconfig/clang-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f285b58dccc1e60ec52c=
1ce
      new failure (last pass: next-20200729) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
rk3399-gru-kevin          | arm64  | lab-collabora | clang-10 | defconfig  =
                  | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f2859e6c8b3bd974a52c1b2

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f2859e7c8b3bd974a52c1f2
      failing since 4 days (last pass: next-20200728, first fail: next-2020=
0729) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
rk3399-gru-kevin          | arm64  | lab-collabora | gcc-8    | defconfig  =
                  | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f2858944b564299ed52c1a6

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f2858954b564299ed52c1e6
      failing since 3 days (last pass: next-20200728, first fail: next-2020=
0731) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
rk3399-gru-kevin          | arm64  | lab-collabora | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f2859083dd602038252c1c3

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f2859083dd602038252c203
      failing since 4 days (last pass: next-20200728, first fail: next-2020=
0729) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun50i-a64-bananapi-m64   | arm64  | lab-clabbe    | clang-10 | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f285c3908244d38ea52c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig/clang-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig/clang-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f285c3908244d38ea52c=
1a7
      failing since 3 days (last pass: next-20200729, first fail: next-2020=
0731) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun50i-a64-bananapi-m64   | arm64  | lab-clabbe    | gcc-8    | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2859591ddd0e2b0252c1b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2859591ddd0e2b0252c=
1ba
      new failure (last pass: next-20200731) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun50i-a64-bananapi-m64   | arm64  | lab-clabbe    | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f285a9ed2632c0ecb52c1d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f285a9ed2632c0ecb52c=
1d3
      new failure (last pass: next-20200731) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun50i-a64-pine64-plus    | arm64  | lab-baylibre  | clang-10 | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f285cbaa16617cc4c52c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f285cbaa16617cc4c52c=
1a7
      failing since 17 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun50i-a64-pine64-plus    | arm64  | lab-baylibre  | gcc-8    | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f28597317d1211d5252c1b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f28597317d1211d5252c=
1b5
      failing since 17 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun50i-a64-pine64-plus    | arm64  | lab-baylibre  | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f285b02fd9e1e799a52c1d3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f285b02fd9e1e799a52c=
1d4
      failing since 17 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun50i-a64-pine64-plus    | arm64  | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f285e3bf5c852282752c1a8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f285e3bf5c852282752c=
1a9
      failing since 17 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-cubieboard2     | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f285bc7a56e8e570452c1ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f285bc7a56e8e570452c=
1cb
      failing since 17 days (last pass: next-20200715, first fail: next-202=
00717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-cubieboard2     | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f285d0b7eeddd85e652c1e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f285d0b7eeddd85e652c=
1ea
      failing since 17 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-cubieboard2     | arm    | lab-clabbe    | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f285bcea56e8e570452c1d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun7i-a20-cubie=
board2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun7i-a20-cubie=
board2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f285bcea56e8e570452c=
1d1
      failing since 17 days (last pass: next-20200715, first fail: next-202=
00717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-cubieboard2     | arm    | lab-clabbe    | gcc-8    | multi_v7_de=
fconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f285d1b7eeddd85e652c1f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f285d1b7eeddd85e652c=
1f2
      failing since 17 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-cubieboard2     | arm    | lab-baylibre  | gcc-8    | sunxi_defco=
nfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f285936a5ed229e4252c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f285936a5ed229e4252c=
1a7
      failing since 14 days (last pass: next-20200717, first fail: next-202=
00720) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-cubieboard2     | arm    | lab-clabbe    | gcc-8    | sunxi_defco=
nfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f285a90ad1834d72552c1c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f285a90ad1834d72552c=
1c4
      failing since 14 days (last pass: next-20200717, first fail: next-202=
00720) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-olinuxino-lime2 | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f285d1d7eeddd85e652c1f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-oli=
nuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-oli=
nuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f285d1d7eeddd85e652c=
1f5
      failing since 17 days (last pass: next-20200715, first fail: next-202=
00717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-olinuxino-lime2 | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f285e7255b9aa0f4452c1ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f285e7255b9aa0f4452c=
1af
      failing since 17 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-olinuxino-lime2 | arm    | lab-baylibre  | gcc-8    | sunxi_defco=
nfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f285a634ac9ded79552c1b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200803/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200803/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f285a634ac9ded79552c=
1b1
      failing since 17 days (last pass: next-20200716, first fail: next-202=
00717) =20
