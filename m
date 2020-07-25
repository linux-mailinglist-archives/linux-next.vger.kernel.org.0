Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2ED22D3C5
	for <lists+linux-next@lfdr.de>; Sat, 25 Jul 2020 04:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbgGYCgt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Jul 2020 22:36:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726572AbgGYCgt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 24 Jul 2020 22:36:49 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0E62C0619D3
        for <linux-next@vger.kernel.org>; Fri, 24 Jul 2020 19:36:48 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d1so5539181plr.8
        for <linux-next@vger.kernel.org>; Fri, 24 Jul 2020 19:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=BiM+p5jsp8jFGQYqcLUTxcSN1cnARrE6Q9BQoCm0V1s=;
        b=X8uCfuuW1Sp76rqH3cv5gtdgsWgK4XENXXgeNNdAnIKVxjr2ekIVCvRm2N1Izss/+l
         NJcBz4WA59uN2mVcW9PmST/KMxEFlG1B0uinPyC81/l2fi4MG3pgi2pZE2Di4AR3RKbk
         sfHUc+Kq8Uv79lEmNjfSILI8XbecwusK2kuoMM2D+PdouCakJQmJ4x/IUhPW21xfC3xm
         TTGBmKJTZ0v7pnFMK2Ed8JIgxSlxaT5k/oCFYIOZ7+Otr/w67aMUBm5J+jr0ULyrsRfN
         IJOBzgZp79lBu6etUKlUdrpTNY/AAaYbL1y8wZpOdZ1v56A9m/QYO3s7gJjDvJzTfTTT
         CBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=BiM+p5jsp8jFGQYqcLUTxcSN1cnARrE6Q9BQoCm0V1s=;
        b=CdrlpA9yZeEtAUOteYv9WF4OsTdosaDo+am5XPY3ti6zl0L6xs6OS+6k8bJIREhxPE
         ciF1YQcTCy9utb7oh41kNLl9U8a/dyksnZgB7FwgqdOKrD/ny2oHenTvdfGah/hAkrUv
         WGe8JHvL102lNJzyL9HN/MBX1XrbyPiO7rQv9AkhAlv7Pq8IUBrG6VEHTGbtInbgzrUU
         xzwpJssw4vClOlb4//lB3E/xE+67nwUoXxZ5oWl4GOFRjUnBb+fezgYBRZAGo0Z1I12u
         dinAVGv7rdM3dvkWTA8jIcZSXAVr55hWQxsiXUNJZAaNNkRxnSfPi/7r+50109yizJwf
         s4DA==
X-Gm-Message-State: AOAM5322iT16ZPMx/yxJlbjs7vld3YPiiTzhzvRNpfGE7HFj1Fy19PIy
        N729IpEC5jXT7YrxrrXDbvO23i+B9n4=
X-Google-Smtp-Source: ABdhPJxPbdhMqc1E7WJhFqY3nDiLRdtprdnadiBrRLz+MFYwD6HWLuXAyJkFZS4rx036Vs7vWvuq8Q==
X-Received: by 2002:a17:902:c38a:: with SMTP id g10mr10207181plg.50.1595644606522;
        Fri, 24 Jul 2020 19:36:46 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o136sm7524602pfg.24.2020.07.24.19.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 19:36:45 -0700 (PDT)
Message-ID: <5f1b9abd.1c69fb81.c1d9b.cafb@mx.google.com>
Date:   Fri, 24 Jul 2020 19:36:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200724
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 471 runs, 31 regressions (next-20200724)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 471 runs, 31 regressions (next-20200724)

Regressions Summary
-------------------

platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
at91-sama5d4_xplained     | arm    | lab-baylibre  | gcc-8    | sama5_defco=
nfig              | 0/1    =

bcm2837-rpi-3-b           | arm64  | lab-baylibre  | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 4/5    =

exynos5422-odroidxu3      | arm    | lab-collabora | clang-10 | multi_v7_de=
fconfig           | 0/1    =

exynos5422-odroidxu3      | arm    | lab-collabora | gcc-8    | exynos_defc=
onfig             | 0/1    =

exynos5422-odroidxu3      | arm    | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =

exynos5422-odroidxu3      | arm    | lab-collabora | gcc-8    | multi_v7_de=
fconfig           | 0/1    =

exynos5422-odroidxu3      | arm    | lab-collabora | gcc-8    | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 0/1    =

imx6q-var-dt6customboard  | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =

mt8173-elm-hana           | arm64  | lab-collabora | clang-10 | defconfig  =
                  | 0/1    =

