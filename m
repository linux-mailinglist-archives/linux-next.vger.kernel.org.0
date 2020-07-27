Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F80922FB11
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 23:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgG0VIr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 17:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgG0VIq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2020 17:08:46 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BFAFC061794
        for <linux-next@vger.kernel.org>; Mon, 27 Jul 2020 14:08:46 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id k13so1005711plk.13
        for <linux-next@vger.kernel.org>; Mon, 27 Jul 2020 14:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=BDfXDLb+KAaq2DNfeeasErPhD8WcR4ImczgrotZ5Ta4=;
        b=W463YPzBEMK7WT/2ojYLxUKG1sTSoa0hvbRUQmk0xxnsl7b2jqH+m6QF5SRx0HLcOl
         4I48j4oWcifKTudUjdXKx/oH1FXzh6nvywb7ZBiLR6bb5s2C/Z1kWCHCgiLhNDvRbMxp
         IaGX6KS5nQKSNwf1GQGUzFpGQyZ3UPI1PH9LAicss9NfvTc/haUeVDuLj6RhY9mSu0nm
         PQMADVn9ZvCP7/1dz+NpO8K44t6Cfy/BPbuVHBKivqNfNxdjhPgnd+K1yJAM5CN0SIme
         cg+4i+FWkHyMyeBmDrCa5x322J92cuCVM+9QcUe31Uev1c7NbYXPJDhwn6qhlqst1HMY
         W61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=BDfXDLb+KAaq2DNfeeasErPhD8WcR4ImczgrotZ5Ta4=;
        b=pdVtNVxrYkwkIjRGZBETl4L+WIGQ9DUv8PXcjkqQ2yqQ/gHMUofqs5EwgTkmCwwVwF
         Cz3VCHXDewKSfZkAaS4oSW147vPkYp9W8yK7ZiAf1bq93GrVE3ANb1CcHSq2Ny40O9h8
         QZWos/OMIodm/zczLUh5cgFqKqGarP+Lp5RZRdM2p9uKZamDXfQA/SyePAFlx32kJ+0R
         5VHhIWmiuIg6ongIOR/hbMjjldshaXvrYFnNZutZSjGfY5du636b8Vl6VKhVX7lo8hD4
         caNHTjlCw3DH87qFDsV9lUzkCacaddoglMVnRnO8f1hHB6kKrR4XQ0tg5Ggvdv/yUeSG
         V7BQ==
X-Gm-Message-State: AOAM533UjEqfwXG7rDyZiSF+Ro7OuDpXjNa05mIlj28CDGFIDbu59O68
        cELeKISMPTum7ZtIxzlOaumeJMQLsFQ=
X-Google-Smtp-Source: ABdhPJywg/WLSmxA8g6ZZFRknIHEqqBTJIzv7bnRJInHABF6jm0AK36KR8k6J4i1t8rLrvwmHePDlQ==
X-Received: by 2002:a17:902:8349:: with SMTP id z9mr20904903pln.46.1595884124831;
        Mon, 27 Jul 2020 14:08:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u14sm15582788pgf.51.2020.07.27.14.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 14:08:44 -0700 (PDT)
Message-ID: <5f1f425c.1c69fb81.a0e5e.6ecd@mx.google.com>
Date:   Mon, 27 Jul 2020 14:08:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200727
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 458 runs, 32 regressions (next-20200727)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 458 runs, 32 regressions (next-20200727)

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

exynos5422-odroidxu3      | arm    | lab-collabora | clang-10 | multi_v7_de=
fconfig           | 0/1    =

exynos5422-odroidxu3      | arm    | lab-collabora | gcc-8    | exynos_defc=
onfig             | 0/1    =

exynos5422-odroidxu3      | arm    | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =

exynos5422-odroidxu3      | arm    | lab-collabora | gcc-8    | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 0/1    =

exynos5422-odroidxu3      | arm    | lab-collabora | gcc-8    | multi_v7_de=
fconfig           | 0/1    =

imx6q-var-dt6customboard  | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =

meson-gxl-s905d-p230      | arm64  | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 0/1    =

