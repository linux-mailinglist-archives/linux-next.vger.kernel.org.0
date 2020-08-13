Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E43432439A2
	for <lists+linux-next@lfdr.de>; Thu, 13 Aug 2020 14:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgHMMNZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 Aug 2020 08:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbgHMMNY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 Aug 2020 08:13:24 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 307B0C061757
        for <linux-next@vger.kernel.org>; Thu, 13 Aug 2020 05:13:23 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id c10so4200276pjn.1
        for <linux-next@vger.kernel.org>; Thu, 13 Aug 2020 05:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+6o6+YMq1Md/S5R2dRzNCXuF9N/CRC6eIW9cdzEtvsM=;
        b=Ztu/6a+8ERHCys5WarAJWTNKkr1jLGvVFIgJbPbV396avSIq2ab+NwF6McNXDdqH0Z
         l0yYE1uu2Kn2mWkOKgQvAk3FIZTyOJkNn8z95zzv1yYCXLdKSpzmQHSBP8Gc5hk/B/r7
         qe1lVIFbeuBHq+ghlY8mD5guIf/qyNbq3V1ACKvm4Ce5CNr3C/S6QcwIcnFuJcppwXqX
         XfVerfUAQlCGmAjg1Jcc8vgEfOhoaQcRHTL6NzLLMi3O1Yu2AIkKWK3eEKg38nfEkjOt
         eFGeDATRBsy0z4reeFg8+3EI+tvAlinlOMXi/sQd106CN3CsDIcm4SXlcIRaLkCHd5Rg
         wiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+6o6+YMq1Md/S5R2dRzNCXuF9N/CRC6eIW9cdzEtvsM=;
        b=qCijit3yhpp6xdL483SnMVmlg9mRfppBU25uMfvcFDz9qn52s1H1kjpf5tED1NQ7j+
         NY6z6nRu/bKtqunJmmVNN2nWkdVTQ+mJWzOXNzhWQr6wJvL3AsJq8IiBT0z+bhz1J6vC
         ZjWhJHgsiqA+H6ruSxWxLT2dvWedxxjQiwtuQ2pefZVNTk2xiP2qvfQTKrtPUD8bOJwf
         d/biTb09inBZPUOP6r6aglyFVjnCU9IirPHP74I67hrfaJE0IAhFgvXgekgUDqPgRpTB
         KlNn9yknZbdKq4RbDUaWq5inPqDSZZMSAjcAZ13MQToAkQcCH9OYIlH8FFBrTGVKjd0a
         4zyA==
X-Gm-Message-State: AOAM530D5G2n3rqP9VqF+netz07WQLFl9tquMpAs1vIcJJ061comZVSK
        JqBwkCRhNhryuD9FKTNCy9D3WPsnMnw=
X-Google-Smtp-Source: ABdhPJyR0W5XN4569V/A+V6ARQ0rau2pzIrVV9DDYbjOPf9UFxsknXI8NfHalMVy/TV8k/98LZENVA==
X-Received: by 2002:a17:902:221:: with SMTP id 30mr3732710plc.222.1597320799084;
        Thu, 13 Aug 2020 05:13:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x7sm5986465pfc.209.2020.08.13.05.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 05:13:18 -0700 (PDT)
Message-ID: <5f352e5e.1c69fb81.e6067.e140@mx.google.com>
Date:   Thu, 13 Aug 2020 05:13:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20200813
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 470 runs, 36 regressions (next-20200813)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 470 runs, 36 regressions (next-20200813)

Regressions Summary
-------------------

platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained       | arm   | lab-baylibre  | gcc-8    | sama5_defc=
onfig              | 0/1    =

bcm2837-rpi-3-b             | arm64 | lab-baylibre  | clang-10 | defconfig =
                   | 4/5    =

bcm2837-rpi-3-b             | arm64 | lab-baylibre  | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =

exynos5422-odroidxu3        | arm   | lab-collabora | clang-10 | multi_v7_d=
efconfig           | 0/1    =

exynos5422-odroidxu3        | arm   | lab-collabora | gcc-8    | exynos_def=
config             | 0/1    =

exynos5422-odroidxu3        | arm   | lab-collabora | gcc-8    | multi_v7_d=
efconfig           | 0/1    =

exynos5422-odroidxu3        | arm   | lab-collabora | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =

exynos5422-odroidxu3        | arm   | lab-collabora | gcc-8    | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 0/1    =

imx6q-var-dt6customboard    | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =

omap4-panda                 | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efconfig           | 4/5    =

omap4-panda                 | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 4/5    =

omap4-panda                 | arm   | lab-collabora | gcc-8    | multi_v7_d=
efconfig           | 4/5    =

omap4-panda                 | arm   | lab-collabora | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 4/5    =

omap4-panda                 | arm   | lab-baylibre  | gcc-8    | omap2plus_=
defconfig          | 0/1    =

