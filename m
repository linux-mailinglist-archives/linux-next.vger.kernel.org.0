Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 450DF29043D
	for <lists+linux-next@lfdr.de>; Fri, 16 Oct 2020 13:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406841AbgJPLnv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Oct 2020 07:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394457AbgJPLnu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Oct 2020 07:43:50 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4B9EC061755
        for <linux-next@vger.kernel.org>; Fri, 16 Oct 2020 04:43:50 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id 144so1357084pfb.4
        for <linux-next@vger.kernel.org>; Fri, 16 Oct 2020 04:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8p5g0P/eIVeg1aWjn4YQHSGCx8dkcBP1B8s1h5byXuQ=;
        b=q0MDbg4tpQhEF2AMPSRwsKiYM6LW7XmQRb5mZUqGu4kesqoiup0i7yN+7BPULyPKk/
         2pNDzf6APotGbDse/QBV23CQN9y8bdG09/qRoV3OAi3WjHtKQ7EdvNBDmMbDep87oxH4
         LYrJ1Jq+///gUAqUoRXTOZxjbnKqMgLVt/L6HCLy0dcVpmJIf4444ecJQCxSzDIVOQEt
         Y5VAPpbI2KnskW1b2zCqhX2GLwt9LB2LF7DDfKVB6vuvz7wEBZrGz7tvs0MwR/dejt3f
         1c2XVqM33RVBCf604FLDFoOJFhQJB1XNi5PUjH2OIjU15GQvVQ8RHMfUcR/GOxG+lHov
         op1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8p5g0P/eIVeg1aWjn4YQHSGCx8dkcBP1B8s1h5byXuQ=;
        b=HohjI0qrt1vylqPyPWSPqYjsGgCDqpVYK3zttjq8JRqjW98G33viUhrPwE5gXEthxU
         eVLdPFYI+jIHRZ39/3OaOsCDiUvbBEN9KTcUwGnEoXp/S7h02jrsBwO4wfmfh7uj6Io3
         BnxiPJwOfIOFZjIdV2WP+K6rIzl1L9TJedWQr6B5r6si+J0jIG5J33Gq7+sIHNHoJ++f
         tW4edKPTQO5+s5aXdaVp3A4FxFxDVLzm0gzjnsJ24APpw4hHDUZXppqqOanT9z55oKVt
         JD634oxpVpgAud79vw/Hbyfm7CfN5xUT5MNodI9zZz8D1h/4e5tHRhZmyo75lR9dm26A
         eMEA==
X-Gm-Message-State: AOAM532He7JXKrx9+wmnLXD0wxFs0uUwf3+65AkoCIXIkh6OjvF4emcw
        55E9bhGfaT4i0q14QvuGvdjWvrRpH5D7DQ==
X-Google-Smtp-Source: ABdhPJzHylIk6NivGgKu7SlqUloxM69OBOmz08kFPxsmpS7Bv1zDA4/PBrCig2F/yjtx1SKeDiwcEg==
X-Received: by 2002:a62:e104:0:b029:152:4f37:99da with SMTP id q4-20020a62e1040000b02901524f3799damr3284663pfh.17.1602848629495;
        Fri, 16 Oct 2020 04:43:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k9sm2619482pfi.188.2020.10.16.04.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 04:43:48 -0700 (PDT)
Message-ID: <5f898774.1c69fb81.70c19.55e9@mx.google.com>
Date:   Fri, 16 Oct 2020 04:43:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20201016
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 584 runs, 8 regressions (next-20201016)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 584 runs, 8 regressions (next-20201016)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =

bcm2836-rpi-2-b       | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-10 | defconfig       =
             | 3/4    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
_64K_PAGES=3Dy | 3/4    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 3/4    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 3/4    =

hifive-unleashed-a00  | riscv | lab-baylibre  | gcc-8    | defconfig       =
             | 0/1    =

panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
201016/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20201016
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b2926c108f9fd225d3fe9ea73fb5c35f48735d20 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f894de6c6485668854ff3fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201016/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201016/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f894de6c6485668854ff=
3fe
      failing since 170 days (last pass: next-20200424, first fail: next-20=
200428)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2836-rpi-2-b       | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f894d66d5960c2e3f4ff405

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201016/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201016/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f894d66d5960c2e3f4ff=
406
      failing since 15 days (last pass: next-20200929, first fail: next-202=
00930)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-10 | defconfig       =
             | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f894f070e1ef9b7ce4ff45a

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201016/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201016/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f894f070e1ef9b7=
ce4ff45e
      failing since 0 day (last pass: next-20201013, first fail: next-20201=
015)
      1 lines

    2020-10-16 07:40:53.780000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-16 07:40:53.780000  (user:khilman) is already connected
    2020-10-16 07:41:09.603000  =00
    2020-10-16 07:41:09.603000  =

    2020-10-16 07:41:09.603000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-16 07:41:09.603000  =

    2020-10-16 07:41:09.604000  DRAM:  948 MiB
    2020-10-16 07:41:09.619000  RPI 3 Model B (0xa02082)
    2020-10-16 07:41:09.706000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-16 07:41:09.739000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (381 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
_64K_PAGES=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f8947c6025bbd9f3d4ff427

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201016/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201016/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f8947c6025bbd9f=
3d4ff42b
      failing since 0 day (last pass: next-20201013, first fail: next-20201=
015)
      3 lines

    2020-10-16 07:09:09.627000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-16 07:09:09.627000  (user:khilman) is already connected
    2020-10-16 07:09:25.388000  =00
    2020-10-16 07:09:25.389000  =

    2020-10-16 07:09:25.389000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-16 07:09:25.389000  =

    2020-10-16 07:09:25.389000  DRAM:  948 MiB
    2020-10-16 07:09:25.404000  RPI 3 Model B (0xa02082)
    2020-10-16 07:09:25.491000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-16 07:09:25.523000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (392 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f894959d9f663dec64ff3f8

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201016/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201016/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f894959d9f663de=
c64ff3fc
      failing since 2 days (last pass: next-20201009, first fail: next-2020=
1013)
      2 lines

    2020-10-16 07:16:02.007000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-16 07:16:02.007000  (user:khilman) is already connected
    2020-10-16 07:16:17.233000  =00
    2020-10-16 07:16:17.233000  =

    2020-10-16 07:16:17.234000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-16 07:16:17.234000  =

    2020-10-16 07:16:17.234000  DRAM:  948 MiB
    2020-10-16 07:16:17.249000  RPI 3 Model B (0xa02082)
    2020-10-16 07:16:17.336000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-16 07:16:17.368000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (388 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f894ac73f3b8e8e4f4ff3ee

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201016/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201016/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f894ac73f3b8e8e=
4f4ff3f2
      new failure (last pass: next-20201015)
      1 lines  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
hifive-unleashed-a00  | riscv | lab-baylibre  | gcc-8    | defconfig       =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f894b5a0ef0c8c6f14ff3e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201016/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201016/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f894b5a0ef0c8c6f14ff=
3ea
      failing since 36 days (last pass: next-20200818, first fail: next-202=
00909)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f895249bbd90b38dc4ff436

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201016/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201016/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f895249bbd90b38dc4ff=
437
      failing since 86 days (last pass: next-20200706, first fail: next-202=
00721)  =20
