Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B3D62B6F87
	for <lists+linux-next@lfdr.de>; Tue, 17 Nov 2020 21:03:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727301AbgKQUD3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Nov 2020 15:03:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726352AbgKQUD3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Nov 2020 15:03:29 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3027DC0613CF
        for <linux-next@vger.kernel.org>; Tue, 17 Nov 2020 12:03:29 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id 81so8366948pgf.0
        for <linux-next@vger.kernel.org>; Tue, 17 Nov 2020 12:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=x3iBuFyeW1hX8Xv0+GzGr+yX26R8AQizYCssaoCZaKg=;
        b=wVvtq8DTlweUMPj3xcVjFr7r10+ONBMbP6DohDb5oXQGMu7/ptRlUjTzf1GFDTX7c2
         b2EoYUGV4itUv4oqNxl18i8LDdE8AKF+JG/WPAmf457hOMd/Ao8tieFZlVmxNpAlbM3H
         JpE8MaZba14Z0AyZ3Jq8LI7YJ5i/x21QoVJRCprjLt897TR7rBUWjwBnmQTJ/sd5XRS+
         detQ5bJzhMn7Q42N6yQcvZhGHImD+AfYtMwpvZ8tOQxe1eopJc6lW6chuUeuh4Jg5NHK
         lzpbHztBQTPbj498ZqFzFDMb6zBTIF3TvM9k5c8LCE51sRi0oEUmtTFv3DAyNWzxRAM2
         74Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=x3iBuFyeW1hX8Xv0+GzGr+yX26R8AQizYCssaoCZaKg=;
        b=MRe+aQc1SNk/rRum0n7Vnq1SkyiMhc6lPQyb3GSPGBIt78GNIi6Wn80w05vx7LftYI
         vpuvOqCxTJcTulB1qHOTS0cCaETNQwF6mEFYD+u/EeRUa3bmrx+tCg/a/ByP/kGm39wX
         xw9lL6qPQZ/zI4/j6KYr425BL5EXLAlaYXzUFeNZGrE8mAe8uesZMj5WJ/8E3JjOZAdM
         NKdHzcdiGscfS99lAkVjXCRsU86BeFVImFKoNotuixsyovMylYbyz5qa8+/5ZlXEbltn
         hhzjb/PC1dURbW0b3g6JUtpjchtMDhekrgeXBYuHiGfJ0RBYqQeG67XDhHyxvo/5OsbF
         YNGA==
X-Gm-Message-State: AOAM533EoI9TYJ0ks4G38k3K+aK3C3QDNqlQYcRmDDjTMMKpHDTiswaq
        3Mo9dPAXK1qnkDqndEC8NJ/GZ7sUDgMCeQ==
X-Google-Smtp-Source: ABdhPJy2K72eAAUbNOYbdJzSaGn5dxhXVhy2sHFSa6nePfrCtTkFBip2V71bCL6rR4bVqKLyUNXwXg==
X-Received: by 2002:a05:6a00:8ca:b029:196:6dcb:14a4 with SMTP id s10-20020a056a0008cab02901966dcb14a4mr1241672pfu.12.1605643407590;
        Tue, 17 Nov 2020 12:03:27 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e10sm24116539pfl.162.2020.11.17.12.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 12:03:26 -0800 (PST)
Message-ID: <5fb42c8e.1c69fb81.a9b00.3d36@mx.google.com>
Date:   Tue, 17 Nov 2020 12:03:26 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20201117
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 445 runs, 28 regressions (next-20201117)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 445 runs, 28 regressions (next-20201117)

Regressions Summary
-------------------

platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b            | arm64 | lab-baylibre | clang-10 | defconfig   =
                 | 1          =

bcm2837-rpi-3-b            | arm64 | lab-baylibre | clang-11 | defconfig   =
                 | 1          =

bcm2837-rpi-3-b            | arm64 | lab-baylibre | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

fsl-ls1028a-rdb            | arm64 | lab-nxp      | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