omap4-panda                 | arm   | lab-collabora | gcc-8    | omap2plus_=
defconfig          | 0/1    =

rk3288-veyron-jaq           | arm   | lab-collabora | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =

rk3399-gru-kevin            | arm64 | lab-collabora | clang-10 | defconfig =
                   | 84/88  =

rk3399-gru-kevin            | arm64 | lab-collabora | gcc-8    | defconfig =
                   | 84/88  =

rk3399-gru-kevin            | arm64 | lab-collabora | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 84/88  =

sun50i-a64-pine64-plus      | arm64 | lab-baylibre  | clang-10 | defconfig =
                   | 0/1    =

sun50i-a64-pine64-plus      | arm64 | lab-baylibre  | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 0/1    =

sun50i-a64-pine64-plus      | arm64 | lab-baylibre  | gcc-8    | defconfig =
                   | 0/1    =

sun50i-a64-pine64-plus      | arm64 | lab-baylibre  | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 0/1    =

sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efconfig           | 0/1    =

sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-8    | multi_v7_d=
efconfig           | 0/1    =

sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-8    | sunxi_defc=
onfig              | 0/1    =

sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-8    | sunxi_defc=
onfig              | 0/1    =

sun7i-a20-olinuxino-lime2   | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efconfig           | 0/1    =

sun7i-a20-olinuxino-lime2   | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-olinuxino-lime2   | arm   | lab-baylibre  | gcc-8    | sunxi_defc=
onfig              | 0/1    =

sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe    | gcc-8    | multi_v7_d=
efc...BIG_ENDIAN=3Dy | 0/1    =

sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe    | gcc-8    | multi_v7_d=
efconfig           | 0/1    =

sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe    | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =

sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe    | gcc-8    | sunxi_defc=
onfig              | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200813/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200813
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e6d113aca646fb6a92b237340109237fd7a9c770 =



Test Regressions
---------------- =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained       | arm   | lab-baylibre  | gcc-8    | sama5_defc=
onfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f34f96dda507954e852c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f34f96dda507954e852c=
1a7
      failing since 106 days (last pass: next-20200424, first fail: next-20=
200428) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
bcm2837-rpi-3-b             | arm64 | lab-baylibre  | clang-10 | defconfig =
                   | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f34f5191ea9bea02a52c1d3

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f34f5191ea9bea0=
2a52c1d6
      new failure (last pass: next-20200812)
      2 lines =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
bcm2837-rpi-3-b             | arm64 | lab-baylibre  | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f34f73910074bde4552c1aa

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f34f73a10074bde=
4552c1ad
      new failure (last pass: next-20200811)
      1 lines =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
exynos5422-odroidxu3        | arm   | lab-collabora | clang-10 | multi_v7_d=
efconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f350e3381cbe2556552c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f350e3381cbe2556552c=
1a7
      new failure (last pass: next-20200812) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
exynos5422-odroidxu3        | arm   | lab-collabora | gcc-8    | exynos_def=
config             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f34fb75f5aebc370852c1df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f34fb75f5aebc370852c=
1e0
      failing since 22 days (last pass: next-20200630, first fail: next-202=
00721) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
exynos5422-odroidxu3        | arm   | lab-collabora | gcc-8    | multi_v7_d=
efconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3507179671515bdc52c1a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3507179671515bdc52c=
1a8
      failing since 19 days (last pass: next-20200723, first fail: next-202=
00724) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
exynos5422-odroidxu3        | arm   | lab-collabora | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3509a12e2cd4760e52c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3509a12e2cd4760e52c=
1a7
      failing since 19 days (last pass: next-20200723, first fail: next-202=
00724) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
exynos5422-odroidxu3        | arm   | lab-collabora | gcc-8    | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3510d17688fdc09052c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3510d17688fdc09052c=
1a7
      failing since 19 days (last pass: next-20200723, first fail: next-202=
00724) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
imx6q-var-dt6customboard    | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f34fe4f1b0894532a52c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f34fe4f1b0894532a52c=
1a7
      failing since 1 day (last pass: next-20200810, first fail: next-20200=
811) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
omap4-panda                 | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efconfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f34fc055ed18e856052c1be

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f34fc055ed18e8=
56052c1c2
      failing since 28 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
omap4-panda                 | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f34fcafce809158e352c1e1

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap4-panda.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap4-panda.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f34fcafce80915=
8e352c1e5
      failing since 28 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
omap4-panda                 | arm   | lab-collabora | gcc-8    | multi_v7_d=
efconfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f34fbaf167888853352c1b5

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f34fbaf1678888=
53352c1b9
      failing since 28 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
omap4-panda                 | arm   | lab-collabora | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f34fc2c7fb7b592ee52c234

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f34fc2c7fb7b59=
2ee52c238
      failing since 28 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