omap4-panda               | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 4/5    =

omap4-panda               | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 4/5    =

omap4-panda               | arm    | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 4/5    =

omap4-panda               | arm    | lab-collabora | gcc-8    | multi_v7_de=
fconfig           | 4/5    =

omap4-panda               | arm    | lab-baylibre  | gcc-8    | omap2plus_d=
efconfig          | 0/1    =

omap4-panda               | arm    | lab-collabora | gcc-8    | omap2plus_d=
efconfig          | 0/1    =

qemu_x86_64               | x86_64 | lab-baylibre  | clang-10 | x86_64_defc=
onfig             | 0/1    =

qemu_x86_64-uefi-mixed    | x86_64 | lab-baylibre  | clang-9  | x86_64_defc=
onfig             | 0/1    =

sun50i-a64-bananapi-m64   | arm64  | lab-clabbe    | gcc-8    | defconfig  =
                  | 0/1    =

sun50i-a64-pine64-plus    | arm64  | lab-baylibre  | clang-10 | defconfig  =
                  | 0/1    =

sun50i-a64-pine64-plus    | arm64  | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 0/1    =

sun50i-a64-pine64-plus    | arm64  | lab-baylibre  | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =

sun50i-a64-pine64-plus    | arm64  | lab-baylibre  | gcc-8    | defconfig  =
                  | 0/1    =

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
200724/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200724
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      26027945c94a1dfe67ea39f676f5a31276951159 =



Test Regressions
---------------- =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
at91-sama5d4_xplained     | arm    | lab-baylibre  | gcc-8    | sama5_defco=
nfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1b5ef5d2e77243db85bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1b5ef5d2e77243db85b=
b19
      failing since 87 days (last pass: next-20200424, first fail: next-202=
00428) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
bcm2837-rpi-3-b           | arm64  | lab-baylibre  | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1b58b654064c816985bb25

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f1b58b654064c81=
6985bb28
      failing since 9 days (last pass: next-20200714, first fail: next-2020=
0715)
      2 lines =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
exynos5422-odroidxu3      | arm    | lab-collabora | clang-10 | multi_v7_de=
fconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1b70a17e46a2a4ec85bb1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1b70a17e46a2a4ec85b=
b20
      new failure (last pass: next-20200723) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
exynos5422-odroidxu3      | arm    | lab-collabora | gcc-8    | exynos_defc=
onfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1b6269553be66b7485bb6d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1b6269553be66b7485b=
b6e
      failing since 2 days (last pass: next-20200630, first fail: next-2020=
0721) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
exynos5422-odroidxu3      | arm    | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1b650c019241596c85bb22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1b650c019241596c85b=
b23
      new failure (last pass: next-20200723) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
exynos5422-odroidxu3      | arm    | lab-collabora | gcc-8    | multi_v7_de=
fconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1b6bc94ea7b9575285bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1b6bc94ea7b9575285b=
b19
      new failure (last pass: next-20200723) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
exynos5422-odroidxu3      | arm    | lab-collabora | gcc-8    | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1b6d1b0d22ea1af985bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1b6d1b0d22ea1af985b=
b19
      new failure (last pass: next-20200723) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
imx6q-var-dt6customboard  | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1b61a2de5cde38c385bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1b61a2de5cde38c385b=
b19
      failing since 18 days (last pass: next-20200703, first fail: next-202=
00706) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
mt8173-elm-hana           | arm64  | lab-collabora | clang-10 | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1b606f8453d85b0385bb49

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1b606f8453d85b0385b=
b4a
      new failure (last pass: next-20200723) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
omap4-panda               | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1b619989d78c2a5185bb55

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap4-panda.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap4-panda.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f1b619989d78c2=
a5185bb59
      failing since 9 days (last pass: next-20200706, first fail: next-2020=
0715)
      60 lines =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
omap4-panda               | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1b6245fda188fb6785bb30

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f1b6245fda188f=
b6785bb34
      failing since 9 days (last pass: next-20200706, first fail: next-2020=
0715)
      60 lines =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
omap4-panda               | arm    | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1b604dd3b650b0eb85bb58

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f1b604dd3b650b=
0eb85bb5c
      failing since 9 days (last pass: next-20200706, first fail: next-2020=
0715)
      60 lines =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
omap4-panda               | arm    | lab-collabora | gcc-8    | multi_v7_de=
fconfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1b618289d78c2a5185bb1a

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f1b618289d78c2=
a5185bb1e
      failing since 9 days (last pass: next-20200706, first fail: next-2020=
0715)
      60 lines =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
