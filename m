Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F33A72322C3
	for <lists+linux-next@lfdr.de>; Wed, 29 Jul 2020 18:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgG2Qf7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 12:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgG2Qf6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2020 12:35:58 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B97BC061794
        for <linux-next@vger.kernel.org>; Wed, 29 Jul 2020 09:35:58 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id mt12so2104512pjb.4
        for <linux-next@vger.kernel.org>; Wed, 29 Jul 2020 09:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=aYCE0Ok7MH7IoZcl0nb4q/wqPC6Hv+4bkAgByntwiUA=;
        b=NjbxpJDTBLgGvjMnvjyu3LThGGoxOEbzpOtwIqIxXfEqzW4XTL1bHsIk355Aq/iGKN
         T6xpk6NkpPTpEBOKhEiaIKIFBaTd3ucXcXgc7SnNw8CvlFtySgHWbWmG2lIE97pitBeG
         o3iDMp1wsFpowMgyWUtjU7eFza9JOL9HPZx8fysuteObbS40qXfyS70vGwXrO7BmcrnM
         oDpQ/wD35+pbBVdhUPIqXDmw9A9utD5k1y6Hjr2JOU4xNYBlrMhPsarYOfDC++3gw7/q
         pnmyOpZR+b6SvJGHnRlFfwAE5gmZGsxwzkefSjQhw4JoBJPck2XJoxsGNu/KlwdHMdy5
         yD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=aYCE0Ok7MH7IoZcl0nb4q/wqPC6Hv+4bkAgByntwiUA=;
        b=qJxSckhQpwXv7/GSh4leMYJSmBkok4QBo5KcF0JM+X/4fvY65zoKVEPHj09lx69HeM
         GqRTSe8e2fLnq1wii159btDJzuAilbx5VtS7WHu2K3BMsTP2PhEzuurBCTUPjftyU7s4
         CDyOWi6YnjzUyZRUuqM/pbMtJhEGapVLFL27CkZb7pR02LCkBPavbNTSjksgcBZZoXvD
         tIDUPd6a3UfG7cH/OodHHTwwNjXiQe44ATL/zk3JNkmZsYLEfCVJ4pdo+KQJeu0LJi8R
         dm7g1LZmXKuAwP9pUiR2jcVUgckUXGUh9iBAByuSYXc0vEVcVdLJms/xaT3yOWnyY92p
         xlkg==
X-Gm-Message-State: AOAM530iWbbmjYgpmPJAJORt6aerBTHyehuxgQIU4h3nlIpRTDx2n0Y/
        bRg5sDCB7KLjROcfnARIZ7Vnipc2g9o=
X-Google-Smtp-Source: ABdhPJzY8RwN/ovCIaAVriRiWIirWyI1zMopOZNYtS4rleMaV0S8SufXYHUYpYhnaX9oJpUxa/QVuA==
X-Received: by 2002:a17:902:a40c:: with SMTP id p12mr26887820plq.51.1596040556510;
        Wed, 29 Jul 2020 09:35:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t63sm2957786pfb.210.2020.07.29.09.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 09:35:55 -0700 (PDT)
Message-ID: <5f21a56b.1c69fb81.de087.83e5@mx.google.com>
Date:   Wed, 29 Jul 2020 09:35:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20200728
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 467 runs, 30 regressions (next-20200728)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 467 runs, 30 regressions (next-20200728)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
at91-sama5d4_xplained      | arm   | lab-baylibre  | gcc-8    | sama5_defco=
nfig              | 0/1    =

bcm2837-rpi-3-b            | arm64 | lab-baylibre  | clang-10 | defconfig  =
                  | 4/5    =

bcm2837-rpi-3-b            | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 4/5    =

exynos5422-odroidxu3       | arm   | lab-collabora | clang-10 | multi_v7_de=
fconfig           | 0/1    =

exynos5422-odroidxu3       | arm   | lab-collabora | gcc-8    | exynos_defc=
onfig             | 0/1    =

exynos5422-odroidxu3       | arm   | lab-collabora | gcc-8    | multi_v7_de=
fconfig           | 0/1    =

exynos5422-odroidxu3       | arm   | lab-collabora | gcc-8    | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 0/1    =

exynos5422-odroidxu3       | arm   | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =

imx6q-var-dt6customboard   | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =

meson-gxl-s905d-p230       | arm64 | lab-baylibre  | gcc-8    | defconfig  =
                  | 0/1    =

meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 0/1    =

mt8173-elm-hana            | arm64 | lab-collabora | clang-10 | defconfig  =
                  | 0/1    =

mt8173-elm-hana            | arm64 | lab-collabora | gcc-8    | defconfig  =
                  | 0/1    =

mt8173-elm-hana            | arm64 | lab-collabora | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =

omap4-panda                | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 4/5    =

omap4-panda                | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 4/5    =

omap4-panda                | arm   | lab-collabora | gcc-8    | multi_v7_de=
fconfig           | 4/5    =

omap4-panda                | arm   | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 4/5    =

omap4-panda                | arm   | lab-baylibre  | gcc-8    | omap2plus_d=
efconfig          | 0/1    =

omap4-panda                | arm   | lab-collabora | gcc-8    | omap2plus_d=
efconfig          | 0/1    =

sun50i-a64-pine64-plus     | arm64 | lab-baylibre  | clang-10 | defconfig  =
                  | 0/1    =

sun50i-a64-pine64-plus     | arm64 | lab-baylibre  | gcc-8    | defconfig  =
                  | 0/1    =

sun50i-a64-pine64-plus     | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 0/1    =

sun50i-a64-pine64-plus     | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =

sun7i-a20-cubieboard2      | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 0/1    =

sun7i-a20-cubieboard2      | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2      | arm   | lab-baylibre  | gcc-8    | sunxi_defco=
nfig              | 0/1    =

sun7i-a20-olinuxino-lime2  | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 0/1    =

sun7i-a20-olinuxino-lime2  | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-olinuxino-lime2  | arm   | lab-baylibre  | gcc-8    | sunxi_defco=
nfig              | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200728/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200728
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e8926783181347365c9f2a9f5b7c4220be6e3b45 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
at91-sama5d4_xplained      | arm   | lab-baylibre  | gcc-8    | sama5_defco=
nfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f214856a6abe3c0b852c1b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f214856a6abe3c0b852c=
1b2
      failing since 91 days (last pass: next-20200424, first fail: next-202=
00428) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
bcm2837-rpi-3-b            | arm64 | lab-baylibre  | clang-10 | defconfig  =
                  | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f213d32ee069750fa52c1b8

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f213d32ee069750=
fa52c1bb
      failing since 1 day (last pass: next-20200724, first fail: next-20200=
727)
      2 lines =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
bcm2837-rpi-3-b            | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f2148156b54a40dc752c1b1

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f2148156b54a40d=
c752c1b4
      new failure (last pass: next-20200727)
      2 lines =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
exynos5422-odroidxu3       | arm   | lab-collabora | clang-10 | multi_v7_de=
fconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f21523771c71df77952c1fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f21523771c71df77952c=
1ff
      failing since 4 days (last pass: next-20200723, first fail: next-2020=
0724) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
exynos5422-odroidxu3       | arm   | lab-collabora | gcc-8    | exynos_defc=
onfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2148c47331c21e5c52c1ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2148c47331c21e5c52c=
1bb
      failing since 7 days (last pass: next-20200630, first fail: next-2020=
0721) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
exynos5422-odroidxu3       | arm   | lab-collabora | gcc-8    | multi_v7_de=
fconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2142e535e8f6b56b52c1a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2142e535e8f6b56b52c=
1a8
      failing since 4 days (last pass: next-20200723, first fail: next-2020=
0724) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
exynos5422-odroidxu3       | arm   | lab-collabora | gcc-8    | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f214fb8be2f1c7bd852c1b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f214fb8be2f1c7bd852c=
1ba
      failing since 4 days (last pass: next-20200723, first fail: next-2020=
0724) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
exynos5422-odroidxu3       | arm   | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2156dacb1dce40d352c1ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2156dacb1dce40d352c=
1ac
      failing since 4 days (last pass: next-20200723, first fail: next-2020=
0724) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
imx6q-var-dt6customboard   | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f214de909e41c9d2452c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f214de909e41c9d2452c=
1a7
      failing since 23 days (last pass: next-20200703, first fail: next-202=
00706) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
meson-gxl-s905d-p230       | arm64 | lab-baylibre  | gcc-8    | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f213fa449d4f9cd4852c1d8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f213fa449d4f9cd4852c=
1d9
      new failure (last pass: next-20200727) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f21463ab3e63a82b752c1ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f21463ab3e63a82b752c=