omap4-panda                 | arm   | lab-baylibre  | gcc-8    | omap2plus_=
defconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f34fe25ed34a4f24152c1ce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f34fe25ed34a4f24152c=
1cf
      failing since 22 days (last pass: next-20200706, first fail: next-202=
00721) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
omap4-panda                 | arm   | lab-collabora | gcc-8    | omap2plus_=
defconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f34fd6ffdf5cc02c352c1bf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f34fd6ffdf5cc02c352c=
1c0
      failing since 22 days (last pass: next-20200706, first fail: next-202=
00721) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
rk3288-veyron-jaq           | arm   | lab-collabora | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f34ffadac3223a78d52c1b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f34ffadac3223a78d52c=
1b1
      new failure (last pass: next-20200812) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
rk3399-gru-kevin            | arm64 | lab-collabora | clang-10 | defconfig =
                   | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f34f4fdc7e5814c8d52c1bb

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f34f4fec7e5814c8d52c1fb
      failing since 14 days (last pass: next-20200728, first fail: next-202=
00729) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
rk3399-gru-kevin            | arm64 | lab-collabora | gcc-8    | defconfig =
                   | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f34f5e0a5f8182f8d52c1da

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f34f5e1a5f8182f8d52c21a
      failing since 12 days (last pass: next-20200728, first fail: next-202=
00731) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
rk3399-gru-kevin            | arm64 | lab-collabora | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f34f70bbb827bdca852c1da

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f34f70cbb827bdca852c21a
      failing since 14 days (last pass: next-20200728, first fail: next-202=
00729) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun50i-a64-pine64-plus      | arm64 | lab-baylibre  | clang-10 | defconfig =
                   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f34fd37f17152117c52c1af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f34fd37f17152117c52c=
1b0
      failing since 26 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun50i-a64-pine64-plus      | arm64 | lab-baylibre  | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f34febafadbb0ae8b52c1b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f34febafadbb0ae8b52c=
1b1
      failing since 26 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun50i-a64-pine64-plus      | arm64 | lab-baylibre  | gcc-8    | defconfig =
                   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3500488bbd3bc66152c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3500488bbd3bc66152c=
1a7
      failing since 26 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun50i-a64-pine64-plus      | arm64 | lab-baylibre  | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f350375f3a5acb76052c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f350375f3a5acb76052c=
1a7
      failing since 26 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f34fc6fafd452224d52c1d3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f34fc6fafd452224d52c=
1d4
      failing since 26 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f34fdb9af4a923d2c52c1b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f34fdb9af4a923d2c52c=
1b1
      failing since 26 days (last pass: next-20200715, first fail: next-202=
00717) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-8    | multi_v7_d=
efconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f34fc77afd452224d52c1f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f34fc77afd452224d52c=
1f2
      failing since 26 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f34fdba29999bdae752c1b3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun7i-a20-cubie=
board2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun7i-a20-cubie=
board2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f34fdba29999bdae752c=
1b4
      failing since 26 days (last pass: next-20200715, first fail: next-202=
00717) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-8    | sunxi_defc=
onfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f34f6589ba519f1b152c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f34f6589ba519f1b152c=
1a7
      failing since 23 days (last pass: next-20200717, first fail: next-202=
00720) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-8    | sunxi_defc=
onfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f34f64c104726e2e952c1b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f34f64c104726e2e952c=
1b5
      failing since 23 days (last pass: next-20200717, first fail: next-202=
00720) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun7i-a20-olinuxino-lime2   | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f350464a19c35b96552c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f350464a19c35b96552c=
1a7
      failing since 26 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun7i-a20-olinuxino-lime2   | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3505bebaaac920ac52c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-oli=
nuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-oli=
nuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3505bebaaac920ac52c=
1a7
      failing since 26 days (last pass: next-20200715, first fail: next-202=
00717) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun7i-a20-olinuxino-lime2   | arm   | lab-baylibre  | gcc-8    | sunxi_defc=
onfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3500951dccc17ce752c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3500951dccc17ce752c=
1a7
      failing since 26 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe    | gcc-8    | multi_v7_d=
efc...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f34fbfc5ed18e856052c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-clabbe/baseline-sun8=
i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-clabbe/baseline-sun8=
i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armeb/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f34fbfc5ed18e856052c=
1a7
      failing since 1 day (last pass: next-20200519, first fail: next-20200=
811) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe    | gcc-8    | multi_v7_d=
efconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f34ff294bb72f898e52c1be

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f34ff294bb72f898e52c=
1bf
      failing since 1 day (last pass: next-20200519, first fail: next-20200=
811) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe    | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f35006d8bbd3bc66152c1af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun8i-r40-banan=
api-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun8i-r40-banan=
api-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f35006d8bbd3bc66152c=
1b0
      failing since 1 day (last pass: next-20200519, first fail: next-20200=
811) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe    | gcc-8    | sunxi_defc=
onfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f34fa255b9ef65db852c1ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200813/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200813/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f34fa255b9ef65db852c=
1cb
      failing since 1 day (last pass: next-20200519, first fail: next-20200=
811) =20