mt8173-elm-hana           | arm64  | lab-collabora | clang-10 | defconfig  =
                  | 0/1    =

mt8173-elm-hana           | arm64  | lab-collabora | gcc-8    | defconfig  =
                  | 0/1    =

mt8173-elm-hana           | arm64  | lab-collabora | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =

omap3-beagle-xm           | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =

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

qemu_x86_64-uefi          | x86_64 | lab-collabora | clang-10 | x86_64_defc=
onfig             | 0/1    =

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

sun7i-a20-cubieboard2     | arm    | lab-baylibre  | gcc-8    | sunxi_defco=
nfig              | 0/1    =

sun7i-a20-olinuxino-lime2 | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-olinuxino-lime2 | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 0/1    =

sun7i-a20-olinuxino-lime2 | arm    | lab-baylibre  | gcc-8    | sunxi_defco=
nfig              | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200727/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200727
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e9a523ff8f76de0768857f02ea76437d3b39d151 =



Test Regressions
---------------- =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
at91-sama5d4_xplained     | arm    | lab-baylibre  | gcc-8    | sama5_defco=
nfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1f04a83f916ec04485bb33

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1f04a83f916ec04485b=
b34
      failing since 90 days (last pass: next-20200424, first fail: next-202=
00428) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
bcm2837-rpi-3-b           | arm64  | lab-baylibre  | clang-10 | defconfig  =
                  | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1efe630e0848ca8485bb28

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f1efe630e0848ca=
8485bb2b
      new failure (last pass: next-20200724)
      2 lines =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
exynos5422-odroidxu3      | arm    | lab-collabora | clang-10 | multi_v7_de=
fconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1f0ef3299203f6e485bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1f0ef3299203f6e485b=
b19
      failing since 2 days (last pass: next-20200723, first fail: next-2020=
0724) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
exynos5422-odroidxu3      | arm    | lab-collabora | gcc-8    | exynos_defc=
onfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1f003fcf72986e7385bbfd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1f003fcf72986e7385b=
bfe
      failing since 5 days (last pass: next-20200630, first fail: next-2020=
0721) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
exynos5422-odroidxu3      | arm    | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1f03cf2acd09ef8c85bb3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1f03cf2acd09ef8c85b=
b3e
      failing since 2 days (last pass: next-20200723, first fail: next-2020=
0724) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
exynos5422-odroidxu3      | arm    | lab-collabora | gcc-8    | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1f0b9c9a312a85cd85bb31

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1f0b9c9a312a85cd85b=
b32
      failing since 2 days (last pass: next-20200723, first fail: next-2020=
0724) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
exynos5422-odroidxu3      | arm    | lab-collabora | gcc-8    | multi_v7_de=
fconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1f12eb05d70ada6585bb1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1f12eb05d70ada6585b=
b1c
      failing since 2 days (last pass: next-20200723, first fail: next-2020=
0724) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
imx6q-var-dt6customboard  | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1f047bc9a190308185bb22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1f047bc9a190308185b=
b23
      failing since 21 days (last pass: next-20200703, first fail: next-202=
00706) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
meson-gxl-s905d-p230      | arm64  | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1f032d1f6aef336e85bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1f032d1f6aef336e85b=
b19
      new failure (last pass: next-20200724) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
mt8173-elm-hana           | arm64  | lab-collabora | clang-10 | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1f00e05880e9685085bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1f00e05880e9685085b=
b19
      failing since 2 days (last pass: next-20200723, first fail: next-2020=
0724) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
mt8173-elm-hana           | arm64  | lab-collabora | gcc-8    | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1efacdfc78f822af85bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1efacdfc78f822af85b=
b19
      new failure (last pass: next-20200724) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
mt8173-elm-hana           | arm64  | lab-collabora | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1efe39d9801c756485bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-mt8173-e=
lm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-mt8173-e=
lm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1efe39d9801c756485b=
b19
      new failure (last pass: next-20200724) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
omap3-beagle-xm           | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1f03ca2acd09ef8c85bb38

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap3-beagle-=
xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap3-beagle-=
xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1f03ca2acd09ef8c85b=
b39
      new failure (last pass: next-20200724) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
