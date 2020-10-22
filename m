Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A294295B55
	for <lists+linux-next@lfdr.de>; Thu, 22 Oct 2020 11:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbgJVJFU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Oct 2020 05:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbgJVJFT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Oct 2020 05:05:19 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F02C0613CE
        for <linux-next@vger.kernel.org>; Thu, 22 Oct 2020 02:05:19 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id bh6so615320plb.5
        for <linux-next@vger.kernel.org>; Thu, 22 Oct 2020 02:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=4kALzK15XYE1ZluV0iU1Xg3ukGbGTeE5VCoCBNu4Mtw=;
        b=WVaAxvF8dSvYQtWIXNUk2lF+xtLAzMFSdQSNG5iE6vl93yMFg604jppCaMyN62kBuS
         JdjWDIOCM1YOTYOR4PWbu0aos1/MCQ40cFSD/TeLSO1+LylzHmO7JYpX9WYNwV4l5qb9
         +g3mrsWXW4zgI8zLcPtHDQ+GGQYhjW/VPb3u/4v7ma+jcmi7A1c7MZaJqHATjS0ItMNa
         2igZ/TQ5SqOKxsPRCbqvgUdhEcJ1iibpMChgn5sClhAAne9lPmLiivetFyTQHfoBsOcC
         xw0jsHFsO62PbHIHyHM+7MR8mH0BxItiOttRVomXVSoT3Vml23TYQUZGKxPJiPV/2+2k
         vnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=4kALzK15XYE1ZluV0iU1Xg3ukGbGTeE5VCoCBNu4Mtw=;
        b=GWlW2B1lgy6wtu5DUfXgJ5bGXF7E48pB+wVy/woffrh3vI3eeT5JT6RCHa/AzZUvQv
         k/0frR0nHTfkRoP6NsoE8gZGl87d3WWekjOEar4H9YuT691g0iGwsieyWuxS+LUWP65s
         DkghvyOp27vFRzLz42aypouM3MV9YiqV2/zVPMrFLK4b4msi7rGTifx9rkGyXd3hLIOi
         SHqiIM7hH8FOZBc/dhxBStpVHhHB9igeFfc4jEvGhIo9D+VwjsDdxx0lCN/O3ZZVziQt
         I4coknxkjhuMsykh8qqk5sCTbIlH/lCqUm7hjE0gooCXNM+DX+0sWP6Ki5Q+b/5//kzh
         dj+A==
X-Gm-Message-State: AOAM533c6gXYEZ6e5yqDWXF8oWbqVoYtPsEj2phAs22HV0xsrLgaNMxf
        +sx19h54TZu/708qNML0i6UePqSN2LTyNQ==
X-Google-Smtp-Source: ABdhPJzOr3BJvaNdYNNOYj3dpn62XIoqXQxsUS8W1QFwwgMV5FBUecMU/LNhqQgYIDu2Fmv4jgPh3g==
X-Received: by 2002:a17:902:ea8c:b029:d2:8abd:c8de with SMTP id x12-20020a170902ea8cb02900d28abdc8demr1791420plb.21.1603357517861;
        Thu, 22 Oct 2020 02:05:17 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 197sm1492708pfa.170.2020.10.22.02.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 02:05:16 -0700 (PDT)
Message-ID: <5f914b4c.1c69fb81.11950.2c33@mx.google.com>
Date:   Thu, 22 Oct 2020 02:05:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20201022
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 473 runs, 5 regressions (next-20201022)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 473 runs, 5 regressions (next-20201022)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 0/1    =

bcm2837-rpi-3-b      | arm64 | lab-baylibre  | clang-10 | defconfig+CON..._=
64K_PAGES=3Dy | 3/4    =

bcm2837-rpi-3-b      | arm64 | lab-baylibre  | clang-10 | defconfig        =
            | 3/4    =

bcm2837-rpi-3-b      | arm64 | lab-baylibre  | gcc-8    | defconfig        =
            | 3/4    =

hifive-unleashed-a00 | riscv | lab-baylibre  | gcc-8    | defconfig        =
            | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
201022/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20201022
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      37b992c4486c41f0a6ebbaf2294e76b47a047250 =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f9112f460363874524ff3ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201022/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201022/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f9112f460363874524ff=
3ee
      failing since 21 days (last pass: next-20200929, first fail: next-202=
00930)  =



platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
bcm2837-rpi-3-b      | arm64 | lab-baylibre  | clang-10 | defconfig+CON..._=
64K_PAGES=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f9110ee1f55c221b64ff469

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201022/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201022/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f9110ee1f55c221=
b64ff46d
      new failure (last pass: next-20201016)
      1 lines

    2020-10-22 04:54:12.781000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-22 04:54:12.793000  (user:khilman) is already connected
    2020-10-22 04:54:28.391000  =00
    2020-10-22 04:54:28.391000  =

    2020-10-22 04:54:28.407000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-22 04:54:28.407000  =

    2020-10-22 04:54:28.407000  DRAM:  948 MiB
    2020-10-22 04:54:28.423000  RPI 3 Model B (0xa02082)
    2020-10-22 04:54:28.513000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-22 04:54:28.546000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (379 line(s) more)
      =



platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
bcm2837-rpi-3-b      | arm64 | lab-baylibre  | clang-10 | defconfig        =
            | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f911544b2d327f9594ff400

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201022/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201022/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f911544b2d327f9=
594ff404
      failing since 6 days (last pass: next-20201013, first fail: next-2020=
1015)
      2 lines

    2020-10-22 05:12:33.395000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-22 05:12:33.395000  (user:khilman) is already connected
    2020-10-22 05:12:48.932000  =00
    2020-10-22 05:12:48.932000  =

    2020-10-22 05:12:48.953000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-22 05:12:48.953000  =

    2020-10-22 05:12:48.953000  DRAM:  948 MiB
    2020-10-22 05:12:48.970000  RPI 3 Model B (0xa02082)
    2020-10-22 05:12:49.056000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-22 05:12:49.088000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (383 line(s) more)
      =



platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
bcm2837-rpi-3-b      | arm64 | lab-baylibre  | gcc-8    | defconfig        =
            | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f91120762dfba25334ff3f4

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201022/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201022/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f91120762dfba25=
334ff3f8
      failing since 5 days (last pass: next-20201015, first fail: next-2020=
1016)
      2 lines

    2020-10-22 04:58:41.539000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-22 04:58:41.539000  (user:khilman) is already connected
    2020-10-22 04:58:57.108000  =00
    2020-10-22 04:58:57.108000  =

    2020-10-22 04:58:57.108000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-22 04:58:57.108000  =

    2020-10-22 04:58:57.108000  DRAM:  948 MiB
    2020-10-22 04:58:57.124000  RPI 3 Model B (0xa02082)
    2020-10-22 04:58:57.211000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-22 04:58:57.243000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (383 line(s) more)
      =



platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
hifive-unleashed-a00 | riscv | lab-baylibre  | gcc-8    | defconfig        =
            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f910fc2a645e47d4a4ff400

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201022/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201022/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f910fc2a645e47d4a4ff=
401
      failing since 42 days (last pass: next-20200818, first fail: next-202=
00909)  =20