fsl-ls1028a-rdb            | arm64 | lab-nxp      | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb            | arm64 | lab-nxp      | clang-11 | defconfig   =
                 | 1          =

fsl-lx2160a-rdb            | arm64 | lab-nxp      | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

fsl-lx2160a-rdb            | arm64 | lab-nxp      | clang-11 | defconfig   =
                 | 1          =

fsl-lx2160a-rdb            | arm64 | lab-nxp      | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

imx8mp-evk                 | arm64 | lab-nxp      | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

imx8mp-evk                 | arm64 | lab-nxp      | clang-11 | defconfig   =
                 | 1          =

imx8mp-evk                 | arm64 | lab-nxp      | clang-11 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

imx8mp-evk                 | arm64 | lab-nxp      | gcc-8    | defconfig   =
                 | 1          =

imx8mp-evk                 | arm64 | lab-nxp      | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                 | arm64 | lab-nxp      | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

meson-gxm-q200             | arm64 | lab-baylibre | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =

meson-gxm-q200             | arm64 | lab-baylibre | clang-10 | defconfig   =
                 | 2          =

meson-gxm-q200             | arm64 | lab-baylibre | clang-11 | defconfig   =
                 | 1          =

meson-gxm-q200             | arm64 | lab-baylibre | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =

meson-gxm-q200             | arm64 | lab-baylibre | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 3          =

sun50i-h6-pine-h64-model-b | arm64 | lab-baylibre | clang-11 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64-model-b | arm64 | lab-baylibre | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
201117/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20201117
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7c8ca8129ee9724cb1527895fe6dec942ef07f19 =



Test Regressions
---------------- =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb3d4ba2a421f02fbd22e61

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fb3d4ba2a421f02=
fbd22e66
        new failure (last pass: next-20201113)
        1 lines

    2020-11-17 14:38:17.653000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-17 14:38:17.653000+00:00  (user:khilman) is already connected
    2020-11-17 14:38:33.002000+00:00  =00
    2020-11-17 14:38:33.003000+00:00  =

    2020-11-17 14:38:33.003000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-17 14:38:33.003000+00:00  =

    2020-11-17 14:38:33.003000+00:00  DRAM:  948 MiB
    2020-11-17 14:38:33.018000+00:00  RPI 3 Model B (0xa02082)
    2020-11-17 14:38:33.106000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-17 14:38:33.138000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (380 line(s) more)  =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre | clang-10 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb3d672acfa5f8b8ad22e6b

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fb3d672acfa5f8b=
8ad22e70
        new failure (last pass: next-20201113)
        2 lines

    2020-11-17 14:45:12.157000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-17 14:45:12.158000+00:00  (user:khilman) is already connected
    2020-11-17 14:45:28.341000+00:00  =00
    2020-11-17 14:45:28.341000+00:00  =

    2020-11-17 14:45:28.357000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-17 14:45:28.357000+00:00  =

    2020-11-17 14:45:28.357000+00:00  DRAM:  948 MiB
    2020-11-17 14:45:28.373000+00:00  RPI 3 Model B (0xa02082)
    2020-11-17 14:45:28.464000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-17 14:45:28.496000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (383 line(s) more)  =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre | clang-11 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb3d53511a586effbd22e7d

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fb3d53511a586ef=
fbd22e82
        new failure (last pass: next-20201113)
        2 lines

    2020-11-17 14:28:23.433000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-17 14:28:23.434000+00:00  (user:khilman) is already connected
    2020-11-17 14:28:38.911000+00:00  =00
    2020-11-17 14:28:38.911000+00:00  =

    2020-11-17 14:28:38.911000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-17 14:28:38.912000+00:00  =

    2020-11-17 14:28:38.912000+00:00  DRAM:  948 MiB
    2020-11-17 14:28:38.926000+00:00  RPI 3 Model B (0xa02082)
    2020-11-17 14:28:39.013000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-17 14:28:39.045000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (383 line(s) more)  =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb3d65874e0f85904d22e9f

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fb3d65874e0f859=
04d22ea4
        failing since 4 days (last pass: next-20201112, first fail: next-20=
201113)
        2 lines

    2020-11-17 14:49:02.585000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-17 14:49:02.585000+00:00  (user:khilman) is already connected
    2020-11-17 14:49:18.434000+00:00  =00
    2020-11-17 14:49:18.434000+00:00  =

    2020-11-17 14:49:18.434000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-17 14:49:18.434000+00:00  =

    2020-11-17 14:49:18.435000+00:00  DRAM:  948 MiB
    2020-11-17 14:49:18.450000+00:00  RPI 3 Model B (0xa02082)
    2020-11-17 14:49:18.536000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-17 14:49:18.568000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (388 line(s) more)  =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