omap4-panda               | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1f032c4b2902b6af85bb6f

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap4-panda.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap4-panda.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f1f032c4b2902b=
6af85bb73
      failing since 12 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
omap4-panda               | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1f0a4a8d424ac76c85bb4d

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f1f0a4a8d424ac=
76c85bb51
      failing since 12 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
omap4-panda               | arm    | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1f031f4b2902b6af85bb53

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f1f031f4b2902b=
6af85bb57
      failing since 12 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
omap4-panda               | arm    | lab-collabora | gcc-8    | multi_v7_de=
fconfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1f0a47f33d09d3de85bb2b

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f1f0a47f33d09d=
3de85bb2f
      failing since 12 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
omap4-panda               | arm    | lab-baylibre  | gcc-8    | omap2plus_d=
efconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1f0035cf72986e7385bbf8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1f0035cf72986e7385b=
bf9
      failing since 5 days (last pass: next-20200706, first fail: next-2020=
0721) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
omap4-panda               | arm    | lab-collabora | gcc-8    | omap2plus_d=
efconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1eff8478dc7dc3d285bb37

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1eff8478dc7dc3d285b=
b38
      failing since 5 days (last pass: next-20200706, first fail: next-2020=
0721) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
qemu_x86_64-uefi          | x86_64 | lab-collabora | clang-10 | x86_64_defc=
onfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1f05c436824ca6b485bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/x86_=
64/x86_64_defconfig/clang-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/x86_=
64/x86_64_defconfig/clang-10/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1f05c436824ca6b485b=
b19
      new failure (last pass: next-20200724) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun50i-a64-bananapi-m64   | arm64  | lab-clabbe    | gcc-8    | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1efadb58dda3bcc585bb1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1efadb58dda3bcc585b=
b1c
      failing since 3 days (last pass: next-20200722, first fail: next-2020=
0723) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun50i-a64-bananapi-m64   | arm64  | lab-clabbe    | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1efe3ad9801c756485bb1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1efe3ad9801c756485b=
b1e
      new failure (last pass: next-20200724) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun50i-a64-pine64-plus    | arm64  | lab-baylibre  | clang-10 | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1f00b1488945beb585bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1f00b1488945beb585b=
b19
      failing since 9 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun50i-a64-pine64-plus    | arm64  | lab-baylibre  | gcc-8    | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1efbc9c8eb64e89f85bb24

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1efbc9c8eb64e89f85b=
b25
      failing since 9 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun50i-a64-pine64-plus    | arm64  | lab-baylibre  | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1efeddda7c59e48b85bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1efeddda7c59e48b85b=
b19
      failing since 9 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun50i-a64-pine64-plus    | arm64  | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1f0716b7ee16d0a785bb26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1f0716b7ee16d0a785b=
b27
      failing since 9 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-cubieboard2     | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1f03c92acd09ef8c85bb35

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1f03c92acd09ef8c85b=
b36
      failing since 9 days (last pass: next-20200715, first fail: next-2020=
0717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-cubieboard2     | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1f0ba19a312a85cd85bb34

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1f0ba19a312a85cd85b=
b35
      failing since 9 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-cubieboard2     | arm    | lab-baylibre  | gcc-8    | sunxi_defco=
nfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1ef920629fe7575685bb1a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1ef920629fe7575685b=
b1b
      failing since 7 days (last pass: next-20200717, first fail: next-2020=
0720) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-olinuxino-lime2 | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1f032f1f6aef336e85bb1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-oli=
nuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-oli=
nuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1f032f1f6aef336e85b=
b1e
      failing since 9 days (last pass: next-20200715, first fail: next-2020=
0717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-olinuxino-lime2 | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1f0b017d0d8c1e3685bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1f0b017d0d8c1e3685b=
b19
      failing since 9 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-olinuxino-lime2 | arm    | lab-baylibre  | gcc-8    | sunxi_defco=
nfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1ef97e471b44e18585bb23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200727/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200727/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1ef97e471b44e18585b=
b24
      failing since 9 days (last pass: next-20200716, first fail: next-2020=
0717) =20