omap4-panda               | arm    | lab-baylibre  | gcc-8    | omap2plus_d=
efconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1b64de617a851c8185bb2c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1b64de617a851c8185b=
b2d
      failing since 2 days (last pass: next-20200706, first fail: next-2020=
0721) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
omap4-panda               | arm    | lab-collabora | gcc-8    | omap2plus_d=
efconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1b64890568220bf185bb37

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1b64890568220bf185b=
b38
      failing since 2 days (last pass: next-20200706, first fail: next-2020=
0721) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
qemu_x86_64               | x86_64 | lab-baylibre  | clang-10 | x86_64_defc=
onfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1b5947a281d6b02b85bb22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/x86_=
64/x86_64_defconfig/clang-10/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/x86_=
64/x86_64_defconfig/clang-10/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1b5947a281d6b02b85b=
b23
      new failure (last pass: next-20200723) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
qemu_x86_64-uefi-mixed    | x86_64 | lab-baylibre  | clang-9  | x86_64_defc=
onfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1b684407a7f96b8385bb41

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-9 (clang version 9.0.1-+20191211082622+c1a0a213378-1~e=
xp1~20191211193200.102 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/x86_=
64/x86_64_defconfig/clang-9/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/x86_=
64/x86_64_defconfig/clang-9/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1b684407a7f96b8385b=
b42
      new failure (last pass: next-20200723) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun50i-a64-bananapi-m64   | arm64  | lab-clabbe    | gcc-8    | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1b5efa4ec2e4f32d85bb19

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1b5efa4ec2e4f32d85b=
b1a
      failing since 0 day (last pass: next-20200722, first fail: next-20200=
723) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun50i-a64-pine64-plus    | arm64  | lab-baylibre  | clang-10 | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1b60c3a64cc00f5b85bb21

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1b60c3a64cc00f5b85b=
b22
      failing since 7 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun50i-a64-pine64-plus    | arm64  | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1b5aadf29cfde50585bb2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1b5aadf29cfde50585b=
b30
      failing since 7 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun50i-a64-pine64-plus    | arm64  | lab-baylibre  | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1b5c16efbf30013885bb20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1b5c16efbf30013885b=
b21
      failing since 7 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun50i-a64-pine64-plus    | arm64  | lab-baylibre  | gcc-8    | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1b5f4f88d87c552985bb48

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1b5f4f88d87c552985b=
b49
      failing since 7 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-cubieboard2     | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1b601bce641a16cd85bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1b601bce641a16cd85b=
b19
      failing since 7 days (last pass: next-20200715, first fail: next-2020=
0717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-cubieboard2     | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1b624118f781656a85bb5d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1b624118f781656a85b=
b5e
      failing since 7 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-cubieboard2     | arm    | lab-clabbe    | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1b5ffe5a7110146485bb23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun7i-a20-cubie=
board2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun7i-a20-cubie=
board2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1b5ffe5a7110146485b=
b24
      failing since 7 days (last pass: next-20200715, first fail: next-2020=
0717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-cubieboard2     | arm    | lab-clabbe    | gcc-8    | multi_v7_de=
fconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1b624018f781656a85bb5a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1b624018f781656a85b=
b5b
      failing since 7 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-cubieboard2     | arm    | lab-baylibre  | gcc-8    | sunxi_defco=
nfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1b582f3646436d5f85bb62

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1b582f3646436d5f85b=
b63
      failing since 4 days (last pass: next-20200717, first fail: next-2020=
0720) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-cubieboard2     | arm    | lab-clabbe    | gcc-8    | sunxi_defco=
nfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1b58e4f64aaf01ec85bb42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1b58e4f64aaf01ec85b=
b43
      failing since 4 days (last pass: next-20200717, first fail: next-2020=
0720) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-olinuxino-lime2 | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1b6053751d57884f85bb20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-oli=
nuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-oli=
nuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1b6053751d57884f85b=
b21
      failing since 7 days (last pass: next-20200715, first fail: next-2020=
0717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-olinuxino-lime2 | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1b630c129b43564585bb34

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1b630c129b43564585b=
b35
      failing since 7 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-olinuxino-lime2 | arm    | lab-baylibre  | gcc-8    | sunxi_defco=
nfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1b586258cb544b2685bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200724/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200724/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1b586258cb544b2685b=
b19
      failing since 7 days (last pass: next-20200716, first fail: next-2020=
0717) =20