1ad
      new failure (last pass: next-20200727) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
mt8173-elm-hana            | arm64 | lab-collabora | clang-10 | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f213e01716b1ddcfd52c1a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f213e01716b1ddcfd52c=
1a8
      failing since 4 days (last pass: next-20200723, first fail: next-2020=
0724) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
mt8173-elm-hana            | arm64 | lab-collabora | gcc-8    | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f214162287f064c0a52c1b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f214162287f064c0a52c=
1b2
      failing since 1 day (last pass: next-20200724, first fail: next-20200=
727) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
mt8173-elm-hana            | arm64 | lab-collabora | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2148e9bc4979774052c1b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-mt8173-e=
lm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-mt8173-e=
lm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2148e9bc4979774052c=
1b3
      failing since 1 day (last pass: next-20200724, first fail: next-20200=
727) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
omap4-panda                | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f2140cf24672b334e52c1a6

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f2140cf24672b3=
34e52c1aa
      failing since 13 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
omap4-panda                | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f214d00e8712d7fc852c1a6

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap4-panda.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap4-panda.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f214d00e8712d7=
fc852c1aa
      failing since 14 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
omap4-panda                | arm   | lab-collabora | gcc-8    | multi_v7_de=
fconfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f2140cfa51c8d420f52c1d3

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f2140cfa51c8d4=
20f52c1d7
      failing since 13 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
omap4-panda                | arm   | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f214cdb921005015152c1a6

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f214cdb9210050=
15152c1aa
      failing since 14 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
omap4-panda                | arm   | lab-baylibre  | gcc-8    | omap2plus_d=
efconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f214baa13c9719b4052c1b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f214baa13c9719b4052c=
1b2
      failing since 7 days (last pass: next-20200706, first fail: next-2020=
0721) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
omap4-panda                | arm   | lab-collabora | gcc-8    | omap2plus_d=
efconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f214b968949ec385d52c1af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f214b968949ec385d52c=
1b0
      failing since 7 days (last pass: next-20200706, first fail: next-2020=
0721) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
sun50i-a64-pine64-plus     | arm64 | lab-baylibre  | clang-10 | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f213e28e17e5761d852c1a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f213e28e17e5761d852c=
1a8
      failing since 11 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
sun50i-a64-pine64-plus     | arm64 | lab-baylibre  | gcc-8    | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f21410b24672b334e52c1e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f21410b24672b334e52c=
1e9
      failing since 11 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
sun50i-a64-pine64-plus     | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f214858e67021eb7052c1ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f214858e67021eb7052c=
1ad
      failing since 11 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
sun50i-a64-pine64-plus     | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2149ca9937c31f5b52c1b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2149ca9937c31f5b52c=
1b1
      failing since 11 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
sun7i-a20-cubieboard2      | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f214180f23f11114a52c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f214180f23f11114a52c=
1a7
      failing since 11 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
sun7i-a20-cubieboard2      | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f214e26568bcfd3ea52c1a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f214e26568bcfd3ea52c=
1a8
      failing since 11 days (last pass: next-20200715, first fail: next-202=
00717) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
sun7i-a20-cubieboard2      | arm   | lab-baylibre  | gcc-8    | sunxi_defco=
nfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2143d45171ec3a2552c20b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2143d45171ec3a2552c=
20c
      failing since 8 days (last pass: next-20200717, first fail: next-2020=
0720) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
sun7i-a20-olinuxino-lime2  | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2141b42b053a1f4552c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2141b42b053a1f4552c=
1a7
      failing since 11 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
sun7i-a20-olinuxino-lime2  | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f214eae123d48b9e052c1b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-oli=
nuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-oli=
nuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f214eae123d48b9e052c=
1b5
      failing since 11 days (last pass: next-20200715, first fail: next-202=
00717) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
sun7i-a20-olinuxino-lime2  | arm   | lab-baylibre  | gcc-8    | sunxi_defco=
nfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2145c1d14d816cda52c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200728/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200728/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2145c1d14d816cda52c=
1a7
      failing since 11 days (last pass: next-20200716, first fail: next-202=
00717) =20