fsl-ls1028a-rdb            | arm64 | lab-nxp      | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb3d6bb7f51d0afccd22e98

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-fsl-ls1028=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-fsl-ls1028=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb3d6bb7f51d0afccd22=
e99
        new failure (last pass: next-20201113) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
fsl-ls1028a-rdb            | arm64 | lab-nxp      | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb3da7dfe2c323b40d22e97

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1028a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1028a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb3da7dfe2c323b40d22=
e98
        new failure (last pass: next-20201113) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
fsl-ls1088a-rdb            | arm64 | lab-nxp      | clang-11 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb3d9ef6737e5aff2d22eed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig/clang-11/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig/clang-11/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb3d9ef6737e5aff2d22=
eee
        new failure (last pass: next-20201113) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
fsl-lx2160a-rdb            | arm64 | lab-nxp      | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb3e1fdd540a77882d8d8fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-fsl-lx2160=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-fsl-lx2160=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb3e1fdd540a77882d8d=
8fe
        new failure (last pass: next-20201113) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
fsl-lx2160a-rdb            | arm64 | lab-nxp      | clang-11 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb3d84cfc7bbcfb67d22e68

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig/clang-11/lab-nxp/baseline-fsl-lx2160a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig/clang-11/lab-nxp/baseline-fsl-lx2160a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb3d84cfc7bbcfb67d22=
e69
        new failure (last pass: next-20201112) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
fsl-lx2160a-rdb            | arm64 | lab-nxp      | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb3d8d96c8fdb1f81d22e69

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-lx2160a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-lx2160a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb3d8d96c8fdb1f81d22=
e6a
        failing since 4 days (last pass: next-20201112, first fail: next-20=
201113) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
imx8mp-evk                 | arm64 | lab-nxp      | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb3d76e35f614e397d22e75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb3d76e35f614e397d22=
e76
        failing since 6 days (last pass: next-20201109, first fail: next-20=
201111) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
imx8mp-evk                 | arm64 | lab-nxp      | clang-11 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb3db0611e35cc2cdd22e61

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig/clang-11/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig/clang-11/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb3db0611e35cc2cdd22=
e62
        failing since 4 days (last pass: next-20201112, first fail: next-20=
201113) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
imx8mp-evk                 | arm64 | lab-nxp      | clang-11 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb3dbfa0ad268e48bd22e75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb3dbfa0ad268e48bd22=
e76
        new failure (last pass: next-20201112) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
imx8mp-evk                 | arm64 | lab-nxp      | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb3d54011a586effbd22ebf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb3d54011a586effbd22=
ec0
        new failure (last pass: next-20201112) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
imx8mp-evk                 | arm64 | lab-nxp      | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb3d9434b71df2125d22e61

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb3d9434b71df2125d22=
e62
        failing since 6 days (last pass: next-20201110, first fail: next-20=
201111) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
imx8mp-evk                 | arm64 | lab-nxp      | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb3dcbf58c166e51dd22e65

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb3dcbf58c166e51dd22=
e66
        failing since 4 days (last pass: next-20201112, first fail: next-20=
201113) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
meson-gxm-q200             | arm64 | lab-baylibre | clang-10 | defconfig+CO=
N..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/5fb3d5312bb20d0b10d22e6c

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fb3d5312bb20d0=
b10d22e72
        new failure (last pass: next-20201113)
        20 lines

    2020-11-17 14:39:19.725000+00:00  kern  :alert :   ESR =3D 0x96000021
    2020-11-17 14:39:19.725000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-11-17 14:39:19.725000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-11-17 14:39:19.725000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-11-17 14:39:19.725000+00:00  kern  :alert : Data abort info:
    2020-11-17 14:39:19.725000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000021
    2020-11-17 14:39:19.726000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-11-17 14:39:19.726000+00:00  kern  :alert : [007f7f7f7f7f7f7f] add=
