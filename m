Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5B882C0CA2
	for <lists+linux-next@lfdr.de>; Mon, 23 Nov 2020 15:14:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730663AbgKWN6j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Nov 2020 08:58:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730032AbgKWN6i (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Nov 2020 08:58:38 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FAE7C0613CF
        for <linux-next@vger.kernel.org>; Mon, 23 Nov 2020 05:58:38 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id f17so5798096pge.6
        for <linux-next@vger.kernel.org>; Mon, 23 Nov 2020 05:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=AsxFTB7wyh8Xbsdq7YOXp2gHQSnDMxQkj8P29/Ti0MQ=;
        b=q4Uiv7BhIPhsmszcuXQP06jzeE5MwlQ4/XvkxydLcKdM9WJU0/tdHlYrs9cSttL5N0
         8immP+Ty7Bab9eXLVnjgUekWM1ZkAjp7It1QvNFDqEbcLuU3rkbiCazX+kwwMr9dDv5L
         SEtpNF5okyMTyr0ZozdHu62F1/AxlNegz4a9yBDcnMFVWHlDvlf1rMnZviQXDU3HrQ54
         xPXrx1FG6vDfUESuhtPRcERDS7wcs/hZtsIA2L9c3vkLE3NA4kpHQte6LvJBYFRSBpa2
         FOZNL+9vlqUSi01i3B1UYYXAZK2llT2jIgbCmA9nwact38TkkWzi2LHQ2ouEjLKKG/Mx
         oy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=AsxFTB7wyh8Xbsdq7YOXp2gHQSnDMxQkj8P29/Ti0MQ=;
        b=WYuHnTRBLmZ0YrV/Cf7NvhnycCJcZvoHALBgn2+JQ4JjZG4sUOsXrwKhGIageogxiS
         d0JM6RhZByvBD9fK9zgjQszbkzBgxQfyqtEUzphQqMrzc8mXuNEoj1keVLz3PhN2oXzP
         Pn48fgfAQCXbTdDfzTsSJ35/oRZVyid4JFPbmDubuJMv6EqZeBC6Iqa1SGmdIYg/plck
         KfNLvCNzgENJOym6Tf3gZ6oWqzXNgJJ1ABXtmsZWzySTec9ENC38U09c3WIf+WqL4rTF
         W9mZWxEXh76VtUxqmfiSZPGqf+yIz+Zn6cksqe+du9CoJ11OmGGt1PNtbyDkMvMviC5t
         L4Ig==
X-Gm-Message-State: AOAM530LlUmAKw67YWxuRX21zZrOc3ud/+r7p5By12fupx/MakGySuy9
        yEBAfXGOdyJVCgRTxA4Wz6qBVERU2Q8y0Q==
X-Google-Smtp-Source: ABdhPJyi5zDjtLsE72t94Sm0RrnFgor7yaOH92NLRfgoCTyjwl4lu8KE9HMok5ZMiTp6xtO7lnEkAQ==
X-Received: by 2002:a17:90b:1b52:: with SMTP id nv18mr26335806pjb.172.1606139917000;
        Mon, 23 Nov 2020 05:58:37 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y1sm11828086pfe.80.2020.11.23.05.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 05:58:36 -0800 (PST)
Message-ID: <5fbbc00c.1c69fb81.743d5.9b49@mx.google.com>
Date:   Mon, 23 Nov 2020 05:58:36 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20201123
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 788 runs, 37 regressions (next-20201123)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 788 runs, 37 regressions (next-20201123)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
at91-sama5d4_xplained      | arm   | lab-baylibre  | gcc-8    | sama5_defco=
nfig              | 1          =

bcm2836-rpi-2-b            | arm   | lab-collabora | gcc-8    | bcm2835_def=
config            | 1          =

bcm2836-rpi-2-b            | arm   | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b            | arm64 | lab-baylibre  | clang-10 | defconfig  =
                  | 1          =

bcm2837-rpi-3-b            | arm64 | lab-baylibre  | clang-11 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb            | arm64 | lab-nxp       | clang-10 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb            | arm64 | lab-nxp       | clang-10 | defconfig  =
                  | 1          =

fsl-ls1088a-rdb            | arm64 | lab-nxp       | clang-11 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb            | arm64 | lab-nxp       | clang-11 | defconfig  =
                  | 1          =

fsl-ls1088a-rdb            | arm64 | lab-nxp       | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb            | arm64 | lab-nxp       | gcc-8    | defconfig  =
                  | 1          =

fsl-ls1088a-rdb            | arm64 | lab-nxp       | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

hifive-unleashed-a00       | riscv | lab-baylibre  | gcc-8    | defconfig  =
                  | 1          =

hip07-d05                  | arm64 | lab-collabora | clang-10 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

hip07-d05                  | arm64 | lab-collabora | clang-10 | defconfig  =
                  | 1          =

hip07-d05                  | arm64 | lab-collabora | clang-11 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

hip07-d05                  | arm64 | lab-collabora | clang-11 | defconfig  =
                  | 1          =

hip07-d05                  | arm64 | lab-collabora | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

hip07-d05                  | arm64 | lab-collabora | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

imx6q-var-dt6customboard   | arm   | lab-baylibre  | clang-11 | multi_v7_de=
fconfig           | 2          =

imx6q-var-dt6customboard   | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

imx6q-var-dt6customboard   | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 2          =

imx8mp-evk                 | arm64 | lab-nxp       | clang-10 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                 | arm64 | lab-nxp       | clang-10 | defconfig  =
                  | 1          =

imx8mp-evk                 | arm64 | lab-nxp       | clang-11 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                 | arm64 | lab-nxp       | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

odroid-xu3                 | arm   | lab-collabora | gcc-8    | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

panda                      | arm   | lab-collabora | clang-10 | multi_v7_de=
fconfig           | 1          =

qemu_arm-versatilepb       | arm   | lab-baylibre  | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-broonie   | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-cip       | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-collabora | gcc-8    | versatile_d=
efconfig          | 1          =

sun50i-h6-orangepi-3       | arm64 | lab-clabbe    | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64-model-b | arm64 | lab-baylibre  | clang-11 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64-model-b | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
201123/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20201123
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      62918e6fd7b5751c1285c7f8c6cbd27eb6600c02 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
at91-sama5d4_xplained      | arm   | lab-baylibre  | gcc-8    | sama5_defco=
nfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb8a90d4dd9dad80d8d902

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb8a90d4dd9dad80d8d=
903
        failing since 5 days (last pass: next-20201106, first fail: next-20=
201117) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora | gcc-8    | bcm2835_def=
config            | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb8dd70abf7347dad8d8fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb8dd70abf7347dad8d=
8fe
        failing since 26 days (last pass: next-20201027, first fail: next-2=
0201028) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb8f11d91a0084fed8d8fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb8f11d91a0084fed8d=
8fe
        failing since 53 days (last pass: next-20200929, first fail: next-2=
0200930) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre  | clang-10 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb8e07c820571f0fd8d90f

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fbb8e07c820571f=
0fd8d912
        failing since 3 days (last pass: next-20201119, first fail: next-20=
201120)
        1 lines

    2020-11-23 10:22:59.948000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-23 10:22:59.948000+00:00  (user:khilman) is already connected
    2020-11-23 10:23:14.783000+00:00  =00
    2020-11-23 10:23:14.784000+00:00  =

    2020-11-23 10:23:14.784000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-23 10:23:14.784000+00:00  =

    2020-11-23 10:23:14.784000+00:00  DRAM:  948 MiB
    2020-11-23 10:23:14.799000+00:00  RPI 3 Model B (0xa02082)
    2020-11-23 10:23:14.888000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-23 10:23:14.919000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (381 line(s) more)  =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre  | clang-11 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb87733ee02e0e53d8d951

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fbb87733ee02e0e=
53d8d954
        failing since 3 days (last pass: next-20201119, first fail: next-20=
201120)
        1 lines

    2020-11-23 09:54:16.670000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-23 09:54:16.671000+00:00  (user:khilman) is already connected
    2020-11-23 09:54:32.756000+00:00  =00
    2020-11-23 09:54:32.756000+00:00  =

    2020-11-23 09:54:32.756000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-23 09:54:32.756000+00:00  =

    2020-11-23 09:54:32.756000+00:00  DRAM:  948 MiB
    2020-11-23 09:54:32.772000+00:00  RPI 3 Model B (0xa02082)
    2020-11-23 09:54:32.859000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-23 09:54:32.891000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (385 line(s) more)  =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
fsl-ls1088a-rdb            | arm64 | lab-nxp       | clang-10 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb913a8ade20dd53d8d8fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-fsl-ls1088=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-fsl-ls1088=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb913a8ade20dd53d8d=
8fe
        failing since 3 days (last pass: next-20201119, first fail: next-20=
201120) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
fsl-ls1088a-rdb            | arm64 | lab-nxp       | clang-10 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb9382148fc78bffd8d907

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig/clang-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig/clang-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb9382148fc78bffd8d=
908
        failing since 3 days (last pass: next-20201119, first fail: next-20=
201120) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
fsl-ls1088a-rdb            | arm64 | lab-nxp       | clang-11 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb8983818dfb0c9ad8d929

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-fsl-ls1088=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-fsl-ls1088=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb8983818dfb0c9ad8d=
92a
        failing since 3 days (last pass: next-20201119, first fail: next-20=
201120) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
fsl-ls1088a-rdb            | arm64 | lab-nxp       | clang-11 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb8d45d38288f947d8d929

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig/clang-11/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig/clang-11/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb8d45d38288f947d8d=
92a
        failing since 3 days (last pass: next-20201119, first fail: next-20=
201120) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
fsl-ls1088a-rdb            | arm64 | lab-nxp       | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb87afff070b6549d8d942

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb87afff070b6549d8d=
943
        failing since 3 days (last pass: next-20201119, first fail: next-20=
201120) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
fsl-ls1088a-rdb            | arm64 | lab-nxp       | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb8b73c59eb0e464d8d90a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb8b73c59eb0e464d8d=
90b
        failing since 3 days (last pass: next-20201119, first fail: next-20=
201120) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
fsl-ls1088a-rdb            | arm64 | lab-nxp       | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb8f982e6757253ed8d90f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb8f982e6757253ed8d=
910
        failing since 3 days (last pass: next-20201119, first fail: next-20=
201120) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
hifive-unleashed-a00       | riscv | lab-baylibre  | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb8804a10580dd20d8d92b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb8804a10580dd20d8d=
92c
        failing since 5 days (last pass: next-20201113, first fail: next-20=
201117) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
hip07-d05                  | arm64 | lab-collabora | clang-10 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb90a90f9a6b4008d8d92a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-hip0=
7-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-hip0=
7-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb90a90f9a6b4008d8d=
92b
        new failure (last pass: next-20201120) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
hip07-d05                  | arm64 | lab-collabora | clang-10 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb9322e40a3de06cd8d913

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig/clang-10/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig/clang-10/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb9322e40a3de06cd8d=
914
        failing since 4 days (last pass: next-20201117, first fail: next-20=
201119) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
hip07-d05                  | arm64 | lab-collabora | clang-11 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb88a01cb46701bfd8d90d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-hip0=
7-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-hip0=
7-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb88a01cb46701bfd8d=
90e
        failing since 4 days (last pass: next-20201117, first fail: next-20=
201119) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
hip07-d05                  | arm64 | lab-collabora | clang-11 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb8cb06a4002689ad8d91e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig/clang-11/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig/clang-11/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb8cb06a4002689ad8d=
91f
        failing since 4 days (last pass: next-20201117, first fail: next-20=
201119) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
hip07-d05                  | arm64 | lab-collabora | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb875ededadf889dd8d92f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-hip07-d=
05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-hip07-d=
05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb875ededadf889dd8d=
930
        failing since 4 days (last pass: next-20201117, first fail: next-20=
201119) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
hip07-d05                  | arm64 | lab-collabora | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb8f6be33a4f004fd8d936

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb8f6be33a4f004fd8d=
937
        new failure (last pass: next-20201120) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx6q-var-dt6customboard   | arm   | lab-baylibre  | clang-11 | multi_v7_de=
fconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/5fbb8fa09b820266fcd8d907

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-imx6q-var-dt6customboard.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-imx6q-var-dt6customboard.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fbb8fa09b82026=
6fcd8d90b
        new failure (last pass: next-20201120)
        4 lines

    2020-11-23 10:31:47.488000+00:00  kern  :alert : pgd =3D (ptrval)
    2020-11-23 10:31:47.489000+00:00  kern  :alert : [cec60217] *pgd=3D1ec1=
141e(bad)   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fbb8fa09b82026=
6fcd8d90c
        new failure (last pass: next-20201120)
        25 lines

    2020-11-23 10:31:47.530000+00:00  kern  :emerg : Process kworker/1:3 (p=
id: 138, stack limit =3D 0x(ptrval))
    2020-11-23 10:31:47.532000+00:00  kern  :emerg : Stack: (0xc3be1ec8 to =
0xc3be2000)
    2020-11-23 10:31:47.532000+00:00  kern  :emerg : 1ec0:                 =
  fd0887d7 cec60217 00000000 00000000 00000003 00000000
    2020-11-23 10:31:47.532000+00:00  kern  :emerg : 1ee0: 00000000 fd0887d=
7 c390c840 c3bc9400 c390c894 00000000 cec6008f c0a89ca8
    2020-11-23 10:31:47.533000+00:00  kern  :emerg : 1f00: c390c840 c3bc940=
0 fffffc84 00000000 00000000 ef7aa340 ef7ad600 c0a89640
    2020-11-23 10:31:47.572000+00:00  kern  :emerg : 1f20: c3b15280 0000000=
2 c1a04d18 c3bc95a0 ef7ad600 c0371b00 c3b15294 c3b15280
    2020-11-23 10:31:47.574000+00:00  kern  :emerg : 1f40: ef7aa340 0000000=
8 c3b15294 ef7aa358 0000000c ef7aa340 c1a03d00 c03721dc
    2020-11-23 10:31:47.574000+00:00  kern  :emerg : 1f60: c3be1f70 c3b1428=
0 00000004 c212febc 0000000c c1c2723c c3b142a4 c0371de8
    2020-11-23 10:31:47.574000+00:00  kern  :emerg : 1f80: c3b15280 c037797=
0 00000000 c3b141c0 c03777f4 00000000 00000000 00000000
    2020-11-23 10:31:47.575000+00:00  kern  :emerg : 1fa0: 00000000 0000000=
0 00000000 c03001b0 00000000 00000000 00000000 00000000 =

    ... (14 line(s) more)  =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx6q-var-dt6customboard   | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb8c6f6d92fc2940d8d907

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb8c6f6d92fc2940d8d=
908
        failing since 10 days (last pass: next-20201112, first fail: next-2=
0201113) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx6q-var-dt6customboard   | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/5fbb8e75dfd28572a2d8d918

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fbb8e75dfd2857=
2a2d8d91c
        new failure (last pass: next-20201120)
        4 lines

    2020-11-23 10:25:55.107000+00:00  kern  :alert : Unable to handle kerne=
l NULL pointer dereference at virtual address 00000313
    2020-11-23 10:25:55.107000+00:00  kern  :alert : pgd =3D 9c890b77
    2020-11-23 10:25:55.107000+00:00  kern  :alert : [00000313] *pgd=3D0000=
0000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fbb8e75dfd2857=
2a2d8d91d
        new failure (last pass: next-20201120)
        46 lines

    2020-11-23 10:25:55.152000+00:00  kern  :emerg : Process kworker/0:1 (p=
id: 29, stack limit =3D 0xd2c138de)
    2020-11-23 10:25:55.152000+00:00  kern  :emerg : Stack: (0xc223bd60 to =
0xc223c000)
    2020-11-23 10:25:55.152000+00:00  kern  :emerg : bd60: c3ee15b0 c3ee15b=
4 c3ee1400 c3ee1414 c14322b8 c09e1c28 c223a000 8020001b
    2020-11-23 10:25:55.152000+00:00  kern  :emerg : bd80: c19baf88 c3ee140=
0 000002f3 c2001d80 c33d4d00 ef85fa80 c09ef864 c14322b8
    2020-11-23 10:25:55.153000+00:00  kern  :emerg : bda0: c19baf88 0000000=
c c19bafa4 ec25787e 00000001 c3bbcd00 c3bbe100 c3ee1400
    2020-11-23 10:25:55.194000+00:00  kern  :emerg : bdc0: c3ee1414 c14322b=
8 c19baf88 0000000c c19bafa4 c09ef834 c142fefc 00000000
    2020-11-23 10:25:55.195000+00:00  kern  :emerg : bde0: c3ee140c c3ee140=
0 c22d8c10 c21718c0 c3b3b240 c09c4f94 c3ee1400 fffffdfb
    2020-11-23 10:25:55.195000+00:00  kern  :emerg : be00: c22d8c10 bf04413=
4 c3bbc340 c3620f08 00000120 c21718c0 c3b3b240 c0a22364
    2020-11-23 10:25:55.196000+00:00  kern  :emerg : be20: c3bbc340 c3bbc34=
0 c2232c10 c3bbc340 c3b3b240 00000000 c19baf9c bf07a084
    2020-11-23 10:25:55.196000+00:00  kern  :emerg : be40: bf07b014 0000002=
3 ef796340 c0a22444 c2232c10 00000000 bf07b014 00000000 =

    ... (35 line(s) more)  =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx8mp-evk                 | arm64 | lab-nxp       | clang-10 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb8ea92063f97577d8d937

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb8ea92063f97577d8d=
938
        new failure (last pass: next-20201120) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx8mp-evk                 | arm64 | lab-nxp       | clang-10 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb9036c2a44b2c6cd8d918

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb9036c2a44b2c6cd8d=
919
        failing since 4 days (last pass: next-20201118, first fail: next-20=
201119) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx8mp-evk                 | arm64 | lab-nxp       | clang-11 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb88da07329c2d0dd8d91e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb88da07329c2d0dd8d=
91f
        failing since 5 days (last pass: next-20201112, first fail: next-20=
201117) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx8mp-evk                 | arm64 | lab-nxp       | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb8c4ec094805ffdd8d926

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb8c4ec094805ffdd8d=
927
        new failure (last pass: next-20201120) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
odroid-xu3                 | arm   | lab-collabora | gcc-8    | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbba1b8b002eb8765d8d911

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbba1b8b002eb8765d8d=
912
        new failure (last pass: next-20201120) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
panda                      | arm   | lab-collabora | clang-10 | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb8e293083f37f81d8d90f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb8e293083f37f81d8d=
910
        new failure (last pass: next-20201120) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-versatilepb       | arm   | lab-baylibre  | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb877e104c5f8d9bd8d905

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb877e104c5f8d9bd8d=
906
        failing since 5 days (last pass: next-20201113, first fail: next-20=
201117) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-versatilepb       | arm   | lab-broonie   | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb878bff070b6549d8d915

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb878bff070b6549d8d=
916
        failing since 5 days (last pass: next-20201113, first fail: next-20=
201117) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-versatilepb       | arm   | lab-cip       | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb87eda10580dd20d8d90c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb87eda10580dd20d8d=
90d
        failing since 5 days (last pass: next-20201113, first fail: next-20=
201117) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-versatilepb       | arm   | lab-collabora | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb8901ef039ce349d8d95e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb8901ef039ce349d8d=
95f
        failing since 5 days (last pass: next-20201113, first fail: next-20=
201117) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun50i-h6-orangepi-3       | arm64 | lab-clabbe    | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb89b0e8c46b9780d8d929

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h6-=
orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h6-=
orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb89b1e8c46b9780d8d=
92a
        failing since 11 days (last pass: next-20201110, first fail: next-2=
0201111) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun50i-h6-pine-h64-model-b | arm64 | lab-baylibre  | clang-11 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb89fb28be7244b8d8d926

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb89fb28be7244b8d8d=
927
        failing since 11 days (last pass: next-20201110, first fail: next-2=
0201111) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun50i-h6-pine-h64-model-b | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbb885295e1613478d8d8fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbb885295e1613478d8d=
8fe
        failing since 11 days (last pass: next-20201110, first fail: next-2=
0201111) =

 =20