ress between user and kernel address ranges
    2020-11-17 14:39:19.767000+00:00  kern  :alert : Unable to handle kerne=
l paging request at virtual address 00020000400c02b8
    2020-11-17 14:39:19.767000+00:00  kern  :alert : Mem abort info: =

    ... (8 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fb3d5312bb20d0=
b10d22e73
        new failure (last pass: next-20201113)
        4 lines

    2020-11-17 14:39:19.821000+00:00  kern  :emerg : Code: d5384613 521b0a6=
9 d5184609 f9800111 (885ffd01) =

    2020-11-17 14:39:19.821000+00:00  kern  :emerg : Internal error: Oops: =
96000004 [#2] PREEMPT SMP
    2020-11-17 14:39:19.821000+00:00  kern  :emerg : Code: f9400288 d100810=
8 f9401af6 b94002fa (f9411ec9)    =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
meson-gxm-q200             | arm64 | lab-baylibre | clang-10 | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/5fb3d917710897d770d22e61

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fb3d917710897d=
770d22e67
        new failure (last pass: next-20201113)
        10 lines

    2020-11-17 14:47:27.889000+00:00  kern  :alert : Mem abort info:
    2020-11-17 14:47:27.890000+00:00  kern  :alert :   ESR =3D 0x96000004
    2020-11-17 14:47:27.931000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-11-17 14:47:27.931000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-11-17 14:47:27.931000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-11-17 14:47:27.932000+00:00  kern  :alert : Data abort info:
    2020-11-17 14:47:27.932000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000004
    2020-11-17 14:47:27.932000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-11-17 14:47:27.932000+00:00  kern  :alert : [007f80001229bb78] add=
ress between user and kernel address ranges   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fb3d917710897d=
770d22e68
        new failure (last pass: next-20201113)
        2 lines

    2020-11-17 14:47:27.932000+00:00  kern  :emerg : Code: b94007e8 7100011=
f 1a880280 d0004be9 (f85f83a8) =

    2020-11-17 14:47:27.958000+00:00  + set +x   =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
meson-gxm-q200             | arm64 | lab-baylibre | clang-11 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb3d64774e0f85904d22e76

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb3d64774e0f85904d22=
e77
        new failure (last pass: next-20201113) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
meson-gxm-q200             | arm64 | lab-baylibre | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/5fb3d5b2ab37f3a58fd22e76

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fb3d5b2ab37f3a=
58fd22e7c
        new failure (last pass: next-20201113)
        8 lines

    2020-11-17 13:52:45.187000+00:00  kern  :alert : Mem abort info:
    2020-11-17 13:52:45.187000+00:00  kern  :alert :   ESR =3D 0x8600000f
    2020-11-17 13:52:45.228000+00:00  kern  :alert :   EC =3D 0x21: IABT (c=
urrent EL), IL =3D 32 bits
    2020-11-17 13:52:45.228000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-11-17 13:52:45.228000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-11-17 13:52:45.228000+00:00  kern  :alert : swapper pgtable: 4k pa=
ges, 48-bit VAs, pgdp=3D000000000257e000
    2020-11-17 13:52:45.229000+00:00  kern  :alert : [ffff0000458e9980] pgd=
=3D000000007fff7003, p4d=3D000000007fff7003, pud=3D000000007fe08003, pmd=3D=
000000007fddb003, pte=3D00680000458e9f07   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fb3d5b2ab37f3a=
58fd22e7d
        new failure (last pass: next-20201113)
        2 lines

    2020-11-17 13:52:45.259000+00:00  kern  :emerg : Code: 00000000 0000000=
0 00000000 00000000 (01162280)    =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
meson-gxm-q200             | arm64 | lab-baylibre | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/5fb3d8b3498ca4dfdfd22e72

  Results:     2 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-gx=
m-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-gx=
m-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fb3d8b3498ca4df=
dfd22e77
        new failure (last pass: next-20201113)
        1 lines

    2020-11-17 14:49:05.641000+00:00  Connected to meson-gxm-q200 console [=
channel connected] (~$quit to exit)
    2020-11-17 14:49:05.641000+00:00  (user:khilman) is already connected
    2020-11-17 14:49:19.573000+00:00  GXM:BL1:dc8b51:76f1a5;FEAT:ADFC318C:0=
;POC:3;RCY:0;EMMC:0;READ:0;CHK:AA;SD:0;READ:0;0.0;CHK:0;
    2020-11-17 14:49:19.573000+00:00  no sdio debug board detected =

    2020-11-17 14:49:19.573000+00:00  TE: 319784
    2020-11-17 14:49:19.573000+00:00  =

    2020-11-17 14:49:19.573000+00:00  BL2 Built : 11:58:42, May 27 2017. =

    2020-11-17 14:49:19.574000+00:00  gxl gc3c9a84 - xiaobo.gu@droid05
    2020-11-17 14:49:19.574000+00:00  =

    2020-11-17 14:49:19.574000+00:00  set vcck to 1120 mv =

    ... (778 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fb3d8b3498ca4d=
fdfd22e78
        new failure (last pass: next-20201113)
        22 lines

    2020-11-17 14:50:16.296000+00:00  kern  :alert : Unable to handle kerne=
l paging request at virtual address ffff80001323fff8
    2020-11-17 14:50:16.296000+00:00  kern  :alert : Mem abort info:
    2020-11-17 14:50:16.296000+00:00  kern  :alert :   ESR =3D 0x96000007
    2020-11-17 14:50:16.297000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-11-17 14:50:16.297000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-11-17 14:50:16.297000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-11-17 14:50:16.297000+00:00  kern  :alert : Data abort info:
    2020-11-17 14:50:16.297000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000007
    2020-11-17 14:50:16.297000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-11-17 14:50:16.339000+00:00  kern  :alert : swapper pgtable: 64k p=
ages, 48-bit VAs, pgdp=3D00000000025e0000 =

    ... (11 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fb3d8b3498ca4d=
fdfd22e79
        new failure (last pass: next-20201113)
        6 lines

    2020-11-17 14:50:16.382000+00:00  kern  :emerg : Code: 17ffff99 f9401bf=
7 17fffff5 f9001bf7 (d4210000) =

    2020-11-17 14:50:16.382000+00:00  kern  :emerg : Internal error: Oops: =
96000007 [#2] PREEMPT SMP
    2020-11-17 14:50:16.423000+00:00  kern  :emerg : Code: d50323bf d65f03c=
0 d1002042 f86268a1 (f8626880) =

    2020-11-17 14:50:16.423000+00:00  kern  :emerg : Internal error: Oops: =
96000007 [#3] PREEMPT SMP
    2020-11-17 14:50:16.423000+00:00  kern  :emerg : Code: b9400261 0b01000=
0 b9000260 f94002a3 (f9400282)    =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
sun50i-h6-pine-h64-model-b | arm64 | lab-baylibre | clang-11 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb3e28f09b8c568bdd8d918

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb3e28f09b8c568bdd8d=
919
        failing since 6 days (last pass: next-20201110, first fail: next-20=
201111) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
sun50i-h6-pine-h64-model-b | arm64 | lab-baylibre | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb3e63d0b19f995d8d8d906

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201117/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb3e63d0b19f995d8d8d=
907
        failing since 6 days (last pass: next-20201110, first fail: next-20=
201111) =

 =20
